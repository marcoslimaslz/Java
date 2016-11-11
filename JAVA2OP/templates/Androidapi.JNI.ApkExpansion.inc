{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.ApkExpansion;

interface

uses
{{Uses}};

type
{{Classes}}
  TDownloadStateKind = (
    STATE_IDLE = 1,
    STATE_FETCHING_URL = 2,
    STATE_CONNECTING = 3,
    STATE_DOWNLOADING = 4,
    STATE_COMPLETED = 5,
    STATE_PAUSED_NETWORK_UNAVAILABLE = 6,
    STATE_PAUSED_BY_REQUEST = 7,
    STATE_PAUSED_WIFI_DISABLED_NEED_CELLULAR_PERMISSION = 8,
    STATE_PAUSED_NEED_CELLULAR_PERMISSION = 9,
    STATE_PAUSED_WIFI_DISABLED = 10,
    STATE_PAUSED_NEED_WIFI = 11,
    STATE_PAUSED_ROAMING = 12,
    STATE_PAUSED_NETWORK_SETUP_FAILURE = 13,
    STATE_PAUSED_SDCARD_UNAVAILABLE = 14,
    STATE_FAILED_UNLICENSED = 15,
    STATE_FAILED_FETCHING_URL = 16,
    STATE_FAILED_SDCARD_FULL = 17,
    STATE_FAILED_CANCELED = 18,
    STATE_FAILED = 19
  );

  TObbStateKind = (
    ERROR_INTERNAL = 20,
    ERROR_COULD_NOT_MOUNT = 21,
    ERROR_COULD_NOT_UNMOUNT = 22,
    ERROR_NOT_MOUNTED = 23,
    ERROR_ALREADY_MOUNTED = 24,
    ERROR_PERMISSION_DENIED = 25,
    MOUNTED = 1,
    UNMOUNTED = 2
  );

  TObb = class;

  TDownloadProgressInfo = record
    OverallTotal,
    OverallProgress,
    TimeRemaining: Int64;
    CurrentSpeed: Single;
  end;

  TApkFileInfo = record
    IsMainFile: Boolean;
    FileVersion: Integer;
    FileSize: Int64;
    EncriptKey: string;
    function GetObb: TObb;
    function ToJApkFileInfo: JApkFileInfo;
  end;

  TApkExpansion = class
  public
    class function AreFilesDelivered(MainFile: TApkFileInfo): Boolean; overload;
    class function AreFilesDelivered(MainFile, PatchFile: TApkFileInfo): Boolean; overload;
  end;

  TOnObbStateChangeCallback = procedure(Obb: TObb; const State: TObbStateKind) of object;

  TObb = class(TJavaLocal, JObb_ObbListener)
  private
    FObb: JObb;
    FOnStateChange: TOnObbStateChangeCallback;
  public
    constructor Create(ApkFile: TApkFileInfo); overload;
    function GetName: string;
    function GetPath: string;
    function GetMountedPath: string;
    function GetResourcePath(filePath: string): string;
    function IsMounted: Boolean;
    procedure Mount(Callback: TOnObbStateChangeCallback);
    procedure onObbStateChange(path: JString; state: Integer); cdecl;
    procedure Unmount(Callback: TOnObbStateChangeCallback; Force: Boolean);
  end;
  {
  TOnActivityDownloaderFinish = procedure(ResultCode: Integer) of object;

  TActivityDownloader = class
  const
    kActivityResultCode = 1000;
  private
    FDownloader: JDownloaderActivityLauncher;
    FOnFinish: TOnActivityDownloaderFinish;
    procedure ResultCallback(const Sender: TObject; const M: TMessage);
  public
    constructor Create(PublicKey: string; Salt: array of Byte; MainFile: TApkFileInfo); overload;
    constructor Create(PublicKey: string; Salt: array of Byte; MainFile, PatchFile: TApkFileInfo); overload;
    function Launch(Callback: TOnActivityDownloaderFinish): Boolean;
    procedure SetNotificationLabels(Labels: TDictionary<string, string>);
    procedure SetDownloaderLabels(Labels: TDictionary<string, string>);
  end;
  }

  TOnDownloadStateChange = procedure(NewState: TDownloadStateKind) of object;
  TOnDownloadProgress = procedure(DownloadInfo: TDownloadProgressInfo) of object;

  TNativeDownloader = class(TJavaLocal, JApkDownloaderListener)
  private
    FDownloader: JNativeDownloaderLauncher;
    FStateChangeCallback: TOnDownloadStateChange;
    FDownloadProgressCallback: TOnDownloadProgress;
    FMainFile, FPatchFile: TApkFileInfo;
  public
    constructor Create(PublicKey: string; Salt: array of Byte; MainFile: TApkFileInfo); overload;
    constructor Create(PublicKey: string; Salt: array of Byte; MainFile, PatchFile: TApkFileInfo); overload;
    procedure ClearCallbacks;
    procedure DoLaunch;
    function Launch(StateChangeCallback: TOnDownloadStateChange; DownloadProgressCallback: TOnDownloadProgress): Boolean;
    procedure requestAbortDownload;
    procedure requestContinueDownload;
    procedure requestPauseDownload;
    procedure onDownloadProgress(progress: JDownloadProgressInfo); cdecl;
    procedure onDownloadStateChanged(newState: Integer); cdecl;
    procedure onStart;
    procedure onStop;
  end;

  TRunMethod = procedure of object;
  TUIThread = class(TJavaLocal, JRunnable)
  private
    FRunMethod: TRunMethod;
  public
    constructor Create(RunMethod: TRunMethod); overload;
    procedure run; cdecl;
  end;

 implementation

uses
  System.Classes,
  System.Messaging,
  Generics.Collections,
  Androidapi.NativeActivity,
  Androidapi.Helpers,
  Androidapi.JNI.Embarcadero;


var
  NativeDownloaderInstance: TNativeDownloader;
  UIThread: TUIThread;

  // Helpers

  function DictionaryToJMap(Dictionary: TDictionary<string, string>): JHashMap;
  var
    Key, Value: string;
  begin
    Result := TJHashMap.JavaClass.init;
    for Key in Dictionary.Keys do
    begin
      Dictionary.TryGetValue(Key, Value);
      Result.put(StringToJString(Key), StringToJString(Value));
    end;
  end;

  function ByteArrayToJArray(ByteArray: array of Byte): TJavaArray<System.Byte>;
  var
    I, Len: Integer;
  begin
    Len := Length(ByteArray);
    Result := TJavaArray<System.Byte>.Create(Len);
    for I := 0 to Len - 1 do
      Result.Items[I] := ByteArray[I];
  end;

  function StringToJStringNull(Str: string): JString;
  begin
    if Str = '' then Result := nil
    else Result := StringToJString(Str)
  end;

  function CreateApkList(MainFile, PatchFile: TApkFileInfo): TJavaObjectArray<JApkFileInfo>;
  var
    ApkNum: Integer;
  begin
    // Only get into account Patch file if Main file exists
    ApkNum := 0;
    if MainFile.FileSize <> 0 then begin
      Inc(ApkNum);
      if PatchFile.FileSize <> 0 then
        Inc(ApkNum);
    end;

    if ApkNum > 0 then
    begin
      Result := TJavaObjectArray<JApkFileInfo>.Create(ApkNum);
      if MainFile.FileSize <> 0 then
        Result.Items[0] := MainFile.ToJApkFileInfo;

      if PatchFile.FileSize <> 0 then
        Result.Items[1] := PatchFile.ToJApkFileInfo;
    end;
  end;

  procedure NativeActivityOnStart(ANativeActivity: PANativeActivity);
  begin
    NativeDownloaderInstance.OnStart;
  end;

  procedure NativeActivityOnStop(ANativeActivity: PANativeActivity);
  begin
    NativeDownloaderInstance.OnStop;
  end;

  function GetFMXNativeActivity: JFMXNativeActivity;
  begin
    Result := TJFMXNativeActivity.Wrap(PANativeActivity(System.DelphiActivity)^.clazz);
  end;

  { TUIThread }

  constructor TUIThread.Create(RunMethod: TRunMethod);
  begin
    FRunMethod := RunMethod;
    Create;
  end;
  procedure TUIThread.run; cdecl;
  begin
    FRunMethod;
  end;

  { TApkFileInfo }

  function TApkFileInfo.ToJApkFileInfo: JApkFileInfo;
  begin
    Result := TJApkFileInfo.JavaClass.init(IsMainFile,FileVersion, FileSize, StringToJStringNull(EncriptKey));
  end;

  function TApkFileInfo.GetObb: TObb;
  begin
    if TJApkFilesHelper.JavaClass.doesExpansionFileExist(GetFMXNativeActivity, IsMainFile, FileVersion, FileSize, False) then
      Result := TObb.Create(Self)
    else
      Result := nil;
  end;

  class function TApkExpansion.AreFilesDelivered(MainFile: TApkFileInfo): Boolean;
  begin
    Result := TJApkFilesHelper.JavaClass.doesExpansionFileExist(GetFMXNativeActivity, MainFile.IsMainFile, MainFile.FileVersion, MainFile.FileSize, False);
  end;

  class function TApkExpansion.AreFilesDelivered(MainFile, PatchFile: TApkFileInfo): Boolean;
  begin
    Result := TJApkFilesHelper.JavaClass.doesExpansionFileExist(GetFMXNativeActivity, MainFile.IsMainFile, MainFile.FileVersion, MainFile.FileSize, False)
          and TJApkFilesHelper.JavaClass.doesExpansionFileExist(GetFMXNativeActivity, PatchFile.IsMainFile, PatchFile.FileVersion, PatchFile.FileSize, False);
  end;

  { TObb }

  constructor TObb.Create(ApkFile: TApkFileInfo);
  begin
    Create;
    FObb := TJObb.JavaClass.init(GetFMXNativeActivity, ApkFile.ToJApkFileInfo);
    FObb.setListener(Self);
  end;

  function TObb.GetName: string;
  begin
    Result := JStringToString(FObb.getName);
  end;

  function TObb.GetPath: string;
  begin
    Result := JStringToString(FObb.getPath);
  end;

  function TObb.GetMountedPath: string;
  begin
    Result := JStringToString(FObb.getMountedObbPath);
  end;

  function TObb.GetResourcePath(filePath: string): string;
  begin
    Result := JStringToString(FObb.getResourcePath(StringToJString(filePath)));
  end;

  procedure TObb.Mount(Callback: TOnObbStateChangeCallback);
  begin
    FOnStateChange := Callback;
    FObb.mount;
  end;

  procedure TObb.Unmount(Callback: TOnObbStateChangeCallback; Force: Boolean);
  begin
    FOnStateChange := Callback;
    FObb.umount(Force);
  end;

  function TObb.IsMounted: Boolean;
  begin
    Result := FObb.isMounted;
  end;

  procedure TObb.onObbStateChange(path: JString; state: Integer); cdecl;
  begin
    if Assigned(FOnStateChange) then
      TThread.Synchronize(nil, procedure begin
        FOnStateChange(Self, TObbStateKind(state));
      end);
  end;

  { TActivityDownloader }
  {
  constructor TActivityDownloader.Create(PublicKey: string; Salt: array of Byte; MainFile, PatchFile: TApkFileInfo);
  begin
    FDownloader := TJDownloaderActivityLauncher.JavaClass.init(
      StringToJString(PublicKey),ByteArrayToJArray(Salt), CreateApkList(MainFile, PatchFile));
    Create;
  end;

  constructor TActivityDownloader.Create(PublicKey: string; Salt: array of Byte; MainFile: TApkFileInfo);
  var
    Empty: TApkFileInfo;
  begin
    Create(PublicKey, Salt, MainFile, Empty);
  end;

  function TActivityDownloader.Launch(Callback: TOnActivityDownloaderFinish): Boolean;
  begin
    if Assigned(Callback) then
      FOnFinish := Callback;
    TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, ResultCallback);
    Result := FDownloader.launch(GetFMXNativeActivity, kActivityResultCode);
  end;

  procedure TActivityDownloader.SetNotificationLabels(Labels: TDictionary<string, string>);
  begin
    FDownloader.setNotificationLabels(DictionaryToJMap(Labels));
  end;

  procedure TActivityDownloader.SetDownloaderLabels(Labels: TDictionary<string, string>);
  begin
    FDownloader.SetDownloaderLabels(DictionaryToJMap(Labels));
  end;

  procedure TActivityDownloader.ResultCallback(const Sender: TObject; const M: TMessage);
  begin
    if TMessageResultNotification(M).RequestCode = kActivityResultCode then
    begin
      FDownloader.setActivityEnabled(False);
      if Assigned(FOnFinish) then
        TThread.Synchronize(nil, procedure begin
          FOnFinish(TMessageResultNotification(M).ResultCode);
        end);
    end;
  end;
  }

  { TNativeDownloader }

  constructor TNativeDownloader.Create(PublicKey: string; Salt: array of Byte; MainFile, PatchFile: TApkFileInfo);
  begin
    FMainFile := MainFile;
    FPatchFile := FPatchFile;
    FDownloader := TJNativeDownloaderLauncher.JavaClass.init(StringToJString(PublicKey), ByteArrayToJArray(Salt),
      CreateApkList(MainFile, PatchFile));
    Create;
  end;

  constructor TNativeDownloader.Create(PublicKey: string; Salt: array of Byte; MainFile: TApkFileInfo);
  var
    Empty: TApkFileInfo;
  begin
    Create(PublicKey, Salt, MainFile, Empty);
  end;

  function TNativeDownloader.Launch(StateChangeCallback: TOnDownloadStateChange; DownloadProgressCallback: TOnDownloadProgress): Boolean;
  var
    PNativeActivity: PANativeActivity;
  begin
    Result := not TApkExpansion.AreFilesDelivered(FMainFile, FPatchFile);
    if Result then
    begin
      // Callbacks
      PNativeActivity := PANativeActivity(System.DelphiActivity);
      PNativeActivity^.callbacks^.onStart := @NativeActivityOnStart;
      PNativeActivity^.callbacks^.onStop := @NativeActivityOnStop;
      FStateChangeCallback := StateChangeCallback;
      FDownloadProgressCallback := DownloadProgressCallback;
      // Save the receiver object for the callbacks
      NativeDownloaderInstance := Self;
      // Run in ui thread
      UIThread := TUIThread.Create(DoLaunch);
      GetFMXNativeActivity.runOnUiThread(UIThread);
    end;
  end;

  procedure TNativeDownloader.DoLaunch;
  begin
    FDownloader.launch(GetFMXNativeActivity,Self);
    onStart;
  end;

  procedure TNativeDownloader.ClearCallbacks;
  begin
    FStateChangeCallback := nil;
    FDownloadProgressCallback := nil;
  end;

  procedure TNativeDownloader.requestAbortDownload;
  begin
    FDownloader.requestAbortDownload;
  end;

  procedure TNativeDownloader.requestContinueDownload;
  begin
    FDownloader.requestContinueDownload;
    FDownloader.connect(GetFMXNativeActivity); // re-connect to retrieve notifications
  end;

  procedure TNativeDownloader.requestPauseDownload;
  begin
    FDownloader.requestPauseDownload;
  end;

  procedure TNativeDownloader.onDownloadProgress(progress: JDownloadProgressInfo); cdecl;
  var
    ProgressInfo: TDownloadProgressInfo;
  begin
    if Assigned(FDownloadProgressCallback) then
    begin
      ProgressInfo.OverallTotal := progress.mOverallTotal;
      ProgressInfo.OverallProgress := progress.mOverallProgress;
      ProgressInfo.TimeRemaining := progress.mTimeRemaining;
      ProgressInfo.CurrentSpeed := progress.mCurrentSpeed;
      TThread.Synchronize(nil, procedure begin
        FDownloadProgressCallback(ProgressInfo);
      end);
    end;
  end;

  procedure TNativeDownloader.onDownloadStateChanged(newState: Integer); cdecl;
  begin
    if Assigned(FStateChangeCallback) then
      TThread.Synchronize(nil, procedure begin
        FStateChangeCallback(TDownloadStateKind(newState));
      end);
  end;

  procedure TNativeDownloader.onStart;
  begin
    FDownloader.connect(GetFMXNativeActivity);
  end;

  procedure TNativeDownloader.onStop;
  begin
    FDownloader.disconnect(GetFMXNativeActivity);
  end;


procedure RegisterTypes;
begin
{{RegClasses}}end;

initialization
  RegisterTypes;
end.



