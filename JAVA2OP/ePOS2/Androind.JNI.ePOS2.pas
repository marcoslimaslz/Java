{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit ePOS2\Androind.JNI.ePOS2;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Util,
  Androidapi.JNI.Os,
  Androidapi.JNI.Net,
  Androidapi.JNI.Bluetooth,
  Androidapi.JNI.App;

type
// ===== Forward declarations =====

  JUsbAccessory = interface;//android.hardware.usb.UsbAccessory
  JUsbDevice = interface;//android.hardware.usb.UsbDevice
  JUsbDeviceConnection = interface;//android.hardware.usb.UsbDeviceConnection
  JUsbEndpoint = interface;//android.hardware.usb.UsbEndpoint
  JUsbInterface = interface;//android.hardware.usb.UsbInterface
  JUsbManager = interface;//android.hardware.usb.UsbManager
  JUsbRequest = interface;//android.hardware.usb.UsbRequest
  Jepos2_BuildConfig = interface;//com.epson.epos2.BuildConfig
  JEventListener = interface;//java.util.EventListener
  JConnectionListener = interface;//com.epson.epos2.ConnectionListener
  JEpos2CallbackCode = interface;//com.epson.epos2.Epos2CallbackCode
  JEpos2Exception = interface;//com.epson.epos2.Epos2Exception
  Jepos2_Log = interface;//com.epson.epos2.Log
  JNativeInitializer = interface;//com.epson.epos2.NativeInitializer
  JOutputLog = interface;//com.epson.epos2.OutputLog
  JBarcodeScanner = interface;//com.epson.epos2.barcodescanner.BarcodeScanner
  JScanListener = interface;//com.epson.epos2.barcodescanner.ScanListener
  JScannerStatusInfo = interface;//com.epson.epos2.barcodescanner.ScannerStatusInfo
  JCommBox = interface;//com.epson.epos2.commbox.CommBox
  JCommBox_CommBoxHistoryCallbackAdapter = interface;//com.epson.epos2.commbox.CommBox$CommBoxHistoryCallbackAdapter
  JCommBox_CommBoxSendMessageCallbackAdapter = interface;//com.epson.epos2.commbox.CommBox$CommBoxSendMessageCallbackAdapter
  JCommBoxStatusInfo = interface;//com.epson.epos2.commbox.CommBoxStatusInfo
  JGetCommHistoryCallback = interface;//com.epson.epos2.commbox.GetCommHistoryCallback
  JReceiveListener = interface;//com.epson.epos2.commbox.ReceiveListener
  JSendMessageCallback = interface;//com.epson.epos2.commbox.SendMessageCallback
  JDeviceInfo = interface;//com.epson.epos2.discovery.DeviceInfo
  JDiscovery = interface;//com.epson.epos2.discovery.Discovery
  JDiscoveryListener = interface;//com.epson.epos2.discovery.DiscoveryListener
  JFilterOption = interface;//com.epson.epos2.discovery.FilterOption
  JKeyPressListener = interface;//com.epson.epos2.keyboard.KeyPressListener
  Jkeyboard_Keyboard = interface;//com.epson.epos2.keyboard.Keyboard
  JKeyboardStatusInfo = interface;//com.epson.epos2.keyboard.KeyboardStatusInfo
  JReadStringListener = interface;//com.epson.epos2.keyboard.ReadStringListener
  JDisplayStatusInfo = interface;//com.epson.epos2.linedisplay.DisplayStatusInfo
  JLineDisplay = interface;//com.epson.epos2.linedisplay.LineDisplay
  Jlinedisplay_ReceiveListener = interface;//com.epson.epos2.linedisplay.ReceiveListener
  JLogoKeyCode = interface;//com.epson.epos2.printer.LogoKeyCode
  Jprinter_Printer = interface;//com.epson.epos2.printer.Printer
  JPrinterStatusInfo = interface;//com.epson.epos2.printer.PrinterStatusInfo
  Jprinter_ReceiveListener = interface;//com.epson.epos2.printer.ReceiveListener
  JStatusChangeListener = interface;//com.epson.epos2.printer.StatusChangeListener
  Jsimpleserial_ReceiveListener = interface;//com.epson.epos2.simpleserial.ReceiveListener
  JSerialStatusInfo = interface;//com.epson.epos2.simpleserial.SerialStatusInfo
  JSimpleSerial = interface;//com.epson.epos2.simpleserial.SimpleSerial
  JConnectListener = interface;//com.epson.eposdevice.ConnectListener
  JCreateDeviceListener = interface;//com.epson.eposdevice.CreateDeviceListener
  JDeleteDeviceListener = interface;//com.epson.eposdevice.DeleteDeviceListener
  JNativeDevice = interface;//com.epson.eposdevice.NativeDevice
  JDeviceInnerImplement = interface;//com.epson.eposdevice.DeviceInnerImplement
  JDevice = interface;//com.epson.eposdevice.Device
  JDevice_ConnectCallbackAdapter = interface;//com.epson.eposdevice.Device$ConnectCallbackAdapter
  JDevice_CreateDeviceCallbackAdapter = interface;//com.epson.eposdevice.Device$CreateDeviceCallbackAdapter
  JDevice_DeleteDeviceCallbackAdapter = interface;//com.epson.eposdevice.Device$DeleteDeviceCallbackAdapter
  JNativeCommBoxManager = interface;//com.epson.eposdevice.commbox.NativeCommBoxManager
  JCommBoxManager = interface;//com.epson.eposdevice.commbox.CommBoxManager
  JDeviceInnerImplement_CommBoxManagerInner = interface;//com.epson.eposdevice.DeviceInnerImplement$CommBoxManagerInner
  JNativeCommBox = interface;//com.epson.eposdevice.commbox.NativeCommBox
  Jcommbox_CommBox = interface;//com.epson.eposdevice.commbox.CommBox
  JCommBoxManager_CommBoxAccessor = interface;//com.epson.eposdevice.commbox.CommBoxManager$CommBoxAccessor
  JCommBoxManagerInner_CommBoxInner = interface;//com.epson.eposdevice.DeviceInnerImplement$CommBoxManagerInner$CommBoxInner
  JNativeDisplay = interface;//com.epson.eposdevice.display.NativeDisplay
  Jdisplay_Display = interface;//com.epson.eposdevice.display.Display
  JDeviceInnerImplement_DisplayInner = interface;//com.epson.eposdevice.DeviceInnerImplement$DisplayInner
  JDeviceInnerImplement_IHandleObject = interface;//com.epson.eposdevice.DeviceInnerImplement$IHandleObject
  JDeviceInnerImplement_IDeviceObject = interface;//com.epson.eposdevice.DeviceInnerImplement$IDeviceObject
  JNativeKeyboard = interface;//com.epson.eposdevice.keyboard.NativeKeyboard
  Jeposdevice_keyboard_Keyboard = interface;//com.epson.eposdevice.keyboard.Keyboard
  JDeviceInnerImplement_KeyboardInner = interface;//com.epson.eposdevice.DeviceInnerImplement$KeyboardInner
  JNativePrinter = interface;//com.epson.eposdevice.printer.NativePrinter
  Jeposdevice_printer_Printer = interface;//com.epson.eposdevice.printer.Printer
  JDeviceInnerImplement_PrinterInner = interface;//com.epson.eposdevice.DeviceInnerImplement$PrinterInner
  JNativeScanner = interface;//com.epson.eposdevice.scanner.NativeScanner
  Jscanner_Scanner = interface;//com.epson.eposdevice.scanner.Scanner
  JDeviceInnerImplement_ScannerInner = interface;//com.epson.eposdevice.DeviceInnerImplement$ScannerInner
  JNativeSimpleSerial = interface;//com.epson.eposdevice.simpleserial.NativeSimpleSerial
  Jsimpleserial_SimpleSerial = interface;//com.epson.eposdevice.simpleserial.SimpleSerial
  JDeviceInnerImplement_SimpleSerialInner = interface;//com.epson.eposdevice.DeviceInnerImplement$SimpleSerialInner
  JDisconnectListener = interface;//com.epson.eposdevice.DisconnectListener
  JEposCallbackCode = interface;//com.epson.eposdevice.EposCallbackCode
  JEposException = interface;//com.epson.eposdevice.EposException
  Jeposdevice_Log = interface;//com.epson.eposdevice.Log
  JNativeDevice_NativeConnectCallbackAdapter = interface;//com.epson.eposdevice.NativeDevice$NativeConnectCallbackAdapter
  JNativeDevice_NativeCreateDeviceCallbackAdapter = interface;//com.epson.eposdevice.NativeDevice$NativeCreateDeviceCallbackAdapter
  JNativeDevice_NativeDeleteDeviceCallbackAdapter = interface;//com.epson.eposdevice.NativeDevice$NativeDeleteDeviceCallbackAdapter
  JReconnectListener = interface;//com.epson.eposdevice.ReconnectListener
  JReconnectingListener = interface;//com.epson.eposdevice.ReconnectingListener
  JCloseCommBoxListener = interface;//com.epson.eposdevice.commbox.CloseCommBoxListener
  Jcommbox_CommBox_CommBoxHistoryCallbackAdapter = interface;//com.epson.eposdevice.commbox.CommBox$CommBoxHistoryCallbackAdapter
  JCommBox_CommBoxSendDataCallbackAdapter = interface;//com.epson.eposdevice.commbox.CommBox$CommBoxSendDataCallbackAdapter
  JCommBoxManager_CloseCommBoxCallbackAdapter = interface;//com.epson.eposdevice.commbox.CommBoxManager$CloseCommBoxCallbackAdapter
  JCommBoxManager_OpenCommBoxCallbackAdapter = interface;//com.epson.eposdevice.commbox.CommBoxManager$OpenCommBoxCallbackAdapter
  JGetCommHistoryListener = interface;//com.epson.eposdevice.commbox.GetCommHistoryListener
  JNativeCommBox_NativeCommBoxHistoryCallbackAdapter = interface;//com.epson.eposdevice.commbox.NativeCommBox$NativeCommBoxHistoryCallbackAdapter
  JNativeCommBox_NativeCommBoxSendDataCallbackAdapter = interface;//com.epson.eposdevice.commbox.NativeCommBox$NativeCommBoxSendDataCallbackAdapter
  JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter = interface;//com.epson.eposdevice.commbox.NativeCommBoxManager$NativeCloseCommBoxCallbackAdapter
  JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter = interface;//com.epson.eposdevice.commbox.NativeCommBoxManager$NativeOpenCommBoxCallbackAdapter
  JOpenCommBoxListener = interface;//com.epson.eposdevice.commbox.OpenCommBoxListener
  Jcommbox_ReceiveListener = interface;//com.epson.eposdevice.commbox.ReceiveListener
  JSendDataListener = interface;//com.epson.eposdevice.commbox.SendDataListener
  Jdisplay_ReceiveListener = interface;//com.epson.eposdevice.display.ReceiveListener
  Jkeyboard_KeyPressListener = interface;//com.epson.eposdevice.keyboard.KeyPressListener
  JStringListener = interface;//com.epson.eposdevice.keyboard.StringListener
  JBatteryLowListener = interface;//com.epson.eposdevice.printer.BatteryLowListener
  JBatteryOkListener = interface;//com.epson.eposdevice.printer.BatteryOkListener
  JBatteryStatusChangeListener = interface;//com.epson.eposdevice.printer.BatteryStatusChangeListener
  JCoverOkListener = interface;//com.epson.eposdevice.printer.CoverOkListener
  JCoverOpenListener = interface;//com.epson.eposdevice.printer.CoverOpenListener
  JDrawerClosedListener = interface;//com.epson.eposdevice.printer.DrawerClosedListener
  JDrawerOpenListener = interface;//com.epson.eposdevice.printer.DrawerOpenListener
  Jeposdevice_printer_ReceiveListener = interface;//com.epson.eposdevice.printer.ReceiveListener
  JJobReceiveListener = interface;//com.epson.eposdevice.printer.JobReceiveListener
  JOfflineListener = interface;//com.epson.eposdevice.printer.OfflineListener
  JOnlineListener = interface;//com.epson.eposdevice.printer.OnlineListener
  JPaperEndListener = interface;//com.epson.eposdevice.printer.PaperEndListener
  JPaperNearEndListener = interface;//com.epson.eposdevice.printer.PaperNearEndListener
  JPaperOkListener = interface;//com.epson.eposdevice.printer.PaperOkListener
  JPowerOffListener = interface;//com.epson.eposdevice.printer.PowerOffListener
  Jprinter_StatusChangeListener = interface;//com.epson.eposdevice.printer.StatusChangeListener
  JDataListener = interface;//com.epson.eposdevice.scanner.DataListener
  JCommandReplayListener = interface;//com.epson.eposdevice.simpleserial.CommandReplayListener
  JBatteryLowEventListener = interface;//com.epson.eposprint.BatteryLowEventListener
  JBatteryOkEventListener = interface;//com.epson.eposprint.BatteryOkEventListener
  JBatteryStatusChangeEventListener = interface;//com.epson.eposprint.BatteryStatusChangeEventListener
  JBuilder = interface;//com.epson.eposprint.Builder
  JCoverOkEventListener = interface;//com.epson.eposprint.CoverOkEventListener
  JCoverOpenEventListener = interface;//com.epson.eposprint.CoverOpenEventListener
  JDrawerClosedEventListener = interface;//com.epson.eposprint.DrawerClosedEventListener
  JDrawerOpenEventListener = interface;//com.epson.eposprint.DrawerOpenEventListener
  Jeposprint_EposException = interface;//com.epson.eposprint.EposException
  Jeposprint_Log = interface;//com.epson.eposprint.Log
  JOfflineEventListener = interface;//com.epson.eposprint.OfflineEventListener
  JOnlineEventListener = interface;//com.epson.eposprint.OnlineEventListener
  JPaperEndEventListener = interface;//com.epson.eposprint.PaperEndEventListener
  JPaperNearEndEventListener = interface;//com.epson.eposprint.PaperNearEndEventListener
  JPaperOkEventListener = interface;//com.epson.eposprint.PaperOkEventListener
  JPowerOffEventListener = interface;//com.epson.eposprint.PowerOffEventListener
  JPrint = interface;//com.epson.eposprint.Print
  JStatusChangeEventListener = interface;//com.epson.eposprint.StatusChangeEventListener
  JDevType = interface;//com.epson.epsonio.DevType
  Jepsonio_DeviceInfo = interface;//com.epson.epsonio.DeviceInfo
  JEpsonIo = interface;//com.epson.epsonio.EpsonIo
  JEpsonIoException = interface;//com.epson.epsonio.EpsonIoException
  Jepsonio_FilterOption = interface;//com.epson.epsonio.FilterOption
  JFinder = interface;//com.epson.epsonio.Finder
  JIoStatus = interface;//com.epson.epsonio.IoStatus
  JNetIFInfo = interface;//com.epson.epsonio.NetIFInfo
  JNetIfResult = interface;//com.epson.epsonio.NetIfResult
  JSupportUsb = interface;//com.epson.epsonio.SupportUsb
  JAdapterHandler = interface;//com.epson.epsonio.bluetooth.AdapterHandler
  JDevBt = interface;//com.epson.epsonio.bluetooth.DevBt
  JDevBt_1 = interface;//com.epson.epsonio.bluetooth.DevBt$1
  JDevBt_2 = interface;//com.epson.epsonio.bluetooth.DevBt$2
  JNetBt = interface;//com.epson.epsonio.bluetooth.NetBt
  JDevUsb = interface;//com.epson.epsonio.usb.DevUsb
  JDevUsb_1 = interface;//com.epson.epsonio.usb.DevUsb$1
  JDevUsb_2 = interface;//com.epson.epsonio.usb.DevUsb$2
  JDevUsb_3 = interface;//com.epson.epsonio.usb.DevUsb$3
  JNetUsb = interface;//com.epson.epsonio.usb.NetUsb
  JUsbConnecter = interface;//com.epson.epsonio.usb.UsbConnecter
  JVector = interface;//java.util.Vector

// ===== Interface declarations =====

  JUsbAccessoryClass = interface(JObjectClass)
    ['{1D9B9887-3355-48AD-9E48-30EA6B124537}']
    {class} function _GetCREATOR: JParcelable_Creator;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbAccessory')]
  JUsbAccessory = interface(JObject)
    ['{083B13FB-2A1A-4659-BECD-9C245475B724}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getDescription: JString; cdecl;
    function getManufacturer: JString; cdecl;
    function getModel: JString; cdecl;
    function getSerial: JString; cdecl;
    function getUri: JString; cdecl;
    function getVersion: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJUsbAccessory = class(TJavaGenericImport<JUsbAccessoryClass, JUsbAccessory>) end;

  JUsbDeviceClass = interface(JObjectClass)
    ['{23359F82-699F-48E1-B1DD-43DD18455D2D}']
    {class} function _GetCREATOR: JParcelable_Creator;
    {class} function getDeviceId(name: JString): Integer; cdecl; overload;
    {class} function getDeviceName(id: Integer): JString; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbDevice')]
  JUsbDevice = interface(JObject)
    ['{EAD5113C-AC54-4131-BED2-46F449FFD4B7}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getDeviceClass: Integer; cdecl;
    function getDeviceId: Integer; cdecl; overload;
    function getDeviceName: JString; cdecl; overload;
    function getDeviceProtocol: Integer; cdecl;
    function getDeviceSubclass: Integer; cdecl;
    function getInterface(index: Integer): JUsbInterface; cdecl;
    function getInterfaceCount: Integer; cdecl;
    function getProductId: Integer; cdecl;
    function getVendorId: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJUsbDevice = class(TJavaGenericImport<JUsbDeviceClass, JUsbDevice>) end;

  JUsbDeviceConnectionClass = interface(JObjectClass)
    ['{83888555-657F-42A1-9BC1-8B23E2F69899}']
  end;

  [JavaSignature('android/hardware/usb/UsbDeviceConnection')]
  JUsbDeviceConnection = interface(JObject)
    ['{6CC94621-8592-4C7F-B28A-2E644692B85A}']
    function bulkTransfer(endpoint: JUsbEndpoint; buffer: TJavaArray<Byte>; length: Integer; timeout: Integer): Integer; cdecl; overload;
    function bulkTransfer(endpoint: JUsbEndpoint; buffer: TJavaArray<Byte>; offset: Integer; length: Integer; timeout: Integer): Integer; cdecl; overload;
    function claimInterface(intf: JUsbInterface; force: Boolean): Boolean; cdecl;
    procedure close; cdecl;
    function controlTransfer(requestType: Integer; request: Integer; value: Integer; index: Integer; buffer: TJavaArray<Byte>; length: Integer; timeout: Integer): Integer; cdecl; overload;
    function controlTransfer(requestType: Integer; request: Integer; value: Integer; index: Integer; buffer: TJavaArray<Byte>; offset: Integer; length: Integer; timeout: Integer): Integer; cdecl; overload;
    function getFileDescriptor: Integer; cdecl;
    function getRawDescriptors: TJavaArray<Byte>; cdecl;
    function getSerial: JString; cdecl;
    function releaseInterface(intf: JUsbInterface): Boolean; cdecl;
    function requestWait: JUsbRequest; cdecl;
  end;
  TJUsbDeviceConnection = class(TJavaGenericImport<JUsbDeviceConnectionClass, JUsbDeviceConnection>) end;

  JUsbEndpointClass = interface(JObjectClass)
    ['{53DC559E-4126-4589-9CDF-681B6A461496}']
    {class} function _GetCREATOR: JParcelable_Creator;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbEndpoint')]
  JUsbEndpoint = interface(JObject)
    ['{A9A1F612-B537-4C37-8523-1B7AEADB1D43}']
    function describeContents: Integer; cdecl;
    function getAddress: Integer; cdecl;
    function getAttributes: Integer; cdecl;
    function getDirection: Integer; cdecl;
    function getEndpointNumber: Integer; cdecl;
    function getInterval: Integer; cdecl;
    function getMaxPacketSize: Integer; cdecl;
    function getType: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJUsbEndpoint = class(TJavaGenericImport<JUsbEndpointClass, JUsbEndpoint>) end;

  JUsbInterfaceClass = interface(JObjectClass)
    ['{59313EE2-7603-4BBC-ACBC-4BC863D31B6C}']
    {class} function _GetCREATOR: JParcelable_Creator;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbInterface')]
  JUsbInterface = interface(JObject)
    ['{026556E6-07DF-422D-AF28-BC06795B91E7}']
    function describeContents: Integer; cdecl;
    function getEndpoint(index: Integer): JUsbEndpoint; cdecl;
    function getEndpointCount: Integer; cdecl;
    function getId: Integer; cdecl;
    function getInterfaceClass: Integer; cdecl;
    function getInterfaceProtocol: Integer; cdecl;
    function getInterfaceSubclass: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJUsbInterface = class(TJavaGenericImport<JUsbInterfaceClass, JUsbInterface>) end;

  JUsbManagerClass = interface(JObjectClass)
    ['{1048A6E9-E1B5-4DA5-A168-ED91E8DE5284}']
    {class} function _GetACTION_USB_ACCESSORY_ATTACHED: JString;
    {class} function _GetACTION_USB_ACCESSORY_DETACHED: JString;
    {class} function _GetACTION_USB_DEVICE_ATTACHED: JString;
    {class} function _GetACTION_USB_DEVICE_DETACHED: JString;
    {class} function _GetEXTRA_ACCESSORY: JString;
    {class} function _GetEXTRA_DEVICE: JString;
    {class} function _GetEXTRA_PERMISSION_GRANTED: JString;
    {class} property ACTION_USB_ACCESSORY_ATTACHED: JString read _GetACTION_USB_ACCESSORY_ATTACHED;
    {class} property ACTION_USB_ACCESSORY_DETACHED: JString read _GetACTION_USB_ACCESSORY_DETACHED;
    {class} property ACTION_USB_DEVICE_ATTACHED: JString read _GetACTION_USB_DEVICE_ATTACHED;
    {class} property ACTION_USB_DEVICE_DETACHED: JString read _GetACTION_USB_DEVICE_DETACHED;
    {class} property EXTRA_ACCESSORY: JString read _GetEXTRA_ACCESSORY;
    {class} property EXTRA_DEVICE: JString read _GetEXTRA_DEVICE;
    {class} property EXTRA_PERMISSION_GRANTED: JString read _GetEXTRA_PERMISSION_GRANTED;
  end;

  [JavaSignature('android/hardware/usb/UsbManager')]
  JUsbManager = interface(JObject)
    ['{6F603A25-E816-4012-9B23-054B428A4A75}']
    function getAccessoryList: TJavaObjectArray<JUsbAccessory>; cdecl;
    function getDeviceList: JHashMap; cdecl;
    function hasPermission(device: JUsbDevice): Boolean; cdecl; overload;
    function hasPermission(accessory: JUsbAccessory): Boolean; cdecl; overload;
    function openAccessory(accessory: JUsbAccessory): JParcelFileDescriptor; cdecl;
    function openDevice(device: JUsbDevice): JUsbDeviceConnection; cdecl;
    procedure requestPermission(device: JUsbDevice; pi: JPendingIntent); cdecl; overload;
    procedure requestPermission(accessory: JUsbAccessory; pi: JPendingIntent); cdecl; overload;
  end;
  TJUsbManager = class(TJavaGenericImport<JUsbManagerClass, JUsbManager>) end;

  JUsbRequestClass = interface(JObjectClass)
    ['{8A8E6489-7B33-4CCC-B25E-2847FD29DA80}']
    {class} function init: JUsbRequest; cdecl;
  end;

  [JavaSignature('android/hardware/usb/UsbRequest')]
  JUsbRequest = interface(JObject)
    ['{C192EBAE-64F9-46FD-9E81-CB44E9D42FB1}']
    function cancel: Boolean; cdecl;
    procedure close; cdecl;
    function getClientData: JObject; cdecl;
    function getEndpoint: JUsbEndpoint; cdecl;
    function initialize(connection: JUsbDeviceConnection; endpoint: JUsbEndpoint): Boolean; cdecl;
    function queue(buffer: JByteBuffer; length: Integer): Boolean; cdecl;
    procedure setClientData(data: JObject); cdecl;
  end;
  TJUsbRequest = class(TJavaGenericImport<JUsbRequestClass, JUsbRequest>) end;

  Jepos2_BuildConfigClass = interface(JObjectClass)
    ['{9CBC06CE-B900-40C2-AED5-1A40CF63A321}']
    {class} function _GetAPPLICATION_ID: JString;
    {class} function _GetBUILD_TYPE: JString;
    {class} function _GetDEBUG: Boolean;
    {class} function _GetFLAVOR: JString;
    {class} function _GetVERSION_CODE: Integer;
    {class} function _GetVERSION_NAME: JString;
    {class} function init: Jepos2_BuildConfig; cdecl;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/epson/epos2/BuildConfig')]
  Jepos2_BuildConfig = interface(JObject)
    ['{833EFF95-3A4D-47EE-AD0B-05394AA3BD7C}']
  end;
  TJepos2_BuildConfig = class(TJavaGenericImport<Jepos2_BuildConfigClass, Jepos2_BuildConfig>) end;

  JEventListenerClass = interface(IJavaClass)
    ['{48BD1D07-BCE3-4F68-982B-617B523C7116}']
  end;

  [JavaSignature('java/util/EventListener')]
  JEventListener = interface(IJavaInstance)
    ['{D9ADB67A-5217-4762-9961-710BF18CAD39}']
  end;
  TJEventListener = class(TJavaGenericImport<JEventListenerClass, JEventListener>) end;

  JConnectionListenerClass = interface(JEventListenerClass)
    ['{10EF1DF8-E95B-4C63-9478-6BE977845590}']
    {class} function _GetEVENT_DISCONNECT: Integer;
    {class} function _GetEVENT_RECONNECT: Integer;
    {class} function _GetEVENT_RECONNECTING: Integer;
    {class} property EVENT_DISCONNECT: Integer read _GetEVENT_DISCONNECT;
    {class} property EVENT_RECONNECT: Integer read _GetEVENT_RECONNECT;
    {class} property EVENT_RECONNECTING: Integer read _GetEVENT_RECONNECTING;
  end;

  [JavaSignature('com/epson/epos2/ConnectionListener')]
  JConnectionListener = interface(JEventListener)
    ['{2D1132CC-62B4-4754-BB37-925BAE3EF571}']
    procedure onConnection(P1: JObject; P2: Integer); cdecl;
  end;
  TJConnectionListener = class(TJavaGenericImport<JConnectionListenerClass, JConnectionListener>) end;

  JEpos2CallbackCodeClass = interface(JObjectClass)
    ['{63AB1935-FDE7-495B-9BC3-93E11CAF3FDD}']
    {class} function _GetCODE_ERR_AUTORECOVER: Integer;
    {class} function _GetCODE_ERR_BATTERY_LOW: Integer;
    {class} function _GetCODE_ERR_COVER_OPEN: Integer;
    {class} function _GetCODE_ERR_CUTTER: Integer;
    {class} function _GetCODE_ERR_EMPTY: Integer;
    {class} function _GetCODE_ERR_FAILURE: Integer;
    {class} function _GetCODE_ERR_INVALID_WINDOW: Integer;
    {class} function _GetCODE_ERR_JOB_NOT_FOUND: Integer;
    {class} function _GetCODE_ERR_MECHANICAL: Integer;
    {class} function _GetCODE_ERR_NOT_FOUND: Integer;
    {class} function _GetCODE_ERR_PORT: Integer;
    {class} function _GetCODE_ERR_SPOOLER: Integer;
    {class} function _GetCODE_ERR_SYSTEM: Integer;
    {class} function _GetCODE_ERR_TIMEOUT: Integer;
    {class} function _GetCODE_ERR_UNRECOVERABLE: Integer;
    {class} function _GetCODE_PRINTING: Integer;
    {class} function _GetCODE_SUCCESS: Integer;
    {class} function init: JEpos2CallbackCode; cdecl;
    {class} property CODE_ERR_AUTORECOVER: Integer read _GetCODE_ERR_AUTORECOVER;
    {class} property CODE_ERR_BATTERY_LOW: Integer read _GetCODE_ERR_BATTERY_LOW;
    {class} property CODE_ERR_COVER_OPEN: Integer read _GetCODE_ERR_COVER_OPEN;
    {class} property CODE_ERR_CUTTER: Integer read _GetCODE_ERR_CUTTER;
    {class} property CODE_ERR_EMPTY: Integer read _GetCODE_ERR_EMPTY;
    {class} property CODE_ERR_FAILURE: Integer read _GetCODE_ERR_FAILURE;
    {class} property CODE_ERR_INVALID_WINDOW: Integer read _GetCODE_ERR_INVALID_WINDOW;
    {class} property CODE_ERR_JOB_NOT_FOUND: Integer read _GetCODE_ERR_JOB_NOT_FOUND;
    {class} property CODE_ERR_MECHANICAL: Integer read _GetCODE_ERR_MECHANICAL;
    {class} property CODE_ERR_NOT_FOUND: Integer read _GetCODE_ERR_NOT_FOUND;
    {class} property CODE_ERR_PORT: Integer read _GetCODE_ERR_PORT;
    {class} property CODE_ERR_SPOOLER: Integer read _GetCODE_ERR_SPOOLER;
    {class} property CODE_ERR_SYSTEM: Integer read _GetCODE_ERR_SYSTEM;
    {class} property CODE_ERR_TIMEOUT: Integer read _GetCODE_ERR_TIMEOUT;
    {class} property CODE_ERR_UNRECOVERABLE: Integer read _GetCODE_ERR_UNRECOVERABLE;
    {class} property CODE_PRINTING: Integer read _GetCODE_PRINTING;
    {class} property CODE_SUCCESS: Integer read _GetCODE_SUCCESS;
  end;

  [JavaSignature('com/epson/epos2/Epos2CallbackCode')]
  JEpos2CallbackCode = interface(JObject)
    ['{1730D64C-851F-4305-895D-E79394C5B04C}']
  end;
  TJEpos2CallbackCode = class(TJavaGenericImport<JEpos2CallbackCodeClass, JEpos2CallbackCode>) end;

  JEpos2ExceptionClass = interface(JExceptionClass)
    ['{839D17C4-A3D1-40BE-B763-DB2D987DD914}']
    {class} function _GetERR_ALREADY_OPENED: Integer;
    {class} function _GetERR_ALREADY_USED: Integer;
    {class} function _GetERR_BOX_CLIENT_OVER: Integer;
    {class} function _GetERR_BOX_COUNT_OVER: Integer;
    {class} function _GetERR_CONNECT: Integer;
    {class} function _GetERR_DISCONNECT: Integer;
    {class} function _GetERR_FAILURE: Integer;
    {class} function _GetERR_ILLEGAL: Integer;
    {class} function _GetERR_IN_USE: Integer;
    {class} function _GetERR_MEMORY: Integer;
    {class} function _GetERR_NOT_FOUND: Integer;
    {class} function _GetERR_PARAM: Integer;
    {class} function _GetERR_PROCESSING: Integer;
    {class} function _GetERR_TIMEOUT: Integer;
    {class} function _GetERR_TYPE_INVALID: Integer;
    {class} function _GetERR_UNSUPPORTED: Integer;
    {class} function init(P1: Integer): JEpos2Exception; cdecl; overload;
    {class} function init(P1: JString; P2: JThrowable): JEpos2Exception; cdecl; overload;
    {class} property ERR_ALREADY_OPENED: Integer read _GetERR_ALREADY_OPENED;
    {class} property ERR_ALREADY_USED: Integer read _GetERR_ALREADY_USED;
    {class} property ERR_BOX_CLIENT_OVER: Integer read _GetERR_BOX_CLIENT_OVER;
    {class} property ERR_BOX_COUNT_OVER: Integer read _GetERR_BOX_COUNT_OVER;
    {class} property ERR_CONNECT: Integer read _GetERR_CONNECT;
    {class} property ERR_DISCONNECT: Integer read _GetERR_DISCONNECT;
    {class} property ERR_FAILURE: Integer read _GetERR_FAILURE;
    {class} property ERR_ILLEGAL: Integer read _GetERR_ILLEGAL;
    {class} property ERR_IN_USE: Integer read _GetERR_IN_USE;
    {class} property ERR_MEMORY: Integer read _GetERR_MEMORY;
    {class} property ERR_NOT_FOUND: Integer read _GetERR_NOT_FOUND;
    {class} property ERR_PARAM: Integer read _GetERR_PARAM;
    {class} property ERR_PROCESSING: Integer read _GetERR_PROCESSING;
    {class} property ERR_TIMEOUT: Integer read _GetERR_TIMEOUT;
    {class} property ERR_TYPE_INVALID: Integer read _GetERR_TYPE_INVALID;
    {class} property ERR_UNSUPPORTED: Integer read _GetERR_UNSUPPORTED;
  end;

  [JavaSignature('com/epson/epos2/Epos2Exception')]
  JEpos2Exception = interface(JException)
    ['{E427543D-7D12-4C63-A4D7-00889D93F9D6}']
    function getErrorStatus: Integer; cdecl;
  end;
  TJEpos2Exception = class(TJavaGenericImport<JEpos2ExceptionClass, JEpos2Exception>) end;

  Jepos2_LogClass = interface(JObjectClass)
    ['{B428DB09-4F4A-44FC-B9AD-FE9BFD9302AD}']
    {class} function _GetLOGLEVEL_LOW: Integer;
    {class} function _GetOUTPUT_DISABLE: Integer;
    {class} function _GetOUTPUT_STORAGE: Integer;
    {class} function _GetOUTPUT_TCP: Integer;
    {class} function _GetPERIOD_PERMANENT: Integer;
    {class} function _GetPERIOD_TEMPORARY: Integer;
    {class} function getSdkVersion: JString; cdecl;
    {class} function init: Jepos2_Log; cdecl;
    {class} procedure setLogSettings(P1: JContext; P2: Integer; P3: Integer; P4: JString; P5: Integer; P6: Integer; P7: Integer); cdecl;
    {class} property LOGLEVEL_LOW: Integer read _GetLOGLEVEL_LOW;
    {class} property OUTPUT_DISABLE: Integer read _GetOUTPUT_DISABLE;
    {class} property OUTPUT_STORAGE: Integer read _GetOUTPUT_STORAGE;
    {class} property OUTPUT_TCP: Integer read _GetOUTPUT_TCP;
    {class} property PERIOD_PERMANENT: Integer read _GetPERIOD_PERMANENT;
    {class} property PERIOD_TEMPORARY: Integer read _GetPERIOD_TEMPORARY;
  end;

  [JavaSignature('com/epson/epos2/Log')]
  Jepos2_Log = interface(JObject)
    ['{7A88931E-0FBB-44F8-9A7A-585BA819B578}']
  end;
  TJepos2_Log = class(TJavaGenericImport<Jepos2_LogClass, Jepos2_Log>) end;

  JNativeInitializerClass = interface(JObjectClass)
    ['{DC44B5F4-B4A6-43FE-8CFF-8453499F766D}']
    {class} procedure initializeNativeEnv(P1: JContext); cdecl;
  end;

  [JavaSignature('com/epson/epos2/NativeInitializer')]
  JNativeInitializer = interface(JObject)
    ['{A059BEFF-0E29-49EB-9EF3-4F804554285F}']
  end;
  TJNativeInitializer = class(TJavaGenericImport<JNativeInitializerClass, JNativeInitializer>) end;

  JOutputLogClass = interface(JObjectClass)
    ['{43F41FFE-7861-407A-8E33-5E52A6B61B20}']
    {class} procedure outputException(P1: JString; P2: Int64; P3: JException); cdecl;
    {class} procedure readLogSettings(P1: JContext); cdecl;
  end;

  [JavaSignature('com/epson/epos2/OutputLog')]
  JOutputLog = interface(JObject)
    ['{9C95E558-ECE1-4700-80E1-F64BE4BF25F5}']
  end;
  TJOutputLog = class(TJavaGenericImport<JOutputLogClass, JOutputLog>) end;

  JBarcodeScannerClass = interface(JObjectClass)
    ['{D1FA1CE0-1209-4F13-B08D-1D8244251BA1}']
    {class} function _GetEVENT_DISCONNECT: Integer;
    {class} function _GetEVENT_RECONNECT: Integer;
    {class} function _GetEVENT_RECONNECTING: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetTRUE: Integer;
    {class} function init(P1: JContext): JBarcodeScanner; cdecl;
    {class} property EVENT_DISCONNECT: Integer read _GetEVENT_DISCONNECT;
    {class} property EVENT_RECONNECT: Integer read _GetEVENT_RECONNECT;
    {class} property EVENT_RECONNECTING: Integer read _GetEVENT_RECONNECTING;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/epos2/barcodescanner/BarcodeScanner')]
  JBarcodeScanner = interface(JObject)
    ['{EAB26EA4-B6B6-4BAC-A396-46C594159630}']
    procedure connect(P1: JString; P2: Integer); cdecl;
    procedure disconnect; cdecl;
    function getAdmin: JString; cdecl;
    function getLocation: JString; cdecl;
    function getStatus: JScannerStatusInfo; cdecl;
    procedure setConnectionEventListener(P1: JConnectionListener); cdecl;
    procedure setScanEventListener(P1: JScanListener); cdecl;
  end;
  TJBarcodeScanner = class(TJavaGenericImport<JBarcodeScannerClass, JBarcodeScanner>) end;

  JScanListenerClass = interface(JEventListenerClass)
    ['{5CE54C46-3608-4279-A926-9DC460701E5C}']
  end;

  [JavaSignature('com/epson/epos2/barcodescanner/ScanListener')]
  JScanListener = interface(JEventListener)
    ['{446AF67B-ECC5-414F-A405-C85B9CD52994}']
    procedure onScanData(P1: JBarcodeScanner; P2: JString); cdecl;
  end;
  TJScanListener = class(TJavaGenericImport<JScanListenerClass, JScanListener>) end;

  JScannerStatusInfoClass = interface(JObjectClass)
    ['{0E87E504-2BE4-4B37-A09D-2178F649C6E9}']
    {class} function init: JScannerStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/barcodescanner/ScannerStatusInfo')]
  JScannerStatusInfo = interface(JObject)
    ['{B6DE3CC9-85BA-48C5-94D3-4F128DFB5990}']
    function getConnection: Integer; cdecl;
  end;
  TJScannerStatusInfo = class(TJavaGenericImport<JScannerStatusInfoClass, JScannerStatusInfo>) end;

  JCommBoxClass = interface(JObjectClass)
    ['{16E073CA-0836-49C4-87B9-76AECFDE26CD}']
    {class} function _GetEVENT_DISCONNECT: Integer;
    {class} function _GetEVENT_RECONNECT: Integer;
    {class} function _GetEVENT_RECONNECTING: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetTRUE: Integer;
    {class} function init(P1: JContext): JCommBox; cdecl;
    {class} property EVENT_DISCONNECT: Integer read _GetEVENT_DISCONNECT;
    {class} property EVENT_RECONNECT: Integer read _GetEVENT_RECONNECT;
    {class} property EVENT_RECONNECTING: Integer read _GetEVENT_RECONNECTING;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/epos2/commbox/CommBox')]
  JCommBox = interface(JObject)
    ['{0978B334-103A-48C3-9431-1DAC45A0AE75}']
    procedure connect(P1: JString; P2: Integer; P3: JString); cdecl;
    procedure disconnect; cdecl;
    function getAdmin: JString; cdecl;
    procedure getCommHistory(P1: JGetCommHistoryCallback); cdecl;
    function getLocation: JString; cdecl;
    function getStatus: JCommBoxStatusInfo; cdecl;
    procedure sendMessage(P1: JString; P2: JString; P3: JSendMessageCallback); cdecl;
    procedure setConnectionEventListener(P1: JConnectionListener); cdecl;
    procedure setReceiveEventListener(P1: JReceiveListener); cdecl;
  end;
  TJCommBox = class(TJavaGenericImport<JCommBoxClass, JCommBox>) end;

  JCommBox_CommBoxHistoryCallbackAdapterClass = interface(JObjectClass)
    ['{B5332678-7FF2-4BAD-A2C5-093110BB0DF7}']
    {class} function init(P1: JCommBox; P2: Int64; P3: JGetCommHistoryCallback; P4: JCommBox): JCommBox_CommBoxHistoryCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/epos2/commbox/CommBox$CommBoxHistoryCallbackAdapter')]
  JCommBox_CommBoxHistoryCallbackAdapter = interface(JObject)
    ['{727CC1D9-35C3-4489-B8DC-9283F2B4578C}']
    procedure addHistory(P1: JString; P2: JString; P3: JString); cdecl;
    function getAdapterCommBoxHandle: Int64; cdecl;
    procedure onCommBoxHistory(P1: Int64; P2: Integer); cdecl;
  end;
  TJCommBox_CommBoxHistoryCallbackAdapter = class(TJavaGenericImport<JCommBox_CommBoxHistoryCallbackAdapterClass, JCommBox_CommBoxHistoryCallbackAdapter>) end;

  JCommBox_CommBoxSendMessageCallbackAdapterClass = interface(JObjectClass)
    ['{B8E4DDE9-C9AD-4C84-8FAD-570CD146B57A}']
    {class} function init(P1: JCommBox; P2: Int64; P3: JSendMessageCallback; P4: JCommBox): JCommBox_CommBoxSendMessageCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/epos2/commbox/CommBox$CommBoxSendMessageCallbackAdapter')]
  JCommBox_CommBoxSendMessageCallbackAdapter = interface(JObject)
    ['{2DA0BBE0-2E0B-4DD2-8A78-712620DA07A4}']
    function getAdapterCommBoxHandle: Int64; cdecl;
    procedure onCommBoxSendMessage(P1: Int64; P2: Integer; P3: Int64); cdecl;
  end;
  TJCommBox_CommBoxSendMessageCallbackAdapter = class(TJavaGenericImport<JCommBox_CommBoxSendMessageCallbackAdapterClass, JCommBox_CommBoxSendMessageCallbackAdapter>) end;

  JCommBoxStatusInfoClass = interface(JObjectClass)
    ['{420ADB3F-A0CF-4D22-B889-0F1ECD52B386}']
    {class} function init: JCommBoxStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/commbox/CommBoxStatusInfo')]
  JCommBoxStatusInfo = interface(JObject)
    ['{65F2980A-4CB9-4CB7-94DB-FF3E871C7F6F}']
    function getConnection: Integer; cdecl;
  end;
  TJCommBoxStatusInfo = class(TJavaGenericImport<JCommBoxStatusInfoClass, JCommBoxStatusInfo>) end;

  JGetCommHistoryCallbackClass = interface(JEventListenerClass)
    ['{4B1CE821-2B43-4870-8EE4-0CC4945EF295}']
  end;

  [JavaSignature('com/epson/epos2/commbox/GetCommHistoryCallback')]
  JGetCommHistoryCallback = interface(JEventListener)
    ['{A04F6E47-7C3B-472A-8984-5242277CE709}']
    procedure onGetCommHistory(P1: JCommBox; P2: Integer; P3: JArrayList); cdecl;
  end;
  TJGetCommHistoryCallback = class(TJavaGenericImport<JGetCommHistoryCallbackClass, JGetCommHistoryCallback>) end;

  JReceiveListenerClass = interface(IJavaClass)
    ['{5C35BE97-AE14-4F7E-BB3B-BA7E2E9FCB03}']
  end;

  [JavaSignature('com/epson/epos2/commbox/ReceiveListener')]
  JReceiveListener = interface(IJavaInstance)
    ['{714936C3-9A6C-4E8E-A200-CFC030537912}']
    procedure onCommBoxReceive(P1: JCommBox; P2: JString; P3: JString; P4: JString); cdecl;
  end;
  TJReceiveListener = class(TJavaGenericImport<JReceiveListenerClass, JReceiveListener>) end;

  JSendMessageCallbackClass = interface(JEventListenerClass)
    ['{93C57D15-9F91-4110-AA94-B82EF2494879}']
  end;

  [JavaSignature('com/epson/epos2/commbox/SendMessageCallback')]
  JSendMessageCallback = interface(JEventListener)
    ['{2528D483-0126-4B3C-8167-CC4AF9A5E4F0}']
    procedure onCommBoxSendMessage(P1: JCommBox; P2: Integer; P3: Integer); cdecl;
  end;
  TJSendMessageCallback = class(TJavaGenericImport<JSendMessageCallbackClass, JSendMessageCallback>) end;

  JDeviceInfoClass = interface(JObjectClass)
    ['{E05DB082-70CF-4204-8EC4-084E8A8B9E7F}']
    {class} function init: JDeviceInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/discovery/DeviceInfo')]
  JDeviceInfo = interface(JObject)
    ['{FDF40A05-742B-4F8F-8F18-1DCCFAD9DDDE}']
    function getBdAddress: JString; cdecl;
    function getDeviceName: JString; cdecl;
    function getDeviceType: Integer; cdecl;
    function getIpAddress: JString; cdecl;
    function getMacAddress: JString; cdecl;
    function getTarget: JString; cdecl;
  end;
  TJDeviceInfo = class(TJavaGenericImport<JDeviceInfoClass, JDeviceInfo>) end;

  JDiscoveryClass = interface(JObjectClass)
    ['{03670C60-AC30-4C56-881D-43DC9D1EB03E}']
    {class} function _GetFILTER_NAME: Integer;
    {class} function _GetFILTER_NONE: Integer;
    {class} function _GetMODEL_ALL: Integer;
    {class} function _GetPORTTYPE_ALL: Integer;
    {class} function _GetPORTTYPE_BLUETOOTH: Integer;
    {class} function _GetPORTTYPE_TCP: Integer;
    {class} function _GetPORTTYPE_USB: Integer;
    {class} function _GetTYPE_ALL: Integer;
    {class} function _GetTYPE_DISPLAY: Integer;
    {class} function _GetTYPE_KEYBOARD: Integer;
    {class} function _GetTYPE_PRINTER: Integer;
    {class} function _GetTYPE_SCANNER: Integer;
    {class} function _GetTYPE_SERIAL: Integer;
    {class} function init: JDiscovery; cdecl;
    {class} procedure start(P1: JContext; P2: JFilterOption; P3: JDiscoveryListener); cdecl;
    {class} procedure stop; cdecl;
    {class} property FILTER_NAME: Integer read _GetFILTER_NAME;
    {class} property FILTER_NONE: Integer read _GetFILTER_NONE;
    {class} property MODEL_ALL: Integer read _GetMODEL_ALL;
    {class} property PORTTYPE_ALL: Integer read _GetPORTTYPE_ALL;
    {class} property PORTTYPE_BLUETOOTH: Integer read _GetPORTTYPE_BLUETOOTH;
    {class} property PORTTYPE_TCP: Integer read _GetPORTTYPE_TCP;
    {class} property PORTTYPE_USB: Integer read _GetPORTTYPE_USB;
    {class} property TYPE_ALL: Integer read _GetTYPE_ALL;
    {class} property TYPE_DISPLAY: Integer read _GetTYPE_DISPLAY;
    {class} property TYPE_KEYBOARD: Integer read _GetTYPE_KEYBOARD;
    {class} property TYPE_PRINTER: Integer read _GetTYPE_PRINTER;
    {class} property TYPE_SCANNER: Integer read _GetTYPE_SCANNER;
    {class} property TYPE_SERIAL: Integer read _GetTYPE_SERIAL;
  end;

  [JavaSignature('com/epson/epos2/discovery/Discovery')]
  JDiscovery = interface(JObject)
    ['{D24B5A2C-2C19-4FA2-AFC7-2DBBC27D9789}']
  end;
  TJDiscovery = class(TJavaGenericImport<JDiscoveryClass, JDiscovery>) end;

  JDiscoveryListenerClass = interface(IJavaClass)
    ['{6C6DB95F-82FA-41AB-9460-2EE327681305}']
  end;

  [JavaSignature('com/epson/epos2/discovery/DiscoveryListener')]
  JDiscoveryListener = interface(IJavaInstance)
    ['{786BAA85-6FC1-4830-9B67-47D5D9564936}']
    procedure onDiscovery(P1: JDeviceInfo); cdecl;
  end;
  TJDiscoveryListener = class(TJavaGenericImport<JDiscoveryListenerClass, JDiscoveryListener>) end;

  JFilterOptionClass = interface(JObjectClass)
    ['{485F7660-2FD3-4221-B62B-671408DC90E0}']
    {class} function init: JFilterOption; cdecl;
  end;

  [JavaSignature('com/epson/epos2/discovery/FilterOption')]
  JFilterOption = interface(JObject)
    ['{E7936E5B-5097-42A6-8441-BDCBCD54F8DE}']
    function getBroadcast: JString; cdecl;
    function getDeviceModel: Integer; cdecl;
    function getDeviceType: Integer; cdecl;
    function getEpsonFilter: Integer; cdecl;
    function getPortType: Integer; cdecl;
    procedure setBroadcast(P1: JString); cdecl;
    procedure setDeviceModel(P1: Integer); cdecl;
    procedure setDeviceType(P1: Integer); cdecl;
    procedure setEpsonFilter(P1: Integer); cdecl;
    procedure setPortType(P1: Integer); cdecl;
  end;
  TJFilterOption = class(TJavaGenericImport<JFilterOptionClass, JFilterOption>) end;

  JKeyPressListenerClass = interface(JEventListenerClass)
    ['{28350637-C673-43B5-82EA-BF5EB930F909}']
  end;

  [JavaSignature('com/epson/epos2/keyboard/KeyPressListener')]
  JKeyPressListener = interface(JEventListener)
    ['{03078C8E-F447-4E0C-9229-9A7C46D4F326}']
    procedure onKbdKeyPress(P1: Jkeyboard_Keyboard; P2: Integer; P3: JString); cdecl;
  end;
  TJKeyPressListener = class(TJavaGenericImport<JKeyPressListenerClass, JKeyPressListener>) end;

  Jkeyboard_KeyboardClass = interface(JObjectClass)
    ['{46F15622-16AA-4F22-B904-58647609E5AF}']
    {class} function _GetEVENT_DISCONNECT: Integer;
    {class} function _GetEVENT_RECONNECT: Integer;
    {class} function _GetEVENT_RECONNECTING: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetTRUE: Integer;
    {class} function _GetVK_0: Integer;
    {class} function _GetVK_1: Integer;
    {class} function _GetVK_2: Integer;
    {class} function _GetVK_3: Integer;
    {class} function _GetVK_4: Integer;
    {class} function _GetVK_5: Integer;
    {class} function _GetVK_6: Integer;
    {class} function _GetVK_7: Integer;
    {class} function _GetVK_8: Integer;
    {class} function _GetVK_9: Integer;
    {class} function _GetVK_A: Integer;
    {class} function _GetVK_ADD: Integer;
    {class} function _GetVK_B: Integer;
    {class} function _GetVK_BACK: Integer;
    {class} function _GetVK_C: Integer;
    {class} function _GetVK_CAPITAL: Integer;
    {class} function _GetVK_CONTROL: Integer;
    {class} function _GetVK_CONVERT: Integer;
    {class} function _GetVK_D: Integer;
    {class} function _GetVK_DELETE: Integer;
    {class} function _GetVK_DOWN: Integer;
    {class} function _GetVK_E: Integer;
    {class} function _GetVK_END: Integer;
    {class} function _GetVK_ESCAPE: Integer;
    {class} function _GetVK_F: Integer;
    {class} function _GetVK_F1: Integer;
    {class} function _GetVK_F10: Integer;
    {class} function _GetVK_F11: Integer;
    {class} function _GetVK_F12: Integer;
    {class} function _GetVK_F2: Integer;
    {class} function _GetVK_F3: Integer;
    {class} function _GetVK_F4: Integer;
    {class} function _GetVK_F5: Integer;
    {class} function _GetVK_F6: Integer;
    {class} function _GetVK_F7: Integer;
    {class} function _GetVK_F8: Integer;
    {class} function _GetVK_F9: Integer;
    {class} function _GetVK_G: Integer;
    {class} function _GetVK_H: Integer;
    {class} function _GetVK_HOME: Integer;
    {class} function _GetVK_I: Integer;
    {class} function _GetVK_INSERT: Integer;
    {class} function _GetVK_J: Integer;
    {class} function _GetVK_K: Integer;
    {class} function _GetVK_L: Integer;
    {class} function _GetVK_LEFT: Integer;
    {class} function _GetVK_M: Integer;
    {class} function _GetVK_MENU: Integer;
    {class} function _GetVK_MULTIPLY: Integer;
    {class} function _GetVK_N: Integer;
    {class} function _GetVK_NEXT: Integer;
    {class} function _GetVK_NONCONVERT: Integer;
    {class} function _GetVK_O: Integer;
    {class} function _GetVK_OEM_1: Integer;
    {class} function _GetVK_OEM_2: Integer;
    {class} function _GetVK_OEM_3: Integer;
    {class} function _GetVK_OEM_4: Integer;
    {class} function _GetVK_OEM_5: Integer;
    {class} function _GetVK_OEM_6: Integer;
    {class} function _GetVK_OEM_7: Integer;
    {class} function _GetVK_OEM_ATTN: Integer;
    {class} function _GetVK_OEM_COMMA: Integer;
    {class} function _GetVK_OEM_MINUS: Integer;
    {class} function _GetVK_OEM_PERIOD: Integer;
    {class} function _GetVK_OEM_PLUS: Integer;
    {class} function _GetVK_P: Integer;
    {class} function _GetVK_PRIOR: Integer;
    {class} function _GetVK_Q: Integer;
    {class} function _GetVK_R: Integer;
    {class} function _GetVK_RETURN: Integer;
    {class} function _GetVK_RIGHT: Integer;
    {class} function _GetVK_S: Integer;
    {class} function _GetVK_SHIFT: Integer;
    {class} function _GetVK_SPACE: Integer;
    {class} function _GetVK_SUBTRACT: Integer;
    {class} function _GetVK_T: Integer;
    {class} function _GetVK_TAB: Integer;
    {class} function _GetVK_U: Integer;
    {class} function _GetVK_UP: Integer;
    {class} function _GetVK_V: Integer;
    {class} function _GetVK_W: Integer;
    {class} function _GetVK_X: Integer;
    {class} function _GetVK_Y: Integer;
    {class} function _GetVK_Z: Integer;
    {class} function init(P1: JContext): Jkeyboard_Keyboard; cdecl;
    {class} property EVENT_DISCONNECT: Integer read _GetEVENT_DISCONNECT;
    {class} property EVENT_RECONNECT: Integer read _GetEVENT_RECONNECT;
    {class} property EVENT_RECONNECTING: Integer read _GetEVENT_RECONNECTING;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property TRUE: Integer read _GetTRUE;
    {class} property VK_0: Integer read _GetVK_0;
    {class} property VK_1: Integer read _GetVK_1;
    {class} property VK_2: Integer read _GetVK_2;
    {class} property VK_3: Integer read _GetVK_3;
    {class} property VK_4: Integer read _GetVK_4;
    {class} property VK_5: Integer read _GetVK_5;
    {class} property VK_6: Integer read _GetVK_6;
    {class} property VK_7: Integer read _GetVK_7;
    {class} property VK_8: Integer read _GetVK_8;
    {class} property VK_9: Integer read _GetVK_9;
    {class} property VK_A: Integer read _GetVK_A;
    {class} property VK_ADD: Integer read _GetVK_ADD;
    {class} property VK_B: Integer read _GetVK_B;
    {class} property VK_BACK: Integer read _GetVK_BACK;
    {class} property VK_C: Integer read _GetVK_C;
    {class} property VK_CAPITAL: Integer read _GetVK_CAPITAL;
    {class} property VK_CONTROL: Integer read _GetVK_CONTROL;
    {class} property VK_CONVERT: Integer read _GetVK_CONVERT;
    {class} property VK_D: Integer read _GetVK_D;
    {class} property VK_DELETE: Integer read _GetVK_DELETE;
    {class} property VK_DOWN: Integer read _GetVK_DOWN;
    {class} property VK_E: Integer read _GetVK_E;
    {class} property VK_END: Integer read _GetVK_END;
    {class} property VK_ESCAPE: Integer read _GetVK_ESCAPE;
    {class} property VK_F: Integer read _GetVK_F;
    {class} property VK_F1: Integer read _GetVK_F1;
    {class} property VK_F10: Integer read _GetVK_F10;
    {class} property VK_F11: Integer read _GetVK_F11;
    {class} property VK_F12: Integer read _GetVK_F12;
    {class} property VK_F2: Integer read _GetVK_F2;
    {class} property VK_F3: Integer read _GetVK_F3;
    {class} property VK_F4: Integer read _GetVK_F4;
    {class} property VK_F5: Integer read _GetVK_F5;
    {class} property VK_F6: Integer read _GetVK_F6;
    {class} property VK_F7: Integer read _GetVK_F7;
    {class} property VK_F8: Integer read _GetVK_F8;
    {class} property VK_F9: Integer read _GetVK_F9;
    {class} property VK_G: Integer read _GetVK_G;
    {class} property VK_H: Integer read _GetVK_H;
    {class} property VK_HOME: Integer read _GetVK_HOME;
    {class} property VK_I: Integer read _GetVK_I;
    {class} property VK_INSERT: Integer read _GetVK_INSERT;
    {class} property VK_J: Integer read _GetVK_J;
    {class} property VK_K: Integer read _GetVK_K;
    {class} property VK_L: Integer read _GetVK_L;
    {class} property VK_LEFT: Integer read _GetVK_LEFT;
    {class} property VK_M: Integer read _GetVK_M;
    {class} property VK_MENU: Integer read _GetVK_MENU;
    {class} property VK_MULTIPLY: Integer read _GetVK_MULTIPLY;
    {class} property VK_N: Integer read _GetVK_N;
    {class} property VK_NEXT: Integer read _GetVK_NEXT;
    {class} property VK_NONCONVERT: Integer read _GetVK_NONCONVERT;
    {class} property VK_O: Integer read _GetVK_O;
    {class} property VK_OEM_1: Integer read _GetVK_OEM_1;
    {class} property VK_OEM_2: Integer read _GetVK_OEM_2;
    {class} property VK_OEM_3: Integer read _GetVK_OEM_3;
    {class} property VK_OEM_4: Integer read _GetVK_OEM_4;
    {class} property VK_OEM_5: Integer read _GetVK_OEM_5;
    {class} property VK_OEM_6: Integer read _GetVK_OEM_6;
    {class} property VK_OEM_7: Integer read _GetVK_OEM_7;
    {class} property VK_OEM_ATTN: Integer read _GetVK_OEM_ATTN;
    {class} property VK_OEM_COMMA: Integer read _GetVK_OEM_COMMA;
    {class} property VK_OEM_MINUS: Integer read _GetVK_OEM_MINUS;
    {class} property VK_OEM_PERIOD: Integer read _GetVK_OEM_PERIOD;
    {class} property VK_OEM_PLUS: Integer read _GetVK_OEM_PLUS;
    {class} property VK_P: Integer read _GetVK_P;
    {class} property VK_PRIOR: Integer read _GetVK_PRIOR;
    {class} property VK_Q: Integer read _GetVK_Q;
    {class} property VK_R: Integer read _GetVK_R;
    {class} property VK_RETURN: Integer read _GetVK_RETURN;
    {class} property VK_RIGHT: Integer read _GetVK_RIGHT;
    {class} property VK_S: Integer read _GetVK_S;
    {class} property VK_SHIFT: Integer read _GetVK_SHIFT;
    {class} property VK_SPACE: Integer read _GetVK_SPACE;
    {class} property VK_SUBTRACT: Integer read _GetVK_SUBTRACT;
    {class} property VK_T: Integer read _GetVK_T;
    {class} property VK_TAB: Integer read _GetVK_TAB;
    {class} property VK_U: Integer read _GetVK_U;
    {class} property VK_UP: Integer read _GetVK_UP;
    {class} property VK_V: Integer read _GetVK_V;
    {class} property VK_W: Integer read _GetVK_W;
    {class} property VK_X: Integer read _GetVK_X;
    {class} property VK_Y: Integer read _GetVK_Y;
    {class} property VK_Z: Integer read _GetVK_Z;
  end;

  [JavaSignature('com/epson/epos2/keyboard/Keyboard')]
  Jkeyboard_Keyboard = interface(JObject)
    ['{E5151557-9624-4146-A5D4-A6F962651224}']
    procedure connect(P1: JString; P2: Integer); cdecl;
    procedure disconnect; cdecl;
    function getAdmin: JString; cdecl;
    function getLocation: JString; cdecl;
    function getPrefix: TJavaArray<Integer>; cdecl;
    function getStatus: JKeyboardStatusInfo; cdecl;
    procedure setConnectionEventListener(P1: JConnectionListener); cdecl;
    procedure setKeyPressEventListener(P1: JKeyPressListener); cdecl;
    procedure setPrefix(P1: TJavaArray<Integer>); cdecl;
    procedure setReadStringEventListener(P1: JReadStringListener); cdecl;
  end;
  TJkeyboard_Keyboard = class(TJavaGenericImport<Jkeyboard_KeyboardClass, Jkeyboard_Keyboard>) end;

  JKeyboardStatusInfoClass = interface(JObjectClass)
    ['{6DCD5F53-AB54-4AC3-B156-2B5B3DFBFACC}']
    {class} function init: JKeyboardStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/keyboard/KeyboardStatusInfo')]
  JKeyboardStatusInfo = interface(JObject)
    ['{393E5358-0950-4BAB-94CF-B7969AABC1BE}']
    function getConnection: Integer; cdecl;
  end;
  TJKeyboardStatusInfo = class(TJavaGenericImport<JKeyboardStatusInfoClass, JKeyboardStatusInfo>) end;

  JReadStringListenerClass = interface(JEventListenerClass)
    ['{3D2E1BBA-13F9-495B-A3B0-540F8D5C6299}']
  end;

  [JavaSignature('com/epson/epos2/keyboard/ReadStringListener')]
  JReadStringListener = interface(JEventListener)
    ['{08C79188-4D10-4CD1-B451-CB6E8F1E04BE}']
    procedure onKbdReadString(P1: Jkeyboard_Keyboard; P2: JString; P3: Integer); cdecl;
  end;
  TJReadStringListener = class(TJavaGenericImport<JReadStringListenerClass, JReadStringListener>) end;

  JDisplayStatusInfoClass = interface(JObjectClass)
    ['{DEE4E63B-07F4-465A-A9A3-1975FBFC7B6F}']
    {class} function init: JDisplayStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/linedisplay/DisplayStatusInfo')]
  JDisplayStatusInfo = interface(JObject)
    ['{4DC51864-6AE1-4CD3-AECA-E8A655AFA014}']
    function getConnection: Integer; cdecl;
  end;
  TJDisplayStatusInfo = class(TJavaGenericImport<JDisplayStatusInfoClass, JDisplayStatusInfo>) end;

  JLineDisplayClass = interface(JObjectClass)
    ['{DE8DA507-BDA1-4D6E-A837-AA3A137F5092}']
    {class} function _GetBRIGHTNESS_100: Integer;
    {class} function _GetBRIGHTNESS_20: Integer;
    {class} function _GetBRIGHTNESS_40: Integer;
    {class} function _GetBRIGHTNESS_60: Integer;
    {class} function _GetCURSOR_NONE: Integer;
    {class} function _GetCURSOR_UNDERLINE: Integer;
    {class} function _GetDM_D110: Integer;
    {class} function _GetDM_D30: Integer;
    {class} function _GetEVENT_DISCONNECT: Integer;
    {class} function _GetEVENT_RECONNECT: Integer;
    {class} function _GetEVENT_RECONNECTING: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetLANG_EN: Integer;
    {class} function _GetLANG_JA: Integer;
    {class} function _GetMARQUEE_PLACE: Integer;
    {class} function _GetMARQUEE_WALK: Integer;
    {class} function _GetMOVE_BOTTOM_LEFT: Integer;
    {class} function _GetMOVE_BOTTOM_RIGHT: Integer;
    {class} function _GetMOVE_TOP_LEFT: Integer;
    {class} function _GetMOVE_TOP_RIGHT: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetSCROLL_HORIZONTAL: Integer;
    {class} function _GetSCROLL_OVERWRITE: Integer;
    {class} function _GetSCROLL_VERTICAL: Integer;
    {class} function _GetTRUE: Integer;
    {class} function init(P1: Integer; P2: JContext): JLineDisplay; cdecl;
    {class} property BRIGHTNESS_100: Integer read _GetBRIGHTNESS_100;
    {class} property BRIGHTNESS_20: Integer read _GetBRIGHTNESS_20;
    {class} property BRIGHTNESS_40: Integer read _GetBRIGHTNESS_40;
    {class} property BRIGHTNESS_60: Integer read _GetBRIGHTNESS_60;
    {class} property CURSOR_NONE: Integer read _GetCURSOR_NONE;
    {class} property CURSOR_UNDERLINE: Integer read _GetCURSOR_UNDERLINE;
    {class} property DM_D110: Integer read _GetDM_D110;
    {class} property DM_D30: Integer read _GetDM_D30;
    {class} property EVENT_DISCONNECT: Integer read _GetEVENT_DISCONNECT;
    {class} property EVENT_RECONNECT: Integer read _GetEVENT_RECONNECT;
    {class} property EVENT_RECONNECTING: Integer read _GetEVENT_RECONNECTING;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property LANG_EN: Integer read _GetLANG_EN;
    {class} property LANG_JA: Integer read _GetLANG_JA;
    {class} property MARQUEE_PLACE: Integer read _GetMARQUEE_PLACE;
    {class} property MARQUEE_WALK: Integer read _GetMARQUEE_WALK;
    {class} property MOVE_BOTTOM_LEFT: Integer read _GetMOVE_BOTTOM_LEFT;
    {class} property MOVE_BOTTOM_RIGHT: Integer read _GetMOVE_BOTTOM_RIGHT;
    {class} property MOVE_TOP_LEFT: Integer read _GetMOVE_TOP_LEFT;
    {class} property MOVE_TOP_RIGHT: Integer read _GetMOVE_TOP_RIGHT;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property SCROLL_HORIZONTAL: Integer read _GetSCROLL_HORIZONTAL;
    {class} property SCROLL_OVERWRITE: Integer read _GetSCROLL_OVERWRITE;
    {class} property SCROLL_VERTICAL: Integer read _GetSCROLL_VERTICAL;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/epos2/linedisplay/LineDisplay')]
  JLineDisplay = interface(JObject)
    ['{982A3230-06B5-49D7-958E-60161C4828D2}']
    procedure addClearCurrentWindow; cdecl;
    procedure addCommand(P1: TJavaArray<Byte>); cdecl;
    procedure addCreateWindow(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addDestroyWindow(P1: Integer); cdecl;
    procedure addInitialize; cdecl;
    procedure addMarqueeText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addMoveCursorPosition(P1: Integer); cdecl;
    procedure addReverseText(P1: JString); cdecl; overload;
    procedure addReverseText(P1: JString; P2: Integer); cdecl; overload;
    procedure addReverseText(P1: JString; P2: Integer; P3: Integer); cdecl; overload;
    procedure addReverseText(P1: JString; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
    procedure addSetBlink(P1: Integer); cdecl;
    procedure addSetBrightness(P1: Integer); cdecl;
    procedure addSetCurrentWindow(P1: Integer); cdecl;
    procedure addSetCursorPosition(P1: Integer; P2: Integer); cdecl;
    procedure addSetCursorType(P1: Integer); cdecl;
    procedure addShowClock; cdecl;
    procedure addText(P1: JString); cdecl; overload;
    procedure addText(P1: JString; P2: Integer); cdecl; overload;
    procedure addText(P1: JString; P2: Integer; P3: Integer); cdecl; overload;
    procedure addText(P1: JString; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
    procedure clearCommandBuffer; cdecl;
    procedure connect(P1: JString; P2: Integer); cdecl;
    procedure disconnect; cdecl;
    function getAdmin: JString; cdecl;
    function getLocation: JString; cdecl;
    function getStatus: JDisplayStatusInfo; cdecl;
    procedure sendData; cdecl;
    procedure setConnectionEventListener(P1: JConnectionListener); cdecl;
    procedure setReceiveEventListener(P1: Jlinedisplay_ReceiveListener); cdecl;
  end;
  TJLineDisplay = class(TJavaGenericImport<JLineDisplayClass, JLineDisplay>) end;

  Jlinedisplay_ReceiveListenerClass = interface(JEventListenerClass)
    ['{C4984CBD-9AD9-46B8-B9B5-596289D147CC}']
  end;

  [JavaSignature('com/epson/epos2/linedisplay/ReceiveListener')]
  Jlinedisplay_ReceiveListener = interface(JEventListener)
    ['{BE15C025-5C20-4F83-A057-11D3A7A0CF0D}']
    procedure onDispReceive(P1: JLineDisplay; P2: Integer); cdecl;
  end;
  TJlinedisplay_ReceiveListener = class(TJavaGenericImport<Jlinedisplay_ReceiveListenerClass, Jlinedisplay_ReceiveListener>) end;

  JLogoKeyCodeClass = interface(JObjectClass)
    ['{FFA922E0-788E-43FB-B381-E4B584C13837}']
  end;

  [JavaSignature('com/epson/epos2/printer/LogoKeyCode')]
  JLogoKeyCode = interface(JObject)
    ['{70C3AE1E-9629-43C1-943C-AA06541414CA}']
    function _Getkey1: Integer;
    procedure _Setkey1(Value: Integer);
    function _Getkey2: Integer;
    procedure _Setkey2(Value: Integer);
    property key1: Integer read _Getkey1 write _Setkey1;
    property key2: Integer read _Getkey2 write _Setkey2;
  end;
  TJLogoKeyCode = class(TJavaGenericImport<JLogoKeyCodeClass, JLogoKeyCode>) end;

  Jprinter_PrinterClass = interface(JObjectClass)
    ['{2CA627F0-25DE-4C94-B8E0-4CCCFBEAC31C}']
    {class} function _GetALIGN_CENTER: Integer;
    {class} function _GetALIGN_LEFT: Integer;
    {class} function _GetALIGN_RIGHT: Integer;
    {class} function _GetAUTOCUTTER_ERR: Integer;
    {class} function _GetAUTORECOVER_ERR: Integer;
    {class} function _GetBARCODE_CODABAR: Integer;
    {class} function _GetBARCODE_CODE128: Integer;
    {class} function _GetBARCODE_CODE39: Integer;
    {class} function _GetBARCODE_CODE93: Integer;
    {class} function _GetBARCODE_EAN13: Integer;
    {class} function _GetBARCODE_EAN8: Integer;
    {class} function _GetBARCODE_GS1_128: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_EXPANDED: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_LIMITED: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_OMNIDIRECTIONAL: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_TRUNCATED: Integer;
    {class} function _GetBARCODE_ITF: Integer;
    {class} function _GetBARCODE_JAN13: Integer;
    {class} function _GetBARCODE_JAN8: Integer;
    {class} function _GetBARCODE_UPC_A: Integer;
    {class} function _GetBARCODE_UPC_E: Integer;
    {class} function _GetBATTERY_LEVEL_0: Integer;
    {class} function _GetBATTERY_LEVEL_1: Integer;
    {class} function _GetBATTERY_LEVEL_2: Integer;
    {class} function _GetBATTERY_LEVEL_3: Integer;
    {class} function _GetBATTERY_LEVEL_4: Integer;
    {class} function _GetBATTERY_LEVEL_5: Integer;
    {class} function _GetBATTERY_LEVEL_6: Integer;
    {class} function _GetBATTERY_OVERHEAT: Integer;
    {class} function _GetCOLOR_1: Integer;
    {class} function _GetCOLOR_2: Integer;
    {class} function _GetCOLOR_3: Integer;
    {class} function _GetCOLOR_4: Integer;
    {class} function _GetCOLOR_NONE: Integer;
    {class} function _GetCOMPRESS_AUTO: Integer;
    {class} function _GetCOMPRESS_DEFLATE: Integer;
    {class} function _GetCOMPRESS_NONE: Integer;
    {class} function _GetCUT_FEED: Integer;
    {class} function _GetCUT_NO_FEED: Integer;
    {class} function _GetCUT_RESERVE: Integer;
    {class} function _GetDIRECTION_BOTTOM_TO_TOP: Integer;
    {class} function _GetDIRECTION_LEFT_TO_RIGHT: Integer;
    {class} function _GetDIRECTION_RIGHT_TO_LEFT: Integer;
    {class} function _GetDIRECTION_TOP_TO_BOTTOM: Integer;
    {class} function _GetDRAWER_2PIN: Integer;
    {class} function _GetDRAWER_5PIN: Integer;
    {class} function _GetDRAWER_HIGH: Integer;
    {class} function _GetDRAWER_LOW: Integer;
    {class} function _GetEVENT_BATTERY_EMPTY: Integer;
    {class} function _GetEVENT_BATTERY_ENOUGH: Integer;
    {class} function _GetEVENT_COVER_CLOSE: Integer;
    {class} function _GetEVENT_COVER_OPEN: Integer;
    {class} function _GetEVENT_DISCONNECT: Integer;
    {class} function _GetEVENT_DRAWER_HIGH: Integer;
    {class} function _GetEVENT_DRAWER_LOW: Integer;
    {class} function _GetEVENT_OFFLINE: Integer;
    {class} function _GetEVENT_ONLINE: Integer;
    {class} function _GetEVENT_PAPER_EMPTY: Integer;
    {class} function _GetEVENT_PAPER_NEAR_END: Integer;
    {class} function _GetEVENT_PAPER_OK: Integer;
    {class} function _GetEVENT_POWER_OFF: Integer;
    {class} function _GetEVENT_RECONNECT: Integer;
    {class} function _GetEVENT_RECONNECTING: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetFEED_CURRENT_TOF: Integer;
    {class} function _GetFEED_CUTTING: Integer;
    {class} function _GetFEED_NEXT_TOF: Integer;
    {class} function _GetFEED_PEELING: Integer;
    {class} function _GetFONT_A: Integer;
    {class} function _GetFONT_B: Integer;
    {class} function _GetFONT_C: Integer;
    {class} function _GetFONT_D: Integer;
    {class} function _GetFONT_E: Integer;
    {class} function _GetHALFTONE_DITHER: Integer;
    {class} function _GetHALFTONE_ERROR_DIFFUSION: Integer;
    {class} function _GetHALFTONE_THRESHOLD: Integer;
    {class} function _GetHEAD_OVERHEAT: Integer;
    {class} function _GetHRI_ABOVE: Integer;
    {class} function _GetHRI_BELOW: Integer;
    {class} function _GetHRI_BOTH: Integer;
    {class} function _GetHRI_NONE: Integer;
    {class} function _GetLANG_EN: Integer;
    {class} function _GetLANG_JA: Integer;
    {class} function _GetLANG_KO: Integer;
    {class} function _GetLANG_TH: Integer;
    {class} function _GetLANG_VI: Integer;
    {class} function _GetLANG_ZH_CN: Integer;
    {class} function _GetLANG_ZH_TW: Integer;
    {class} function _GetLAYOUT_LABEL: Integer;
    {class} function _GetLAYOUT_LABEL_BM: Integer;
    {class} function _GetLAYOUT_RECEIPT: Integer;
    {class} function _GetLAYOUT_RECEIPT_BM: Integer;
    {class} function _GetLEVEL_0: Integer;
    {class} function _GetLEVEL_1: Integer;
    {class} function _GetLEVEL_2: Integer;
    {class} function _GetLEVEL_3: Integer;
    {class} function _GetLEVEL_4: Integer;
    {class} function _GetLEVEL_5: Integer;
    {class} function _GetLEVEL_6: Integer;
    {class} function _GetLEVEL_7: Integer;
    {class} function _GetLEVEL_8: Integer;
    {class} function _GetLEVEL_H: Integer;
    {class} function _GetLEVEL_L: Integer;
    {class} function _GetLEVEL_M: Integer;
    {class} function _GetLEVEL_Q: Integer;
    {class} function _GetLINE_MEDIUM: Integer;
    {class} function _GetLINE_MEDIUM_DOUBLE: Integer;
    {class} function _GetLINE_THICK: Integer;
    {class} function _GetLINE_THICK_DOUBLE: Integer;
    {class} function _GetLINE_THIN: Integer;
    {class} function _GetLINE_THIN_DOUBLE: Integer;
    {class} function _GetMECHANICAL_ERR: Integer;
    {class} function _GetMODEL_ANK: Integer;
    {class} function _GetMODEL_CHINESE: Integer;
    {class} function _GetMODEL_JAPANESE: Integer;
    {class} function _GetMODEL_KOREAN: Integer;
    {class} function _GetMODEL_SOUTHASIA: Integer;
    {class} function _GetMODEL_TAIWAN: Integer;
    {class} function _GetMODEL_THAI: Integer;
    {class} function _GetMODE_GRAY16: Integer;
    {class} function _GetMODE_MONO: Integer;
    {class} function _GetMODE_MONO_HIGH_DENSITY: Integer;
    {class} function _GetMOTOR_OVERHEAT: Integer;
    {class} function _GetNO_ERR: Integer;
    {class} function _GetPAPER_EMPTY: Integer;
    {class} function _GetPAPER_NEAR_END: Integer;
    {class} function _GetPAPER_OK: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetPARAM_UNSPECIFIED: Integer;
    {class} function _GetPATTERN_1: Integer;
    {class} function _GetPATTERN_10: Integer;
    {class} function _GetPATTERN_2: Integer;
    {class} function _GetPATTERN_3: Integer;
    {class} function _GetPATTERN_4: Integer;
    {class} function _GetPATTERN_5: Integer;
    {class} function _GetPATTERN_6: Integer;
    {class} function _GetPATTERN_7: Integer;
    {class} function _GetPATTERN_8: Integer;
    {class} function _GetPATTERN_9: Integer;
    {class} function _GetPATTERN_A: Integer;
    {class} function _GetPATTERN_B: Integer;
    {class} function _GetPATTERN_C: Integer;
    {class} function _GetPATTERN_D: Integer;
    {class} function _GetPATTERN_E: Integer;
    {class} function _GetPATTERN_ERROR: Integer;
    {class} function _GetPATTERN_NONE: Integer;
    {class} function _GetPATTERN_PAPER_EMPTY: Integer;
    {class} function _GetPULSE_100: Integer;
    {class} function _GetPULSE_200: Integer;
    {class} function _GetPULSE_300: Integer;
    {class} function _GetPULSE_400: Integer;
    {class} function _GetPULSE_500: Integer;
    {class} function _GetSWITCH_OFF: Integer;
    {class} function _GetSWITCH_ON: Integer;
    {class} function _GetSYMBOL_AZTECCODE_COMPACT: Integer;
    {class} function _GetSYMBOL_AZTECCODE_FULLRANGE: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_12: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_16: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_8: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_SQUARE: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_EXPANDED_STACKED: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_STACKED: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_2: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_3: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_4: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_5: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_6: Integer;
    {class} function _GetSYMBOL_PDF417_STANDARD: Integer;
    {class} function _GetSYMBOL_PDF417_TRUNCATED: Integer;
    {class} function _GetSYMBOL_QRCODE_MICRO: Integer;
    {class} function _GetSYMBOL_QRCODE_MODEL_1: Integer;
    {class} function _GetSYMBOL_QRCODE_MODEL_2: Integer;
    {class} function _GetTM_H6000: Integer;
    {class} function _GetTM_L90: Integer;
    {class} function _GetTM_M10: Integer;
    {class} function _GetTM_M30: Integer;
    {class} function _GetTM_P20: Integer;
    {class} function _GetTM_P60: Integer;
    {class} function _GetTM_P60II: Integer;
    {class} function _GetTM_P80: Integer;
    {class} function _GetTM_T20: Integer;
    {class} function _GetTM_T60: Integer;
    {class} function _GetTM_T70: Integer;
    {class} function _GetTM_T81: Integer;
    {class} function _GetTM_T82: Integer;
    {class} function _GetTM_T83: Integer;
    {class} function _GetTM_T88: Integer;
    {class} function _GetTM_T90: Integer;
    {class} function _GetTM_T90KP: Integer;
    {class} function _GetTM_U220: Integer;
    {class} function _GetTM_U330: Integer;
    {class} function _GetTRUE: Integer;
    {class} function _GetUNKNOWN: Integer;
    {class} function _GetUNRECOVER_ERR: Integer;
    {class} function _GetWRONG_PAPER: Integer;
    {class} function init(P1: Integer; P2: Integer; P3: JContext): Jprinter_Printer; cdecl;
    {class} property ALIGN_CENTER: Integer read _GetALIGN_CENTER;
    {class} property ALIGN_LEFT: Integer read _GetALIGN_LEFT;
    {class} property ALIGN_RIGHT: Integer read _GetALIGN_RIGHT;
    {class} property AUTOCUTTER_ERR: Integer read _GetAUTOCUTTER_ERR;
    {class} property AUTORECOVER_ERR: Integer read _GetAUTORECOVER_ERR;
    {class} property BARCODE_CODABAR: Integer read _GetBARCODE_CODABAR;
    {class} property BARCODE_CODE128: Integer read _GetBARCODE_CODE128;
    {class} property BARCODE_CODE39: Integer read _GetBARCODE_CODE39;
    {class} property BARCODE_CODE93: Integer read _GetBARCODE_CODE93;
    {class} property BARCODE_EAN13: Integer read _GetBARCODE_EAN13;
    {class} property BARCODE_EAN8: Integer read _GetBARCODE_EAN8;
    {class} property BARCODE_GS1_128: Integer read _GetBARCODE_GS1_128;
    {class} property BARCODE_GS1_DATABAR_EXPANDED: Integer read _GetBARCODE_GS1_DATABAR_EXPANDED;
    {class} property BARCODE_GS1_DATABAR_LIMITED: Integer read _GetBARCODE_GS1_DATABAR_LIMITED;
    {class} property BARCODE_GS1_DATABAR_OMNIDIRECTIONAL: Integer read _GetBARCODE_GS1_DATABAR_OMNIDIRECTIONAL;
    {class} property BARCODE_GS1_DATABAR_TRUNCATED: Integer read _GetBARCODE_GS1_DATABAR_TRUNCATED;
    {class} property BARCODE_ITF: Integer read _GetBARCODE_ITF;
    {class} property BARCODE_JAN13: Integer read _GetBARCODE_JAN13;
    {class} property BARCODE_JAN8: Integer read _GetBARCODE_JAN8;
    {class} property BARCODE_UPC_A: Integer read _GetBARCODE_UPC_A;
    {class} property BARCODE_UPC_E: Integer read _GetBARCODE_UPC_E;
    {class} property BATTERY_LEVEL_0: Integer read _GetBATTERY_LEVEL_0;
    {class} property BATTERY_LEVEL_1: Integer read _GetBATTERY_LEVEL_1;
    {class} property BATTERY_LEVEL_2: Integer read _GetBATTERY_LEVEL_2;
    {class} property BATTERY_LEVEL_3: Integer read _GetBATTERY_LEVEL_3;
    {class} property BATTERY_LEVEL_4: Integer read _GetBATTERY_LEVEL_4;
    {class} property BATTERY_LEVEL_5: Integer read _GetBATTERY_LEVEL_5;
    {class} property BATTERY_LEVEL_6: Integer read _GetBATTERY_LEVEL_6;
    {class} property BATTERY_OVERHEAT: Integer read _GetBATTERY_OVERHEAT;
    {class} property COLOR_1: Integer read _GetCOLOR_1;
    {class} property COLOR_2: Integer read _GetCOLOR_2;
    {class} property COLOR_3: Integer read _GetCOLOR_3;
    {class} property COLOR_4: Integer read _GetCOLOR_4;
    {class} property COLOR_NONE: Integer read _GetCOLOR_NONE;
    {class} property COMPRESS_AUTO: Integer read _GetCOMPRESS_AUTO;
    {class} property COMPRESS_DEFLATE: Integer read _GetCOMPRESS_DEFLATE;
    {class} property COMPRESS_NONE: Integer read _GetCOMPRESS_NONE;
    {class} property CUT_FEED: Integer read _GetCUT_FEED;
    {class} property CUT_NO_FEED: Integer read _GetCUT_NO_FEED;
    {class} property CUT_RESERVE: Integer read _GetCUT_RESERVE;
    {class} property DIRECTION_BOTTOM_TO_TOP: Integer read _GetDIRECTION_BOTTOM_TO_TOP;
    {class} property DIRECTION_LEFT_TO_RIGHT: Integer read _GetDIRECTION_LEFT_TO_RIGHT;
    {class} property DIRECTION_RIGHT_TO_LEFT: Integer read _GetDIRECTION_RIGHT_TO_LEFT;
    {class} property DIRECTION_TOP_TO_BOTTOM: Integer read _GetDIRECTION_TOP_TO_BOTTOM;
    {class} property DRAWER_2PIN: Integer read _GetDRAWER_2PIN;
    {class} property DRAWER_5PIN: Integer read _GetDRAWER_5PIN;
    {class} property DRAWER_HIGH: Integer read _GetDRAWER_HIGH;
    {class} property DRAWER_LOW: Integer read _GetDRAWER_LOW;
    {class} property EVENT_BATTERY_EMPTY: Integer read _GetEVENT_BATTERY_EMPTY;
    {class} property EVENT_BATTERY_ENOUGH: Integer read _GetEVENT_BATTERY_ENOUGH;
    {class} property EVENT_COVER_CLOSE: Integer read _GetEVENT_COVER_CLOSE;
    {class} property EVENT_COVER_OPEN: Integer read _GetEVENT_COVER_OPEN;
    {class} property EVENT_DISCONNECT: Integer read _GetEVENT_DISCONNECT;
    {class} property EVENT_DRAWER_HIGH: Integer read _GetEVENT_DRAWER_HIGH;
    {class} property EVENT_DRAWER_LOW: Integer read _GetEVENT_DRAWER_LOW;
    {class} property EVENT_OFFLINE: Integer read _GetEVENT_OFFLINE;
    {class} property EVENT_ONLINE: Integer read _GetEVENT_ONLINE;
    {class} property EVENT_PAPER_EMPTY: Integer read _GetEVENT_PAPER_EMPTY;
    {class} property EVENT_PAPER_NEAR_END: Integer read _GetEVENT_PAPER_NEAR_END;
    {class} property EVENT_PAPER_OK: Integer read _GetEVENT_PAPER_OK;
    {class} property EVENT_POWER_OFF: Integer read _GetEVENT_POWER_OFF;
    {class} property EVENT_RECONNECT: Integer read _GetEVENT_RECONNECT;
    {class} property EVENT_RECONNECTING: Integer read _GetEVENT_RECONNECTING;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property FEED_CURRENT_TOF: Integer read _GetFEED_CURRENT_TOF;
    {class} property FEED_CUTTING: Integer read _GetFEED_CUTTING;
    {class} property FEED_NEXT_TOF: Integer read _GetFEED_NEXT_TOF;
    {class} property FEED_PEELING: Integer read _GetFEED_PEELING;
    {class} property FONT_A: Integer read _GetFONT_A;
    {class} property FONT_B: Integer read _GetFONT_B;
    {class} property FONT_C: Integer read _GetFONT_C;
    {class} property FONT_D: Integer read _GetFONT_D;
    {class} property FONT_E: Integer read _GetFONT_E;
    {class} property HALFTONE_DITHER: Integer read _GetHALFTONE_DITHER;
    {class} property HALFTONE_ERROR_DIFFUSION: Integer read _GetHALFTONE_ERROR_DIFFUSION;
    {class} property HALFTONE_THRESHOLD: Integer read _GetHALFTONE_THRESHOLD;
    {class} property HEAD_OVERHEAT: Integer read _GetHEAD_OVERHEAT;
    {class} property HRI_ABOVE: Integer read _GetHRI_ABOVE;
    {class} property HRI_BELOW: Integer read _GetHRI_BELOW;
    {class} property HRI_BOTH: Integer read _GetHRI_BOTH;
    {class} property HRI_NONE: Integer read _GetHRI_NONE;
    {class} property LANG_EN: Integer read _GetLANG_EN;
    {class} property LANG_JA: Integer read _GetLANG_JA;
    {class} property LANG_KO: Integer read _GetLANG_KO;
    {class} property LANG_TH: Integer read _GetLANG_TH;
    {class} property LANG_VI: Integer read _GetLANG_VI;
    {class} property LANG_ZH_CN: Integer read _GetLANG_ZH_CN;
    {class} property LANG_ZH_TW: Integer read _GetLANG_ZH_TW;
    {class} property LAYOUT_LABEL: Integer read _GetLAYOUT_LABEL;
    {class} property LAYOUT_LABEL_BM: Integer read _GetLAYOUT_LABEL_BM;
    {class} property LAYOUT_RECEIPT: Integer read _GetLAYOUT_RECEIPT;
    {class} property LAYOUT_RECEIPT_BM: Integer read _GetLAYOUT_RECEIPT_BM;
    {class} property LEVEL_0: Integer read _GetLEVEL_0;
    {class} property LEVEL_1: Integer read _GetLEVEL_1;
    {class} property LEVEL_2: Integer read _GetLEVEL_2;
    {class} property LEVEL_3: Integer read _GetLEVEL_3;
    {class} property LEVEL_4: Integer read _GetLEVEL_4;
    {class} property LEVEL_5: Integer read _GetLEVEL_5;
    {class} property LEVEL_6: Integer read _GetLEVEL_6;
    {class} property LEVEL_7: Integer read _GetLEVEL_7;
    {class} property LEVEL_8: Integer read _GetLEVEL_8;
    {class} property LEVEL_H: Integer read _GetLEVEL_H;
    {class} property LEVEL_L: Integer read _GetLEVEL_L;
    {class} property LEVEL_M: Integer read _GetLEVEL_M;
    {class} property LEVEL_Q: Integer read _GetLEVEL_Q;
    {class} property LINE_MEDIUM: Integer read _GetLINE_MEDIUM;
    {class} property LINE_MEDIUM_DOUBLE: Integer read _GetLINE_MEDIUM_DOUBLE;
    {class} property LINE_THICK: Integer read _GetLINE_THICK;
    {class} property LINE_THICK_DOUBLE: Integer read _GetLINE_THICK_DOUBLE;
    {class} property LINE_THIN: Integer read _GetLINE_THIN;
    {class} property LINE_THIN_DOUBLE: Integer read _GetLINE_THIN_DOUBLE;
    {class} property MECHANICAL_ERR: Integer read _GetMECHANICAL_ERR;
    {class} property MODEL_ANK: Integer read _GetMODEL_ANK;
    {class} property MODEL_CHINESE: Integer read _GetMODEL_CHINESE;
    {class} property MODEL_JAPANESE: Integer read _GetMODEL_JAPANESE;
    {class} property MODEL_KOREAN: Integer read _GetMODEL_KOREAN;
    {class} property MODEL_SOUTHASIA: Integer read _GetMODEL_SOUTHASIA;
    {class} property MODEL_TAIWAN: Integer read _GetMODEL_TAIWAN;
    {class} property MODEL_THAI: Integer read _GetMODEL_THAI;
    {class} property MODE_GRAY16: Integer read _GetMODE_GRAY16;
    {class} property MODE_MONO: Integer read _GetMODE_MONO;
    {class} property MODE_MONO_HIGH_DENSITY: Integer read _GetMODE_MONO_HIGH_DENSITY;
    {class} property MOTOR_OVERHEAT: Integer read _GetMOTOR_OVERHEAT;
    {class} property NO_ERR: Integer read _GetNO_ERR;
    {class} property PAPER_EMPTY: Integer read _GetPAPER_EMPTY;
    {class} property PAPER_NEAR_END: Integer read _GetPAPER_NEAR_END;
    {class} property PAPER_OK: Integer read _GetPAPER_OK;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property PARAM_UNSPECIFIED: Integer read _GetPARAM_UNSPECIFIED;
    {class} property PATTERN_1: Integer read _GetPATTERN_1;
    {class} property PATTERN_10: Integer read _GetPATTERN_10;
    {class} property PATTERN_2: Integer read _GetPATTERN_2;
    {class} property PATTERN_3: Integer read _GetPATTERN_3;
    {class} property PATTERN_4: Integer read _GetPATTERN_4;
    {class} property PATTERN_5: Integer read _GetPATTERN_5;
    {class} property PATTERN_6: Integer read _GetPATTERN_6;
    {class} property PATTERN_7: Integer read _GetPATTERN_7;
    {class} property PATTERN_8: Integer read _GetPATTERN_8;
    {class} property PATTERN_9: Integer read _GetPATTERN_9;
    {class} property PATTERN_A: Integer read _GetPATTERN_A;
    {class} property PATTERN_B: Integer read _GetPATTERN_B;
    {class} property PATTERN_C: Integer read _GetPATTERN_C;
    {class} property PATTERN_D: Integer read _GetPATTERN_D;
    {class} property PATTERN_E: Integer read _GetPATTERN_E;
    {class} property PATTERN_ERROR: Integer read _GetPATTERN_ERROR;
    {class} property PATTERN_NONE: Integer read _GetPATTERN_NONE;
    {class} property PATTERN_PAPER_EMPTY: Integer read _GetPATTERN_PAPER_EMPTY;
    {class} property PULSE_100: Integer read _GetPULSE_100;
    {class} property PULSE_200: Integer read _GetPULSE_200;
    {class} property PULSE_300: Integer read _GetPULSE_300;
    {class} property PULSE_400: Integer read _GetPULSE_400;
    {class} property PULSE_500: Integer read _GetPULSE_500;
    {class} property SWITCH_OFF: Integer read _GetSWITCH_OFF;
    {class} property SWITCH_ON: Integer read _GetSWITCH_ON;
    {class} property SYMBOL_AZTECCODE_COMPACT: Integer read _GetSYMBOL_AZTECCODE_COMPACT;
    {class} property SYMBOL_AZTECCODE_FULLRANGE: Integer read _GetSYMBOL_AZTECCODE_FULLRANGE;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_12: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_12;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_16: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_16;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_8: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_8;
    {class} property SYMBOL_DATAMATRIX_SQUARE: Integer read _GetSYMBOL_DATAMATRIX_SQUARE;
    {class} property SYMBOL_GS1_DATABAR_EXPANDED_STACKED: Integer read _GetSYMBOL_GS1_DATABAR_EXPANDED_STACKED;
    {class} property SYMBOL_GS1_DATABAR_STACKED: Integer read _GetSYMBOL_GS1_DATABAR_STACKED;
    {class} property SYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL: Integer read _GetSYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL;
    {class} property SYMBOL_MAXICODE_MODE_2: Integer read _GetSYMBOL_MAXICODE_MODE_2;
    {class} property SYMBOL_MAXICODE_MODE_3: Integer read _GetSYMBOL_MAXICODE_MODE_3;
    {class} property SYMBOL_MAXICODE_MODE_4: Integer read _GetSYMBOL_MAXICODE_MODE_4;
    {class} property SYMBOL_MAXICODE_MODE_5: Integer read _GetSYMBOL_MAXICODE_MODE_5;
    {class} property SYMBOL_MAXICODE_MODE_6: Integer read _GetSYMBOL_MAXICODE_MODE_6;
    {class} property SYMBOL_PDF417_STANDARD: Integer read _GetSYMBOL_PDF417_STANDARD;
    {class} property SYMBOL_PDF417_TRUNCATED: Integer read _GetSYMBOL_PDF417_TRUNCATED;
    {class} property SYMBOL_QRCODE_MICRO: Integer read _GetSYMBOL_QRCODE_MICRO;
    {class} property SYMBOL_QRCODE_MODEL_1: Integer read _GetSYMBOL_QRCODE_MODEL_1;
    {class} property SYMBOL_QRCODE_MODEL_2: Integer read _GetSYMBOL_QRCODE_MODEL_2;
    {class} property TM_H6000: Integer read _GetTM_H6000;
    {class} property TM_L90: Integer read _GetTM_L90;
    {class} property TM_M10: Integer read _GetTM_M10;
    {class} property TM_M30: Integer read _GetTM_M30;
    {class} property TM_P20: Integer read _GetTM_P20;
    {class} property TM_P60: Integer read _GetTM_P60;
    {class} property TM_P60II: Integer read _GetTM_P60II;
    {class} property TM_P80: Integer read _GetTM_P80;
    {class} property TM_T20: Integer read _GetTM_T20;
    {class} property TM_T60: Integer read _GetTM_T60;
    {class} property TM_T70: Integer read _GetTM_T70;
    {class} property TM_T81: Integer read _GetTM_T81;
    {class} property TM_T82: Integer read _GetTM_T82;
    {class} property TM_T83: Integer read _GetTM_T83;
    {class} property TM_T88: Integer read _GetTM_T88;
    {class} property TM_T90: Integer read _GetTM_T90;
    {class} property TM_T90KP: Integer read _GetTM_T90KP;
    {class} property TM_U220: Integer read _GetTM_U220;
    {class} property TM_U330: Integer read _GetTM_U330;
    {class} property TRUE: Integer read _GetTRUE;
    {class} property UNKNOWN: Integer read _GetUNKNOWN;
    {class} property UNRECOVER_ERR: Integer read _GetUNRECOVER_ERR;
    {class} property WRONG_PAPER: Integer read _GetWRONG_PAPER;
  end;

  [JavaSignature('com/epson/epos2/printer/Printer')]
  Jprinter_Printer = interface(JObject)
    ['{FBB13038-C530-487F-AD78-EC09B7B89566}']
    procedure addBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addCommand(P1: TJavaArray<Byte>); cdecl;
    procedure addCut(P1: Integer); cdecl;
    procedure addFeedLine(P1: Integer); cdecl;
    procedure addFeedPosition(P1: Integer); cdecl;
    procedure addFeedUnit(P1: Integer); cdecl;
    procedure addHLine(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure addHPosition(P1: Integer); cdecl;
    procedure addImage(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Double; P10: Integer); cdecl;
    procedure addLayout(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer); cdecl;
    procedure addLineSpace(P1: Integer); cdecl;
    procedure addLogo(P1: Integer; P2: Integer); cdecl;
    procedure addPageArea(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    procedure addPageBegin; cdecl;
    procedure addPageDirection(P1: Integer); cdecl;
    procedure addPageEnd; cdecl;
    procedure addPageLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure addPagePosition(P1: Integer; P2: Integer); cdecl;
    procedure addPageRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure addPulse(P1: Integer; P2: Integer); cdecl;
    procedure addSound(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure addSymbol(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addText(P1: JString); cdecl;
    procedure addTextAlign(P1: Integer); cdecl;
    procedure addTextFont(P1: Integer); cdecl;
    procedure addTextLang(P1: Integer); cdecl;
    procedure addTextRotate(P1: Integer); cdecl;
    procedure addTextSize(P1: Integer; P2: Integer); cdecl;
    procedure addTextSmooth(P1: Integer); cdecl;
    procedure addTextStyle(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    procedure addVLineBegin(P1: Integer; P2: Integer; P3: TJavaArray<Integer>); cdecl;
    procedure addVLineEnd(P1: Integer); cdecl;
    procedure beginTransaction; cdecl;
    procedure clearCommandBuffer; cdecl;
    procedure connect(P1: JString; P2: Integer); cdecl;
    procedure disconnect; cdecl;
    procedure endTransaction; cdecl;
    procedure forceCommand(P1: TJavaArray<Byte>; P2: Integer); cdecl;
    procedure forcePulse(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure forceRecover(P1: Integer); cdecl;
    procedure forceReset(P1: Integer); cdecl;
    procedure forceStopSound(P1: Integer); cdecl;
    function getAdmin: JString; cdecl;
    function getInterval: Integer; cdecl;
    function getLocation: JString; cdecl;
    function getStatus: JPrinterStatusInfo; cdecl;
    procedure requestPrintJobStatus(P1: JString); cdecl;
    procedure sendData(P1: Integer); cdecl;
    procedure setConnectionEventListener(P1: JConnectionListener); cdecl;
    procedure setInterval(P1: Integer); cdecl;
    procedure setReceiveEventListener(P1: Jprinter_ReceiveListener); cdecl;
    procedure setStatusChangeEventListener(P1: JStatusChangeListener); cdecl;
    procedure startMonitor; cdecl;
    procedure stopMonitor; cdecl;
  end;
  TJprinter_Printer = class(TJavaGenericImport<Jprinter_PrinterClass, Jprinter_Printer>) end;

  JPrinterStatusInfoClass = interface(JObjectClass)
    ['{2CB995FC-6654-4F9E-833F-5553D668C148}']
    {class} function init: JPrinterStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/printer/PrinterStatusInfo')]
  JPrinterStatusInfo = interface(JObject)
    ['{165D5C29-3DA6-4956-8F79-179AF2688C03}']
    function getAdapter: Integer; cdecl;
    function getAutoRecoverError: Integer; cdecl;
    function getBatteryLevel: Integer; cdecl;
    function getBuzzer: Integer; cdecl;
    function getConnection: Integer; cdecl;
    function getCoverOpen: Integer; cdecl;
    function getDrawer: Integer; cdecl;
    function getErrorStatus: Integer; cdecl;
    function getOnline: Integer; cdecl;
    function getPanelSwitch: Integer; cdecl;
    function getPaper: Integer; cdecl;
    function getPaperFeed: Integer; cdecl;
    function getWaitOnline: Integer; cdecl;
  end;
  TJPrinterStatusInfo = class(TJavaGenericImport<JPrinterStatusInfoClass, JPrinterStatusInfo>) end;

  Jprinter_ReceiveListenerClass = interface(JEventListenerClass)
    ['{2938FE72-E314-45AC-94E2-3B9ED255FCAE}']
  end;

  [JavaSignature('com/epson/epos2/printer/ReceiveListener')]
  Jprinter_ReceiveListener = interface(JEventListener)
    ['{9FD5CE69-4089-4AFE-9CB4-4C683CCC4C89}']
    procedure onPtrReceive(P1: Jprinter_Printer; P2: Integer; P3: JPrinterStatusInfo; P4: JString); cdecl;
  end;
  TJprinter_ReceiveListener = class(TJavaGenericImport<Jprinter_ReceiveListenerClass, Jprinter_ReceiveListener>) end;

  JStatusChangeListenerClass = interface(JEventListenerClass)
    ['{E9824898-C36D-44F8-897C-674B1AD00A2A}']
  end;

  [JavaSignature('com/epson/epos2/printer/StatusChangeListener')]
  JStatusChangeListener = interface(JEventListener)
    ['{45718763-42B2-4CF7-B43F-75C67D4D030A}']
    procedure onPtrStatusChange(P1: Jprinter_Printer; P2: Integer); cdecl;
  end;
  TJStatusChangeListener = class(TJavaGenericImport<JStatusChangeListenerClass, JStatusChangeListener>) end;

  Jsimpleserial_ReceiveListenerClass = interface(JEventListenerClass)
    ['{6A3A4D6A-F476-457B-90C6-14E0D56EDB03}']
  end;

  [JavaSignature('com/epson/epos2/simpleserial/ReceiveListener')]
  Jsimpleserial_ReceiveListener = interface(JEventListener)
    ['{BE295AE8-D9E3-4CA8-B564-487E03A3560C}']
    procedure onSimpleSerialReceive(P1: JSimpleSerial; P2: TJavaArray<Byte>); cdecl;
  end;
  TJsimpleserial_ReceiveListener = class(TJavaGenericImport<Jsimpleserial_ReceiveListenerClass, Jsimpleserial_ReceiveListener>) end;

  JSerialStatusInfoClass = interface(JObjectClass)
    ['{2111219A-4506-4475-8339-A0D3792F3FC2}']
    {class} function init: JSerialStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/simpleserial/SerialStatusInfo')]
  JSerialStatusInfo = interface(JObject)
    ['{7F4EA4B6-B45A-45B8-8B71-6BC3C30D254D}']
    function getConnection: Integer; cdecl;
  end;
  TJSerialStatusInfo = class(TJavaGenericImport<JSerialStatusInfoClass, JSerialStatusInfo>) end;

  JSimpleSerialClass = interface(JObjectClass)
    ['{E4B4DB54-48BA-4761-A95A-9C3D39068F80}']
    {class} function _GetEVENT_DISCONNECT: Integer;
    {class} function _GetEVENT_RECONNECT: Integer;
    {class} function _GetEVENT_RECONNECTING: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetTRUE: Integer;
    {class} function init(P1: JContext): JSimpleSerial; cdecl;
    {class} property EVENT_DISCONNECT: Integer read _GetEVENT_DISCONNECT;
    {class} property EVENT_RECONNECT: Integer read _GetEVENT_RECONNECT;
    {class} property EVENT_RECONNECTING: Integer read _GetEVENT_RECONNECTING;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/epos2/simpleserial/SimpleSerial')]
  JSimpleSerial = interface(JObject)
    ['{55285DAD-A248-4EFC-B712-6C1044940DD5}']
    procedure connect(P1: JString; P2: Integer); cdecl;
    procedure disconnect; cdecl;
    function getAdmin: JString; cdecl;
    function getLocation: JString; cdecl;
    function getStatus: JSerialStatusInfo; cdecl;
    procedure sendCommand(P1: TJavaArray<Byte>); cdecl;
    procedure setConnectionEventListener(P1: JConnectionListener); cdecl;
    procedure setReceiveEventListener(P1: Jsimpleserial_ReceiveListener); cdecl;
  end;
  TJSimpleSerial = class(TJavaGenericImport<JSimpleSerialClass, JSimpleSerial>) end;

  JConnectListenerClass = interface(JEventListenerClass)
    ['{457E6AEC-059F-45F1-BE3E-B333313C3AE5}']
  end;

  [JavaSignature('com/epson/eposdevice/ConnectListener')]
  JConnectListener = interface(JEventListener)
    ['{4687E4F6-C550-46FE-824A-25F11A640254}']
    procedure onConnect(P1: JString; P2: Integer); cdecl;
  end;
  TJConnectListener = class(TJavaGenericImport<JConnectListenerClass, JConnectListener>) end;

  JCreateDeviceListenerClass = interface(JEventListenerClass)
    ['{B337BDE9-C00C-4554-AB9C-36E680FC62F7}']
  end;

  [JavaSignature('com/epson/eposdevice/CreateDeviceListener')]
  JCreateDeviceListener = interface(JEventListener)
    ['{B8006344-E88B-426C-8CDC-F82A61BE617D}']
    procedure onCreateDevice(P1: JString; P2: JString; P3: Integer; P4: JObject; P5: Integer); cdecl;
  end;
  TJCreateDeviceListener = class(TJavaGenericImport<JCreateDeviceListenerClass, JCreateDeviceListener>) end;

  JDeleteDeviceListenerClass = interface(JEventListenerClass)
    ['{AAAB6B7A-A87F-4E93-89C7-B8F0F5FB2D0E}']
  end;

  [JavaSignature('com/epson/eposdevice/DeleteDeviceListener')]
  JDeleteDeviceListener = interface(JEventListener)
    ['{26F2AC21-59D9-4A06-806F-B5BD9BEBF841}']
    procedure onDeleteDevice(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJDeleteDeviceListener = class(TJavaGenericImport<JDeleteDeviceListenerClass, JDeleteDeviceListener>) end;

  JNativeDeviceClass = interface(JObjectClass)
    ['{3B5315F3-AB63-48BA-8853-E70CE65F71D6}']
  end;

  [JavaSignature('com/epson/eposdevice/NativeDevice')]
  JNativeDevice = interface(JObject)
    ['{F60919F2-9660-4318-B84E-C0281DF2BF3A}']
  end;
  TJNativeDevice = class(TJavaGenericImport<JNativeDeviceClass, JNativeDevice>) end;

  JDeviceInnerImplementClass = interface(JNativeDeviceClass)
    ['{B70690E7-3B1F-4185-9071-74D84D224C29}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement')]
  JDeviceInnerImplement = interface(JNativeDevice)
    ['{10E8C9CC-3C49-48AA-B419-4DE51CA0FD58}']
  end;
  TJDeviceInnerImplement = class(TJavaGenericImport<JDeviceInnerImplementClass, JDeviceInnerImplement>) end;

  JDeviceClass = interface(JDeviceInnerImplementClass)
    ['{04EB617F-A53C-425A-BE4B-E651B34B03AC}']
    {class} function _GetDEV_TYPE_DISPLAY: Integer;
    {class} function _GetDEV_TYPE_KEYBOARD: Integer;
    {class} function _GetDEV_TYPE_PRINTER: Integer;
    {class} function _GetDEV_TYPE_SCANNER: Integer;
    {class} function _GetDEV_TYPE_SIMPLE_SERIAL: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetPARAM_UNSPECIFIED: Integer;
    {class} function _GetTRUE: Integer;
    {class} function init: JDevice; cdecl; overload;
    {class} function init(P1: JContext): JDevice; cdecl; overload;
    {class} property DEV_TYPE_DISPLAY: Integer read _GetDEV_TYPE_DISPLAY;
    {class} property DEV_TYPE_KEYBOARD: Integer read _GetDEV_TYPE_KEYBOARD;
    {class} property DEV_TYPE_PRINTER: Integer read _GetDEV_TYPE_PRINTER;
    {class} property DEV_TYPE_SCANNER: Integer read _GetDEV_TYPE_SCANNER;
    {class} property DEV_TYPE_SIMPLE_SERIAL: Integer read _GetDEV_TYPE_SIMPLE_SERIAL;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property PARAM_UNSPECIFIED: Integer read _GetPARAM_UNSPECIFIED;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/eposdevice/Device')]
  JDevice = interface(JDeviceInnerImplement)
    ['{055B47E8-5180-44C5-B597-AEF989EBF5A6}']
    procedure connect(P1: JString; P2: JConnectListener); cdecl;
    procedure createDevice(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JCreateDeviceListener); cdecl;
    procedure deleteDevice(P1: JObject; P2: JDeleteDeviceListener); cdecl;
    procedure disconnect; cdecl;
    function getAdmin: JString; cdecl;
    function getCommBoxManager: JCommBoxManager; cdecl;
    function getLocation: JString; cdecl;
    function isConnected: Boolean; cdecl;
    procedure setDisconnectEventCallback(P1: JDisconnectListener); cdecl;
    procedure setReconnectEventCallback(P1: JReconnectListener); cdecl;
    procedure setReconnectingEventCallback(P1: JReconnectingListener); cdecl;
  end;
  TJDevice = class(TJavaGenericImport<JDeviceClass, JDevice>) end;

  JDevice_ConnectCallbackAdapterClass = interface(JObjectClass)
    ['{1C87CB6F-26AD-47D0-B9A2-5CA52866B38A}']
    {class} function init(P1: JDevice; P2: JConnectListener): JDevice_ConnectCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/Device$ConnectCallbackAdapter')]
  JDevice_ConnectCallbackAdapter = interface(JObject)
    ['{7BA9DBA5-2344-4DC4-AE18-AE06A2755ACC}']
    procedure nativeOnConnect(P1: JString; P2: Integer); cdecl;
  end;
  TJDevice_ConnectCallbackAdapter = class(TJavaGenericImport<JDevice_ConnectCallbackAdapterClass, JDevice_ConnectCallbackAdapter>) end;

  JDevice_CreateDeviceCallbackAdapterClass = interface(JObjectClass)
    ['{3C38F06A-6A7E-496B-8D14-1BD8638AE98D}']
    {class} function init(P1: JDevice; P2: JCreateDeviceListener): JDevice_CreateDeviceCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/Device$CreateDeviceCallbackAdapter')]
  JDevice_CreateDeviceCallbackAdapter = interface(JObject)
    ['{783657F9-E27D-4BE7-95F3-E2A747516962}']
    procedure nativeOnCreateDevice(P1: JString; P2: JString; P3: Integer; P4: Int64; P5: Integer); cdecl;
  end;
  TJDevice_CreateDeviceCallbackAdapter = class(TJavaGenericImport<JDevice_CreateDeviceCallbackAdapterClass, JDevice_CreateDeviceCallbackAdapter>) end;

  JDevice_DeleteDeviceCallbackAdapterClass = interface(JObjectClass)
    ['{8EE46136-9EEA-4748-87F7-0E7E416BE96E}']
    {class} function init(P1: JDevice; P2: JDeleteDeviceListener; P3: JDeviceInnerImplement_IDeviceObject): JDevice_DeleteDeviceCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/Device$DeleteDeviceCallbackAdapter')]
  JDevice_DeleteDeviceCallbackAdapter = interface(JObject)
    ['{2E429D25-85B5-413B-94C0-BFBE1C6E5227}']
    procedure nativeOnDeleteDevice(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJDevice_DeleteDeviceCallbackAdapter = class(TJavaGenericImport<JDevice_DeleteDeviceCallbackAdapterClass, JDevice_DeleteDeviceCallbackAdapter>) end;

  JNativeCommBoxManagerClass = interface(JObjectClass)
    ['{CD95A2B5-5701-4847-B166-CACD29AC2A73}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBoxManager')]
  JNativeCommBoxManager = interface(JObject)
    ['{D36B5745-D798-4B55-AC58-3AE84D9976FF}']
  end;
  TJNativeCommBoxManager = class(TJavaGenericImport<JNativeCommBoxManagerClass, JNativeCommBoxManager>) end;

  JCommBoxManagerClass = interface(JNativeCommBoxManagerClass)
    ['{DC5020A4-E048-48B8-90F8-013C5A19DD9E}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBoxManager')]
  JCommBoxManager = interface(JNativeCommBoxManager)
    ['{29F1149C-58B9-4F51-BA59-06E907864C58}']
    procedure closeCommBox(P1: Jcommbox_CommBox; P2: TJavaArray<Integer>; P3: JCloseCommBoxListener); cdecl;
    procedure openCommBox(P1: JString; P2: JString; P3: TJavaArray<Integer>; P4: JOpenCommBoxListener); cdecl;
  end;
  TJCommBoxManager = class(TJavaGenericImport<JCommBoxManagerClass, JCommBoxManager>) end;

  JDeviceInnerImplement_CommBoxManagerInnerClass = interface(JCommBoxManagerClass)
    ['{21860A44-C4BC-4C15-9CE5-6991C49D2BAA}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$CommBoxManagerInner')]
  JDeviceInnerImplement_CommBoxManagerInner = interface(JCommBoxManager)
    ['{0080EDA7-5093-4558-ABCF-2A7D69C4DBA3}']
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_CommBoxManagerInner = class(TJavaGenericImport<JDeviceInnerImplement_CommBoxManagerInnerClass, JDeviceInnerImplement_CommBoxManagerInner>) end;

  JNativeCommBoxClass = interface(JObjectClass)
    ['{92047CC9-0D49-47D0-B159-3020C9545530}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBox')]
  JNativeCommBox = interface(JObject)
    ['{5AA2B0BD-BCFD-4486-8AF9-8D382A1AA3D4}']
  end;
  TJNativeCommBox = class(TJavaGenericImport<JNativeCommBoxClass, JNativeCommBox>) end;

  Jcommbox_CommBoxClass = interface(JNativeCommBoxClass)
    ['{8264D786-A4F6-4261-B9AC-F033E7A317AF}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBox')]
  Jcommbox_CommBox = interface(JNativeCommBox)
    ['{9060EBFB-5556-441E-8EF5-31F3D8FAD109}']
    procedure getCommHistory(P1: TJavaArray<Integer>; P2: JGetCommHistoryListener); cdecl;
    procedure sendData(P1: JString; P2: JString; P3: TJavaArray<Integer>; P4: JSendDataListener); cdecl;
    procedure setReceiveEventCallback(P1: Jcommbox_ReceiveListener); cdecl;
  end;
  TJcommbox_CommBox = class(TJavaGenericImport<Jcommbox_CommBoxClass, Jcommbox_CommBox>) end;

  JCommBoxManager_CommBoxAccessorClass = interface(Jcommbox_CommBoxClass)
    ['{E6123066-7BF9-4112-B1A3-C6497CEBD9B8}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBoxManager$CommBoxAccessor')]
  JCommBoxManager_CommBoxAccessor = interface(Jcommbox_CommBox)
    ['{EFAB2422-6AA2-4BBB-9703-7115A7A1FB41}']
  end;
  TJCommBoxManager_CommBoxAccessor = class(TJavaGenericImport<JCommBoxManager_CommBoxAccessorClass, JCommBoxManager_CommBoxAccessor>) end;

  JCommBoxManagerInner_CommBoxInnerClass = interface(JCommBoxManager_CommBoxAccessorClass)
    ['{0C6601CB-F8C7-4029-A4F1-3A23389992D3}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$CommBoxManagerInner$CommBoxInner')]
  JCommBoxManagerInner_CommBoxInner = interface(JCommBoxManager_CommBoxAccessor)
    ['{4F476B77-E1FA-4415-839A-D64C1E181264}']
    function getDeviceHandle: Int64; cdecl;
  end;
  TJCommBoxManagerInner_CommBoxInner = class(TJavaGenericImport<JCommBoxManagerInner_CommBoxInnerClass, JCommBoxManagerInner_CommBoxInner>) end;

  JNativeDisplayClass = interface(JObjectClass)
    ['{9BEC8CFB-E7AE-427D-9D10-D6A1922BE880}']
  end;

  [JavaSignature('com/epson/eposdevice/display/NativeDisplay')]
  JNativeDisplay = interface(JObject)
    ['{C48992F6-6B22-45B5-BEE3-B9AE64D3ED4F}']
  end;
  TJNativeDisplay = class(TJavaGenericImport<JNativeDisplayClass, JNativeDisplay>) end;

  Jdisplay_DisplayClass = interface(JNativeDisplayClass)
    ['{209650F5-7AB0-47EB-9B2E-F262FA10E07E}']
    {class} function _GetBRIGHTNESS_100: Integer;
    {class} function _GetBRIGHTNESS_20: Integer;
    {class} function _GetBRIGHTNESS_40: Integer;
    {class} function _GetBRIGHTNESS_60: Integer;
    {class} function _GetCURSOR_NONE: Integer;
    {class} function _GetCURSOR_UNDERLINE: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetLANG_EN: Integer;
    {class} function _GetLANG_JA: Integer;
    {class} function _GetMARQUEE_PLACE: Integer;
    {class} function _GetMARQUEE_WALK: Integer;
    {class} function _GetMOVE_BOTTOM_LEFT: Integer;
    {class} function _GetMOVE_BOTTOM_RIGHT: Integer;
    {class} function _GetMOVE_TOP_LEFT: Integer;
    {class} function _GetMOVE_TOP_RIGHT: Integer;
    {class} function _GetSCROLL_HORIZONTAL: Integer;
    {class} function _GetSCROLL_OVERWRITE: Integer;
    {class} function _GetSCROLL_VERTICAL: Integer;
    {class} function _GetTRUE: Integer;
    {class} property BRIGHTNESS_100: Integer read _GetBRIGHTNESS_100;
    {class} property BRIGHTNESS_20: Integer read _GetBRIGHTNESS_20;
    {class} property BRIGHTNESS_40: Integer read _GetBRIGHTNESS_40;
    {class} property BRIGHTNESS_60: Integer read _GetBRIGHTNESS_60;
    {class} property CURSOR_NONE: Integer read _GetCURSOR_NONE;
    {class} property CURSOR_UNDERLINE: Integer read _GetCURSOR_UNDERLINE;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property LANG_EN: Integer read _GetLANG_EN;
    {class} property LANG_JA: Integer read _GetLANG_JA;
    {class} property MARQUEE_PLACE: Integer read _GetMARQUEE_PLACE;
    {class} property MARQUEE_WALK: Integer read _GetMARQUEE_WALK;
    {class} property MOVE_BOTTOM_LEFT: Integer read _GetMOVE_BOTTOM_LEFT;
    {class} property MOVE_BOTTOM_RIGHT: Integer read _GetMOVE_BOTTOM_RIGHT;
    {class} property MOVE_TOP_LEFT: Integer read _GetMOVE_TOP_LEFT;
    {class} property MOVE_TOP_RIGHT: Integer read _GetMOVE_TOP_RIGHT;
    {class} property SCROLL_HORIZONTAL: Integer read _GetSCROLL_HORIZONTAL;
    {class} property SCROLL_OVERWRITE: Integer read _GetSCROLL_OVERWRITE;
    {class} property SCROLL_VERTICAL: Integer read _GetSCROLL_VERTICAL;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/eposdevice/display/Display')]
  Jdisplay_Display = interface(JNativeDisplay)
    ['{5EC7C11B-CF52-40BB-9B52-229B2E32EAFA}']
    procedure addCommand(P1: TJavaArray<Byte>); cdecl;
    procedure addMarquee(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addReverseText(P1: JString); cdecl; overload;
    procedure addReverseText(P1: JString; P2: Integer); cdecl; overload;
    procedure addReverseText(P1: JString; P2: Integer; P3: Integer); cdecl; overload;
    procedure addReverseText(P1: JString; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
    procedure addText(P1: JString); cdecl; overload;
    procedure addText(P1: JString; P2: Integer); cdecl; overload;
    procedure addText(P1: JString; P2: Integer; P3: Integer); cdecl; overload;
    procedure addText(P1: JString; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
    procedure clearCommandBuffer; cdecl;
    procedure clearWindow; cdecl;
    procedure createWindow(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure destroyWindow(P1: Integer); cdecl;
    procedure moveCursorPosition(P1: Integer); cdecl;
    procedure reset; cdecl;
    procedure sendData; cdecl;
    procedure setBlink(P1: Integer); cdecl;
    procedure setBrightness(P1: Integer); cdecl;
    procedure setCurrentWindow(P1: Integer); cdecl;
    procedure setCursorPosition(P1: Integer; P2: Integer); cdecl;
    procedure setCursorType(P1: Integer); cdecl;
    procedure setReceiveEventCallback(P1: Jdisplay_ReceiveListener); cdecl;
    procedure showClock; cdecl;
  end;
  TJdisplay_Display = class(TJavaGenericImport<Jdisplay_DisplayClass, Jdisplay_Display>) end;

  JDeviceInnerImplement_DisplayInnerClass = interface(Jdisplay_DisplayClass)
    ['{05F76449-E939-4703-ACDD-1E35C1F9CD9E}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$DisplayInner')]
  JDeviceInnerImplement_DisplayInner = interface(Jdisplay_Display)
    ['{A9407A92-B57C-4C46-BD09-3232CE28321C}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_DisplayInner = class(TJavaGenericImport<JDeviceInnerImplement_DisplayInnerClass, JDeviceInnerImplement_DisplayInner>) end;

  JDeviceInnerImplement_IHandleObjectClass = interface(IJavaClass)
    ['{B06BA8D6-3E69-4C0C-8AD1-8EBB1ABD7F84}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$IHandleObject')]
  JDeviceInnerImplement_IHandleObject = interface(IJavaInstance)
    ['{FD677BB0-79FF-44C8-BB83-9CF49EE08419}']
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_IHandleObject = class(TJavaGenericImport<JDeviceInnerImplement_IHandleObjectClass, JDeviceInnerImplement_IHandleObject>) end;

  JDeviceInnerImplement_IDeviceObjectClass = interface(JDeviceInnerImplement_IHandleObjectClass)
    ['{0C1F9374-0404-4A29-A560-AF2621702F28}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$IDeviceObject')]
  JDeviceInnerImplement_IDeviceObject = interface(JDeviceInnerImplement_IHandleObject)
    ['{2CD1F62D-B194-47C5-BC5C-4773E7E460CA}']
    procedure deleteInstance; cdecl;
  end;
  TJDeviceInnerImplement_IDeviceObject = class(TJavaGenericImport<JDeviceInnerImplement_IDeviceObjectClass, JDeviceInnerImplement_IDeviceObject>) end;

  JNativeKeyboardClass = interface(JObjectClass)
    ['{58270833-BC63-4FF5-992C-5AE2DAF14080}']
  end;

  [JavaSignature('com/epson/eposdevice/keyboard/NativeKeyboard')]
  JNativeKeyboard = interface(JObject)
    ['{DF72595C-0F57-406A-8C75-23804F2FD6C3}']
  end;
  TJNativeKeyboard = class(TJavaGenericImport<JNativeKeyboardClass, JNativeKeyboard>) end;

  Jeposdevice_keyboard_KeyboardClass = interface(JNativeKeyboardClass)
    ['{6344985B-7EF8-4010-8E97-71CDA739B2F4}']
    {class} function _GetVK_0: Byte;
    {class} function _GetVK_1: Byte;
    {class} function _GetVK_2: Byte;
    {class} function _GetVK_3: Byte;
    {class} function _GetVK_4: Byte;
    {class} function _GetVK_5: Byte;
    {class} function _GetVK_6: Byte;
    {class} function _GetVK_7: Byte;
    {class} function _GetVK_8: Byte;
    {class} function _GetVK_9: Byte;
    {class} function _GetVK_A: Byte;
    {class} function _GetVK_ADD: Byte;
    {class} function _GetVK_B: Byte;
    {class} function _GetVK_BACK: Byte;
    {class} function _GetVK_C: Byte;
    {class} function _GetVK_CAPITAL: Byte;
    {class} function _GetVK_CONTROL: Byte;
    {class} function _GetVK_CONVERT: Byte;
    {class} function _GetVK_D: Byte;
    {class} function _GetVK_DELETE: Byte;
    {class} function _GetVK_DOWN: Byte;
    {class} function _GetVK_E: Byte;
    {class} function _GetVK_END: Byte;
    {class} function _GetVK_ESCAPE: Byte;
    {class} function _GetVK_F: Byte;
    {class} function _GetVK_F1: Byte;
    {class} function _GetVK_F10: Byte;
    {class} function _GetVK_F11: Byte;
    {class} function _GetVK_F12: Byte;
    {class} function _GetVK_F2: Byte;
    {class} function _GetVK_F3: Byte;
    {class} function _GetVK_F4: Byte;
    {class} function _GetVK_F5: Byte;
    {class} function _GetVK_F6: Byte;
    {class} function _GetVK_F7: Byte;
    {class} function _GetVK_F8: Byte;
    {class} function _GetVK_F9: Byte;
    {class} function _GetVK_G: Byte;
    {class} function _GetVK_H: Byte;
    {class} function _GetVK_HOME: Byte;
    {class} function _GetVK_I: Byte;
    {class} function _GetVK_INSERT: Byte;
    {class} function _GetVK_J: Byte;
    {class} function _GetVK_K: Byte;
    {class} function _GetVK_L: Byte;
    {class} function _GetVK_LEFT: Byte;
    {class} function _GetVK_M: Byte;
    {class} function _GetVK_MENU: Byte;
    {class} function _GetVK_MULTIPLY: Byte;
    {class} function _GetVK_N: Byte;
    {class} function _GetVK_NEXT: Byte;
    {class} function _GetVK_NONCONVERT: Byte;
    {class} function _GetVK_O: Byte;
    {class} function _GetVK_OEM_1: Byte;
    {class} function _GetVK_OEM_2: Byte;
    {class} function _GetVK_OEM_3: Byte;
    {class} function _GetVK_OEM_4: Byte;
    {class} function _GetVK_OEM_5: Byte;
    {class} function _GetVK_OEM_6: Byte;
    {class} function _GetVK_OEM_7: Byte;
    {class} function _GetVK_OEM_ATTN: Byte;
    {class} function _GetVK_OEM_COMMA: Byte;
    {class} function _GetVK_OEM_MINUS: Byte;
    {class} function _GetVK_OEM_PERIOD: Byte;
    {class} function _GetVK_OEM_PLUS: Byte;
    {class} function _GetVK_P: Byte;
    {class} function _GetVK_PRIOR: Byte;
    {class} function _GetVK_Q: Byte;
    {class} function _GetVK_R: Byte;
    {class} function _GetVK_RETURN: Byte;
    {class} function _GetVK_RIGHT: Byte;
    {class} function _GetVK_S: Byte;
    {class} function _GetVK_SHIFT: Byte;
    {class} function _GetVK_SPACE: Byte;
    {class} function _GetVK_SUBTRACT: Byte;
    {class} function _GetVK_T: Byte;
    {class} function _GetVK_TAB: Byte;
    {class} function _GetVK_U: Byte;
    {class} function _GetVK_UP: Byte;
    {class} function _GetVK_V: Byte;
    {class} function _GetVK_W: Byte;
    {class} function _GetVK_X: Byte;
    {class} function _GetVK_Y: Byte;
    {class} function _GetVK_Z: Byte;
    {class} property VK_0: Byte read _GetVK_0;
    {class} property VK_1: Byte read _GetVK_1;
    {class} property VK_2: Byte read _GetVK_2;
    {class} property VK_3: Byte read _GetVK_3;
    {class} property VK_4: Byte read _GetVK_4;
    {class} property VK_5: Byte read _GetVK_5;
    {class} property VK_6: Byte read _GetVK_6;
    {class} property VK_7: Byte read _GetVK_7;
    {class} property VK_8: Byte read _GetVK_8;
    {class} property VK_9: Byte read _GetVK_9;
    {class} property VK_A: Byte read _GetVK_A;
    {class} property VK_ADD: Byte read _GetVK_ADD;
    {class} property VK_B: Byte read _GetVK_B;
    {class} property VK_BACK: Byte read _GetVK_BACK;
    {class} property VK_C: Byte read _GetVK_C;
    {class} property VK_CAPITAL: Byte read _GetVK_CAPITAL;
    {class} property VK_CONTROL: Byte read _GetVK_CONTROL;
    {class} property VK_CONVERT: Byte read _GetVK_CONVERT;
    {class} property VK_D: Byte read _GetVK_D;
    {class} property VK_DELETE: Byte read _GetVK_DELETE;
    {class} property VK_DOWN: Byte read _GetVK_DOWN;
    {class} property VK_E: Byte read _GetVK_E;
    {class} property VK_END: Byte read _GetVK_END;
    {class} property VK_ESCAPE: Byte read _GetVK_ESCAPE;
    {class} property VK_F: Byte read _GetVK_F;
    {class} property VK_F1: Byte read _GetVK_F1;
    {class} property VK_F10: Byte read _GetVK_F10;
    {class} property VK_F11: Byte read _GetVK_F11;
    {class} property VK_F12: Byte read _GetVK_F12;
    {class} property VK_F2: Byte read _GetVK_F2;
    {class} property VK_F3: Byte read _GetVK_F3;
    {class} property VK_F4: Byte read _GetVK_F4;
    {class} property VK_F5: Byte read _GetVK_F5;
    {class} property VK_F6: Byte read _GetVK_F6;
    {class} property VK_F7: Byte read _GetVK_F7;
    {class} property VK_F8: Byte read _GetVK_F8;
    {class} property VK_F9: Byte read _GetVK_F9;
    {class} property VK_G: Byte read _GetVK_G;
    {class} property VK_H: Byte read _GetVK_H;
    {class} property VK_HOME: Byte read _GetVK_HOME;
    {class} property VK_I: Byte read _GetVK_I;
    {class} property VK_INSERT: Byte read _GetVK_INSERT;
    {class} property VK_J: Byte read _GetVK_J;
    {class} property VK_K: Byte read _GetVK_K;
    {class} property VK_L: Byte read _GetVK_L;
    {class} property VK_LEFT: Byte read _GetVK_LEFT;
    {class} property VK_M: Byte read _GetVK_M;
    {class} property VK_MENU: Byte read _GetVK_MENU;
    {class} property VK_MULTIPLY: Byte read _GetVK_MULTIPLY;
    {class} property VK_N: Byte read _GetVK_N;
    {class} property VK_NEXT: Byte read _GetVK_NEXT;
    {class} property VK_NONCONVERT: Byte read _GetVK_NONCONVERT;
    {class} property VK_O: Byte read _GetVK_O;
    {class} property VK_OEM_1: Byte read _GetVK_OEM_1;
    {class} property VK_OEM_2: Byte read _GetVK_OEM_2;
    {class} property VK_OEM_3: Byte read _GetVK_OEM_3;
    {class} property VK_OEM_4: Byte read _GetVK_OEM_4;
    {class} property VK_OEM_5: Byte read _GetVK_OEM_5;
    {class} property VK_OEM_6: Byte read _GetVK_OEM_6;
    {class} property VK_OEM_7: Byte read _GetVK_OEM_7;
    {class} property VK_OEM_ATTN: Byte read _GetVK_OEM_ATTN;
    {class} property VK_OEM_COMMA: Byte read _GetVK_OEM_COMMA;
    {class} property VK_OEM_MINUS: Byte read _GetVK_OEM_MINUS;
    {class} property VK_OEM_PERIOD: Byte read _GetVK_OEM_PERIOD;
    {class} property VK_OEM_PLUS: Byte read _GetVK_OEM_PLUS;
    {class} property VK_P: Byte read _GetVK_P;
    {class} property VK_PRIOR: Byte read _GetVK_PRIOR;
    {class} property VK_Q: Byte read _GetVK_Q;
    {class} property VK_R: Byte read _GetVK_R;
    {class} property VK_RETURN: Byte read _GetVK_RETURN;
    {class} property VK_RIGHT: Byte read _GetVK_RIGHT;
    {class} property VK_S: Byte read _GetVK_S;
    {class} property VK_SHIFT: Byte read _GetVK_SHIFT;
    {class} property VK_SPACE: Byte read _GetVK_SPACE;
    {class} property VK_SUBTRACT: Byte read _GetVK_SUBTRACT;
    {class} property VK_T: Byte read _GetVK_T;
    {class} property VK_TAB: Byte read _GetVK_TAB;
    {class} property VK_U: Byte read _GetVK_U;
    {class} property VK_UP: Byte read _GetVK_UP;
    {class} property VK_V: Byte read _GetVK_V;
    {class} property VK_W: Byte read _GetVK_W;
    {class} property VK_X: Byte read _GetVK_X;
    {class} property VK_Y: Byte read _GetVK_Y;
    {class} property VK_Z: Byte read _GetVK_Z;
  end;

  [JavaSignature('com/epson/eposdevice/keyboard/Keyboard')]
  Jeposdevice_keyboard_Keyboard = interface(JNativeKeyboard)
    ['{934B112D-0A64-4E51-81B1-EF6E49C0A3E9}']
    procedure setKeyPressEventCallback(P1: Jkeyboard_KeyPressListener); cdecl;
    procedure setPrefix(P1: TJavaArray<Byte>); cdecl;
    procedure setStringEventCallback(P1: JStringListener); cdecl;
  end;
  TJeposdevice_keyboard_Keyboard = class(TJavaGenericImport<Jeposdevice_keyboard_KeyboardClass, Jeposdevice_keyboard_Keyboard>) end;

  JDeviceInnerImplement_KeyboardInnerClass = interface(Jeposdevice_keyboard_KeyboardClass)
    ['{1148E476-D91E-4EA0-8109-B265064B90F4}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$KeyboardInner')]
  JDeviceInnerImplement_KeyboardInner = interface(Jeposdevice_keyboard_Keyboard)
    ['{53B2C5F8-5937-4611-B9E7-006474551343}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_KeyboardInner = class(TJavaGenericImport<JDeviceInnerImplement_KeyboardInnerClass, JDeviceInnerImplement_KeyboardInner>) end;

  JNativePrinterClass = interface(JObjectClass)
    ['{B583D1A4-02BB-48E4-99DC-851F7F6BBC92}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/NativePrinter')]
  JNativePrinter = interface(JObject)
    ['{499FA6E8-A0BD-4394-9F9F-1B69AAB4D5CE}']
  end;
  TJNativePrinter = class(TJavaGenericImport<JNativePrinterClass, JNativePrinter>) end;

  Jeposdevice_printer_PrinterClass = interface(JNativePrinterClass)
    ['{765A32E8-28D2-4416-978E-CA4FCA3E9535}']
    {class} function _GetALIGN_CENTER: Integer;
    {class} function _GetALIGN_LEFT: Integer;
    {class} function _GetALIGN_RIGHT: Integer;
    {class} function _GetBARCODE_CODABAR: Integer;
    {class} function _GetBARCODE_CODE128: Integer;
    {class} function _GetBARCODE_CODE39: Integer;
    {class} function _GetBARCODE_CODE93: Integer;
    {class} function _GetBARCODE_EAN13: Integer;
    {class} function _GetBARCODE_EAN8: Integer;
    {class} function _GetBARCODE_GS1_128: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_EXPANDED: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_LIMITED: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_OMNIDIRECTIONAL: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_TRUNCATED: Integer;
    {class} function _GetBARCODE_ITF: Integer;
    {class} function _GetBARCODE_JAN13: Integer;
    {class} function _GetBARCODE_JAN8: Integer;
    {class} function _GetBARCODE_UPC_A: Integer;
    {class} function _GetBARCODE_UPC_E: Integer;
    {class} function _GetCOLOR_1: Integer;
    {class} function _GetCOLOR_2: Integer;
    {class} function _GetCOLOR_3: Integer;
    {class} function _GetCOLOR_4: Integer;
    {class} function _GetCOLOR_NONE: Integer;
    {class} function _GetCUT_FEED: Integer;
    {class} function _GetCUT_NO_FEED: Integer;
    {class} function _GetCUT_RESERVE: Integer;
    {class} function _GetDIRECTION_BOTTOM_TO_TOP: Integer;
    {class} function _GetDIRECTION_LEFT_TO_RIGHT: Integer;
    {class} function _GetDIRECTION_RIGHT_TO_LEFT: Integer;
    {class} function _GetDIRECTION_TOP_TO_BOTTOM: Integer;
    {class} function _GetDRAWER_1: Integer;
    {class} function _GetDRAWER_2: Integer;
    {class} function _GetDRAWER_OPEN_LEVEL_HIGH: Integer;
    {class} function _GetDRAWER_OPEN_LEVEL_LOW: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetFEED_CURRENT_TOF: Integer;
    {class} function _GetFEED_CUTTING: Integer;
    {class} function _GetFEED_NEXT_TOF: Integer;
    {class} function _GetFEED_PEELING: Integer;
    {class} function _GetFONT_A: Integer;
    {class} function _GetFONT_B: Integer;
    {class} function _GetFONT_C: Integer;
    {class} function _GetFONT_D: Integer;
    {class} function _GetFONT_E: Integer;
    {class} function _GetHALFTONE_DITHER: Integer;
    {class} function _GetHALFTONE_ERROR_DIFFUSION: Integer;
    {class} function _GetHALFTONE_THRESHOLD: Integer;
    {class} function _GetHRI_ABOVE: Integer;
    {class} function _GetHRI_BELOW: Integer;
    {class} function _GetHRI_BOTH: Integer;
    {class} function _GetHRI_NONE: Integer;
    {class} function _GetLANG_EN: Integer;
    {class} function _GetLANG_JA: Integer;
    {class} function _GetLANG_KO: Integer;
    {class} function _GetLANG_TH: Integer;
    {class} function _GetLANG_ZH_CN: Integer;
    {class} function _GetLANG_ZH_TW: Integer;
    {class} function _GetLAYOUT_LABEL: Integer;
    {class} function _GetLAYOUT_LABEL_BM: Integer;
    {class} function _GetLAYOUT_RECEIPT: Integer;
    {class} function _GetLAYOUT_RECEIPT_BM: Integer;
    {class} function _GetLEVEL_0: Integer;
    {class} function _GetLEVEL_1: Integer;
    {class} function _GetLEVEL_2: Integer;
    {class} function _GetLEVEL_3: Integer;
    {class} function _GetLEVEL_4: Integer;
    {class} function _GetLEVEL_5: Integer;
    {class} function _GetLEVEL_6: Integer;
    {class} function _GetLEVEL_7: Integer;
    {class} function _GetLEVEL_8: Integer;
    {class} function _GetLEVEL_DEFAULT: Integer;
    {class} function _GetLEVEL_H: Integer;
    {class} function _GetLEVEL_L: Integer;
    {class} function _GetLEVEL_M: Integer;
    {class} function _GetLEVEL_Q: Integer;
    {class} function _GetLINE_MEDIUM: Integer;
    {class} function _GetLINE_MEDIUM_DOUBLE: Integer;
    {class} function _GetLINE_THICK: Integer;
    {class} function _GetLINE_THICK_DOUBLE: Integer;
    {class} function _GetLINE_THIN: Integer;
    {class} function _GetLINE_THIN_DOUBLE: Integer;
    {class} function _GetMODE_GRAY16: Integer;
    {class} function _GetMODE_MONO: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetPARAM_UNSPECIFIED: Integer;
    {class} function _GetPATTERN_1: Integer;
    {class} function _GetPATTERN_10: Integer;
    {class} function _GetPATTERN_2: Integer;
    {class} function _GetPATTERN_3: Integer;
    {class} function _GetPATTERN_4: Integer;
    {class} function _GetPATTERN_5: Integer;
    {class} function _GetPATTERN_6: Integer;
    {class} function _GetPATTERN_7: Integer;
    {class} function _GetPATTERN_8: Integer;
    {class} function _GetPATTERN_9: Integer;
    {class} function _GetPATTERN_A: Integer;
    {class} function _GetPATTERN_B: Integer;
    {class} function _GetPATTERN_C: Integer;
    {class} function _GetPATTERN_D: Integer;
    {class} function _GetPATTERN_E: Integer;
    {class} function _GetPATTERN_ERROR: Integer;
    {class} function _GetPATTERN_NONE: Integer;
    {class} function _GetPATTERN_PAPER_END: Integer;
    {class} function _GetPULSE_100: Integer;
    {class} function _GetPULSE_200: Integer;
    {class} function _GetPULSE_300: Integer;
    {class} function _GetPULSE_400: Integer;
    {class} function _GetPULSE_500: Integer;
    {class} function _GetST_AUTOCUTTER_ERR: Integer;
    {class} function _GetST_AUTORECOVER_ERR: Integer;
    {class} function _GetST_BATTERY_OFFLINE: Integer;
    {class} function _GetST_BUZZER: Integer;
    {class} function _GetST_COVER_OPEN: Integer;
    {class} function _GetST_DRAWER_KICK: Integer;
    {class} function _GetST_MECHANICAL_ERR: Integer;
    {class} function _GetST_NO_RESPONSE: Integer;
    {class} function _GetST_OFF_LINE: Integer;
    {class} function _GetST_PANEL_SWITCH: Integer;
    {class} function _GetST_PAPER_FEED: Integer;
    {class} function _GetST_PRINT_SUCCESS: Integer;
    {class} function _GetST_RECEIPT_END: Integer;
    {class} function _GetST_RECEIPT_NEAR_END: Integer;
    {class} function _GetST_SPOOLER_IS_STOPPED: Integer;
    {class} function _GetST_UNRECOVER_ERR: Integer;
    {class} function _GetST_WAIT_ON_LINE: Integer;
    {class} function _GetSYMBOL_AZTECCODE_COMPACT: Integer;
    {class} function _GetSYMBOL_AZTECCODE_FULLRANGE: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_12: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_16: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_8: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_SQUARE: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_EXPANDED_STACKED: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_STACKED: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_2: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_3: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_4: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_5: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_6: Integer;
    {class} function _GetSYMBOL_PDF417_STANDARD: Integer;
    {class} function _GetSYMBOL_PDF417_TRUNCATED: Integer;
    {class} function _GetSYMBOL_QRCODE_MICRO: Integer;
    {class} function _GetSYMBOL_QRCODE_MODEL_1: Integer;
    {class} function _GetSYMBOL_QRCODE_MODEL_2: Integer;
    {class} function _GetTRUE: Integer;
    {class} property ALIGN_CENTER: Integer read _GetALIGN_CENTER;
    {class} property ALIGN_LEFT: Integer read _GetALIGN_LEFT;
    {class} property ALIGN_RIGHT: Integer read _GetALIGN_RIGHT;
    {class} property BARCODE_CODABAR: Integer read _GetBARCODE_CODABAR;
    {class} property BARCODE_CODE128: Integer read _GetBARCODE_CODE128;
    {class} property BARCODE_CODE39: Integer read _GetBARCODE_CODE39;
    {class} property BARCODE_CODE93: Integer read _GetBARCODE_CODE93;
    {class} property BARCODE_EAN13: Integer read _GetBARCODE_EAN13;
    {class} property BARCODE_EAN8: Integer read _GetBARCODE_EAN8;
    {class} property BARCODE_GS1_128: Integer read _GetBARCODE_GS1_128;
    {class} property BARCODE_GS1_DATABAR_EXPANDED: Integer read _GetBARCODE_GS1_DATABAR_EXPANDED;
    {class} property BARCODE_GS1_DATABAR_LIMITED: Integer read _GetBARCODE_GS1_DATABAR_LIMITED;
    {class} property BARCODE_GS1_DATABAR_OMNIDIRECTIONAL: Integer read _GetBARCODE_GS1_DATABAR_OMNIDIRECTIONAL;
    {class} property BARCODE_GS1_DATABAR_TRUNCATED: Integer read _GetBARCODE_GS1_DATABAR_TRUNCATED;
    {class} property BARCODE_ITF: Integer read _GetBARCODE_ITF;
    {class} property BARCODE_JAN13: Integer read _GetBARCODE_JAN13;
    {class} property BARCODE_JAN8: Integer read _GetBARCODE_JAN8;
    {class} property BARCODE_UPC_A: Integer read _GetBARCODE_UPC_A;
    {class} property BARCODE_UPC_E: Integer read _GetBARCODE_UPC_E;
    {class} property COLOR_1: Integer read _GetCOLOR_1;
    {class} property COLOR_2: Integer read _GetCOLOR_2;
    {class} property COLOR_3: Integer read _GetCOLOR_3;
    {class} property COLOR_4: Integer read _GetCOLOR_4;
    {class} property COLOR_NONE: Integer read _GetCOLOR_NONE;
    {class} property CUT_FEED: Integer read _GetCUT_FEED;
    {class} property CUT_NO_FEED: Integer read _GetCUT_NO_FEED;
    {class} property CUT_RESERVE: Integer read _GetCUT_RESERVE;
    {class} property DIRECTION_BOTTOM_TO_TOP: Integer read _GetDIRECTION_BOTTOM_TO_TOP;
    {class} property DIRECTION_LEFT_TO_RIGHT: Integer read _GetDIRECTION_LEFT_TO_RIGHT;
    {class} property DIRECTION_RIGHT_TO_LEFT: Integer read _GetDIRECTION_RIGHT_TO_LEFT;
    {class} property DIRECTION_TOP_TO_BOTTOM: Integer read _GetDIRECTION_TOP_TO_BOTTOM;
    {class} property DRAWER_1: Integer read _GetDRAWER_1;
    {class} property DRAWER_2: Integer read _GetDRAWER_2;
    {class} property DRAWER_OPEN_LEVEL_HIGH: Integer read _GetDRAWER_OPEN_LEVEL_HIGH;
    {class} property DRAWER_OPEN_LEVEL_LOW: Integer read _GetDRAWER_OPEN_LEVEL_LOW;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property FEED_CURRENT_TOF: Integer read _GetFEED_CURRENT_TOF;
    {class} property FEED_CUTTING: Integer read _GetFEED_CUTTING;
    {class} property FEED_NEXT_TOF: Integer read _GetFEED_NEXT_TOF;
    {class} property FEED_PEELING: Integer read _GetFEED_PEELING;
    {class} property FONT_A: Integer read _GetFONT_A;
    {class} property FONT_B: Integer read _GetFONT_B;
    {class} property FONT_C: Integer read _GetFONT_C;
    {class} property FONT_D: Integer read _GetFONT_D;
    {class} property FONT_E: Integer read _GetFONT_E;
    {class} property HALFTONE_DITHER: Integer read _GetHALFTONE_DITHER;
    {class} property HALFTONE_ERROR_DIFFUSION: Integer read _GetHALFTONE_ERROR_DIFFUSION;
    {class} property HALFTONE_THRESHOLD: Integer read _GetHALFTONE_THRESHOLD;
    {class} property HRI_ABOVE: Integer read _GetHRI_ABOVE;
    {class} property HRI_BELOW: Integer read _GetHRI_BELOW;
    {class} property HRI_BOTH: Integer read _GetHRI_BOTH;
    {class} property HRI_NONE: Integer read _GetHRI_NONE;
    {class} property LANG_EN: Integer read _GetLANG_EN;
    {class} property LANG_JA: Integer read _GetLANG_JA;
    {class} property LANG_KO: Integer read _GetLANG_KO;
    {class} property LANG_TH: Integer read _GetLANG_TH;
    {class} property LANG_ZH_CN: Integer read _GetLANG_ZH_CN;
    {class} property LANG_ZH_TW: Integer read _GetLANG_ZH_TW;
    {class} property LAYOUT_LABEL: Integer read _GetLAYOUT_LABEL;
    {class} property LAYOUT_LABEL_BM: Integer read _GetLAYOUT_LABEL_BM;
    {class} property LAYOUT_RECEIPT: Integer read _GetLAYOUT_RECEIPT;
    {class} property LAYOUT_RECEIPT_BM: Integer read _GetLAYOUT_RECEIPT_BM;
    {class} property LEVEL_0: Integer read _GetLEVEL_0;
    {class} property LEVEL_1: Integer read _GetLEVEL_1;
    {class} property LEVEL_2: Integer read _GetLEVEL_2;
    {class} property LEVEL_3: Integer read _GetLEVEL_3;
    {class} property LEVEL_4: Integer read _GetLEVEL_4;
    {class} property LEVEL_5: Integer read _GetLEVEL_5;
    {class} property LEVEL_6: Integer read _GetLEVEL_6;
    {class} property LEVEL_7: Integer read _GetLEVEL_7;
    {class} property LEVEL_8: Integer read _GetLEVEL_8;
    {class} property LEVEL_DEFAULT: Integer read _GetLEVEL_DEFAULT;
    {class} property LEVEL_H: Integer read _GetLEVEL_H;
    {class} property LEVEL_L: Integer read _GetLEVEL_L;
    {class} property LEVEL_M: Integer read _GetLEVEL_M;
    {class} property LEVEL_Q: Integer read _GetLEVEL_Q;
    {class} property LINE_MEDIUM: Integer read _GetLINE_MEDIUM;
    {class} property LINE_MEDIUM_DOUBLE: Integer read _GetLINE_MEDIUM_DOUBLE;
    {class} property LINE_THICK: Integer read _GetLINE_THICK;
    {class} property LINE_THICK_DOUBLE: Integer read _GetLINE_THICK_DOUBLE;
    {class} property LINE_THIN: Integer read _GetLINE_THIN;
    {class} property LINE_THIN_DOUBLE: Integer read _GetLINE_THIN_DOUBLE;
    {class} property MODE_GRAY16: Integer read _GetMODE_GRAY16;
    {class} property MODE_MONO: Integer read _GetMODE_MONO;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property PARAM_UNSPECIFIED: Integer read _GetPARAM_UNSPECIFIED;
    {class} property PATTERN_1: Integer read _GetPATTERN_1;
    {class} property PATTERN_10: Integer read _GetPATTERN_10;
    {class} property PATTERN_2: Integer read _GetPATTERN_2;
    {class} property PATTERN_3: Integer read _GetPATTERN_3;
    {class} property PATTERN_4: Integer read _GetPATTERN_4;
    {class} property PATTERN_5: Integer read _GetPATTERN_5;
    {class} property PATTERN_6: Integer read _GetPATTERN_6;
    {class} property PATTERN_7: Integer read _GetPATTERN_7;
    {class} property PATTERN_8: Integer read _GetPATTERN_8;
    {class} property PATTERN_9: Integer read _GetPATTERN_9;
    {class} property PATTERN_A: Integer read _GetPATTERN_A;
    {class} property PATTERN_B: Integer read _GetPATTERN_B;
    {class} property PATTERN_C: Integer read _GetPATTERN_C;
    {class} property PATTERN_D: Integer read _GetPATTERN_D;
    {class} property PATTERN_E: Integer read _GetPATTERN_E;
    {class} property PATTERN_ERROR: Integer read _GetPATTERN_ERROR;
    {class} property PATTERN_NONE: Integer read _GetPATTERN_NONE;
    {class} property PATTERN_PAPER_END: Integer read _GetPATTERN_PAPER_END;
    {class} property PULSE_100: Integer read _GetPULSE_100;
    {class} property PULSE_200: Integer read _GetPULSE_200;
    {class} property PULSE_300: Integer read _GetPULSE_300;
    {class} property PULSE_400: Integer read _GetPULSE_400;
    {class} property PULSE_500: Integer read _GetPULSE_500;
    {class} property ST_AUTOCUTTER_ERR: Integer read _GetST_AUTOCUTTER_ERR;
    {class} property ST_AUTORECOVER_ERR: Integer read _GetST_AUTORECOVER_ERR;
    {class} property ST_BATTERY_OFFLINE: Integer read _GetST_BATTERY_OFFLINE;
    {class} property ST_BUZZER: Integer read _GetST_BUZZER;
    {class} property ST_COVER_OPEN: Integer read _GetST_COVER_OPEN;
    {class} property ST_DRAWER_KICK: Integer read _GetST_DRAWER_KICK;
    {class} property ST_MECHANICAL_ERR: Integer read _GetST_MECHANICAL_ERR;
    {class} property ST_NO_RESPONSE: Integer read _GetST_NO_RESPONSE;
    {class} property ST_OFF_LINE: Integer read _GetST_OFF_LINE;
    {class} property ST_PANEL_SWITCH: Integer read _GetST_PANEL_SWITCH;
    {class} property ST_PAPER_FEED: Integer read _GetST_PAPER_FEED;
    {class} property ST_PRINT_SUCCESS: Integer read _GetST_PRINT_SUCCESS;
    {class} property ST_RECEIPT_END: Integer read _GetST_RECEIPT_END;
    {class} property ST_RECEIPT_NEAR_END: Integer read _GetST_RECEIPT_NEAR_END;
    {class} property ST_SPOOLER_IS_STOPPED: Integer read _GetST_SPOOLER_IS_STOPPED;
    {class} property ST_UNRECOVER_ERR: Integer read _GetST_UNRECOVER_ERR;
    {class} property ST_WAIT_ON_LINE: Integer read _GetST_WAIT_ON_LINE;
    {class} property SYMBOL_AZTECCODE_COMPACT: Integer read _GetSYMBOL_AZTECCODE_COMPACT;
    {class} property SYMBOL_AZTECCODE_FULLRANGE: Integer read _GetSYMBOL_AZTECCODE_FULLRANGE;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_12: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_12;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_16: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_16;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_8: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_8;
    {class} property SYMBOL_DATAMATRIX_SQUARE: Integer read _GetSYMBOL_DATAMATRIX_SQUARE;
    {class} property SYMBOL_GS1_DATABAR_EXPANDED_STACKED: Integer read _GetSYMBOL_GS1_DATABAR_EXPANDED_STACKED;
    {class} property SYMBOL_GS1_DATABAR_STACKED: Integer read _GetSYMBOL_GS1_DATABAR_STACKED;
    {class} property SYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL: Integer read _GetSYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL;
    {class} property SYMBOL_MAXICODE_MODE_2: Integer read _GetSYMBOL_MAXICODE_MODE_2;
    {class} property SYMBOL_MAXICODE_MODE_3: Integer read _GetSYMBOL_MAXICODE_MODE_3;
    {class} property SYMBOL_MAXICODE_MODE_4: Integer read _GetSYMBOL_MAXICODE_MODE_4;
    {class} property SYMBOL_MAXICODE_MODE_5: Integer read _GetSYMBOL_MAXICODE_MODE_5;
    {class} property SYMBOL_MAXICODE_MODE_6: Integer read _GetSYMBOL_MAXICODE_MODE_6;
    {class} property SYMBOL_PDF417_STANDARD: Integer read _GetSYMBOL_PDF417_STANDARD;
    {class} property SYMBOL_PDF417_TRUNCATED: Integer read _GetSYMBOL_PDF417_TRUNCATED;
    {class} property SYMBOL_QRCODE_MICRO: Integer read _GetSYMBOL_QRCODE_MICRO;
    {class} property SYMBOL_QRCODE_MODEL_1: Integer read _GetSYMBOL_QRCODE_MODEL_1;
    {class} property SYMBOL_QRCODE_MODEL_2: Integer read _GetSYMBOL_QRCODE_MODEL_2;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/eposdevice/printer/Printer')]
  Jeposdevice_printer_Printer = interface(JNativePrinter)
    ['{3454FDB6-6556-4879-AFA0-AC0E2D6433B2}']
    procedure addBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addCommand(P1: TJavaArray<Byte>); cdecl;
    procedure addCut(P1: Integer); cdecl;
    procedure addFeed; cdecl;
    procedure addFeedLine(P1: Integer); cdecl;
    procedure addFeedPosition(P1: Integer); cdecl;
    procedure addFeedUnit(P1: Integer); cdecl;
    procedure addHLine(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure addImage(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer); cdecl;
    procedure addLayout(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer); cdecl;
    procedure addLogo(P1: Integer; P2: Integer); cdecl;
    procedure addPageArea(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    procedure addPageBegin; cdecl;
    procedure addPageDirection(P1: Integer); cdecl;
    procedure addPageEnd; cdecl;
    procedure addPageLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure addPagePosition(P1: Integer; P2: Integer); cdecl;
    procedure addPageRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure addPulse(P1: Integer; P2: Integer); cdecl;
    procedure addRecovery; cdecl;
    procedure addReset; cdecl;
    procedure addSound(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure addSymbol(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addText(P1: JString); cdecl;
    procedure addTextAlign(P1: Integer); cdecl;
    procedure addTextDouble(P1: Integer; P2: Integer); cdecl;
    procedure addTextFont(P1: Integer); cdecl;
    procedure addTextLang(P1: Integer); cdecl;
    procedure addTextLineSpace(P1: Integer); cdecl;
    procedure addTextPosition(P1: Integer); cdecl;
    procedure addTextRotate(P1: Integer); cdecl;
    procedure addTextSize(P1: Integer; P2: Integer); cdecl;
    procedure addTextSmooth(P1: Integer); cdecl;
    procedure addTextStyle(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    procedure addTextVPosition(P1: Integer); cdecl;
    procedure addVLineBegin(P1: Integer; P2: Integer); cdecl;
    procedure addVLineEnd(P1: Integer; P2: Integer); cdecl;
    procedure clearCommandBuffer; cdecl;
    function getBrightness: Double; cdecl;
    function getDrawerOpenLevel: Integer; cdecl;
    function getForce: Boolean; cdecl;
    function getHalftone: Integer; cdecl;
    function getInterval: Integer; cdecl;
    procedure getPrintJobStatus(P1: JString); cdecl;
    function getTimeout: Integer; cdecl;
    procedure recover; cdecl;
    procedure reset; cdecl;
    procedure sendData; cdecl; overload;
    procedure sendData(P1: JString); cdecl; overload;
    procedure setBatteryLowEventCallback(P1: JBatteryLowListener); cdecl;
    procedure setBatteryOkEventCallback(P1: JBatteryOkListener); cdecl;
    procedure setBatteryStatusChangeEventCallback(P1: JBatteryStatusChangeListener); cdecl;
    procedure setBrightness(P1: Double); cdecl;
    procedure setCoverOkEventCallback(P1: JCoverOkListener); cdecl;
    procedure setCoverOpenEventCallback(P1: JCoverOpenListener); cdecl;
    procedure setDrawerClosedEventCallback(P1: JDrawerClosedListener); cdecl;
    procedure setDrawerOpenEventCallback(P1: JDrawerOpenListener); cdecl;
    procedure setDrawerOpenLevel(P1: Integer); cdecl;
    procedure setForce(P1: Boolean); cdecl;
    procedure setHalftone(P1: Integer); cdecl;
    procedure setInterval(P1: Integer); cdecl;
    procedure setOfflineEventCallback(P1: JOfflineListener); cdecl;
    procedure setOnlineEventCallback(P1: JOnlineListener); cdecl;
    procedure setPaperEndEventCallback(P1: JPaperEndListener); cdecl;
    procedure setPaperNearEndEventCallback(P1: JPaperNearEndListener); cdecl;
    procedure setPaperOkEventCallback(P1: JPaperOkListener); cdecl;
    procedure setPowerOffEventCallback(P1: JPowerOffListener); cdecl;
    procedure setReceiveEventCallback(P1: Jeposdevice_printer_ReceiveListener); cdecl;
    procedure setStatusChangeEventCallback(P1: Jprinter_StatusChangeListener); cdecl;
    procedure setTimeout(P1: Integer); cdecl;
    procedure startMonitor; cdecl;
    procedure stopMonitor; cdecl;
  end;
  TJeposdevice_printer_Printer = class(TJavaGenericImport<Jeposdevice_printer_PrinterClass, Jeposdevice_printer_Printer>) end;

  JDeviceInnerImplement_PrinterInnerClass = interface(Jeposdevice_printer_PrinterClass)
    ['{C19401B6-BC07-4914-A6D8-EC8EF25DB236}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$PrinterInner')]
  JDeviceInnerImplement_PrinterInner = interface(Jeposdevice_printer_Printer)
    ['{0CF5F9A4-E346-42A0-B0C4-EF3D06C6B6D6}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_PrinterInner = class(TJavaGenericImport<JDeviceInnerImplement_PrinterInnerClass, JDeviceInnerImplement_PrinterInner>) end;

  JNativeScannerClass = interface(JObjectClass)
    ['{366E0145-E3FA-44A8-BA4F-11BCF6C9F076}']
  end;

  [JavaSignature('com/epson/eposdevice/scanner/NativeScanner')]
  JNativeScanner = interface(JObject)
    ['{4B071A65-F165-4A75-BC79-6DBD0EE99BE0}']
  end;
  TJNativeScanner = class(TJavaGenericImport<JNativeScannerClass, JNativeScanner>) end;

  Jscanner_ScannerClass = interface(JNativeScannerClass)
    ['{BA2B7FD8-2F3E-472E-98A0-83E301F38E4A}']
  end;

  [JavaSignature('com/epson/eposdevice/scanner/Scanner')]
  Jscanner_Scanner = interface(JNativeScanner)
    ['{912FE0FC-2C8A-4D42-B77B-7B87FF60D3A9}']
    procedure setDataEventCallback(P1: JDataListener); cdecl;
  end;
  TJscanner_Scanner = class(TJavaGenericImport<Jscanner_ScannerClass, Jscanner_Scanner>) end;

  JDeviceInnerImplement_ScannerInnerClass = interface(Jscanner_ScannerClass)
    ['{0F043521-7B3A-4780-8108-67F0D166C505}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$ScannerInner')]
  JDeviceInnerImplement_ScannerInner = interface(Jscanner_Scanner)
    ['{F767BEE4-C087-438E-A4C1-BED4EF281066}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_ScannerInner = class(TJavaGenericImport<JDeviceInnerImplement_ScannerInnerClass, JDeviceInnerImplement_ScannerInner>) end;

  JNativeSimpleSerialClass = interface(JObjectClass)
    ['{CB5896CB-5603-425B-8741-609B1D4CB949}']
  end;

  [JavaSignature('com/epson/eposdevice/simpleserial/NativeSimpleSerial')]
  JNativeSimpleSerial = interface(JObject)
    ['{F2C86573-EA80-4BE6-A60F-86DAA8EFEFC9}']
  end;
  TJNativeSimpleSerial = class(TJavaGenericImport<JNativeSimpleSerialClass, JNativeSimpleSerial>) end;

  Jsimpleserial_SimpleSerialClass = interface(JNativeSimpleSerialClass)
    ['{5C7F2395-B765-4E00-A4C5-1D1C735DF310}']
  end;

  [JavaSignature('com/epson/eposdevice/simpleserial/SimpleSerial')]
  Jsimpleserial_SimpleSerial = interface(JNativeSimpleSerial)
    ['{D8029D84-915A-44D0-9C9D-FBE41A4EA28B}']
    procedure sendCommand(P1: TJavaArray<Byte>); cdecl;
    procedure setCommandReplyEventCallback(P1: JCommandReplayListener); cdecl;
  end;
  TJsimpleserial_SimpleSerial = class(TJavaGenericImport<Jsimpleserial_SimpleSerialClass, Jsimpleserial_SimpleSerial>) end;

  JDeviceInnerImplement_SimpleSerialInnerClass = interface(Jsimpleserial_SimpleSerialClass)
    ['{8552FFB1-731F-45EE-8A82-774C966B3FCA}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$SimpleSerialInner')]
  JDeviceInnerImplement_SimpleSerialInner = interface(Jsimpleserial_SimpleSerial)
    ['{0D559455-A27D-4DD3-A58C-93E50AAD58F2}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_SimpleSerialInner = class(TJavaGenericImport<JDeviceInnerImplement_SimpleSerialInnerClass, JDeviceInnerImplement_SimpleSerialInner>) end;

  JDisconnectListenerClass = interface(JEventListenerClass)
    ['{FCFDC69F-D5D6-4E67-9C83-B05F3F575098}']
  end;

  [JavaSignature('com/epson/eposdevice/DisconnectListener')]
  JDisconnectListener = interface(JEventListener)
    ['{42920E51-D603-41D6-8C05-E9947878C47F}']
    procedure onDisconnect(P1: JString); cdecl;
  end;
  TJDisconnectListener = class(TJavaGenericImport<JDisconnectListenerClass, JDisconnectListener>) end;

  JEposCallbackCodeClass = interface(JObjectClass)
    ['{AA3819AE-4303-450B-AE08-FA456A70428C}']
    {class} function _GetERR_ALREADY_OPENED: Integer;
    {class} function _GetERR_ALREADY_USED: Integer;
    {class} function _GetERR_AUTOMATICAL: Integer;
    {class} function _GetERR_BATTERY_LOW: Integer;
    {class} function _GetERR_BOX_CLIENT_OVER: Integer;
    {class} function _GetERR_BOX_COUNT_OVER: Integer;
    {class} function _GetERR_CLOSE: Integer;
    {class} function _GetERR_COVER_OPEN: Integer;
    {class} function _GetERR_CUTTER: Integer;
    {class} function _GetERR_EMPTY: Integer;
    {class} function _GetERR_FAILURE: Integer;
    {class} function _GetERR_ILLEGAL: Integer;
    {class} function _GetERR_INVALID_WINDOW: Integer;
    {class} function _GetERR_IN_USE: Integer;
    {class} function _GetERR_JOB_NOT_FOUND: Integer;
    {class} function _GetERR_MECHANICAL: Integer;
    {class} function _GetERR_MEMORY: Integer;
    {class} function _GetERR_NOT_FOUND: Integer;
    {class} function _GetERR_NOT_OPENED: Integer;
    {class} function _GetERR_OPEN: Integer;
    {class} function _GetERR_PARAM: Integer;
    {class} function _GetERR_PORT: Integer;
    {class} function _GetERR_SPOOLER: Integer;
    {class} function _GetERR_SYSTEM: Integer;
    {class} function _GetERR_TIMEOUT: Integer;
    {class} function _GetERR_TYPE_INVALID: Integer;
    {class} function _GetERR_UNRECOVERABLE: Integer;
    {class} function _GetPRINTING: Integer;
    {class} function _GetSUCCESS: Integer;
    {class} function init: JEposCallbackCode; cdecl;
    {class} property ERR_ALREADY_OPENED: Integer read _GetERR_ALREADY_OPENED;
    {class} property ERR_ALREADY_USED: Integer read _GetERR_ALREADY_USED;
    {class} property ERR_AUTOMATICAL: Integer read _GetERR_AUTOMATICAL;
    {class} property ERR_BATTERY_LOW: Integer read _GetERR_BATTERY_LOW;
    {class} property ERR_BOX_CLIENT_OVER: Integer read _GetERR_BOX_CLIENT_OVER;
    {class} property ERR_BOX_COUNT_OVER: Integer read _GetERR_BOX_COUNT_OVER;
    {class} property ERR_CLOSE: Integer read _GetERR_CLOSE;
    {class} property ERR_COVER_OPEN: Integer read _GetERR_COVER_OPEN;
    {class} property ERR_CUTTER: Integer read _GetERR_CUTTER;
    {class} property ERR_EMPTY: Integer read _GetERR_EMPTY;
    {class} property ERR_FAILURE: Integer read _GetERR_FAILURE;
    {class} property ERR_ILLEGAL: Integer read _GetERR_ILLEGAL;
    {class} property ERR_INVALID_WINDOW: Integer read _GetERR_INVALID_WINDOW;
    {class} property ERR_IN_USE: Integer read _GetERR_IN_USE;
    {class} property ERR_JOB_NOT_FOUND: Integer read _GetERR_JOB_NOT_FOUND;
    {class} property ERR_MECHANICAL: Integer read _GetERR_MECHANICAL;
    {class} property ERR_MEMORY: Integer read _GetERR_MEMORY;
    {class} property ERR_NOT_FOUND: Integer read _GetERR_NOT_FOUND;
    {class} property ERR_NOT_OPENED: Integer read _GetERR_NOT_OPENED;
    {class} property ERR_OPEN: Integer read _GetERR_OPEN;
    {class} property ERR_PARAM: Integer read _GetERR_PARAM;
    {class} property ERR_PORT: Integer read _GetERR_PORT;
    {class} property ERR_SPOOLER: Integer read _GetERR_SPOOLER;
    {class} property ERR_SYSTEM: Integer read _GetERR_SYSTEM;
    {class} property ERR_TIMEOUT: Integer read _GetERR_TIMEOUT;
    {class} property ERR_TYPE_INVALID: Integer read _GetERR_TYPE_INVALID;
    {class} property ERR_UNRECOVERABLE: Integer read _GetERR_UNRECOVERABLE;
    {class} property PRINTING: Integer read _GetPRINTING;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('com/epson/eposdevice/EposCallbackCode')]
  JEposCallbackCode = interface(JObject)
    ['{BA1BB01C-3E17-4FC2-9F8E-B864754B8775}']
  end;
  TJEposCallbackCode = class(TJavaGenericImport<JEposCallbackCodeClass, JEposCallbackCode>) end;

  JEposExceptionClass = interface(JExceptionClass)
    ['{6699542F-C07F-4C01-9FD5-3D8FC0D387CA}']
    {class} function _GetERR_CONNECT: Integer;
    {class} function _GetERR_FAILURE: Integer;
    {class} function _GetERR_ILLEGAL: Integer;
    {class} function _GetERR_IN_USE: Integer;
    {class} function _GetERR_MEMORY: Integer;
    {class} function _GetERR_PARAM: Integer;
    {class} function _GetERR_PROCESSING: Integer;
    {class} function init(P1: Integer): JEposException; cdecl; overload;
    {class} function init(P1: JString; P2: JThrowable): JEposException; cdecl; overload;
    {class} property ERR_CONNECT: Integer read _GetERR_CONNECT;
    {class} property ERR_FAILURE: Integer read _GetERR_FAILURE;
    {class} property ERR_ILLEGAL: Integer read _GetERR_ILLEGAL;
    {class} property ERR_IN_USE: Integer read _GetERR_IN_USE;
    {class} property ERR_MEMORY: Integer read _GetERR_MEMORY;
    {class} property ERR_PARAM: Integer read _GetERR_PARAM;
    {class} property ERR_PROCESSING: Integer read _GetERR_PROCESSING;
  end;

  [JavaSignature('com/epson/eposdevice/EposException')]
  JEposException = interface(JException)
    ['{5D4FA68C-7576-42F9-A64C-F8A48460D0B3}']
    function getErrorStatus: Integer; cdecl;
  end;
  TJEposException = class(TJavaGenericImport<JEposExceptionClass, JEposException>) end;

  Jeposdevice_LogClass = interface(JObjectClass)
    ['{C4508C45-9040-4A2B-9CD5-8CAE8A20798D}']
    {class} function _GetLOG_DISABLE: Integer;
    {class} function _GetLOG_LOW: Integer;
    {class} function _GetLOG_PERMANENT: Integer;
    {class} function _GetLOG_STORAGE: Integer;
    {class} function _GetLOG_TCP: Integer;
    {class} function _GetLOG_TEMPORARY: Integer;
    {class} function init: Jeposdevice_Log; cdecl;
    {class} procedure setLogSettings(P1: JContext; P2: Integer; P3: Integer; P4: JString; P5: Integer; P6: Integer; P7: Integer); cdecl;
    {class} property LOG_DISABLE: Integer read _GetLOG_DISABLE;
    {class} property LOG_LOW: Integer read _GetLOG_LOW;
    {class} property LOG_PERMANENT: Integer read _GetLOG_PERMANENT;
    {class} property LOG_STORAGE: Integer read _GetLOG_STORAGE;
    {class} property LOG_TCP: Integer read _GetLOG_TCP;
    {class} property LOG_TEMPORARY: Integer read _GetLOG_TEMPORARY;
  end;

  [JavaSignature('com/epson/eposdevice/Log')]
  Jeposdevice_Log = interface(JObject)
    ['{E53D7553-694C-4120-8119-66464A2FF831}']
  end;
  TJeposdevice_Log = class(TJavaGenericImport<Jeposdevice_LogClass, Jeposdevice_Log>) end;

  JNativeDevice_NativeConnectCallbackAdapterClass = interface(IJavaClass)
    ['{DABD23D3-D336-4DBF-9D76-2642FC875309}']
  end;

  [JavaSignature('com/epson/eposdevice/NativeDevice$NativeConnectCallbackAdapter')]
  JNativeDevice_NativeConnectCallbackAdapter = interface(IJavaInstance)
    ['{297C6995-CD0D-441F-AA57-2F387ECFE196}']
    procedure nativeOnConnect(P1: JString; P2: Integer); cdecl;
  end;
  TJNativeDevice_NativeConnectCallbackAdapter = class(TJavaGenericImport<JNativeDevice_NativeConnectCallbackAdapterClass, JNativeDevice_NativeConnectCallbackAdapter>) end;

  JNativeDevice_NativeCreateDeviceCallbackAdapterClass = interface(IJavaClass)
    ['{65F5CE93-4044-42BE-AD9C-076F22494EAF}']
  end;

  [JavaSignature('com/epson/eposdevice/NativeDevice$NativeCreateDeviceCallbackAdapter')]
  JNativeDevice_NativeCreateDeviceCallbackAdapter = interface(IJavaInstance)
    ['{A40095EA-B0FA-4534-9C7C-8CF634C6B6C5}']
    procedure nativeOnCreateDevice(P1: JString; P2: JString; P3: Integer; P4: Int64; P5: Integer); cdecl;
  end;
  TJNativeDevice_NativeCreateDeviceCallbackAdapter = class(TJavaGenericImport<JNativeDevice_NativeCreateDeviceCallbackAdapterClass, JNativeDevice_NativeCreateDeviceCallbackAdapter>) end;

  JNativeDevice_NativeDeleteDeviceCallbackAdapterClass = interface(IJavaClass)
    ['{EF3D61C2-37E3-4010-9492-8226DD3610D8}']
  end;

  [JavaSignature('com/epson/eposdevice/NativeDevice$NativeDeleteDeviceCallbackAdapter')]
  JNativeDevice_NativeDeleteDeviceCallbackAdapter = interface(IJavaInstance)
    ['{A63B9AA3-7993-49AF-AC5F-31B457288132}']
    procedure nativeOnDeleteDevice(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJNativeDevice_NativeDeleteDeviceCallbackAdapter = class(TJavaGenericImport<JNativeDevice_NativeDeleteDeviceCallbackAdapterClass, JNativeDevice_NativeDeleteDeviceCallbackAdapter>) end;

  JReconnectListenerClass = interface(JEventListenerClass)
    ['{66C50255-35C8-49ED-BDD3-C52CC3680634}']
  end;

  [JavaSignature('com/epson/eposdevice/ReconnectListener')]
  JReconnectListener = interface(JEventListener)
    ['{745EB193-7723-4BDC-B73E-EC44740DBDD6}']
    procedure onReconnect(P1: JString); cdecl;
  end;
  TJReconnectListener = class(TJavaGenericImport<JReconnectListenerClass, JReconnectListener>) end;

  JReconnectingListenerClass = interface(JEventListenerClass)
    ['{00CE4C04-5992-484B-920D-72C5888B843F}']
  end;

  [JavaSignature('com/epson/eposdevice/ReconnectingListener')]
  JReconnectingListener = interface(JEventListener)
    ['{00300774-851F-458F-BEF6-6B5B95061FC2}']
    procedure onReconnecting(P1: JString); cdecl;
  end;
  TJReconnectingListener = class(TJavaGenericImport<JReconnectingListenerClass, JReconnectingListener>) end;

  JCloseCommBoxListenerClass = interface(IJavaClass)
    ['{C913BF31-28E6-4D84-805D-C3AB92256630}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CloseCommBoxListener')]
  JCloseCommBoxListener = interface(IJavaInstance)
    ['{03F9D3A6-CF03-477F-BD16-35AEDB40012F}']
    procedure onCloseCommBox(P1: JString; P2: Integer; P3: Integer); cdecl;
  end;
  TJCloseCommBoxListener = class(TJavaGenericImport<JCloseCommBoxListenerClass, JCloseCommBoxListener>) end;

  Jcommbox_CommBox_CommBoxHistoryCallbackAdapterClass = interface(JObjectClass)
    ['{BFF88782-2B4A-47F8-A1C5-C776D898D861}']
    {class} function init(P1: Jcommbox_CommBox; P2: JGetCommHistoryListener): Jcommbox_CommBox_CommBoxHistoryCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBox$CommBoxHistoryCallbackAdapter')]
  Jcommbox_CommBox_CommBoxHistoryCallbackAdapter = interface(JObject)
    ['{D5553C96-452A-459B-8AD1-A616A4C62D25}']
    procedure addHistory(P1: JString; P2: JString; P3: JString); cdecl;
    procedure onCommBoxHistory(P1: Int64; P2: JString; P3: Integer; P4: Int64); cdecl;
  end;
  TJcommbox_CommBox_CommBoxHistoryCallbackAdapter = class(TJavaGenericImport<Jcommbox_CommBox_CommBoxHistoryCallbackAdapterClass, Jcommbox_CommBox_CommBoxHistoryCallbackAdapter>) end;

  JCommBox_CommBoxSendDataCallbackAdapterClass = interface(JObjectClass)
    ['{1AD3320C-C839-4409-871B-AEFB8833D102}']
    {class} function init(P1: Jcommbox_CommBox; P2: JSendDataListener): JCommBox_CommBoxSendDataCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBox$CommBoxSendDataCallbackAdapter')]
  JCommBox_CommBoxSendDataCallbackAdapter = interface(JObject)
    ['{D3FA577E-48A0-46A2-BBED-1160D4169DB0}']
    procedure onCommBoxSendData(P1: Int64; P2: JString; P3: Integer; P4: Int64; P5: Int64); cdecl;
  end;
  TJCommBox_CommBoxSendDataCallbackAdapter = class(TJavaGenericImport<JCommBox_CommBoxSendDataCallbackAdapterClass, JCommBox_CommBoxSendDataCallbackAdapter>) end;

  JCommBoxManager_CloseCommBoxCallbackAdapterClass = interface(JObjectClass)
    ['{FC42E837-8896-49D8-9EF5-2599D993E307}']
    {class} function init(P1: JCommBoxManager; P2: JCloseCommBoxListener; P3: JCommBoxManager_CommBoxAccessor): JCommBoxManager_CloseCommBoxCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBoxManager$CloseCommBoxCallbackAdapter')]
  JCommBoxManager_CloseCommBoxCallbackAdapter = interface(JObject)
    ['{E0D4483E-D7BC-4703-96A7-3DD1784D5CD9}']
    procedure nativeOnCloseCommBox(P1: Int64; P2: Int64; P3: JString; P4: Integer; P5: Int64); cdecl;
  end;
  TJCommBoxManager_CloseCommBoxCallbackAdapter = class(TJavaGenericImport<JCommBoxManager_CloseCommBoxCallbackAdapterClass, JCommBoxManager_CloseCommBoxCallbackAdapter>) end;

  JCommBoxManager_OpenCommBoxCallbackAdapterClass = interface(JObjectClass)
    ['{E1A46E50-35DE-4E1E-824D-C1F68586CED6}']
    {class} function init(P1: JCommBoxManager; P2: JOpenCommBoxListener): JCommBoxManager_OpenCommBoxCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBoxManager$OpenCommBoxCallbackAdapter')]
  JCommBoxManager_OpenCommBoxCallbackAdapter = interface(JObject)
    ['{9B3F4AB6-7C80-4E4E-AD4F-567041453DD2}']
    procedure nativeOnOpenCommBox(P1: Int64; P2: Int64; P3: JString; P4: Integer; P5: Int64); cdecl;
  end;
  TJCommBoxManager_OpenCommBoxCallbackAdapter = class(TJavaGenericImport<JCommBoxManager_OpenCommBoxCallbackAdapterClass, JCommBoxManager_OpenCommBoxCallbackAdapter>) end;

  JGetCommHistoryListenerClass = interface(IJavaClass)
    ['{BD4EE86A-97C6-4716-B49F-2DBF2AC1C113}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/GetCommHistoryListener')]
  JGetCommHistoryListener = interface(IJavaInstance)
    ['{343083ED-68FB-4CA8-8F6F-18CDA5F9B87F}']
    procedure onGetCommHistory(P1: JString; P2: Integer; P3: JArrayList; P4: Integer); cdecl;
  end;
  TJGetCommHistoryListener = class(TJavaGenericImport<JGetCommHistoryListenerClass, JGetCommHistoryListener>) end;

  JNativeCommBox_NativeCommBoxHistoryCallbackAdapterClass = interface(IJavaClass)
    ['{62569E87-E96D-4593-98A1-05F15C85501A}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBox$NativeCommBoxHistoryCallbackAdapter')]
  JNativeCommBox_NativeCommBoxHistoryCallbackAdapter = interface(IJavaInstance)
    ['{6815AE5D-8832-4251-804A-BB325EF7A29A}']
    procedure addHistory(P1: JString; P2: JString; P3: JString); cdecl;
    procedure onCommBoxHistory(P1: Int64; P2: JString; P3: Integer; P4: Int64); cdecl;
  end;
  TJNativeCommBox_NativeCommBoxHistoryCallbackAdapter = class(TJavaGenericImport<JNativeCommBox_NativeCommBoxHistoryCallbackAdapterClass, JNativeCommBox_NativeCommBoxHistoryCallbackAdapter>) end;

  JNativeCommBox_NativeCommBoxSendDataCallbackAdapterClass = interface(IJavaClass)
    ['{02025C95-56CD-442C-9A01-CBFBF40BF3B9}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBox$NativeCommBoxSendDataCallbackAdapter')]
  JNativeCommBox_NativeCommBoxSendDataCallbackAdapter = interface(IJavaInstance)
    ['{FE9B19A4-BAAA-4B74-9229-AE3F6E783C56}']
    procedure onCommBoxSendData(P1: Int64; P2: JString; P3: Integer; P4: Int64; P5: Int64); cdecl;
  end;
  TJNativeCommBox_NativeCommBoxSendDataCallbackAdapter = class(TJavaGenericImport<JNativeCommBox_NativeCommBoxSendDataCallbackAdapterClass, JNativeCommBox_NativeCommBoxSendDataCallbackAdapter>) end;

  JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapterClass = interface(IJavaClass)
    ['{146D829C-6224-4CDE-8FE0-4C9DF3428381}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBoxManager$NativeCloseCommBoxCallbackAdapter')]
  JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter = interface(IJavaInstance)
    ['{2B6DB55D-0D2C-4790-940D-BF54EF60AA42}']
    procedure nativeOnCloseCommBox(P1: Int64; P2: Int64; P3: JString; P4: Integer; P5: Int64); cdecl;
  end;
  TJNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter = class(TJavaGenericImport<JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapterClass, JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter>) end;

  JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapterClass = interface(IJavaClass)
    ['{375E9E2A-7E4D-482D-AECC-42D138B25CE5}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBoxManager$NativeOpenCommBoxCallbackAdapter')]
  JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter = interface(IJavaInstance)
    ['{EBDB87B9-A413-497A-99F2-F7571F39CDA8}']
    procedure nativeOnOpenCommBox(P1: Int64; P2: Int64; P3: JString; P4: Integer; P5: Int64); cdecl;
  end;
  TJNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter = class(TJavaGenericImport<JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapterClass, JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter>) end;

  JOpenCommBoxListenerClass = interface(IJavaClass)
    ['{C91A1F14-AEAB-49AD-B3E6-6BBCF32F30AC}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/OpenCommBoxListener')]
  JOpenCommBoxListener = interface(IJavaInstance)
    ['{5C5BB1D5-709E-47E4-8C6F-4660FC79506A}']
    procedure onOpenCommBox(P1: JString; P2: Jcommbox_CommBox; P3: Integer; P4: Integer); cdecl;
  end;
  TJOpenCommBoxListener = class(TJavaGenericImport<JOpenCommBoxListenerClass, JOpenCommBoxListener>) end;

  Jcommbox_ReceiveListenerClass = interface(IJavaClass)
    ['{F03CFDFB-E39A-46B7-9A06-8CC5A2A3FC62}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/ReceiveListener')]
  Jcommbox_ReceiveListener = interface(IJavaInstance)
    ['{1B27EFE9-C8FC-45FF-939C-5E8EA4A854E8}']
    procedure onCommBoxReceive(P1: JString; P2: JString; P3: JString; P4: JString); cdecl;
  end;
  TJcommbox_ReceiveListener = class(TJavaGenericImport<Jcommbox_ReceiveListenerClass, Jcommbox_ReceiveListener>) end;

  JSendDataListenerClass = interface(IJavaClass)
    ['{573F021C-25CD-4927-87E6-7D6C7E3E0FF2}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/SendDataListener')]
  JSendDataListener = interface(IJavaInstance)
    ['{0CCD8168-8FA5-4131-95C0-09D6977DC489}']
    procedure onCommBoxSendData(P1: JString; P2: Integer; P3: Integer; P4: Integer); cdecl;
  end;
  TJSendDataListener = class(TJavaGenericImport<JSendDataListenerClass, JSendDataListener>) end;

  Jdisplay_ReceiveListenerClass = interface(IJavaClass)
    ['{4D43B273-5CD4-4EC1-B6A0-199D6C144CC4}']
  end;

  [JavaSignature('com/epson/eposdevice/display/ReceiveListener')]
  Jdisplay_ReceiveListener = interface(IJavaInstance)
    ['{4FA2CD8E-0036-4742-B4CE-77535FEAC295}']
    procedure onDspReceive(P1: JString; P2: JString; P3: Integer; P4: Integer); cdecl;
  end;
  TJdisplay_ReceiveListener = class(TJavaGenericImport<Jdisplay_ReceiveListenerClass, Jdisplay_ReceiveListener>) end;

  Jkeyboard_KeyPressListenerClass = interface(IJavaClass)
    ['{42A114F3-41C8-466D-95EF-03DE69C0F5A2}']
  end;

  [JavaSignature('com/epson/eposdevice/keyboard/KeyPressListener')]
  Jkeyboard_KeyPressListener = interface(IJavaInstance)
    ['{3F17DCB7-7B54-4779-A796-F32B70D89620}']
    procedure onKbdKeyPress(P1: JString; P2: JString; P3: Integer; P4: JString); cdecl;
  end;
  TJkeyboard_KeyPressListener = class(TJavaGenericImport<Jkeyboard_KeyPressListenerClass, Jkeyboard_KeyPressListener>) end;

  JStringListenerClass = interface(IJavaClass)
    ['{595CA951-7AA1-4885-81AF-CB66CF8557E7}']
  end;

  [JavaSignature('com/epson/eposdevice/keyboard/StringListener')]
  JStringListener = interface(IJavaInstance)
    ['{B0F19790-CF67-4C96-9528-86926017A3C4}']
    procedure onKbdString(P1: JString; P2: JString; P3: JString; P4: Integer); cdecl;
  end;
  TJStringListener = class(TJavaGenericImport<JStringListenerClass, JStringListener>) end;

  JBatteryLowListenerClass = interface(JEventListenerClass)
    ['{C4259FA3-DEB9-49F5-90BE-7759E8BF9DD2}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/BatteryLowListener')]
  JBatteryLowListener = interface(JEventListener)
    ['{F2D93B6D-26A7-446D-9679-D2D72B7CEC7E}']
    procedure onPtrBatteryLow(P1: JString; P2: JString); cdecl;
  end;
  TJBatteryLowListener = class(TJavaGenericImport<JBatteryLowListenerClass, JBatteryLowListener>) end;

  JBatteryOkListenerClass = interface(JEventListenerClass)
    ['{B9A34A7B-D7C7-4AAB-A962-47AA2DF766D7}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/BatteryOkListener')]
  JBatteryOkListener = interface(JEventListener)
    ['{0ECB748C-FBD4-4634-A757-F0342ED9ADC3}']
    procedure onPtrBatteryOk(P1: JString; P2: JString); cdecl;
  end;
  TJBatteryOkListener = class(TJavaGenericImport<JBatteryOkListenerClass, JBatteryOkListener>) end;

  JBatteryStatusChangeListenerClass = interface(JEventListenerClass)
    ['{AB649C24-01F5-496E-984B-85CF768BDCEA}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/BatteryStatusChangeListener')]
  JBatteryStatusChangeListener = interface(JEventListener)
    ['{2049FDFD-470A-4070-814A-D35A28F5CC61}']
    procedure onPtrBatteryStatusChange(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJBatteryStatusChangeListener = class(TJavaGenericImport<JBatteryStatusChangeListenerClass, JBatteryStatusChangeListener>) end;

  JCoverOkListenerClass = interface(JEventListenerClass)
    ['{91D611EE-ADBC-409C-BA1D-78700C6747E0}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/CoverOkListener')]
  JCoverOkListener = interface(JEventListener)
    ['{34D2A692-487B-44D4-B333-0E8B11EF9AC8}']
    procedure onPtrCoverOk(P1: JString; P2: JString); cdecl;
  end;
  TJCoverOkListener = class(TJavaGenericImport<JCoverOkListenerClass, JCoverOkListener>) end;

  JCoverOpenListenerClass = interface(JEventListenerClass)
    ['{755C0F6E-53B7-4AF7-BA52-3274BD2F28D2}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/CoverOpenListener')]
  JCoverOpenListener = interface(JEventListener)
    ['{6FDCA7F8-214A-4E96-9506-35286B6D59C8}']
    procedure onPtrCoverOpen(P1: JString; P2: JString); cdecl;
  end;
  TJCoverOpenListener = class(TJavaGenericImport<JCoverOpenListenerClass, JCoverOpenListener>) end;

  JDrawerClosedListenerClass = interface(JEventListenerClass)
    ['{70E23E46-06D6-4F1E-9399-66D8ED08A56B}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/DrawerClosedListener')]
  JDrawerClosedListener = interface(JEventListener)
    ['{DF391F34-CDA5-4DA6-9905-92950FD1A846}']
    procedure onPtrDrawerClosed(P1: JString; P2: JString); cdecl;
  end;
  TJDrawerClosedListener = class(TJavaGenericImport<JDrawerClosedListenerClass, JDrawerClosedListener>) end;

  JDrawerOpenListenerClass = interface(JEventListenerClass)
    ['{132168A5-B276-4A5C-8B85-ACCB0164A958}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/DrawerOpenListener')]
  JDrawerOpenListener = interface(JEventListener)
    ['{73C4E391-CCC5-4AA8-9DBA-5B03945F460C}']
    procedure onPtrDrawerOpen(P1: JString; P2: JString); cdecl;
  end;
  TJDrawerOpenListener = class(TJavaGenericImport<JDrawerOpenListenerClass, JDrawerOpenListener>) end;

  Jeposdevice_printer_ReceiveListenerClass = interface(JEventListenerClass)
    ['{5A4D2F4C-B111-41C9-B1CB-FC03128D2890}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/ReceiveListener')]
  Jeposdevice_printer_ReceiveListener = interface(JEventListener)
    ['{2183D596-4CF7-46ED-A52D-0D8BDFAB548E}']
    procedure onPtrReceive(P1: JString; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
  end;
  TJeposdevice_printer_ReceiveListener = class(TJavaGenericImport<Jeposdevice_printer_ReceiveListenerClass, Jeposdevice_printer_ReceiveListener>) end;

  JJobReceiveListenerClass = interface(Jeposdevice_printer_ReceiveListenerClass)
    ['{D033DBA0-7A4D-4FFA-983D-45C717317A78}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/JobReceiveListener')]
  JJobReceiveListener = interface(Jeposdevice_printer_ReceiveListener)
    ['{5DCCBE25-78B6-4893-BC02-73ABF948623F}']
    procedure onPtrReceive(P1: JString; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: JString); cdecl;
  end;
  TJJobReceiveListener = class(TJavaGenericImport<JJobReceiveListenerClass, JJobReceiveListener>) end;

  JOfflineListenerClass = interface(JEventListenerClass)
    ['{12E2359D-01E4-445F-B718-147B0F3A4205}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/OfflineListener')]
  JOfflineListener = interface(JEventListener)
    ['{EB2A1B69-6299-448A-ABF8-074710549646}']
    procedure onPtrOffline(P1: JString; P2: JString); cdecl;
  end;
  TJOfflineListener = class(TJavaGenericImport<JOfflineListenerClass, JOfflineListener>) end;

  JOnlineListenerClass = interface(JEventListenerClass)
    ['{56E2B1D6-ECE7-43F7-A7E4-A66E411E4CDB}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/OnlineListener')]
  JOnlineListener = interface(JEventListener)
    ['{C6F25F2F-1079-49BC-9101-692B86EFCE03}']
    procedure onPtrOnline(P1: JString; P2: JString); cdecl;
  end;
  TJOnlineListener = class(TJavaGenericImport<JOnlineListenerClass, JOnlineListener>) end;

  JPaperEndListenerClass = interface(JEventListenerClass)
    ['{F5936791-7DB4-42AA-9548-18DDC745B73F}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/PaperEndListener')]
  JPaperEndListener = interface(JEventListener)
    ['{26BCC0AF-5CF6-4809-9BEE-2E67E901E32E}']
    procedure onPtrPaperEnd(P1: JString; P2: JString); cdecl;
  end;
  TJPaperEndListener = class(TJavaGenericImport<JPaperEndListenerClass, JPaperEndListener>) end;

  JPaperNearEndListenerClass = interface(JEventListenerClass)
    ['{29422C4C-9E0F-46EF-A49B-7790A9D3FA6A}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/PaperNearEndListener')]
  JPaperNearEndListener = interface(JEventListener)
    ['{ED50EA84-C344-4FF0-8038-CB8AB0CAA7B8}']
    procedure onPtrPaperNearEnd(P1: JString; P2: JString); cdecl;
  end;
  TJPaperNearEndListener = class(TJavaGenericImport<JPaperNearEndListenerClass, JPaperNearEndListener>) end;

  JPaperOkListenerClass = interface(JEventListenerClass)
    ['{446EE650-0F34-4126-8062-5DE253DA68D6}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/PaperOkListener')]
  JPaperOkListener = interface(JEventListener)
    ['{DC5FE9EF-E8D3-45A7-8611-B729F1445960}']
    procedure onPtrPaperOk(P1: JString; P2: JString); cdecl;
  end;
  TJPaperOkListener = class(TJavaGenericImport<JPaperOkListenerClass, JPaperOkListener>) end;

  JPowerOffListenerClass = interface(JEventListenerClass)
    ['{EF3D2474-8898-4149-859A-DAD3EE23F1DD}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/PowerOffListener')]
  JPowerOffListener = interface(JEventListener)
    ['{8C07006A-656E-46C3-A2A3-F70B1987887A}']
    procedure onPtrPowerOff(P1: JString; P2: JString); cdecl;
  end;
  TJPowerOffListener = class(TJavaGenericImport<JPowerOffListenerClass, JPowerOffListener>) end;

  Jprinter_StatusChangeListenerClass = interface(JEventListenerClass)
    ['{6A127A2C-9A06-40BA-AD6F-3812E64713D4}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/StatusChangeListener')]
  Jprinter_StatusChangeListener = interface(JEventListener)
    ['{E5E14A98-8052-4E1C-90C2-636956FB97AF}']
    procedure onPtrStatusChange(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJprinter_StatusChangeListener = class(TJavaGenericImport<Jprinter_StatusChangeListenerClass, Jprinter_StatusChangeListener>) end;

  JDataListenerClass = interface(IJavaClass)
    ['{5B553EB5-0D55-4D61-A4D9-4DC6208B651E}']
  end;

  [JavaSignature('com/epson/eposdevice/scanner/DataListener')]
  JDataListener = interface(IJavaInstance)
    ['{A2611FBE-B9DE-4874-B801-4BC3DE5D2F90}']
    procedure onScanData(P1: JString; P2: JString; P3: JString); cdecl;
  end;
  TJDataListener = class(TJavaGenericImport<JDataListenerClass, JDataListener>) end;

  JCommandReplayListenerClass = interface(IJavaClass)
    ['{5A26309D-6DEE-4821-A68D-447F55FFDDA7}']
  end;

  [JavaSignature('com/epson/eposdevice/simpleserial/CommandReplayListener')]
  JCommandReplayListener = interface(IJavaInstance)
    ['{1DDE7680-BA7D-4C0B-8DCF-1CF49F1681CF}']
    procedure onSimpleSerialCommandReplay(P1: JString; P2: JString; P3: TJavaArray<Byte>); cdecl;
  end;
  TJCommandReplayListener = class(TJavaGenericImport<JCommandReplayListenerClass, JCommandReplayListener>) end;

  JBatteryLowEventListenerClass = interface(JEventListenerClass)
    ['{F5E4BDA7-5D02-402C-A696-F66DD27D22FE}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryLowEventListener')]
  JBatteryLowEventListener = interface(JEventListener)
    ['{26ECEA91-4BD2-48C8-B0A4-AF8406D2DAF4}']
    procedure onBatteryLowEvent(P1: JString); cdecl;
  end;
  TJBatteryLowEventListener = class(TJavaGenericImport<JBatteryLowEventListenerClass, JBatteryLowEventListener>) end;

  JBatteryOkEventListenerClass = interface(JEventListenerClass)
    ['{1A8A34CA-3DF2-4FFA-B3F4-BA541C3FD660}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryOkEventListener')]
  JBatteryOkEventListener = interface(JEventListener)
    ['{AA300DF5-4786-4968-B047-47EBDF0AD442}']
    procedure onBatteryOkEvent(P1: JString); cdecl;
  end;
  TJBatteryOkEventListener = class(TJavaGenericImport<JBatteryOkEventListenerClass, JBatteryOkEventListener>) end;

  JBatteryStatusChangeEventListenerClass = interface(JEventListenerClass)
    ['{1C736A7B-532D-4FE2-80AF-EC6BD2E73E2F}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryStatusChangeEventListener')]
  JBatteryStatusChangeEventListener = interface(JEventListener)
    ['{C6303519-56BF-4893-873E-641090DBC047}']
    procedure onBatteryStatusChangeEvent(P1: JString; P2: Integer); cdecl;
  end;
  TJBatteryStatusChangeEventListener = class(TJavaGenericImport<JBatteryStatusChangeEventListenerClass, JBatteryStatusChangeEventListener>) end;

  JBuilderClass = interface(JObjectClass)
    ['{5ECA974E-D294-435D-92D7-69A76BED5104}']
    {class} function _GetALIGN_CENTER: Integer;
    {class} function _GetALIGN_LEFT: Integer;
    {class} function _GetALIGN_RIGHT: Integer;
    {class} function _GetBARCODE_CODABAR: Integer;
    {class} function _GetBARCODE_CODE128: Integer;
    {class} function _GetBARCODE_CODE39: Integer;
    {class} function _GetBARCODE_CODE93: Integer;
    {class} function _GetBARCODE_EAN13: Integer;
    {class} function _GetBARCODE_EAN8: Integer;
    {class} function _GetBARCODE_GS1_128: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_EXPANDED: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_LIMITED: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_OMNIDIRECTIONAL: Integer;
    {class} function _GetBARCODE_GS1_DATABAR_TRUNCATED: Integer;
    {class} function _GetBARCODE_ITF: Integer;
    {class} function _GetBARCODE_JAN13: Integer;
    {class} function _GetBARCODE_JAN8: Integer;
    {class} function _GetBARCODE_UPC_A: Integer;
    {class} function _GetBARCODE_UPC_E: Integer;
    {class} function _GetCOLOR_1: Integer;
    {class} function _GetCOLOR_2: Integer;
    {class} function _GetCOLOR_3: Integer;
    {class} function _GetCOLOR_4: Integer;
    {class} function _GetCOLOR_NONE: Integer;
    {class} function _GetCOMPRESS_DEFLATE: Integer;
    {class} function _GetCOMPRESS_NONE: Integer;
    {class} function _GetCUT_FEED: Integer;
    {class} function _GetCUT_NO_FEED: Integer;
    {class} function _GetCUT_RESERVE: Integer;
    {class} function _GetDIRECTION_BOTTOM_TO_TOP: Integer;
    {class} function _GetDIRECTION_LEFT_TO_RIGHT: Integer;
    {class} function _GetDIRECTION_RIGHT_TO_LEFT: Integer;
    {class} function _GetDIRECTION_TOP_TO_BOTTOM: Integer;
    {class} function _GetDRAWER_1: Integer;
    {class} function _GetDRAWER_2: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetFEED_CURRENT_TOF: Integer;
    {class} function _GetFEED_CUTTING: Integer;
    {class} function _GetFEED_NEXT_TOF: Integer;
    {class} function _GetFEED_PEELING: Integer;
    {class} function _GetFONT_A: Integer;
    {class} function _GetFONT_B: Integer;
    {class} function _GetFONT_C: Integer;
    {class} function _GetFONT_D: Integer;
    {class} function _GetFONT_E: Integer;
    {class} function _GetHALFTONE_DITHER: Integer;
    {class} function _GetHALFTONE_ERROR_DIFFUSION: Integer;
    {class} function _GetHALFTONE_THRESHOLD: Integer;
    {class} function _GetHRI_ABOVE: Integer;
    {class} function _GetHRI_BELOW: Integer;
    {class} function _GetHRI_BOTH: Integer;
    {class} function _GetHRI_NONE: Integer;
    {class} function _GetLANG_EN: Integer;
    {class} function _GetLANG_JA: Integer;
    {class} function _GetLANG_KO: Integer;
    {class} function _GetLANG_TH: Integer;
    {class} function _GetLANG_VI: Integer;
    {class} function _GetLANG_ZH_CN: Integer;
    {class} function _GetLANG_ZH_TW: Integer;
    {class} function _GetLAYOUT_LABEL: Integer;
    {class} function _GetLAYOUT_LABEL_BM: Integer;
    {class} function _GetLAYOUT_RECEIPT: Integer;
    {class} function _GetLAYOUT_RECEIPT_BM: Integer;
    {class} function _GetLEVEL_0: Integer;
    {class} function _GetLEVEL_1: Integer;
    {class} function _GetLEVEL_2: Integer;
    {class} function _GetLEVEL_3: Integer;
    {class} function _GetLEVEL_4: Integer;
    {class} function _GetLEVEL_5: Integer;
    {class} function _GetLEVEL_6: Integer;
    {class} function _GetLEVEL_7: Integer;
    {class} function _GetLEVEL_8: Integer;
    {class} function _GetLEVEL_DEFAULT: Integer;
    {class} function _GetLEVEL_H: Integer;
    {class} function _GetLEVEL_L: Integer;
    {class} function _GetLEVEL_M: Integer;
    {class} function _GetLEVEL_Q: Integer;
    {class} function _GetLINE_MEDIUM: Integer;
    {class} function _GetLINE_MEDIUM_DOUBLE: Integer;
    {class} function _GetLINE_THICK: Integer;
    {class} function _GetLINE_THICK_DOUBLE: Integer;
    {class} function _GetLINE_THIN: Integer;
    {class} function _GetLINE_THIN_DOUBLE: Integer;
    {class} function _GetMODEL_ANK: Integer;
    {class} function _GetMODEL_CHINESE: Integer;
    {class} function _GetMODEL_JAPANESE: Integer;
    {class} function _GetMODEL_KOREAN: Integer;
    {class} function _GetMODEL_SOUTHASIA: Integer;
    {class} function _GetMODEL_TAIWAN: Integer;
    {class} function _GetMODEL_THAI: Integer;
    {class} function _GetMODE_GRAY16: Integer;
    {class} function _GetMODE_MONO: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetPARAM_UNSPECIFIED: Integer;
    {class} function _GetPATTERN_1: Integer;
    {class} function _GetPATTERN_10: Integer;
    {class} function _GetPATTERN_2: Integer;
    {class} function _GetPATTERN_3: Integer;
    {class} function _GetPATTERN_4: Integer;
    {class} function _GetPATTERN_5: Integer;
    {class} function _GetPATTERN_6: Integer;
    {class} function _GetPATTERN_7: Integer;
    {class} function _GetPATTERN_8: Integer;
    {class} function _GetPATTERN_9: Integer;
    {class} function _GetPATTERN_A: Integer;
    {class} function _GetPATTERN_B: Integer;
    {class} function _GetPATTERN_C: Integer;
    {class} function _GetPATTERN_D: Integer;
    {class} function _GetPATTERN_E: Integer;
    {class} function _GetPATTERN_ERROR: Integer;
    {class} function _GetPATTERN_PAPER_END: Integer;
    {class} function _GetPULSE_100: Integer;
    {class} function _GetPULSE_200: Integer;
    {class} function _GetPULSE_300: Integer;
    {class} function _GetPULSE_400: Integer;
    {class} function _GetPULSE_500: Integer;
    {class} function _GetSYMBOL_AZTECCODE_COMPACT: Integer;
    {class} function _GetSYMBOL_AZTECCODE_FULLRANGE: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_12: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_16: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_RECTANGLE_8: Integer;
    {class} function _GetSYMBOL_DATAMATRIX_SQUARE: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_EXPANDED_STACKED: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_STACKED: Integer;
    {class} function _GetSYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_2: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_3: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_4: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_5: Integer;
    {class} function _GetSYMBOL_MAXICODE_MODE_6: Integer;
    {class} function _GetSYMBOL_PDF417_STANDARD: Integer;
    {class} function _GetSYMBOL_PDF417_TRUNCATED: Integer;
    {class} function _GetSYMBOL_QRCODE_MODEL_1: Integer;
    {class} function _GetSYMBOL_QRCODE_MODEL_2: Integer;
    {class} function _GetTRUE: Integer;
    {class} function init(P1: JString; P2: Integer): JBuilder; cdecl; overload;
    {class} function init(P1: JString; P2: Integer; P3: JContext): JBuilder; cdecl; overload;
    {class} property ALIGN_CENTER: Integer read _GetALIGN_CENTER;
    {class} property ALIGN_LEFT: Integer read _GetALIGN_LEFT;
    {class} property ALIGN_RIGHT: Integer read _GetALIGN_RIGHT;
    {class} property BARCODE_CODABAR: Integer read _GetBARCODE_CODABAR;
    {class} property BARCODE_CODE128: Integer read _GetBARCODE_CODE128;
    {class} property BARCODE_CODE39: Integer read _GetBARCODE_CODE39;
    {class} property BARCODE_CODE93: Integer read _GetBARCODE_CODE93;
    {class} property BARCODE_EAN13: Integer read _GetBARCODE_EAN13;
    {class} property BARCODE_EAN8: Integer read _GetBARCODE_EAN8;
    {class} property BARCODE_GS1_128: Integer read _GetBARCODE_GS1_128;
    {class} property BARCODE_GS1_DATABAR_EXPANDED: Integer read _GetBARCODE_GS1_DATABAR_EXPANDED;
    {class} property BARCODE_GS1_DATABAR_LIMITED: Integer read _GetBARCODE_GS1_DATABAR_LIMITED;
    {class} property BARCODE_GS1_DATABAR_OMNIDIRECTIONAL: Integer read _GetBARCODE_GS1_DATABAR_OMNIDIRECTIONAL;
    {class} property BARCODE_GS1_DATABAR_TRUNCATED: Integer read _GetBARCODE_GS1_DATABAR_TRUNCATED;
    {class} property BARCODE_ITF: Integer read _GetBARCODE_ITF;
    {class} property BARCODE_JAN13: Integer read _GetBARCODE_JAN13;
    {class} property BARCODE_JAN8: Integer read _GetBARCODE_JAN8;
    {class} property BARCODE_UPC_A: Integer read _GetBARCODE_UPC_A;
    {class} property BARCODE_UPC_E: Integer read _GetBARCODE_UPC_E;
    {class} property COLOR_1: Integer read _GetCOLOR_1;
    {class} property COLOR_2: Integer read _GetCOLOR_2;
    {class} property COLOR_3: Integer read _GetCOLOR_3;
    {class} property COLOR_4: Integer read _GetCOLOR_4;
    {class} property COLOR_NONE: Integer read _GetCOLOR_NONE;
    {class} property COMPRESS_DEFLATE: Integer read _GetCOMPRESS_DEFLATE;
    {class} property COMPRESS_NONE: Integer read _GetCOMPRESS_NONE;
    {class} property CUT_FEED: Integer read _GetCUT_FEED;
    {class} property CUT_NO_FEED: Integer read _GetCUT_NO_FEED;
    {class} property CUT_RESERVE: Integer read _GetCUT_RESERVE;
    {class} property DIRECTION_BOTTOM_TO_TOP: Integer read _GetDIRECTION_BOTTOM_TO_TOP;
    {class} property DIRECTION_LEFT_TO_RIGHT: Integer read _GetDIRECTION_LEFT_TO_RIGHT;
    {class} property DIRECTION_RIGHT_TO_LEFT: Integer read _GetDIRECTION_RIGHT_TO_LEFT;
    {class} property DIRECTION_TOP_TO_BOTTOM: Integer read _GetDIRECTION_TOP_TO_BOTTOM;
    {class} property DRAWER_1: Integer read _GetDRAWER_1;
    {class} property DRAWER_2: Integer read _GetDRAWER_2;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property FEED_CURRENT_TOF: Integer read _GetFEED_CURRENT_TOF;
    {class} property FEED_CUTTING: Integer read _GetFEED_CUTTING;
    {class} property FEED_NEXT_TOF: Integer read _GetFEED_NEXT_TOF;
    {class} property FEED_PEELING: Integer read _GetFEED_PEELING;
    {class} property FONT_A: Integer read _GetFONT_A;
    {class} property FONT_B: Integer read _GetFONT_B;
    {class} property FONT_C: Integer read _GetFONT_C;
    {class} property FONT_D: Integer read _GetFONT_D;
    {class} property FONT_E: Integer read _GetFONT_E;
    {class} property HALFTONE_DITHER: Integer read _GetHALFTONE_DITHER;
    {class} property HALFTONE_ERROR_DIFFUSION: Integer read _GetHALFTONE_ERROR_DIFFUSION;
    {class} property HALFTONE_THRESHOLD: Integer read _GetHALFTONE_THRESHOLD;
    {class} property HRI_ABOVE: Integer read _GetHRI_ABOVE;
    {class} property HRI_BELOW: Integer read _GetHRI_BELOW;
    {class} property HRI_BOTH: Integer read _GetHRI_BOTH;
    {class} property HRI_NONE: Integer read _GetHRI_NONE;
    {class} property LANG_EN: Integer read _GetLANG_EN;
    {class} property LANG_JA: Integer read _GetLANG_JA;
    {class} property LANG_KO: Integer read _GetLANG_KO;
    {class} property LANG_TH: Integer read _GetLANG_TH;
    {class} property LANG_VI: Integer read _GetLANG_VI;
    {class} property LANG_ZH_CN: Integer read _GetLANG_ZH_CN;
    {class} property LANG_ZH_TW: Integer read _GetLANG_ZH_TW;
    {class} property LAYOUT_LABEL: Integer read _GetLAYOUT_LABEL;
    {class} property LAYOUT_LABEL_BM: Integer read _GetLAYOUT_LABEL_BM;
    {class} property LAYOUT_RECEIPT: Integer read _GetLAYOUT_RECEIPT;
    {class} property LAYOUT_RECEIPT_BM: Integer read _GetLAYOUT_RECEIPT_BM;
    {class} property LEVEL_0: Integer read _GetLEVEL_0;
    {class} property LEVEL_1: Integer read _GetLEVEL_1;
    {class} property LEVEL_2: Integer read _GetLEVEL_2;
    {class} property LEVEL_3: Integer read _GetLEVEL_3;
    {class} property LEVEL_4: Integer read _GetLEVEL_4;
    {class} property LEVEL_5: Integer read _GetLEVEL_5;
    {class} property LEVEL_6: Integer read _GetLEVEL_6;
    {class} property LEVEL_7: Integer read _GetLEVEL_7;
    {class} property LEVEL_8: Integer read _GetLEVEL_8;
    {class} property LEVEL_DEFAULT: Integer read _GetLEVEL_DEFAULT;
    {class} property LEVEL_H: Integer read _GetLEVEL_H;
    {class} property LEVEL_L: Integer read _GetLEVEL_L;
    {class} property LEVEL_M: Integer read _GetLEVEL_M;
    {class} property LEVEL_Q: Integer read _GetLEVEL_Q;
    {class} property LINE_MEDIUM: Integer read _GetLINE_MEDIUM;
    {class} property LINE_MEDIUM_DOUBLE: Integer read _GetLINE_MEDIUM_DOUBLE;
    {class} property LINE_THICK: Integer read _GetLINE_THICK;
    {class} property LINE_THICK_DOUBLE: Integer read _GetLINE_THICK_DOUBLE;
    {class} property LINE_THIN: Integer read _GetLINE_THIN;
    {class} property LINE_THIN_DOUBLE: Integer read _GetLINE_THIN_DOUBLE;
    {class} property MODEL_ANK: Integer read _GetMODEL_ANK;
    {class} property MODEL_CHINESE: Integer read _GetMODEL_CHINESE;
    {class} property MODEL_JAPANESE: Integer read _GetMODEL_JAPANESE;
    {class} property MODEL_KOREAN: Integer read _GetMODEL_KOREAN;
    {class} property MODEL_SOUTHASIA: Integer read _GetMODEL_SOUTHASIA;
    {class} property MODEL_TAIWAN: Integer read _GetMODEL_TAIWAN;
    {class} property MODEL_THAI: Integer read _GetMODEL_THAI;
    {class} property MODE_GRAY16: Integer read _GetMODE_GRAY16;
    {class} property MODE_MONO: Integer read _GetMODE_MONO;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property PARAM_UNSPECIFIED: Integer read _GetPARAM_UNSPECIFIED;
    {class} property PATTERN_1: Integer read _GetPATTERN_1;
    {class} property PATTERN_10: Integer read _GetPATTERN_10;
    {class} property PATTERN_2: Integer read _GetPATTERN_2;
    {class} property PATTERN_3: Integer read _GetPATTERN_3;
    {class} property PATTERN_4: Integer read _GetPATTERN_4;
    {class} property PATTERN_5: Integer read _GetPATTERN_5;
    {class} property PATTERN_6: Integer read _GetPATTERN_6;
    {class} property PATTERN_7: Integer read _GetPATTERN_7;
    {class} property PATTERN_8: Integer read _GetPATTERN_8;
    {class} property PATTERN_9: Integer read _GetPATTERN_9;
    {class} property PATTERN_A: Integer read _GetPATTERN_A;
    {class} property PATTERN_B: Integer read _GetPATTERN_B;
    {class} property PATTERN_C: Integer read _GetPATTERN_C;
    {class} property PATTERN_D: Integer read _GetPATTERN_D;
    {class} property PATTERN_E: Integer read _GetPATTERN_E;
    {class} property PATTERN_ERROR: Integer read _GetPATTERN_ERROR;
    {class} property PATTERN_PAPER_END: Integer read _GetPATTERN_PAPER_END;
    {class} property PULSE_100: Integer read _GetPULSE_100;
    {class} property PULSE_200: Integer read _GetPULSE_200;
    {class} property PULSE_300: Integer read _GetPULSE_300;
    {class} property PULSE_400: Integer read _GetPULSE_400;
    {class} property PULSE_500: Integer read _GetPULSE_500;
    {class} property SYMBOL_AZTECCODE_COMPACT: Integer read _GetSYMBOL_AZTECCODE_COMPACT;
    {class} property SYMBOL_AZTECCODE_FULLRANGE: Integer read _GetSYMBOL_AZTECCODE_FULLRANGE;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_12: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_12;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_16: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_16;
    {class} property SYMBOL_DATAMATRIX_RECTANGLE_8: Integer read _GetSYMBOL_DATAMATRIX_RECTANGLE_8;
    {class} property SYMBOL_DATAMATRIX_SQUARE: Integer read _GetSYMBOL_DATAMATRIX_SQUARE;
    {class} property SYMBOL_GS1_DATABAR_EXPANDED_STACKED: Integer read _GetSYMBOL_GS1_DATABAR_EXPANDED_STACKED;
    {class} property SYMBOL_GS1_DATABAR_STACKED: Integer read _GetSYMBOL_GS1_DATABAR_STACKED;
    {class} property SYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL: Integer read _GetSYMBOL_GS1_DATABAR_STACKED_OMNIDIRECTIONAL;
    {class} property SYMBOL_MAXICODE_MODE_2: Integer read _GetSYMBOL_MAXICODE_MODE_2;
    {class} property SYMBOL_MAXICODE_MODE_3: Integer read _GetSYMBOL_MAXICODE_MODE_3;
    {class} property SYMBOL_MAXICODE_MODE_4: Integer read _GetSYMBOL_MAXICODE_MODE_4;
    {class} property SYMBOL_MAXICODE_MODE_5: Integer read _GetSYMBOL_MAXICODE_MODE_5;
    {class} property SYMBOL_MAXICODE_MODE_6: Integer read _GetSYMBOL_MAXICODE_MODE_6;
    {class} property SYMBOL_PDF417_STANDARD: Integer read _GetSYMBOL_PDF417_STANDARD;
    {class} property SYMBOL_PDF417_TRUNCATED: Integer read _GetSYMBOL_PDF417_TRUNCATED;
    {class} property SYMBOL_QRCODE_MODEL_1: Integer read _GetSYMBOL_QRCODE_MODEL_1;
    {class} property SYMBOL_QRCODE_MODEL_2: Integer read _GetSYMBOL_QRCODE_MODEL_2;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/eposprint/Builder')]
  JBuilder = interface(JObject)
    ['{B3DD1568-A59B-4999-AC93-959BECD8DB24}']
    procedure addBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addCommand(P1: TJavaArray<Byte>); cdecl;
    procedure addCut(P1: Integer); cdecl;
    procedure addFeedLine(P1: Integer); cdecl;
    procedure addFeedPosition(P1: Integer); cdecl;
    procedure addFeedUnit(P1: Integer); cdecl;
    procedure addHLine(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure addImage(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl; overload;
    procedure addImage(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Double); cdecl; overload;
    procedure addImage(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Double; P10: Integer); cdecl; overload;
    procedure addLayout(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer); cdecl;
    procedure addLogo(P1: Integer; P2: Integer); cdecl;
    procedure addPageArea(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    procedure addPageBegin; cdecl;
    procedure addPageDirection(P1: Integer); cdecl;
    procedure addPageEnd; cdecl;
    procedure addPageLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure addPagePosition(P1: Integer; P2: Integer); cdecl;
    procedure addPageRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure addPulse(P1: Integer; P2: Integer); cdecl;
    procedure addSound(P1: Integer; P2: Integer); cdecl; overload;
    procedure addSound(P1: Integer; P2: Integer; P3: Integer); cdecl; overload;
    procedure addSymbol(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure addText(P1: JString); cdecl;
    procedure addTextAlign(P1: Integer); cdecl;
    procedure addTextDouble(P1: Integer; P2: Integer); cdecl;
    procedure addTextFont(P1: Integer); cdecl;
    procedure addTextLang(P1: Integer); cdecl;
    procedure addTextLineSpace(P1: Integer); cdecl;
    procedure addTextPosition(P1: Integer); cdecl;
    procedure addTextRotate(P1: Integer); cdecl;
    procedure addTextSize(P1: Integer; P2: Integer); cdecl;
    procedure addTextSmooth(P1: Integer); cdecl;
    procedure addTextStyle(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    procedure addVLineBegin(P1: Integer; P2: Integer); cdecl;
    procedure addVLineEnd(P1: Integer; P2: Integer); cdecl;
    procedure clearCommandBuffer; cdecl;
  end;
  TJBuilder = class(TJavaGenericImport<JBuilderClass, JBuilder>) end;

  JCoverOkEventListenerClass = interface(JEventListenerClass)
    ['{6D30C9F2-1F36-4E13-8756-5B4918CBCF37}']
  end;

  [JavaSignature('com/epson/eposprint/CoverOkEventListener')]
  JCoverOkEventListener = interface(JEventListener)
    ['{EF819AFE-7DD3-48AB-AEAC-1AEE45081B1E}']
    procedure onCoverOkEvent(P1: JString); cdecl;
  end;
  TJCoverOkEventListener = class(TJavaGenericImport<JCoverOkEventListenerClass, JCoverOkEventListener>) end;

  JCoverOpenEventListenerClass = interface(JEventListenerClass)
    ['{716E8341-F160-4016-856F-D3322F71266D}']
  end;

  [JavaSignature('com/epson/eposprint/CoverOpenEventListener')]
  JCoverOpenEventListener = interface(JEventListener)
    ['{BD1D251E-02F6-4FBC-A587-B1326072696C}']
    procedure onCoverOpenEvent(P1: JString); cdecl;
  end;
  TJCoverOpenEventListener = class(TJavaGenericImport<JCoverOpenEventListenerClass, JCoverOpenEventListener>) end;

  JDrawerClosedEventListenerClass = interface(JEventListenerClass)
    ['{E5C81E3A-B779-4D7E-A01B-F7CD8B3E16F9}']
  end;

  [JavaSignature('com/epson/eposprint/DrawerClosedEventListener')]
  JDrawerClosedEventListener = interface(JEventListener)
    ['{3B67E4EC-4DA6-45E8-964C-3566CD60CDA0}']
    procedure onDrawerClosedEvent(P1: JString); cdecl;
  end;
  TJDrawerClosedEventListener = class(TJavaGenericImport<JDrawerClosedEventListenerClass, JDrawerClosedEventListener>) end;

  JDrawerOpenEventListenerClass = interface(JEventListenerClass)
    ['{9522064C-D34F-4958-B216-9F71EF0D7DB0}']
  end;

  [JavaSignature('com/epson/eposprint/DrawerOpenEventListener')]
  JDrawerOpenEventListener = interface(JEventListener)
    ['{1EC688BC-F538-409B-9C36-C20252185832}']
    procedure onDrawerOpenEvent(P1: JString); cdecl;
  end;
  TJDrawerOpenEventListener = class(TJavaGenericImport<JDrawerOpenEventListenerClass, JDrawerOpenEventListener>) end;

  Jeposprint_EposExceptionClass = interface(JExceptionClass)
    ['{F5F3D301-7A85-47B3-9DA2-CB9DB93DF983}']
    {class} function _GetERR_CONNECT: Integer;
    {class} function _GetERR_FAILURE: Integer;
    {class} function _GetERR_ILLEGAL: Integer;
    {class} function _GetERR_MEMORY: Integer;
    {class} function _GetERR_OFF_LINE: Integer;
    {class} function _GetERR_OPEN: Integer;
    {class} function _GetERR_PARAM: Integer;
    {class} function _GetERR_PROCESSING: Integer;
    {class} function _GetERR_TIMEOUT: Integer;
    {class} function _GetERR_UNSUPPORTED: Integer;
    {class} function _GetSUCCESS: Integer;
    {class} function init(P1: Integer): Jeposprint_EposException; cdecl; overload;
    {class} function init(P1: JString; P2: JThrowable): Jeposprint_EposException; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer): Jeposprint_EposException; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer; P3: Integer): Jeposprint_EposException; cdecl; overload;
    {class} property ERR_CONNECT: Integer read _GetERR_CONNECT;
    {class} property ERR_FAILURE: Integer read _GetERR_FAILURE;
    {class} property ERR_ILLEGAL: Integer read _GetERR_ILLEGAL;
    {class} property ERR_MEMORY: Integer read _GetERR_MEMORY;
    {class} property ERR_OFF_LINE: Integer read _GetERR_OFF_LINE;
    {class} property ERR_OPEN: Integer read _GetERR_OPEN;
    {class} property ERR_PARAM: Integer read _GetERR_PARAM;
    {class} property ERR_PROCESSING: Integer read _GetERR_PROCESSING;
    {class} property ERR_TIMEOUT: Integer read _GetERR_TIMEOUT;
    {class} property ERR_UNSUPPORTED: Integer read _GetERR_UNSUPPORTED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('com/epson/eposprint/EposException')]
  Jeposprint_EposException = interface(JException)
    ['{4DFF90C3-69D4-4DAA-8BEB-4A3986E02C63}']
    function getBatteryStatus: Integer; cdecl;
    function getErrorStatus: Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
  end;
  TJeposprint_EposException = class(TJavaGenericImport<Jeposprint_EposExceptionClass, Jeposprint_EposException>) end;

  Jeposprint_LogClass = interface(JObjectClass)
    ['{14983F69-F5FF-47BD-A765-370BAF6522DC}']
    {class} function _GetLOG_DISABLE: Integer;
    {class} function _GetLOG_LOW: Integer;
    {class} function _GetLOG_PERMANENT: Integer;
    {class} function _GetLOG_STORAGE: Integer;
    {class} function _GetLOG_TCP: Integer;
    {class} function _GetLOG_TEMPORARY: Integer;
    {class} function _GetSDK_NAME: JString;
    {class} function _GetSDK_VERSION: JString;
    {class} function init: Jeposprint_Log; cdecl;
    {class} procedure setLogSettings(P1: JContext; P2: Integer; P3: Integer; P4: JString; P5: Integer; P6: Integer; P7: Integer); cdecl;
    {class} property LOG_DISABLE: Integer read _GetLOG_DISABLE;
    {class} property LOG_LOW: Integer read _GetLOG_LOW;
    {class} property LOG_PERMANENT: Integer read _GetLOG_PERMANENT;
    {class} property LOG_STORAGE: Integer read _GetLOG_STORAGE;
    {class} property LOG_TCP: Integer read _GetLOG_TCP;
    {class} property LOG_TEMPORARY: Integer read _GetLOG_TEMPORARY;
    {class} property SDK_NAME: JString read _GetSDK_NAME;
    {class} property SDK_VERSION: JString read _GetSDK_VERSION;
  end;

  [JavaSignature('com/epson/eposprint/Log')]
  Jeposprint_Log = interface(JObject)
    ['{384BE278-0239-4705-A5EB-356ED58CE160}']
  end;
  TJeposprint_Log = class(TJavaGenericImport<Jeposprint_LogClass, Jeposprint_Log>) end;

  JOfflineEventListenerClass = interface(JEventListenerClass)
    ['{852ABCF8-6FEB-4124-BD59-049044175ADD}']
  end;

  [JavaSignature('com/epson/eposprint/OfflineEventListener')]
  JOfflineEventListener = interface(JEventListener)
    ['{801F322B-D765-4D4B-8410-DA7F4A5F3060}']
    procedure onOfflineEvent(P1: JString); cdecl;
  end;
  TJOfflineEventListener = class(TJavaGenericImport<JOfflineEventListenerClass, JOfflineEventListener>) end;

  JOnlineEventListenerClass = interface(JEventListenerClass)
    ['{615BEC25-642F-49A7-83D9-87C279BD6416}']
  end;

  [JavaSignature('com/epson/eposprint/OnlineEventListener')]
  JOnlineEventListener = interface(JEventListener)
    ['{415873F2-4869-4344-B455-55820CE047D1}']
    procedure onOnlineEvent(P1: JString); cdecl;
  end;
  TJOnlineEventListener = class(TJavaGenericImport<JOnlineEventListenerClass, JOnlineEventListener>) end;

  JPaperEndEventListenerClass = interface(JEventListenerClass)
    ['{C7A9087C-7DD1-488E-B740-8AD432F97823}']
  end;

  [JavaSignature('com/epson/eposprint/PaperEndEventListener')]
  JPaperEndEventListener = interface(JEventListener)
    ['{352E209A-DE37-413C-9903-7320878F1AF6}']
    procedure onPaperEndEvent(P1: JString); cdecl;
  end;
  TJPaperEndEventListener = class(TJavaGenericImport<JPaperEndEventListenerClass, JPaperEndEventListener>) end;

  JPaperNearEndEventListenerClass = interface(JEventListenerClass)
    ['{B6A0F352-917C-445E-A1EF-74733E6BCD40}']
  end;

  [JavaSignature('com/epson/eposprint/PaperNearEndEventListener')]
  JPaperNearEndEventListener = interface(JEventListener)
    ['{5101BCC7-9A6F-4033-A4E6-3A7FEB22C803}']
    procedure onPaperNearEndEvent(P1: JString); cdecl;
  end;
  TJPaperNearEndEventListener = class(TJavaGenericImport<JPaperNearEndEventListenerClass, JPaperNearEndEventListener>) end;

  JPaperOkEventListenerClass = interface(JEventListenerClass)
    ['{866F6AB8-0D25-4314-A0BA-AB4594079089}']
  end;

  [JavaSignature('com/epson/eposprint/PaperOkEventListener')]
  JPaperOkEventListener = interface(JEventListener)
    ['{8240566C-EEFA-4490-AB23-618931C2DF26}']
    procedure onPaperOkEvent(P1: JString); cdecl;
  end;
  TJPaperOkEventListener = class(TJavaGenericImport<JPaperOkEventListenerClass, JPaperOkEventListener>) end;

  JPowerOffEventListenerClass = interface(JEventListenerClass)
    ['{0DBB7F84-D369-450B-8D13-CED0D0B3E7C3}']
  end;

  [JavaSignature('com/epson/eposprint/PowerOffEventListener')]
  JPowerOffEventListener = interface(JEventListener)
    ['{CC42C0F2-81BC-46DC-8AF4-74ECFB0FCCCF}']
    procedure onPowerOffEvent(P1: JString); cdecl;
  end;
  TJPowerOffEventListener = class(TJavaGenericImport<JPowerOffEventListenerClass, JPowerOffEventListener>) end;

  JPrintClass = interface(JObjectClass)
    ['{5CBC30F1-335D-42DA-959B-A3B9916E8268}']
    {class} function _GetDEVTYPE_BLUETOOTH: Integer;
    {class} function _GetDEVTYPE_TCP: Integer;
    {class} function _GetDEVTYPE_USB: Integer;
    {class} function _GetFALSE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function _GetPARAM_UNSPECIFIED: Integer;
    {class} function _GetST_AUTOCUTTER_ERR: Integer;
    {class} function _GetST_AUTORECOVER_ERR: Integer;
    {class} function _GetST_BATTERY_OFFLINE: Integer;
    {class} function _GetST_BATTERY_OVERHEAT: Integer;
    {class} function _GetST_BUZZER: Integer;
    {class} function _GetST_COVER_OPEN: Integer;
    {class} function _GetST_DRAWER_KICK: Integer;
    {class} function _GetST_HEAD_OVERHEAT: Integer;
    {class} function _GetST_MECHANICAL_ERR: Integer;
    {class} function _GetST_MOTOR_OVERHEAT: Integer;
    {class} function _GetST_NO_RESPONSE: Integer;
    {class} function _GetST_OFF_LINE: Integer;
    {class} function _GetST_PANEL_SWITCH: Integer;
    {class} function _GetST_PAPER_FEED: Integer;
    {class} function _GetST_PRINT_SUCCESS: Integer;
    {class} function _GetST_RECEIPT_END: Integer;
    {class} function _GetST_RECEIPT_NEAR_END: Integer;
    {class} function _GetST_UNRECOVER_ERR: Integer;
    {class} function _GetST_WAIT_ON_LINE: Integer;
    {class} function _GetST_WRONG_PAPER: Integer;
    {class} function _GetTRUE: Integer;
    {class} function init: JPrint; cdecl; overload;
    {class} function init(P1: JContext): JPrint; cdecl; overload;
    {class} property DEVTYPE_BLUETOOTH: Integer read _GetDEVTYPE_BLUETOOTH;
    {class} property DEVTYPE_TCP: Integer read _GetDEVTYPE_TCP;
    {class} property DEVTYPE_USB: Integer read _GetDEVTYPE_USB;
    {class} property FALSE: Integer read _GetFALSE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
    {class} property PARAM_UNSPECIFIED: Integer read _GetPARAM_UNSPECIFIED;
    {class} property ST_AUTOCUTTER_ERR: Integer read _GetST_AUTOCUTTER_ERR;
    {class} property ST_AUTORECOVER_ERR: Integer read _GetST_AUTORECOVER_ERR;
    {class} property ST_BATTERY_OFFLINE: Integer read _GetST_BATTERY_OFFLINE;
    {class} property ST_BATTERY_OVERHEAT: Integer read _GetST_BATTERY_OVERHEAT;
    {class} property ST_BUZZER: Integer read _GetST_BUZZER;
    {class} property ST_COVER_OPEN: Integer read _GetST_COVER_OPEN;
    {class} property ST_DRAWER_KICK: Integer read _GetST_DRAWER_KICK;
    {class} property ST_HEAD_OVERHEAT: Integer read _GetST_HEAD_OVERHEAT;
    {class} property ST_MECHANICAL_ERR: Integer read _GetST_MECHANICAL_ERR;
    {class} property ST_MOTOR_OVERHEAT: Integer read _GetST_MOTOR_OVERHEAT;
    {class} property ST_NO_RESPONSE: Integer read _GetST_NO_RESPONSE;
    {class} property ST_OFF_LINE: Integer read _GetST_OFF_LINE;
    {class} property ST_PANEL_SWITCH: Integer read _GetST_PANEL_SWITCH;
    {class} property ST_PAPER_FEED: Integer read _GetST_PAPER_FEED;
    {class} property ST_PRINT_SUCCESS: Integer read _GetST_PRINT_SUCCESS;
    {class} property ST_RECEIPT_END: Integer read _GetST_RECEIPT_END;
    {class} property ST_RECEIPT_NEAR_END: Integer read _GetST_RECEIPT_NEAR_END;
    {class} property ST_UNRECOVER_ERR: Integer read _GetST_UNRECOVER_ERR;
    {class} property ST_WAIT_ON_LINE: Integer read _GetST_WAIT_ON_LINE;
    {class} property ST_WRONG_PAPER: Integer read _GetST_WRONG_PAPER;
    {class} property TRUE: Integer read _GetTRUE;
  end;

  [JavaSignature('com/epson/eposprint/Print')]
  JPrint = interface(JObject)
    ['{2780CA5A-5A18-4C1B-B7C1-E6160B91E5BB}']
    procedure beginTransaction; cdecl;
    procedure closePrinter; cdecl;
    procedure endTransaction; cdecl;
    procedure getStatus(P1: TJavaArray<Integer>; P2: TJavaArray<Integer>); cdecl;
    procedure openPrinter(P1: Integer; P2: JString); cdecl; overload;
    procedure openPrinter(P1: Integer; P2: JString; P3: Integer; P4: Integer); cdecl; overload;
    procedure openPrinter(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer); cdecl; overload;
    procedure sendData(P1: JBuilder; P2: Integer; P3: TJavaArray<Integer>); cdecl; overload;
    procedure sendData(P1: JBuilder; P2: Integer; P3: TJavaArray<Integer>; P4: TJavaArray<Integer>); cdecl; overload;
    procedure setBatteryLowEventCallback(P1: JBatteryLowEventListener); cdecl;
    procedure setBatteryOkEventCallback(P1: JBatteryOkEventListener); cdecl;
    procedure setBatteryStatusChangeEventCallback(P1: JBatteryStatusChangeEventListener); cdecl;
    procedure setCoverOkEventCallback(P1: JCoverOkEventListener); cdecl;
    procedure setCoverOpenEventCallback(P1: JCoverOpenEventListener); cdecl;
    procedure setDrawerClosedEventCallback(P1: JDrawerClosedEventListener); cdecl;
    procedure setDrawerOpenEventCallback(P1: JDrawerOpenEventListener); cdecl;
    procedure setOfflineEventCallback(P1: JOfflineEventListener); cdecl;
    procedure setOnlineEventCallback(P1: JOnlineEventListener); cdecl;
    procedure setPaperEndEventCallback(P1: JPaperEndEventListener); cdecl;
    procedure setPaperNearEndEventCallback(P1: JPaperNearEndEventListener); cdecl;
    procedure setPaperOkEventCallback(P1: JPaperOkEventListener); cdecl;
    procedure setPowerOffEventCallback(P1: JPowerOffEventListener); cdecl;
    procedure setStatusChangeEventCallback(P1: JStatusChangeEventListener); cdecl;
  end;
  TJPrint = class(TJavaGenericImport<JPrintClass, JPrint>) end;

  JStatusChangeEventListenerClass = interface(JEventListenerClass)
    ['{67A37D15-CE40-44A6-9B31-E70C61E3FC48}']
  end;

  [JavaSignature('com/epson/eposprint/StatusChangeEventListener')]
  JStatusChangeEventListener = interface(JEventListener)
    ['{0BB65A86-5E46-4441-AD9A-72D17E39C465}']
    procedure onStatusChangeEvent(P1: JString; P2: Integer); cdecl;
  end;
  TJStatusChangeEventListener = class(TJavaGenericImport<JStatusChangeEventListenerClass, JStatusChangeEventListener>) end;

  JDevTypeClass = interface(JObjectClass)
    ['{C5BE0786-78F2-48CB-A25F-D682310D9D76}']
    {class} function _GetANY: Integer;
    {class} function _GetBLUETOOTH: Integer;
    {class} function _GetNONE: Integer;
    {class} function _GetTCP: Integer;
    {class} function _GetUSB: Integer;
    {class} function init: JDevType; cdecl;
    {class} property ANY: Integer read _GetANY;
    {class} property BLUETOOTH: Integer read _GetBLUETOOTH;
    {class} property NONE: Integer read _GetNONE;
    {class} property TCP: Integer read _GetTCP;
    {class} property USB: Integer read _GetUSB;
  end;

  [JavaSignature('com/epson/epsonio/DevType')]
  JDevType = interface(JObject)
    ['{2799F8A2-6C3C-4DA9-8EAA-B5C1845BE754}']
  end;
  TJDevType = class(TJavaGenericImport<JDevTypeClass, JDevType>) end;

  Jepsonio_DeviceInfoClass = interface(JObjectClass)
    ['{B1E54901-E7A8-4875-B386-6CDD06F8082B}']
    {class} function init(P1: Integer; P2: JString; P3: JString; P4: JString; P5: JString): Jepsonio_DeviceInfo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/DeviceInfo')]
  Jepsonio_DeviceInfo = interface(JObject)
    ['{CD85554F-E301-4314-B121-75377440C5E5}']
    function getDeviceName: JString; cdecl;
    function getDeviceType: Integer; cdecl;
    function getIpAddress: JString; cdecl;
    function getMacAddress: JString; cdecl;
    function getPrinterName: JString; cdecl;
  end;
  TJepsonio_DeviceInfo = class(TJavaGenericImport<Jepsonio_DeviceInfoClass, Jepsonio_DeviceInfo>) end;

  JEpsonIoClass = interface(JObjectClass)
    ['{A1E910AD-7C17-4EC6-A6E5-C4D833A58568}']
    {class} function init: JEpsonIo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/EpsonIo')]
  JEpsonIo = interface(JObject)
    ['{2194CAF7-E131-4C0E-9B14-3EBD83254D58}']
    procedure close; cdecl;
    procedure open(P1: Integer; P2: JString; P3: JString); cdecl; overload;
    procedure open(P1: Integer; P2: JString; P3: JString; P4: JContext); cdecl; overload;
    function read(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
    function write(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
  end;
  TJEpsonIo = class(TJavaGenericImport<JEpsonIoClass, JEpsonIo>) end;

  JEpsonIoExceptionClass = interface(JExceptionClass)
    ['{804D1978-EDA4-47CE-A875-DBDC958C5DF0}']
    {class} function init(P1: Integer): JEpsonIoException; cdecl; overload;
    {class} function init(P1: JString; P2: JThrowable): JEpsonIoException; cdecl; overload;
  end;

  [JavaSignature('com/epson/epsonio/EpsonIoException')]
  JEpsonIoException = interface(JException)
    ['{FE36A507-DCA5-4EAD-9BB6-5C94CD6B329B}']
    function getStatus: Integer; cdecl;
    procedure setStatus(P1: Integer); cdecl;
  end;
  TJEpsonIoException = class(TJavaGenericImport<JEpsonIoExceptionClass, JEpsonIoException>) end;

  Jepsonio_FilterOptionClass = interface(JObjectClass)
    ['{3641AC86-2288-4C7C-9B80-C10484029C2B}']
    {class} function _GetFILTER_NAME: Integer;
    {class} function _GetFILTER_NONE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function init: Jepsonio_FilterOption; cdecl;
    {class} property FILTER_NAME: Integer read _GetFILTER_NAME;
    {class} property FILTER_NONE: Integer read _GetFILTER_NONE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
  end;

  [JavaSignature('com/epson/epsonio/FilterOption')]
  Jepsonio_FilterOption = interface(JObject)
    ['{F2ECADD0-F54E-402C-8BD9-56E77E885384}']
  end;
  TJepsonio_FilterOption = class(TJavaGenericImport<Jepsonio_FilterOptionClass, Jepsonio_FilterOption>) end;

  JFinderClass = interface(JObjectClass)
    ['{22E93B1D-59AA-47A2-8ADB-E698B17D9016}']
    {class} function _GetFILTER_NAME: Integer;
    {class} function _GetFILTER_NONE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function getDeviceInfoList(P1: Integer): TJavaObjectArray<Jepsonio_DeviceInfo>; cdecl;
    {class} function getResult: TJavaObjectArray<JString>; cdecl;
    {class} function init: JFinder; cdecl;
    {class} procedure start(P1: JContext; P2: Integer; P3: JString); cdecl;
    {class} procedure stop; cdecl;
    {class} property FILTER_NAME: Integer read _GetFILTER_NAME;
    {class} property FILTER_NONE: Integer read _GetFILTER_NONE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
  end;

  [JavaSignature('com/epson/epsonio/Finder')]
  JFinder = interface(JObject)
    ['{D63F9D69-9B18-4EFC-B621-2549E4B72DBC}']
  end;
  TJFinder = class(TJavaGenericImport<JFinderClass, JFinder>) end;

  JIoStatusClass = interface(JObjectClass)
    ['{D80E8533-C97B-46DC-A690-B74182B73F81}']
    {class} function _GetERR_CONNECT: Integer;
    {class} function _GetERR_FAILURE: Integer;
    {class} function _GetERR_ILLEGAL: Integer;
    {class} function _GetERR_MEMORY: Integer;
    {class} function _GetERR_OPEN: Integer;
    {class} function _GetERR_PARAM: Integer;
    {class} function _GetERR_PROCESSING: Integer;
    {class} function _GetERR_TIMEOUT: Integer;
    {class} function _GetSUCCESS: Integer;
    {class} function init: JIoStatus; cdecl;
    {class} property ERR_CONNECT: Integer read _GetERR_CONNECT;
    {class} property ERR_FAILURE: Integer read _GetERR_FAILURE;
    {class} property ERR_ILLEGAL: Integer read _GetERR_ILLEGAL;
    {class} property ERR_MEMORY: Integer read _GetERR_MEMORY;
    {class} property ERR_OPEN: Integer read _GetERR_OPEN;
    {class} property ERR_PARAM: Integer read _GetERR_PARAM;
    {class} property ERR_PROCESSING: Integer read _GetERR_PROCESSING;
    {class} property ERR_TIMEOUT: Integer read _GetERR_TIMEOUT;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('com/epson/epsonio/IoStatus')]
  JIoStatus = interface(JObject)
    ['{9D3AFE75-2BA7-45AE-9CA9-C4300820E417}']
  end;
  TJIoStatus = class(TJavaGenericImport<JIoStatusClass, JIoStatus>) end;

  JNetIFInfoClass = interface(JObjectClass)
    ['{99B1DD2E-9EE7-49D7-869B-8FD493810D62}']
    {class} function getNetInfoList(P1: Integer): TJavaObjectArray<JNetIfResult>; cdecl;
    {class} function getNetInfoNum(P1: TJavaArray<Integer>): Integer; cdecl;
    {class} function init: JNetIFInfo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/NetIFInfo')]
  JNetIFInfo = interface(JObject)
    ['{1B09CDF4-4A2B-4605-B9DE-88518588AB45}']
  end;
  TJNetIFInfo = class(TJavaGenericImport<JNetIFInfoClass, JNetIFInfo>) end;

  JNetIfResultClass = interface(JObjectClass)
    ['{44F26441-9CBB-4953-9690-50F83D29C819}']
    {class} function init: JNetIfResult; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/NetIfResult')]
  JNetIfResult = interface(JObject)
    ['{8CB4D738-922B-4612-8080-361D1A897349}']
    function _GetipAddress: TJavaArray<Byte>;
    procedure _SetipAddress(Value: TJavaArray<Byte>);
    function _GetmacAddress: TJavaArray<Byte>;
    procedure _SetmacAddress(Value: TJavaArray<Byte>);
    property ipAddress: TJavaArray<Byte> read _GetipAddress write _SetipAddress;
    property macAddress: TJavaArray<Byte> read _GetmacAddress write _SetmacAddress;
  end;
  TJNetIfResult = class(TJavaGenericImport<JNetIfResultClass, JNetIfResult>) end;

  JSupportUsbClass = interface(JObjectClass)
    ['{BC398373-815E-40E7-8159-231639ACD7A9}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<Jepsonio_DeviceInfo>; cdecl;
    {class} function init: JSupportUsb; cdecl;
    {class} function isSupport: JBoolean; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/SupportUsb')]
  JSupportUsb = interface(JObject)
    ['{3D5C431F-5AED-4982-83F2-AD3EA084F57A}']
  end;
  TJSupportUsb = class(TJavaGenericImport<JSupportUsbClass, JSupportUsb>) end;

  JAdapterHandlerClass = interface(JHandlerClass)
    ['{4704DCFB-0F8C-4988-8340-A7E25C6775E9}']
    {class} function init: JAdapterHandler; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/AdapterHandler')]
  JAdapterHandler = interface(JHandler)
    ['{6F0E80BE-74D1-4FB0-A8ED-38EB845955A4}']
    function getAdapter: JBluetoothAdapter; cdecl;
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJAdapterHandler = class(TJavaGenericImport<JAdapterHandlerClass, JAdapterHandler>) end;

  JDevBtClass = interface(JObjectClass)
    ['{8E259810-3EBA-4A37-86AA-C379F582072C}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<Jepsonio_DeviceInfo>; cdecl;
    {class} function init: JDevBt; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt')]
  JDevBt = interface(JObject)
    ['{0B736F68-9879-4D47-BFAA-1ECD0A64D06D}']
  end;
  TJDevBt = class(TJavaGenericImport<JDevBtClass, JDevBt>) end;

  JDevBt_1Class = interface(JBroadcastReceiverClass)
    ['{F1AB6047-9029-4E86-88C9-908DEA645697}']
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt$1')]
  JDevBt_1 = interface(JBroadcastReceiver)
    ['{A8374A2C-10A6-4881-BB9F-2862F7B2B3E6}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJDevBt_1 = class(TJavaGenericImport<JDevBt_1Class, JDevBt_1>) end;

  JDevBt_2Class = interface(JHandlerClass)
    ['{FCC840B9-03D0-44D4-9447-2BD1357BD965}']
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt$2')]
  JDevBt_2 = interface(JHandler)
    ['{2A875416-4B0C-4A60-AEFE-D1305625BD2C}']
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJDevBt_2 = class(TJavaGenericImport<JDevBt_2Class, JDevBt_2>) end;

  JNetBtClass = interface(JObjectClass)
    ['{328C6C73-39DD-4EA8-A9ED-77ACA805B34B}']
    {class} function close(P1: Integer): Integer; cdecl;
    {class} function init: JNetBt; cdecl;
    {class} function kill(P1: Integer): Integer; cdecl;
    {class} function open(P1: JString; P2: JString; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function read(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function write(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/NetBt')]
  JNetBt = interface(JObject)
    ['{B9281D17-C560-417E-9A3B-407F40AD459F}']
  end;
  TJNetBt = class(TJavaGenericImport<JNetBtClass, JNetBt>) end;

  JDevUsbClass = interface(JObjectClass)
    ['{B63B4E59-2B07-4D42-ADB9-BF78C983683B}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<Jepsonio_DeviceInfo>; cdecl;
    {class} function init: JDevUsb; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb')]
  JDevUsb = interface(JObject)
    ['{31F7B952-EB08-457E-A81C-2EC30C3025D8}']
  end;
  TJDevUsb = class(TJavaGenericImport<JDevUsbClass, JDevUsb>) end;

  JDevUsb_1Class = interface(JBroadcastReceiverClass)
    ['{0FFA6D98-0D58-4BFB-AF52-E03FB29B0113}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$1')]
  JDevUsb_1 = interface(JBroadcastReceiver)
    ['{A104A6C0-92FC-4426-9DF1-AADAFD519F77}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJDevUsb_1 = class(TJavaGenericImport<JDevUsb_1Class, JDevUsb_1>) end;

  JDevUsb_2Class = interface(JObjectClass)
    ['{872DAB9D-13B3-4C86-8F25-7102BE1D6FAD}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$2')]
  JDevUsb_2 = interface(JObject)
    ['{29592536-E0E7-4236-883A-84C6315848C1}']
    procedure run; cdecl;
  end;
  TJDevUsb_2 = class(TJavaGenericImport<JDevUsb_2Class, JDevUsb_2>) end;

  JDevUsb_3Class = interface(JHandlerClass)
    ['{E3B6A180-3697-42C5-816C-A344CF4C4E42}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$3')]
  JDevUsb_3 = interface(JHandler)
    ['{A932F234-032D-41C0-AC25-A1F0D6B4EEE4}']
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJDevUsb_3 = class(TJavaGenericImport<JDevUsb_3Class, JDevUsb_3>) end;

  JNetUsbClass = interface(JObjectClass)
    ['{6B6C9AA1-3745-42D2-8DA6-C00BC24EA703}']
    {class} function close(P1: Integer): Integer; cdecl;
    {class} function enableFlowControl(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function getOnlineDMStatus(P1: Integer; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getOnlineTMStatus(P1: Integer; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function init: JNetUsb; cdecl;
    {class} function kill(P1: Integer): Integer; cdecl;
    {class} function open(P1: JString; P2: JString; P3: TJavaArray<Integer>; P4: JObject): Integer; cdecl;
    {class} function read(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function write(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/usb/NetUsb')]
  JNetUsb = interface(JObject)
    ['{42CEA070-641E-41DE-A8F7-B060F74DB5D9}']
  end;
  TJNetUsb = class(TJavaGenericImport<JNetUsbClass, JNetUsb>) end;

  JUsbConnecterClass = interface(JObjectClass)
    ['{CC1B8AE3-6161-4D66-B411-5977120FF848}']
    {class} function init: JUsbConnecter; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/usb/UsbConnecter')]
  JUsbConnecter = interface(JObject)
    ['{806CBC15-7485-42DD-ACF2-3FE3AF6B02E1}']
    function balkRead(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Integer>; P4: Integer): Integer; cdecl;
    function balkWrite(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Integer>; P4: Integer): Integer; cdecl;
    function checkDevice(P1: JString): JBoolean; cdecl;
    function checkHandle(P1: Integer): JBoolean; cdecl;
    function close: Integer; cdecl;
    function connect(P1: Integer; P2: JUsbManager; P3: JUsbDevice): Integer; cdecl;
    function enableFlowControl(P1: Integer): Integer; cdecl;
    function getOnlineDMStatus(P1: TJavaArray<Integer>): Integer; cdecl;
    function getOnlineTMStatus(P1: TJavaArray<Integer>): Integer; cdecl;
  end;
  TJUsbConnecter = class(TJavaGenericImport<JUsbConnecterClass, JUsbConnecter>) end;

  JVectorClass = interface(JAbstractListClass)
    ['{AF3067AC-4EA6-496A-9A93-E5D96BDDDECD}']
    {class} function init: JVector; cdecl; overload;
    {class} function init(capacity: Integer): JVector; cdecl; overload;
    {class} function init(capacity: Integer; capacityIncrement: Integer): JVector; cdecl; overload;
    {class} function init(collection: JCollection): JVector; cdecl; overload;
  end;

  [JavaSignature('java/util/Vector')]
  JVector = interface(JAbstractList)
    ['{CC07A8CD-E311-453A-B3D5-2786E688CEFD}']
    procedure add(location: Integer; object_: JObject); cdecl; overload;
    function add(object_: JObject): Boolean; cdecl; overload;
    function addAll(location: Integer; collection: JCollection): Boolean; cdecl; overload;
    function addAll(collection: JCollection): Boolean; cdecl; overload;
    procedure addElement(object_: JObject); cdecl;
    function capacity: Integer; cdecl;
    procedure clear; cdecl;
    function clone: JObject; cdecl;
    function &contains(object_: JObject): Boolean; cdecl;
    function containsAll(collection: JCollection): Boolean; cdecl;
    procedure copyInto(elements: TJavaObjectArray<JObject>); cdecl;
    function elementAt(location: Integer): JObject; cdecl;
    function elements: JEnumeration; cdecl;
    procedure ensureCapacity(minimumCapacity: Integer); cdecl;
    function equals(object_: JObject): Boolean; cdecl;
    function firstElement: JObject; cdecl;
    function &get(location: Integer): JObject; cdecl;
    function hashCode: Integer; cdecl;
    function indexOf(object_: JObject): Integer; cdecl; overload;
    function indexOf(object_: JObject; location: Integer): Integer; cdecl; overload;
    procedure insertElementAt(object_: JObject; location: Integer); cdecl;
    function isEmpty: Boolean; cdecl;
    function lastElement: JObject; cdecl;
    function lastIndexOf(object_: JObject): Integer; cdecl; overload;
    function lastIndexOf(object_: JObject; location: Integer): Integer; cdecl; overload;
    function remove(location: Integer): JObject; cdecl; overload;
    function remove(object_: JObject): Boolean; cdecl; overload;
    function removeAll(collection: JCollection): Boolean; cdecl;
    procedure removeAllElements; cdecl;
    function removeElement(object_: JObject): Boolean; cdecl;
    procedure removeElementAt(location: Integer); cdecl;
    function retainAll(collection: JCollection): Boolean; cdecl;
    function &set(location: Integer; object_: JObject): JObject; cdecl;
    procedure setElementAt(object_: JObject; location: Integer); cdecl;
    procedure setSize(length: Integer); cdecl;
    function size: Integer; cdecl;
    function subList(start: Integer; end_: Integer): JList; cdecl;
    function toArray: TJavaObjectArray<JObject>; cdecl; overload;
    function toArray(contents: TJavaObjectArray<JObject>): TJavaObjectArray<JObject>; cdecl; overload;
    function toString: JString; cdecl;
    procedure trimToSize; cdecl;
  end;
  TJVector = class(TJavaGenericImport<JVectorClass, JVector>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JUsbAccessory', TypeInfo(ePOS2\Androind.JNI.ePOS2.JUsbAccessory));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JUsbDevice', TypeInfo(ePOS2\Androind.JNI.ePOS2.JUsbDevice));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JUsbDeviceConnection', TypeInfo(ePOS2\Androind.JNI.ePOS2.JUsbDeviceConnection));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JUsbEndpoint', TypeInfo(ePOS2\Androind.JNI.ePOS2.JUsbEndpoint));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JUsbInterface', TypeInfo(ePOS2\Androind.JNI.ePOS2.JUsbInterface));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JUsbManager', TypeInfo(ePOS2\Androind.JNI.ePOS2.JUsbManager));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JUsbRequest', TypeInfo(ePOS2\Androind.JNI.ePOS2.JUsbRequest));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jepos2_BuildConfig', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jepos2_BuildConfig));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JConnectionListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JConnectionListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JEpos2CallbackCode', TypeInfo(ePOS2\Androind.JNI.ePOS2.JEpos2CallbackCode));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JEpos2Exception', TypeInfo(ePOS2\Androind.JNI.ePOS2.JEpos2Exception));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jepos2_Log', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jepos2_Log));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeInitializer', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeInitializer));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JOutputLog', TypeInfo(ePOS2\Androind.JNI.ePOS2.JOutputLog));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JBarcodeScanner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JBarcodeScanner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JScanListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JScanListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JScannerStatusInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JScannerStatusInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBox', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBox));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBox_CommBoxHistoryCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBox_CommBoxHistoryCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBox_CommBoxSendMessageCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBox_CommBoxSendMessageCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBoxStatusInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBoxStatusInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JGetCommHistoryCallback', TypeInfo(ePOS2\Androind.JNI.ePOS2.JGetCommHistoryCallback));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JReceiveListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JReceiveListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JSendMessageCallback', TypeInfo(ePOS2\Androind.JNI.ePOS2.JSendMessageCallback));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDiscovery', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDiscovery));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDiscoveryListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDiscoveryListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JFilterOption', TypeInfo(ePOS2\Androind.JNI.ePOS2.JFilterOption));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JKeyPressListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JKeyPressListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jkeyboard_Keyboard', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jkeyboard_Keyboard));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JKeyboardStatusInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JKeyboardStatusInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JReadStringListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JReadStringListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDisplayStatusInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDisplayStatusInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JLineDisplay', TypeInfo(ePOS2\Androind.JNI.ePOS2.JLineDisplay));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jlinedisplay_ReceiveListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jlinedisplay_ReceiveListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JLogoKeyCode', TypeInfo(ePOS2\Androind.JNI.ePOS2.JLogoKeyCode));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jprinter_Printer', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jprinter_Printer));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPrinterStatusInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPrinterStatusInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jprinter_ReceiveListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jprinter_ReceiveListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JStatusChangeListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JStatusChangeListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jsimpleserial_ReceiveListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jsimpleserial_ReceiveListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JSerialStatusInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JSerialStatusInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JSimpleSerial', TypeInfo(ePOS2\Androind.JNI.ePOS2.JSimpleSerial));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JConnectListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JConnectListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCreateDeviceListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCreateDeviceListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeleteDeviceListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeleteDeviceListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeDevice', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeDevice));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevice', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevice));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevice_ConnectCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevice_ConnectCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevice_CreateDeviceCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevice_CreateDeviceCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevice_DeleteDeviceCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevice_DeleteDeviceCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeCommBoxManager', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeCommBoxManager));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBoxManager', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBoxManager));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_CommBoxManagerInner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_CommBoxManagerInner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeCommBox', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeCommBox));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jcommbox_CommBox', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jcommbox_CommBox));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBoxManager_CommBoxAccessor', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBoxManager_CommBoxAccessor));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBoxManagerInner_CommBoxInner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBoxManagerInner_CommBoxInner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeDisplay', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeDisplay));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jdisplay_Display', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jdisplay_Display));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_DisplayInner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_DisplayInner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_IHandleObject', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_IHandleObject));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_IDeviceObject', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_IDeviceObject));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeKeyboard', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeKeyboard));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jeposdevice_keyboard_Keyboard', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jeposdevice_keyboard_Keyboard));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_KeyboardInner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_KeyboardInner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativePrinter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativePrinter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jeposdevice_printer_Printer', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jeposdevice_printer_Printer));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_PrinterInner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_PrinterInner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeScanner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeScanner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jscanner_Scanner', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jscanner_Scanner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_ScannerInner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_ScannerInner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeSimpleSerial', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeSimpleSerial));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jsimpleserial_SimpleSerial', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jsimpleserial_SimpleSerial));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_SimpleSerialInner', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDeviceInnerImplement_SimpleSerialInner));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDisconnectListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDisconnectListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JEposCallbackCode', TypeInfo(ePOS2\Androind.JNI.ePOS2.JEposCallbackCode));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JEposException', TypeInfo(ePOS2\Androind.JNI.ePOS2.JEposException));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jeposdevice_Log', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jeposdevice_Log));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeDevice_NativeConnectCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeDevice_NativeConnectCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeDevice_NativeCreateDeviceCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeDevice_NativeCreateDeviceCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeDevice_NativeDeleteDeviceCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeDevice_NativeDeleteDeviceCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JReconnectListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JReconnectListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JReconnectingListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JReconnectingListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCloseCommBoxListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCloseCommBoxListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jcommbox_CommBox_CommBoxHistoryCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jcommbox_CommBox_CommBoxHistoryCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBox_CommBoxSendDataCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBox_CommBoxSendDataCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBoxManager_CloseCommBoxCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBoxManager_CloseCommBoxCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommBoxManager_OpenCommBoxCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommBoxManager_OpenCommBoxCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JGetCommHistoryListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JGetCommHistoryListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeCommBox_NativeCommBoxHistoryCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeCommBox_NativeCommBoxHistoryCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeCommBox_NativeCommBoxSendDataCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeCommBox_NativeCommBoxSendDataCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JOpenCommBoxListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JOpenCommBoxListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jcommbox_ReceiveListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jcommbox_ReceiveListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JSendDataListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JSendDataListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jdisplay_ReceiveListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jdisplay_ReceiveListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jkeyboard_KeyPressListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jkeyboard_KeyPressListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JStringListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JStringListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JBatteryLowListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JBatteryLowListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JBatteryOkListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JBatteryOkListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JBatteryStatusChangeListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JBatteryStatusChangeListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCoverOkListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCoverOkListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCoverOpenListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCoverOpenListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDrawerClosedListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDrawerClosedListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDrawerOpenListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDrawerOpenListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jeposdevice_printer_ReceiveListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jeposdevice_printer_ReceiveListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JJobReceiveListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JJobReceiveListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JOfflineListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JOfflineListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JOnlineListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JOnlineListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPaperEndListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPaperEndListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPaperNearEndListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPaperNearEndListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPaperOkListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPaperOkListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPowerOffListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPowerOffListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jprinter_StatusChangeListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jprinter_StatusChangeListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDataListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDataListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCommandReplayListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCommandReplayListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JBatteryLowEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JBatteryLowEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JBatteryOkEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JBatteryOkEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JBatteryStatusChangeEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JBatteryStatusChangeEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JBuilder', TypeInfo(ePOS2\Androind.JNI.ePOS2.JBuilder));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCoverOkEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCoverOkEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JCoverOpenEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JCoverOpenEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDrawerClosedEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDrawerClosedEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDrawerOpenEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDrawerOpenEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jeposprint_EposException', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jeposprint_EposException));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jeposprint_Log', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jeposprint_Log));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JOfflineEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JOfflineEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JOnlineEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JOnlineEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPaperEndEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPaperEndEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPaperNearEndEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPaperNearEndEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPaperOkEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPaperOkEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPowerOffEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPowerOffEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JPrint', TypeInfo(ePOS2\Androind.JNI.ePOS2.JPrint));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JStatusChangeEventListener', TypeInfo(ePOS2\Androind.JNI.ePOS2.JStatusChangeEventListener));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevType', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevType));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jepsonio_DeviceInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jepsonio_DeviceInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JEpsonIo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JEpsonIo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JEpsonIoException', TypeInfo(ePOS2\Androind.JNI.ePOS2.JEpsonIoException));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.Jepsonio_FilterOption', TypeInfo(ePOS2\Androind.JNI.ePOS2.Jepsonio_FilterOption));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JFinder', TypeInfo(ePOS2\Androind.JNI.ePOS2.JFinder));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JIoStatus', TypeInfo(ePOS2\Androind.JNI.ePOS2.JIoStatus));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNetIFInfo', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNetIFInfo));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNetIfResult', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNetIfResult));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JSupportUsb', TypeInfo(ePOS2\Androind.JNI.ePOS2.JSupportUsb));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JAdapterHandler', TypeInfo(ePOS2\Androind.JNI.ePOS2.JAdapterHandler));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevBt', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevBt));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevBt_1', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevBt_1));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevBt_2', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevBt_2));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNetBt', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNetBt));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevUsb', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevUsb));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevUsb_1', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevUsb_1));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevUsb_2', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevUsb_2));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JDevUsb_3', TypeInfo(ePOS2\Androind.JNI.ePOS2.JDevUsb_3));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JNetUsb', TypeInfo(ePOS2\Androind.JNI.ePOS2.JNetUsb));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JUsbConnecter', TypeInfo(ePOS2\Androind.JNI.ePOS2.JUsbConnecter));
  TRegTypes.RegisterType('ePOS2\Androind.JNI.ePOS2.JVector', TypeInfo(ePOS2\Androind.JNI.ePOS2.JVector));
end;

initialization
  RegisterTypes;
end.


