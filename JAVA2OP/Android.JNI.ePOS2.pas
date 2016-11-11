{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit Android.JNI.ePOS2;

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
    ['{C6209D00-F54F-4F9C-9008-9DD475366F4E}']
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
    ['{4C92453E-E6E9-400E-989F-6911FF3FA05A}']
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
    ['{38BAEACD-B3E9-4EAE-A38C-0C32B76930C8}']
    {class} function _GetEVENT_DISCONNECT: Integer;
    {class} function _GetEVENT_RECONNECT: Integer;
    {class} function _GetEVENT_RECONNECTING: Integer;
    {class} property EVENT_DISCONNECT: Integer read _GetEVENT_DISCONNECT;
    {class} property EVENT_RECONNECT: Integer read _GetEVENT_RECONNECT;
    {class} property EVENT_RECONNECTING: Integer read _GetEVENT_RECONNECTING;
  end;

  [JavaSignature('com/epson/epos2/ConnectionListener')]
  JConnectionListener = interface(JEventListener)
    ['{5C3BF078-591B-42E4-8170-6B5A0FDC22CA}']
    procedure onConnection(P1: JObject; P2: Integer); cdecl;
  end;
  TJConnectionListener = class(TJavaGenericImport<JConnectionListenerClass, JConnectionListener>) end;

  JEpos2CallbackCodeClass = interface(JObjectClass)
    ['{4AFD4844-D753-4D12-8177-9617277A4FEE}']
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
    ['{74A56870-86B1-40C7-9F36-2D04C37D4056}']
  end;
  TJEpos2CallbackCode = class(TJavaGenericImport<JEpos2CallbackCodeClass, JEpos2CallbackCode>) end;

  JEpos2ExceptionClass = interface(JExceptionClass)
    ['{8DCDD1F4-784D-4A35-8C07-D6F9193D8FB7}']
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
    ['{EBFC0774-0EFB-4E13-B167-32CD9D179864}']
    function getErrorStatus: Integer; cdecl;
  end;
  TJEpos2Exception = class(TJavaGenericImport<JEpos2ExceptionClass, JEpos2Exception>) end;

  Jepos2_LogClass = interface(JObjectClass)
    ['{EC8CE162-C854-4D06-8551-3E6E98C49A7C}']
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
    ['{61883095-36FC-4217-964F-405BB3BC007B}']
  end;
  TJepos2_Log = class(TJavaGenericImport<Jepos2_LogClass, Jepos2_Log>) end;

  JNativeInitializerClass = interface(JObjectClass)
    ['{79204E54-D6DE-451A-949B-7048B55C7286}']
    {class} procedure initializeNativeEnv(P1: JContext); cdecl;
  end;

  [JavaSignature('com/epson/epos2/NativeInitializer')]
  JNativeInitializer = interface(JObject)
    ['{E83DC26C-B640-476A-BDA9-6C296222BCAF}']
  end;
  TJNativeInitializer = class(TJavaGenericImport<JNativeInitializerClass, JNativeInitializer>) end;

  JOutputLogClass = interface(JObjectClass)
    ['{AF78CDF9-E390-4C9E-922D-2E363FE034D8}']
    {class} procedure outputException(P1: JString; P2: Int64; P3: JException); cdecl;
    {class} procedure readLogSettings(P1: JContext); cdecl;
  end;

  [JavaSignature('com/epson/epos2/OutputLog')]
  JOutputLog = interface(JObject)
    ['{C7FE6BF5-256D-4344-A96F-5486E18978C5}']
  end;
  TJOutputLog = class(TJavaGenericImport<JOutputLogClass, JOutputLog>) end;

  JBarcodeScannerClass = interface(JObjectClass)
    ['{FECDF283-ACD2-4CFB-B488-7AE23081EB7A}']
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
    ['{F7AC5B07-A273-4F36-AF77-5201DB34C3DD}']
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
    ['{3AF00E14-ED1D-458B-9D1F-794C33EA9E4D}']
  end;

  [JavaSignature('com/epson/epos2/barcodescanner/ScanListener')]
  JScanListener = interface(JEventListener)
    ['{E47ABC94-2A82-4B9E-80F6-72E181C0CC37}']
    procedure onScanData(P1: JBarcodeScanner; P2: JString); cdecl;
  end;
  TJScanListener = class(TJavaGenericImport<JScanListenerClass, JScanListener>) end;

  JScannerStatusInfoClass = interface(JObjectClass)
    ['{254197B4-5498-4BC5-8E98-E25F3E2A9102}']
    {class} function init: JScannerStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/barcodescanner/ScannerStatusInfo')]
  JScannerStatusInfo = interface(JObject)
    ['{5516631C-67AE-4546-A859-3D284FA99239}']
    function getConnection: Integer; cdecl;
  end;
  TJScannerStatusInfo = class(TJavaGenericImport<JScannerStatusInfoClass, JScannerStatusInfo>) end;

  JCommBoxClass = interface(JObjectClass)
    ['{EDEBA976-2008-4081-BF0A-46B5236B5710}']
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
    ['{18CB0B25-D093-4D23-A075-A105CCFB201E}']
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
    ['{C8F062BD-EED5-4C8A-9F6E-EC56273BA807}']
    {class} function init(P1: JCommBox; P2: Int64; P3: JGetCommHistoryCallback; P4: JCommBox): JCommBox_CommBoxHistoryCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/epos2/commbox/CommBox$CommBoxHistoryCallbackAdapter')]
  JCommBox_CommBoxHistoryCallbackAdapter = interface(JObject)
    ['{F68B2E64-C044-4180-BBDF-B1D230AED0D5}']
    procedure addHistory(P1: JString; P2: JString; P3: JString); cdecl;
    function getAdapterCommBoxHandle: Int64; cdecl;
    procedure onCommBoxHistory(P1: Int64; P2: Integer); cdecl;
  end;
  TJCommBox_CommBoxHistoryCallbackAdapter = class(TJavaGenericImport<JCommBox_CommBoxHistoryCallbackAdapterClass, JCommBox_CommBoxHistoryCallbackAdapter>) end;

  JCommBox_CommBoxSendMessageCallbackAdapterClass = interface(JObjectClass)
    ['{B73C6206-0C3C-4438-B4B4-7B1D64A03C8D}']
    {class} function init(P1: JCommBox; P2: Int64; P3: JSendMessageCallback; P4: JCommBox): JCommBox_CommBoxSendMessageCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/epos2/commbox/CommBox$CommBoxSendMessageCallbackAdapter')]
  JCommBox_CommBoxSendMessageCallbackAdapter = interface(JObject)
    ['{5235F61A-6E69-4518-A1EC-8A9B037728D7}']
    function getAdapterCommBoxHandle: Int64; cdecl;
    procedure onCommBoxSendMessage(P1: Int64; P2: Integer; P3: Int64); cdecl;
  end;
  TJCommBox_CommBoxSendMessageCallbackAdapter = class(TJavaGenericImport<JCommBox_CommBoxSendMessageCallbackAdapterClass, JCommBox_CommBoxSendMessageCallbackAdapter>) end;

  JCommBoxStatusInfoClass = interface(JObjectClass)
    ['{A94567A6-26B6-4EE9-964E-8D8C07F29CCD}']
    {class} function init: JCommBoxStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/commbox/CommBoxStatusInfo')]
  JCommBoxStatusInfo = interface(JObject)
    ['{A6269FE0-A4A3-446D-9AFC-B4487EB31E19}']
    function getConnection: Integer; cdecl;
  end;
  TJCommBoxStatusInfo = class(TJavaGenericImport<JCommBoxStatusInfoClass, JCommBoxStatusInfo>) end;

  JGetCommHistoryCallbackClass = interface(JEventListenerClass)
    ['{F3361914-F0CF-4F59-B258-02C545B4DCA7}']
  end;

  [JavaSignature('com/epson/epos2/commbox/GetCommHistoryCallback')]
  JGetCommHistoryCallback = interface(JEventListener)
    ['{003F0070-08DB-4531-A998-3279137B10B8}']
    procedure onGetCommHistory(P1: JCommBox; P2: Integer; P3: JArrayList); cdecl;
  end;
  TJGetCommHistoryCallback = class(TJavaGenericImport<JGetCommHistoryCallbackClass, JGetCommHistoryCallback>) end;

  JReceiveListenerClass = interface(IJavaClass)
    ['{C11BAB95-B3A2-4632-AC46-FBF0B61950F5}']
  end;

  [JavaSignature('com/epson/epos2/commbox/ReceiveListener')]
  JReceiveListener = interface(IJavaInstance)
    ['{4CAB0CB2-8A5D-444F-BAD1-E851A8EADE55}']
    procedure onCommBoxReceive(P1: JCommBox; P2: JString; P3: JString; P4: JString); cdecl;
  end;
  TJReceiveListener = class(TJavaGenericImport<JReceiveListenerClass, JReceiveListener>) end;

  JSendMessageCallbackClass = interface(JEventListenerClass)
    ['{189DF64E-9DC6-497D-B0FC-14E984E469BB}']
  end;

  [JavaSignature('com/epson/epos2/commbox/SendMessageCallback')]
  JSendMessageCallback = interface(JEventListener)
    ['{C3FE9104-BF44-4DD4-9160-090E03AA0844}']
    procedure onCommBoxSendMessage(P1: JCommBox; P2: Integer; P3: Integer); cdecl;
  end;
  TJSendMessageCallback = class(TJavaGenericImport<JSendMessageCallbackClass, JSendMessageCallback>) end;

  JDeviceInfoClass = interface(JObjectClass)
    ['{44F08FA5-D4D9-4061-A943-948FD811BF4C}']
    {class} function init: JDeviceInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/discovery/DeviceInfo')]
  JDeviceInfo = interface(JObject)
    ['{7703AA4B-FF80-48D9-927A-5B73C3C5E57D}']
    function getBdAddress: JString; cdecl;
    function getDeviceName: JString; cdecl;
    function getDeviceType: Integer; cdecl;
    function getIpAddress: JString; cdecl;
    function getMacAddress: JString; cdecl;
    function getTarget: JString; cdecl;
  end;
  TJDeviceInfo = class(TJavaGenericImport<JDeviceInfoClass, JDeviceInfo>) end;

  JDiscoveryClass = interface(JObjectClass)
    ['{B5374A43-A317-4C20-811E-A7EA92ABB57E}']
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
    ['{10586E4C-A2AD-4FB2-99D0-0913F5AE2F54}']
  end;
  TJDiscovery = class(TJavaGenericImport<JDiscoveryClass, JDiscovery>) end;

  JDiscoveryListenerClass = interface(IJavaClass)
    ['{116002FC-A588-4D49-8357-DEBB0C242F24}']
  end;

  [JavaSignature('com/epson/epos2/discovery/DiscoveryListener')]
  JDiscoveryListener = interface(IJavaInstance)
    ['{F25948F1-734F-4558-A589-24BCFAFCC9B7}']
    procedure onDiscovery(P1: JDeviceInfo); cdecl;
  end;
  TJDiscoveryListener = class(TJavaGenericImport<JDiscoveryListenerClass, JDiscoveryListener>) end;

  JFilterOptionClass = interface(JObjectClass)
    ['{52660443-B0F3-404D-925C-AD802FFD2AC1}']
    {class} function init: JFilterOption; cdecl;
  end;

  [JavaSignature('com/epson/epos2/discovery/FilterOption')]
  JFilterOption = interface(JObject)
    ['{BDB73E85-470F-4300-8FDF-9A12F4E2008E}']
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
    ['{B298BF0B-9900-4576-8296-90851F335548}']
  end;

  [JavaSignature('com/epson/epos2/keyboard/KeyPressListener')]
  JKeyPressListener = interface(JEventListener)
    ['{D09CD08E-14BB-4FC1-84CD-6591DFE1406F}']
    procedure onKbdKeyPress(P1: Jkeyboard_Keyboard; P2: Integer; P3: JString); cdecl;
  end;
  TJKeyPressListener = class(TJavaGenericImport<JKeyPressListenerClass, JKeyPressListener>) end;

  Jkeyboard_KeyboardClass = interface(JObjectClass)
    ['{EBB18786-AF1F-4801-84B5-694CEBA6EDE0}']
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
    ['{B2CAD079-81CB-4006-80A9-631445A28849}']
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
    ['{1AB49707-292E-473F-9473-0E51436B9CF8}']
    {class} function init: JKeyboardStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/keyboard/KeyboardStatusInfo')]
  JKeyboardStatusInfo = interface(JObject)
    ['{9221CEA7-FE8D-4786-A383-4AA07EC1EF2B}']
    function getConnection: Integer; cdecl;
  end;
  TJKeyboardStatusInfo = class(TJavaGenericImport<JKeyboardStatusInfoClass, JKeyboardStatusInfo>) end;

  JReadStringListenerClass = interface(JEventListenerClass)
    ['{B47D50F6-74D0-482E-87FB-96F3CFC1CC3A}']
  end;

  [JavaSignature('com/epson/epos2/keyboard/ReadStringListener')]
  JReadStringListener = interface(JEventListener)
    ['{7E16CE08-83A0-4C31-B955-345FD0C7AF99}']
    procedure onKbdReadString(P1: Jkeyboard_Keyboard; P2: JString; P3: Integer); cdecl;
  end;
  TJReadStringListener = class(TJavaGenericImport<JReadStringListenerClass, JReadStringListener>) end;

  JDisplayStatusInfoClass = interface(JObjectClass)
    ['{90CBA4C4-FD2C-4FEC-AE04-9CD11270628A}']
    {class} function init: JDisplayStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/linedisplay/DisplayStatusInfo')]
  JDisplayStatusInfo = interface(JObject)
    ['{95F07D11-0A00-49AD-AC2F-5011706FC5F1}']
    function getConnection: Integer; cdecl;
  end;
  TJDisplayStatusInfo = class(TJavaGenericImport<JDisplayStatusInfoClass, JDisplayStatusInfo>) end;

  JLineDisplayClass = interface(JObjectClass)
    ['{2B66D491-95FC-494F-B78D-D0372B7B975E}']
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
    ['{37111FE2-2B2D-4131-8135-639764255966}']
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
    ['{8C574842-D6D2-4067-9DBE-AAA9A88E8129}']
  end;

  [JavaSignature('com/epson/epos2/linedisplay/ReceiveListener')]
  Jlinedisplay_ReceiveListener = interface(JEventListener)
    ['{B04BAF40-28AD-4942-BAAF-868621D62D9F}']
    procedure onDispReceive(P1: JLineDisplay; P2: Integer); cdecl;
  end;
  TJlinedisplay_ReceiveListener = class(TJavaGenericImport<Jlinedisplay_ReceiveListenerClass, Jlinedisplay_ReceiveListener>) end;

  JLogoKeyCodeClass = interface(JObjectClass)
    ['{AD39D66D-4E20-457B-BF9C-1D85DC548A13}']
  end;

  [JavaSignature('com/epson/epos2/printer/LogoKeyCode')]
  JLogoKeyCode = interface(JObject)
    ['{DF497D89-45F2-44F7-AD9B-8CDD0F2DB1B5}']
    function _Getkey1: Integer;
    procedure _Setkey1(Value: Integer);
    function _Getkey2: Integer;
    procedure _Setkey2(Value: Integer);
    property key1: Integer read _Getkey1 write _Setkey1;
    property key2: Integer read _Getkey2 write _Setkey2;
  end;
  TJLogoKeyCode = class(TJavaGenericImport<JLogoKeyCodeClass, JLogoKeyCode>) end;

  Jprinter_PrinterClass = interface(JObjectClass)
    ['{F5492D04-0074-41A1-9FFC-B3425D9E18EF}']
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
    ['{359D97F4-C4E6-45B4-9005-44645CF5DC10}']
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
    ['{CA6E0E0B-92B8-426B-AF37-CC9FAFD010B1}']
    {class} function init: JPrinterStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/printer/PrinterStatusInfo')]
  JPrinterStatusInfo = interface(JObject)
    ['{94E1930E-3597-453F-A618-48F97D880AF3}']
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
    ['{985B0853-909B-40AA-9D07-65CB37474C3E}']
  end;

  [JavaSignature('com/epson/epos2/printer/ReceiveListener')]
  Jprinter_ReceiveListener = interface(JEventListener)
    ['{BD55EBB4-CE1E-443C-9CED-74E0F0F97E36}']
    procedure onPtrReceive(P1: Jprinter_Printer; P2: Integer; P3: JPrinterStatusInfo; P4: JString); cdecl;
  end;
  TJprinter_ReceiveListener = class(TJavaGenericImport<Jprinter_ReceiveListenerClass, Jprinter_ReceiveListener>) end;

  JStatusChangeListenerClass = interface(JEventListenerClass)
    ['{DCD91AFD-0484-4AA9-943E-1FA1149A9FA8}']
  end;

  [JavaSignature('com/epson/epos2/printer/StatusChangeListener')]
  JStatusChangeListener = interface(JEventListener)
    ['{BDAA0850-FEC2-4C07-9ED9-CA927ED29C6C}']
    procedure onPtrStatusChange(P1: Jprinter_Printer; P2: Integer); cdecl;
  end;
  TJStatusChangeListener = class(TJavaGenericImport<JStatusChangeListenerClass, JStatusChangeListener>) end;

  Jsimpleserial_ReceiveListenerClass = interface(JEventListenerClass)
    ['{73AC2798-D295-493E-A326-9461177D52A3}']
  end;

  [JavaSignature('com/epson/epos2/simpleserial/ReceiveListener')]
  Jsimpleserial_ReceiveListener = interface(JEventListener)
    ['{8BE68B70-C36E-4BE9-98EF-0FAEE8C7EF63}']
    procedure onSimpleSerialReceive(P1: JSimpleSerial; P2: TJavaArray<Byte>); cdecl;
  end;
  TJsimpleserial_ReceiveListener = class(TJavaGenericImport<Jsimpleserial_ReceiveListenerClass, Jsimpleserial_ReceiveListener>) end;

  JSerialStatusInfoClass = interface(JObjectClass)
    ['{F1E5C928-3F87-43A1-8E6E-C0E15E83AD37}']
    {class} function init: JSerialStatusInfo; cdecl;
  end;

  [JavaSignature('com/epson/epos2/simpleserial/SerialStatusInfo')]
  JSerialStatusInfo = interface(JObject)
    ['{982DAE09-0A9E-49A3-85C4-375480E34849}']
    function getConnection: Integer; cdecl;
  end;
  TJSerialStatusInfo = class(TJavaGenericImport<JSerialStatusInfoClass, JSerialStatusInfo>) end;

  JSimpleSerialClass = interface(JObjectClass)
    ['{047DBD18-143E-4033-855D-ED34820717CC}']
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
    ['{EA760AF7-46CB-4A31-AC47-CA4D246A2F0A}']
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
    ['{915E3780-5F25-46B9-A924-176BD2BF6DF1}']
  end;

  [JavaSignature('com/epson/eposdevice/ConnectListener')]
  JConnectListener = interface(JEventListener)
    ['{7171AFE7-3422-45C1-9704-A18B50F2E7F3}']
    procedure onConnect(P1: JString; P2: Integer); cdecl;
  end;
  TJConnectListener = class(TJavaGenericImport<JConnectListenerClass, JConnectListener>) end;

  JCreateDeviceListenerClass = interface(JEventListenerClass)
    ['{D082F49B-75ED-454D-8372-903E042A7D2D}']
  end;

  [JavaSignature('com/epson/eposdevice/CreateDeviceListener')]
  JCreateDeviceListener = interface(JEventListener)
    ['{5F63BA67-21AF-48F5-820A-91337C033157}']
    procedure onCreateDevice(P1: JString; P2: JString; P3: Integer; P4: JObject; P5: Integer); cdecl;
  end;
  TJCreateDeviceListener = class(TJavaGenericImport<JCreateDeviceListenerClass, JCreateDeviceListener>) end;

  JDeleteDeviceListenerClass = interface(JEventListenerClass)
    ['{BC49F773-5543-4BE4-86C6-E39CEFCD615A}']
  end;

  [JavaSignature('com/epson/eposdevice/DeleteDeviceListener')]
  JDeleteDeviceListener = interface(JEventListener)
    ['{5833F5B0-05DF-47E7-B3C1-C60B23D469EE}']
    procedure onDeleteDevice(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJDeleteDeviceListener = class(TJavaGenericImport<JDeleteDeviceListenerClass, JDeleteDeviceListener>) end;

  JNativeDeviceClass = interface(JObjectClass)
    ['{9C842FF9-F716-4829-9E7F-1A0E4026BAC4}']
  end;

  [JavaSignature('com/epson/eposdevice/NativeDevice')]
  JNativeDevice = interface(JObject)
    ['{9BBBB31E-1E9C-4CDB-8A89-57AAE693D8A5}']
  end;
  TJNativeDevice = class(TJavaGenericImport<JNativeDeviceClass, JNativeDevice>) end;

  JDeviceInnerImplementClass = interface(JNativeDeviceClass)
    ['{50DF5073-0FD9-4564-B054-0ED899C1326E}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement')]
  JDeviceInnerImplement = interface(JNativeDevice)
    ['{E38EE2C6-8F30-4E63-993C-5CC6694CB4F1}']
  end;
  TJDeviceInnerImplement = class(TJavaGenericImport<JDeviceInnerImplementClass, JDeviceInnerImplement>) end;

  JDeviceClass = interface(JDeviceInnerImplementClass)
    ['{5512F1C3-19C5-40D0-BB40-B824E1ECFE26}']
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
    ['{1EAC20D0-F3C0-4200-808F-92E0D3A56F6A}']
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
    ['{8957D1E7-6393-4291-905F-72E4C3C4024D}']
    {class} function init(P1: JDevice; P2: JConnectListener): JDevice_ConnectCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/Device$ConnectCallbackAdapter')]
  JDevice_ConnectCallbackAdapter = interface(JObject)
    ['{F27C4FBC-BE7B-4637-930D-EE0AAC222843}']
    procedure nativeOnConnect(P1: JString; P2: Integer); cdecl;
  end;
  TJDevice_ConnectCallbackAdapter = class(TJavaGenericImport<JDevice_ConnectCallbackAdapterClass, JDevice_ConnectCallbackAdapter>) end;

  JDevice_CreateDeviceCallbackAdapterClass = interface(JObjectClass)
    ['{10CDD280-5B71-41C7-B69A-EA7F40DEC4D5}']
    {class} function init(P1: JDevice; P2: JCreateDeviceListener): JDevice_CreateDeviceCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/Device$CreateDeviceCallbackAdapter')]
  JDevice_CreateDeviceCallbackAdapter = interface(JObject)
    ['{81B3F715-0A56-4B94-85D9-25818D90A428}']
    procedure nativeOnCreateDevice(P1: JString; P2: JString; P3: Integer; P4: Int64; P5: Integer); cdecl;
  end;
  TJDevice_CreateDeviceCallbackAdapter = class(TJavaGenericImport<JDevice_CreateDeviceCallbackAdapterClass, JDevice_CreateDeviceCallbackAdapter>) end;

  JDevice_DeleteDeviceCallbackAdapterClass = interface(JObjectClass)
    ['{9A5BAD6A-CFB2-461A-9BF8-07FB537D2FB2}']
    {class} function init(P1: JDevice; P2: JDeleteDeviceListener; P3: JDeviceInnerImplement_IDeviceObject): JDevice_DeleteDeviceCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/Device$DeleteDeviceCallbackAdapter')]
  JDevice_DeleteDeviceCallbackAdapter = interface(JObject)
    ['{CB5AD99B-C34D-432B-AD59-511ABE66EDEE}']
    procedure nativeOnDeleteDevice(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJDevice_DeleteDeviceCallbackAdapter = class(TJavaGenericImport<JDevice_DeleteDeviceCallbackAdapterClass, JDevice_DeleteDeviceCallbackAdapter>) end;

  JNativeCommBoxManagerClass = interface(JObjectClass)
    ['{B7360230-E20A-460C-9FF5-088835E3D17E}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBoxManager')]
  JNativeCommBoxManager = interface(JObject)
    ['{9EB74319-43AC-4364-ACEC-B786D2FB8ED6}']
  end;
  TJNativeCommBoxManager = class(TJavaGenericImport<JNativeCommBoxManagerClass, JNativeCommBoxManager>) end;

  JCommBoxManagerClass = interface(JNativeCommBoxManagerClass)
    ['{B59539F6-577C-4B91-9F57-3D8C47B58540}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBoxManager')]
  JCommBoxManager = interface(JNativeCommBoxManager)
    ['{AEE785E2-8BAA-4883-B71B-8D186616A2DB}']
    procedure closeCommBox(P1: Jcommbox_CommBox; P2: TJavaArray<Integer>; P3: JCloseCommBoxListener); cdecl;
    procedure openCommBox(P1: JString; P2: JString; P3: TJavaArray<Integer>; P4: JOpenCommBoxListener); cdecl;
  end;
  TJCommBoxManager = class(TJavaGenericImport<JCommBoxManagerClass, JCommBoxManager>) end;

  JDeviceInnerImplement_CommBoxManagerInnerClass = interface(JCommBoxManagerClass)
    ['{8934896C-6913-4693-9A10-A864E65B182F}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$CommBoxManagerInner')]
  JDeviceInnerImplement_CommBoxManagerInner = interface(JCommBoxManager)
    ['{9A3B8BE3-071D-4067-8558-29B7974A5227}']
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_CommBoxManagerInner = class(TJavaGenericImport<JDeviceInnerImplement_CommBoxManagerInnerClass, JDeviceInnerImplement_CommBoxManagerInner>) end;

  JNativeCommBoxClass = interface(JObjectClass)
    ['{A3A195DF-981F-4A4D-9228-32545EA31D09}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBox')]
  JNativeCommBox = interface(JObject)
    ['{80F7EFAA-D0FC-423E-8967-82CE32723377}']
  end;
  TJNativeCommBox = class(TJavaGenericImport<JNativeCommBoxClass, JNativeCommBox>) end;

  Jcommbox_CommBoxClass = interface(JNativeCommBoxClass)
    ['{EBCBBA16-8A4F-4216-A78A-6082893F7032}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBox')]
  Jcommbox_CommBox = interface(JNativeCommBox)
    ['{3C168C69-11C3-41D8-A273-DBBF79FD415E}']
    procedure getCommHistory(P1: TJavaArray<Integer>; P2: JGetCommHistoryListener); cdecl;
    procedure sendData(P1: JString; P2: JString; P3: TJavaArray<Integer>; P4: JSendDataListener); cdecl;
    procedure setReceiveEventCallback(P1: Jcommbox_ReceiveListener); cdecl;
  end;
  TJcommbox_CommBox = class(TJavaGenericImport<Jcommbox_CommBoxClass, Jcommbox_CommBox>) end;

  JCommBoxManager_CommBoxAccessorClass = interface(Jcommbox_CommBoxClass)
    ['{3DF7E6BA-8E48-4F87-9180-400AD7E41FEA}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBoxManager$CommBoxAccessor')]
  JCommBoxManager_CommBoxAccessor = interface(Jcommbox_CommBox)
    ['{E396BD20-1A62-49DB-9A21-D6FE5346AE06}']
  end;
  TJCommBoxManager_CommBoxAccessor = class(TJavaGenericImport<JCommBoxManager_CommBoxAccessorClass, JCommBoxManager_CommBoxAccessor>) end;

  JCommBoxManagerInner_CommBoxInnerClass = interface(JCommBoxManager_CommBoxAccessorClass)
    ['{2605831C-EDC1-4873-BB41-B29B8D69F300}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$CommBoxManagerInner$CommBoxInner')]
  JCommBoxManagerInner_CommBoxInner = interface(JCommBoxManager_CommBoxAccessor)
    ['{383F23AE-245E-4E47-B67F-E910E44EFA05}']
    function getDeviceHandle: Int64; cdecl;
  end;
  TJCommBoxManagerInner_CommBoxInner = class(TJavaGenericImport<JCommBoxManagerInner_CommBoxInnerClass, JCommBoxManagerInner_CommBoxInner>) end;

  JNativeDisplayClass = interface(JObjectClass)
    ['{EB2B8FCD-4059-4A87-B15E-D14E3327CFD0}']
  end;

  [JavaSignature('com/epson/eposdevice/display/NativeDisplay')]
  JNativeDisplay = interface(JObject)
    ['{41724F17-EEB9-41DB-8E41-100832561A15}']
  end;
  TJNativeDisplay = class(TJavaGenericImport<JNativeDisplayClass, JNativeDisplay>) end;

  Jdisplay_DisplayClass = interface(JNativeDisplayClass)
    ['{4189BC9A-125C-4552-BD3B-061486C1A206}']
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
    ['{F5C1E001-FF9F-4617-B311-181112BB0F7B}']
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
    ['{748A1D6F-D731-41AD-BC26-E8C18FC0980A}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$DisplayInner')]
  JDeviceInnerImplement_DisplayInner = interface(Jdisplay_Display)
    ['{5A6516E6-6AD8-4C07-A0AB-BA145D7017DD}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_DisplayInner = class(TJavaGenericImport<JDeviceInnerImplement_DisplayInnerClass, JDeviceInnerImplement_DisplayInner>) end;

  JDeviceInnerImplement_IHandleObjectClass = interface(IJavaClass)
    ['{D3D61A40-7C1D-4379-B303-D9DC387812D5}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$IHandleObject')]
  JDeviceInnerImplement_IHandleObject = interface(IJavaInstance)
    ['{2B38F001-77DF-4525-A5B3-29D184F6DCA9}']
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_IHandleObject = class(TJavaGenericImport<JDeviceInnerImplement_IHandleObjectClass, JDeviceInnerImplement_IHandleObject>) end;

  JDeviceInnerImplement_IDeviceObjectClass = interface(JDeviceInnerImplement_IHandleObjectClass)
    ['{0EF3C8D9-40D1-4F0A-BC11-77FBDF53A191}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$IDeviceObject')]
  JDeviceInnerImplement_IDeviceObject = interface(JDeviceInnerImplement_IHandleObject)
    ['{231EA479-0D56-4FB0-89DB-8D6415412339}']
    procedure deleteInstance; cdecl;
  end;
  TJDeviceInnerImplement_IDeviceObject = class(TJavaGenericImport<JDeviceInnerImplement_IDeviceObjectClass, JDeviceInnerImplement_IDeviceObject>) end;

  JNativeKeyboardClass = interface(JObjectClass)
    ['{1E7C5FB9-0FBD-428E-A16F-918E261399BC}']
  end;

  [JavaSignature('com/epson/eposdevice/keyboard/NativeKeyboard')]
  JNativeKeyboard = interface(JObject)
    ['{309B5A5F-FF93-42BD-AF2F-6560DE1BB31D}']
  end;
  TJNativeKeyboard = class(TJavaGenericImport<JNativeKeyboardClass, JNativeKeyboard>) end;

  Jeposdevice_keyboard_KeyboardClass = interface(JNativeKeyboardClass)
    ['{7C7F4E20-C446-4760-AFD1-E27F5259E6D7}']
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
    ['{283DC4F8-F811-4B4D-A3DA-F487EFB89460}']
    procedure setKeyPressEventCallback(P1: Jkeyboard_KeyPressListener); cdecl;
    procedure setPrefix(P1: TJavaArray<Byte>); cdecl;
    procedure setStringEventCallback(P1: JStringListener); cdecl;
  end;
  TJeposdevice_keyboard_Keyboard = class(TJavaGenericImport<Jeposdevice_keyboard_KeyboardClass, Jeposdevice_keyboard_Keyboard>) end;

  JDeviceInnerImplement_KeyboardInnerClass = interface(Jeposdevice_keyboard_KeyboardClass)
    ['{B4B2434C-1C97-4E27-B87B-CBDD39CA331E}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$KeyboardInner')]
  JDeviceInnerImplement_KeyboardInner = interface(Jeposdevice_keyboard_Keyboard)
    ['{3E355304-E1BF-46D8-B0AC-6D8D8654A4EA}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_KeyboardInner = class(TJavaGenericImport<JDeviceInnerImplement_KeyboardInnerClass, JDeviceInnerImplement_KeyboardInner>) end;

  JNativePrinterClass = interface(JObjectClass)
    ['{9C6A5B20-B44D-400A-984F-00FAA3AB5C67}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/NativePrinter')]
  JNativePrinter = interface(JObject)
    ['{162980ED-A600-4295-8A06-0AAF810F2F26}']
  end;
  TJNativePrinter = class(TJavaGenericImport<JNativePrinterClass, JNativePrinter>) end;

  Jeposdevice_printer_PrinterClass = interface(JNativePrinterClass)
    ['{498D60B8-A6BE-41B1-BB2D-B88646154190}']
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
    ['{9DEA86ED-8E52-4D36-A53D-D51A719FF0ED}']
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
    ['{667039EB-CEB4-4D94-BDE2-5FFB4157F380}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$PrinterInner')]
  JDeviceInnerImplement_PrinterInner = interface(Jeposdevice_printer_Printer)
    ['{49BC982B-035E-4823-9173-F9323C43F01D}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_PrinterInner = class(TJavaGenericImport<JDeviceInnerImplement_PrinterInnerClass, JDeviceInnerImplement_PrinterInner>) end;

  JNativeScannerClass = interface(JObjectClass)
    ['{997E2085-1C5B-4B2D-947F-35AB4F4406CA}']
  end;

  [JavaSignature('com/epson/eposdevice/scanner/NativeScanner')]
  JNativeScanner = interface(JObject)
    ['{DFFC27D0-B74C-4D83-9791-9040C9C96CC4}']
  end;
  TJNativeScanner = class(TJavaGenericImport<JNativeScannerClass, JNativeScanner>) end;

  Jscanner_ScannerClass = interface(JNativeScannerClass)
    ['{79733497-AF37-47D4-BBB2-C31885230B23}']
  end;

  [JavaSignature('com/epson/eposdevice/scanner/Scanner')]
  Jscanner_Scanner = interface(JNativeScanner)
    ['{9CBF54C5-5EBD-4F0F-9C1A-1A23A2E9D7C7}']
    procedure setDataEventCallback(P1: JDataListener); cdecl;
  end;
  TJscanner_Scanner = class(TJavaGenericImport<Jscanner_ScannerClass, Jscanner_Scanner>) end;

  JDeviceInnerImplement_ScannerInnerClass = interface(Jscanner_ScannerClass)
    ['{2FCB9A57-86C2-42F4-8348-135BEA1AB32A}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$ScannerInner')]
  JDeviceInnerImplement_ScannerInner = interface(Jscanner_Scanner)
    ['{993D4B0E-93F8-4DF9-9EA4-10133CAA897D}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_ScannerInner = class(TJavaGenericImport<JDeviceInnerImplement_ScannerInnerClass, JDeviceInnerImplement_ScannerInner>) end;

  JNativeSimpleSerialClass = interface(JObjectClass)
    ['{D455272D-F73D-4DF7-8DE7-B57BB5B91DCB}']
  end;

  [JavaSignature('com/epson/eposdevice/simpleserial/NativeSimpleSerial')]
  JNativeSimpleSerial = interface(JObject)
    ['{98514456-F112-4032-ADBC-BC11A9031EB3}']
  end;
  TJNativeSimpleSerial = class(TJavaGenericImport<JNativeSimpleSerialClass, JNativeSimpleSerial>) end;

  Jsimpleserial_SimpleSerialClass = interface(JNativeSimpleSerialClass)
    ['{0D402B67-4AA2-45B0-BFA1-774A291B0470}']
  end;

  [JavaSignature('com/epson/eposdevice/simpleserial/SimpleSerial')]
  Jsimpleserial_SimpleSerial = interface(JNativeSimpleSerial)
    ['{4AC5B0F8-A0F1-4A75-9E14-BFCBFCDE48DB}']
    procedure sendCommand(P1: TJavaArray<Byte>); cdecl;
    procedure setCommandReplyEventCallback(P1: JCommandReplayListener); cdecl;
  end;
  TJsimpleserial_SimpleSerial = class(TJavaGenericImport<Jsimpleserial_SimpleSerialClass, Jsimpleserial_SimpleSerial>) end;

  JDeviceInnerImplement_SimpleSerialInnerClass = interface(Jsimpleserial_SimpleSerialClass)
    ['{BF34A501-5F6A-431E-B725-5C117E718936}']
  end;

  [JavaSignature('com/epson/eposdevice/DeviceInnerImplement$SimpleSerialInner')]
  JDeviceInnerImplement_SimpleSerialInner = interface(Jsimpleserial_SimpleSerial)
    ['{B150F2BF-AEFD-4A7E-A677-0090B6492B8F}']
    procedure deleteInstance; cdecl;
    function getDeviceHandle: Int64; cdecl;
  end;
  TJDeviceInnerImplement_SimpleSerialInner = class(TJavaGenericImport<JDeviceInnerImplement_SimpleSerialInnerClass, JDeviceInnerImplement_SimpleSerialInner>) end;

  JDisconnectListenerClass = interface(JEventListenerClass)
    ['{75AD9D9F-8833-4898-B948-AF493E5E3D56}']
  end;

  [JavaSignature('com/epson/eposdevice/DisconnectListener')]
  JDisconnectListener = interface(JEventListener)
    ['{A6D47610-FDA0-4D5C-A733-735BB9F2E936}']
    procedure onDisconnect(P1: JString); cdecl;
  end;
  TJDisconnectListener = class(TJavaGenericImport<JDisconnectListenerClass, JDisconnectListener>) end;

  JEposCallbackCodeClass = interface(JObjectClass)
    ['{1849D1BA-E7EC-4301-B77D-7E6F198A330A}']
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
    ['{1F046C5B-91A3-4AA4-84D6-E49EECADCA88}']
  end;
  TJEposCallbackCode = class(TJavaGenericImport<JEposCallbackCodeClass, JEposCallbackCode>) end;

  JEposExceptionClass = interface(JExceptionClass)
    ['{44AC8656-7913-4042-9C47-AE8BB567A852}']
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
    ['{A8DA801F-D2E8-468E-9285-CC40766650A8}']
    function getErrorStatus: Integer; cdecl;
  end;
  TJEposException = class(TJavaGenericImport<JEposExceptionClass, JEposException>) end;

  Jeposdevice_LogClass = interface(JObjectClass)
    ['{0C442F39-EA77-4BFA-8627-471356D61159}']
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
    ['{0C14034F-BDB9-4927-BE30-650D0A4B2F81}']
  end;
  TJeposdevice_Log = class(TJavaGenericImport<Jeposdevice_LogClass, Jeposdevice_Log>) end;

  JNativeDevice_NativeConnectCallbackAdapterClass = interface(IJavaClass)
    ['{CCD1C75A-D90B-499F-B620-FF4A8C9C2D6B}']
  end;

  [JavaSignature('com/epson/eposdevice/NativeDevice$NativeConnectCallbackAdapter')]
  JNativeDevice_NativeConnectCallbackAdapter = interface(IJavaInstance)
    ['{BB6FCB94-A373-4177-8CD8-25BC79C04C89}']
    procedure nativeOnConnect(P1: JString; P2: Integer); cdecl;
  end;
  TJNativeDevice_NativeConnectCallbackAdapter = class(TJavaGenericImport<JNativeDevice_NativeConnectCallbackAdapterClass, JNativeDevice_NativeConnectCallbackAdapter>) end;

  JNativeDevice_NativeCreateDeviceCallbackAdapterClass = interface(IJavaClass)
    ['{45ED62C4-E912-4D07-8066-F6800AD217CD}']
  end;

  [JavaSignature('com/epson/eposdevice/NativeDevice$NativeCreateDeviceCallbackAdapter')]
  JNativeDevice_NativeCreateDeviceCallbackAdapter = interface(IJavaInstance)
    ['{BC248B62-F3CC-4919-A81B-176E975FF2CB}']
    procedure nativeOnCreateDevice(P1: JString; P2: JString; P3: Integer; P4: Int64; P5: Integer); cdecl;
  end;
  TJNativeDevice_NativeCreateDeviceCallbackAdapter = class(TJavaGenericImport<JNativeDevice_NativeCreateDeviceCallbackAdapterClass, JNativeDevice_NativeCreateDeviceCallbackAdapter>) end;

  JNativeDevice_NativeDeleteDeviceCallbackAdapterClass = interface(IJavaClass)
    ['{B48F3113-4BA8-436E-BDA1-AC7CD7F74D52}']
  end;

  [JavaSignature('com/epson/eposdevice/NativeDevice$NativeDeleteDeviceCallbackAdapter')]
  JNativeDevice_NativeDeleteDeviceCallbackAdapter = interface(IJavaInstance)
    ['{62497C11-883F-4E28-AFC6-BA8FB5309D26}']
    procedure nativeOnDeleteDevice(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJNativeDevice_NativeDeleteDeviceCallbackAdapter = class(TJavaGenericImport<JNativeDevice_NativeDeleteDeviceCallbackAdapterClass, JNativeDevice_NativeDeleteDeviceCallbackAdapter>) end;

  JReconnectListenerClass = interface(JEventListenerClass)
    ['{61D38DD1-E567-4639-9122-DD707F74F5E2}']
  end;

  [JavaSignature('com/epson/eposdevice/ReconnectListener')]
  JReconnectListener = interface(JEventListener)
    ['{9CE46C7C-B1D1-4BC8-8066-210296F68B09}']
    procedure onReconnect(P1: JString); cdecl;
  end;
  TJReconnectListener = class(TJavaGenericImport<JReconnectListenerClass, JReconnectListener>) end;

  JReconnectingListenerClass = interface(JEventListenerClass)
    ['{F5D97DAD-DD1D-4283-8156-B1EEF381F3D2}']
  end;

  [JavaSignature('com/epson/eposdevice/ReconnectingListener')]
  JReconnectingListener = interface(JEventListener)
    ['{8608692B-8B8B-42AF-BD20-340B3D9F9092}']
    procedure onReconnecting(P1: JString); cdecl;
  end;
  TJReconnectingListener = class(TJavaGenericImport<JReconnectingListenerClass, JReconnectingListener>) end;

  JCloseCommBoxListenerClass = interface(IJavaClass)
    ['{E3CFA1FE-0F7C-4C6C-A79A-1B95976D67D6}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CloseCommBoxListener')]
  JCloseCommBoxListener = interface(IJavaInstance)
    ['{1BEAC953-CA65-4791-A6AA-CB30ACCA7424}']
    procedure onCloseCommBox(P1: JString; P2: Integer; P3: Integer); cdecl;
  end;
  TJCloseCommBoxListener = class(TJavaGenericImport<JCloseCommBoxListenerClass, JCloseCommBoxListener>) end;

  Jcommbox_CommBox_CommBoxHistoryCallbackAdapterClass = interface(JObjectClass)
    ['{4C31DD9F-AFC7-47E9-A48A-D9B89493499C}']
    {class} function init(P1: Jcommbox_CommBox; P2: JGetCommHistoryListener): Jcommbox_CommBox_CommBoxHistoryCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBox$CommBoxHistoryCallbackAdapter')]
  Jcommbox_CommBox_CommBoxHistoryCallbackAdapter = interface(JObject)
    ['{1BE9FAB3-7350-4CED-98E4-4B48C1EB5FCD}']
    procedure addHistory(P1: JString; P2: JString; P3: JString); cdecl;
    procedure onCommBoxHistory(P1: Int64; P2: JString; P3: Integer; P4: Int64); cdecl;
  end;
  TJcommbox_CommBox_CommBoxHistoryCallbackAdapter = class(TJavaGenericImport<Jcommbox_CommBox_CommBoxHistoryCallbackAdapterClass, Jcommbox_CommBox_CommBoxHistoryCallbackAdapter>) end;

  JCommBox_CommBoxSendDataCallbackAdapterClass = interface(JObjectClass)
    ['{6E36DEFA-2766-4D6C-A8AB-F63F422DDFA8}']
    {class} function init(P1: Jcommbox_CommBox; P2: JSendDataListener): JCommBox_CommBoxSendDataCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBox$CommBoxSendDataCallbackAdapter')]
  JCommBox_CommBoxSendDataCallbackAdapter = interface(JObject)
    ['{780B01F1-B49E-4788-A263-4CF5AA83D54B}']
    procedure onCommBoxSendData(P1: Int64; P2: JString; P3: Integer; P4: Int64; P5: Int64); cdecl;
  end;
  TJCommBox_CommBoxSendDataCallbackAdapter = class(TJavaGenericImport<JCommBox_CommBoxSendDataCallbackAdapterClass, JCommBox_CommBoxSendDataCallbackAdapter>) end;

  JCommBoxManager_CloseCommBoxCallbackAdapterClass = interface(JObjectClass)
    ['{D72294C5-EF29-4978-A71D-A32ADB8D132E}']
    {class} function init(P1: JCommBoxManager; P2: JCloseCommBoxListener; P3: JCommBoxManager_CommBoxAccessor): JCommBoxManager_CloseCommBoxCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBoxManager$CloseCommBoxCallbackAdapter')]
  JCommBoxManager_CloseCommBoxCallbackAdapter = interface(JObject)
    ['{2C8FE791-1DA8-4781-9548-4B5394C2D756}']
    procedure nativeOnCloseCommBox(P1: Int64; P2: Int64; P3: JString; P4: Integer; P5: Int64); cdecl;
  end;
  TJCommBoxManager_CloseCommBoxCallbackAdapter = class(TJavaGenericImport<JCommBoxManager_CloseCommBoxCallbackAdapterClass, JCommBoxManager_CloseCommBoxCallbackAdapter>) end;

  JCommBoxManager_OpenCommBoxCallbackAdapterClass = interface(JObjectClass)
    ['{8BBC06DB-6118-47BB-B9AA-5419AB549525}']
    {class} function init(P1: JCommBoxManager; P2: JOpenCommBoxListener): JCommBoxManager_OpenCommBoxCallbackAdapter; cdecl;
  end;

  [JavaSignature('com/epson/eposdevice/commbox/CommBoxManager$OpenCommBoxCallbackAdapter')]
  JCommBoxManager_OpenCommBoxCallbackAdapter = interface(JObject)
    ['{CFAB785C-2835-4868-B796-8BC2FCCB83FB}']
    procedure nativeOnOpenCommBox(P1: Int64; P2: Int64; P3: JString; P4: Integer; P5: Int64); cdecl;
  end;
  TJCommBoxManager_OpenCommBoxCallbackAdapter = class(TJavaGenericImport<JCommBoxManager_OpenCommBoxCallbackAdapterClass, JCommBoxManager_OpenCommBoxCallbackAdapter>) end;

  JGetCommHistoryListenerClass = interface(IJavaClass)
    ['{57DC53BE-1112-4AF8-9D7E-E61BBFDF2E01}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/GetCommHistoryListener')]
  JGetCommHistoryListener = interface(IJavaInstance)
    ['{67925390-EC40-41F3-9E6F-4D7509610880}']
    procedure onGetCommHistory(P1: JString; P2: Integer; P3: JArrayList; P4: Integer); cdecl;
  end;
  TJGetCommHistoryListener = class(TJavaGenericImport<JGetCommHistoryListenerClass, JGetCommHistoryListener>) end;

  JNativeCommBox_NativeCommBoxHistoryCallbackAdapterClass = interface(IJavaClass)
    ['{C496E80C-5C60-49C8-8F59-4779EC14D6E4}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBox$NativeCommBoxHistoryCallbackAdapter')]
  JNativeCommBox_NativeCommBoxHistoryCallbackAdapter = interface(IJavaInstance)
    ['{71679CF7-94EA-4E07-8825-0BD1392F8735}']
    procedure addHistory(P1: JString; P2: JString; P3: JString); cdecl;
    procedure onCommBoxHistory(P1: Int64; P2: JString; P3: Integer; P4: Int64); cdecl;
  end;
  TJNativeCommBox_NativeCommBoxHistoryCallbackAdapter = class(TJavaGenericImport<JNativeCommBox_NativeCommBoxHistoryCallbackAdapterClass, JNativeCommBox_NativeCommBoxHistoryCallbackAdapter>) end;

  JNativeCommBox_NativeCommBoxSendDataCallbackAdapterClass = interface(IJavaClass)
    ['{C571D507-ABC4-451C-8601-4C66141184B7}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBox$NativeCommBoxSendDataCallbackAdapter')]
  JNativeCommBox_NativeCommBoxSendDataCallbackAdapter = interface(IJavaInstance)
    ['{2B27CB44-B62D-4767-BD81-E52EC5E9FBAE}']
    procedure onCommBoxSendData(P1: Int64; P2: JString; P3: Integer; P4: Int64; P5: Int64); cdecl;
  end;
  TJNativeCommBox_NativeCommBoxSendDataCallbackAdapter = class(TJavaGenericImport<JNativeCommBox_NativeCommBoxSendDataCallbackAdapterClass, JNativeCommBox_NativeCommBoxSendDataCallbackAdapter>) end;

  JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapterClass = interface(IJavaClass)
    ['{F9D82523-4199-4950-95DD-C96B5B1AB773}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBoxManager$NativeCloseCommBoxCallbackAdapter')]
  JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter = interface(IJavaInstance)
    ['{DF425DC8-0D3B-4923-9242-CF02C702B33C}']
    procedure nativeOnCloseCommBox(P1: Int64; P2: Int64; P3: JString; P4: Integer; P5: Int64); cdecl;
  end;
  TJNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter = class(TJavaGenericImport<JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapterClass, JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter>) end;

  JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapterClass = interface(IJavaClass)
    ['{433E1497-D125-48A8-A105-3E43ABEBEA5E}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/NativeCommBoxManager$NativeOpenCommBoxCallbackAdapter')]
  JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter = interface(IJavaInstance)
    ['{52A6C092-9DAB-4CD2-AA64-E1D140DF2AD6}']
    procedure nativeOnOpenCommBox(P1: Int64; P2: Int64; P3: JString; P4: Integer; P5: Int64); cdecl;
  end;
  TJNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter = class(TJavaGenericImport<JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapterClass, JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter>) end;

  JOpenCommBoxListenerClass = interface(IJavaClass)
    ['{3AAB7CAC-A9D9-4DFF-87DB-0CB6F99BC731}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/OpenCommBoxListener')]
  JOpenCommBoxListener = interface(IJavaInstance)
    ['{3DB945A7-D1D2-41F6-B5D6-175B1090C528}']
    procedure onOpenCommBox(P1: JString; P2: Jcommbox_CommBox; P3: Integer; P4: Integer); cdecl;
  end;
  TJOpenCommBoxListener = class(TJavaGenericImport<JOpenCommBoxListenerClass, JOpenCommBoxListener>) end;

  Jcommbox_ReceiveListenerClass = interface(IJavaClass)
    ['{B379FEF5-93A8-4B6A-8C60-4D90963BB6E8}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/ReceiveListener')]
  Jcommbox_ReceiveListener = interface(IJavaInstance)
    ['{C3E8B1BE-39AB-4ABC-A85B-061628452DEB}']
    procedure onCommBoxReceive(P1: JString; P2: JString; P3: JString; P4: JString); cdecl;
  end;
  TJcommbox_ReceiveListener = class(TJavaGenericImport<Jcommbox_ReceiveListenerClass, Jcommbox_ReceiveListener>) end;

  JSendDataListenerClass = interface(IJavaClass)
    ['{7E7AB344-3647-4886-B2C6-A015E25F3EA2}']
  end;

  [JavaSignature('com/epson/eposdevice/commbox/SendDataListener')]
  JSendDataListener = interface(IJavaInstance)
    ['{AA30E695-FAA6-4E6C-A14B-A47B94CEA340}']
    procedure onCommBoxSendData(P1: JString; P2: Integer; P3: Integer; P4: Integer); cdecl;
  end;
  TJSendDataListener = class(TJavaGenericImport<JSendDataListenerClass, JSendDataListener>) end;

  Jdisplay_ReceiveListenerClass = interface(IJavaClass)
    ['{DDBA55B8-6BE6-46C9-A065-B2EEE91CE5D9}']
  end;

  [JavaSignature('com/epson/eposdevice/display/ReceiveListener')]
  Jdisplay_ReceiveListener = interface(IJavaInstance)
    ['{021D3935-BB9B-4D9A-A76F-C8E38B0E9012}']
    procedure onDspReceive(P1: JString; P2: JString; P3: Integer; P4: Integer); cdecl;
  end;
  TJdisplay_ReceiveListener = class(TJavaGenericImport<Jdisplay_ReceiveListenerClass, Jdisplay_ReceiveListener>) end;

  Jkeyboard_KeyPressListenerClass = interface(IJavaClass)
    ['{0DF35BBB-C6DA-454A-AE36-B2FFE7BD8548}']
  end;

  [JavaSignature('com/epson/eposdevice/keyboard/KeyPressListener')]
  Jkeyboard_KeyPressListener = interface(IJavaInstance)
    ['{8CEB46E8-BDEE-486B-BD94-84FA372BE491}']
    procedure onKbdKeyPress(P1: JString; P2: JString; P3: Integer; P4: JString); cdecl;
  end;
  TJkeyboard_KeyPressListener = class(TJavaGenericImport<Jkeyboard_KeyPressListenerClass, Jkeyboard_KeyPressListener>) end;

  JStringListenerClass = interface(IJavaClass)
    ['{D6683802-EC07-4671-B9BD-CC0E5AA9B72A}']
  end;

  [JavaSignature('com/epson/eposdevice/keyboard/StringListener')]
  JStringListener = interface(IJavaInstance)
    ['{A7977E6D-35F4-430B-876A-BDD211E07999}']
    procedure onKbdString(P1: JString; P2: JString; P3: JString; P4: Integer); cdecl;
  end;
  TJStringListener = class(TJavaGenericImport<JStringListenerClass, JStringListener>) end;

  JBatteryLowListenerClass = interface(JEventListenerClass)
    ['{74076661-053E-4910-A6BD-5A09C686A9BC}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/BatteryLowListener')]
  JBatteryLowListener = interface(JEventListener)
    ['{C7575316-6C89-46AB-AD31-04CF304675F9}']
    procedure onPtrBatteryLow(P1: JString; P2: JString); cdecl;
  end;
  TJBatteryLowListener = class(TJavaGenericImport<JBatteryLowListenerClass, JBatteryLowListener>) end;

  JBatteryOkListenerClass = interface(JEventListenerClass)
    ['{B9662D69-F349-4CC8-95A3-A47F6DE77188}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/BatteryOkListener')]
  JBatteryOkListener = interface(JEventListener)
    ['{9FAF945C-A7AB-4F69-980C-16F5D1676CDE}']
    procedure onPtrBatteryOk(P1: JString; P2: JString); cdecl;
  end;
  TJBatteryOkListener = class(TJavaGenericImport<JBatteryOkListenerClass, JBatteryOkListener>) end;

  JBatteryStatusChangeListenerClass = interface(JEventListenerClass)
    ['{4893D716-EE2D-45FF-B461-C243E43F514C}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/BatteryStatusChangeListener')]
  JBatteryStatusChangeListener = interface(JEventListener)
    ['{FE4A6063-E6FA-415B-A24C-99D7D3FC1928}']
    procedure onPtrBatteryStatusChange(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJBatteryStatusChangeListener = class(TJavaGenericImport<JBatteryStatusChangeListenerClass, JBatteryStatusChangeListener>) end;

  JCoverOkListenerClass = interface(JEventListenerClass)
    ['{B5659208-62B6-4E27-9831-85F84C351DDB}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/CoverOkListener')]
  JCoverOkListener = interface(JEventListener)
    ['{BC721F5A-2ABA-4ADA-AC29-D73BA5C20B1A}']
    procedure onPtrCoverOk(P1: JString; P2: JString); cdecl;
  end;
  TJCoverOkListener = class(TJavaGenericImport<JCoverOkListenerClass, JCoverOkListener>) end;

  JCoverOpenListenerClass = interface(JEventListenerClass)
    ['{6EB7D7E9-2653-41C7-8433-5DA48C5DE136}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/CoverOpenListener')]
  JCoverOpenListener = interface(JEventListener)
    ['{F4BEE3DA-2017-428F-9094-43A6BDFF813D}']
    procedure onPtrCoverOpen(P1: JString; P2: JString); cdecl;
  end;
  TJCoverOpenListener = class(TJavaGenericImport<JCoverOpenListenerClass, JCoverOpenListener>) end;

  JDrawerClosedListenerClass = interface(JEventListenerClass)
    ['{551CAEF0-B57E-47F6-B996-6F7A56799CEE}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/DrawerClosedListener')]
  JDrawerClosedListener = interface(JEventListener)
    ['{8D5FC70F-7F9A-4550-A5A6-0C0000A2ADC6}']
    procedure onPtrDrawerClosed(P1: JString; P2: JString); cdecl;
  end;
  TJDrawerClosedListener = class(TJavaGenericImport<JDrawerClosedListenerClass, JDrawerClosedListener>) end;

  JDrawerOpenListenerClass = interface(JEventListenerClass)
    ['{6EAD8F1B-5B13-43F4-BB5B-F766E3BFA68F}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/DrawerOpenListener')]
  JDrawerOpenListener = interface(JEventListener)
    ['{0AB457ED-0D27-401A-9C15-2E30EB7AA64B}']
    procedure onPtrDrawerOpen(P1: JString; P2: JString); cdecl;
  end;
  TJDrawerOpenListener = class(TJavaGenericImport<JDrawerOpenListenerClass, JDrawerOpenListener>) end;

  Jeposdevice_printer_ReceiveListenerClass = interface(JEventListenerClass)
    ['{65F46020-9C7A-4F26-B133-68B9DB8B9A86}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/ReceiveListener')]
  Jeposdevice_printer_ReceiveListener = interface(JEventListener)
    ['{8AFEECBA-E870-4732-936E-51D294699F17}']
    procedure onPtrReceive(P1: JString; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
  end;
  TJeposdevice_printer_ReceiveListener = class(TJavaGenericImport<Jeposdevice_printer_ReceiveListenerClass, Jeposdevice_printer_ReceiveListener>) end;

  JJobReceiveListenerClass = interface(Jeposdevice_printer_ReceiveListenerClass)
    ['{718C750A-6AFF-42B3-905F-5347E638476C}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/JobReceiveListener')]
  JJobReceiveListener = interface(Jeposdevice_printer_ReceiveListener)
    ['{540303E5-3D1E-4C2F-8881-76CF2F6932AB}']
    procedure onPtrReceive(P1: JString; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: JString); cdecl;
  end;
  TJJobReceiveListener = class(TJavaGenericImport<JJobReceiveListenerClass, JJobReceiveListener>) end;

  JOfflineListenerClass = interface(JEventListenerClass)
    ['{F5CCCC79-3ED3-427B-AB96-5A9A7E14E097}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/OfflineListener')]
  JOfflineListener = interface(JEventListener)
    ['{C4D10A8D-8F10-4F69-9FD6-0E2CAF9A0566}']
    procedure onPtrOffline(P1: JString; P2: JString); cdecl;
  end;
  TJOfflineListener = class(TJavaGenericImport<JOfflineListenerClass, JOfflineListener>) end;

  JOnlineListenerClass = interface(JEventListenerClass)
    ['{FA961CCD-FE1D-4FCE-A528-A43DD193BD9B}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/OnlineListener')]
  JOnlineListener = interface(JEventListener)
    ['{28C036FB-E283-4AC1-ABCA-380778229869}']
    procedure onPtrOnline(P1: JString; P2: JString); cdecl;
  end;
  TJOnlineListener = class(TJavaGenericImport<JOnlineListenerClass, JOnlineListener>) end;

  JPaperEndListenerClass = interface(JEventListenerClass)
    ['{2F1B6A8C-7961-4E48-ACF7-C119BD68383A}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/PaperEndListener')]
  JPaperEndListener = interface(JEventListener)
    ['{E8C3E692-E148-4C75-8424-BE40314E4649}']
    procedure onPtrPaperEnd(P1: JString; P2: JString); cdecl;
  end;
  TJPaperEndListener = class(TJavaGenericImport<JPaperEndListenerClass, JPaperEndListener>) end;

  JPaperNearEndListenerClass = interface(JEventListenerClass)
    ['{A9A217DE-4B9A-40E9-86C1-509EDFE93236}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/PaperNearEndListener')]
  JPaperNearEndListener = interface(JEventListener)
    ['{A7E94AD6-6FA8-42DA-A250-606C781ED659}']
    procedure onPtrPaperNearEnd(P1: JString; P2: JString); cdecl;
  end;
  TJPaperNearEndListener = class(TJavaGenericImport<JPaperNearEndListenerClass, JPaperNearEndListener>) end;

  JPaperOkListenerClass = interface(JEventListenerClass)
    ['{21F8B5E6-475F-45BB-8D97-EBDF3438D649}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/PaperOkListener')]
  JPaperOkListener = interface(JEventListener)
    ['{A2796833-0857-41D1-A651-3D5AE87BCAEA}']
    procedure onPtrPaperOk(P1: JString; P2: JString); cdecl;
  end;
  TJPaperOkListener = class(TJavaGenericImport<JPaperOkListenerClass, JPaperOkListener>) end;

  JPowerOffListenerClass = interface(JEventListenerClass)
    ['{978B6172-67E9-4E90-B518-F2A84F60B20B}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/PowerOffListener')]
  JPowerOffListener = interface(JEventListener)
    ['{3EF2071C-4A30-4B77-97E8-AB75508048A8}']
    procedure onPtrPowerOff(P1: JString; P2: JString); cdecl;
  end;
  TJPowerOffListener = class(TJavaGenericImport<JPowerOffListenerClass, JPowerOffListener>) end;

  Jprinter_StatusChangeListenerClass = interface(JEventListenerClass)
    ['{B09AC6A2-A3A6-450C-BF80-ACBBAE83564F}']
  end;

  [JavaSignature('com/epson/eposdevice/printer/StatusChangeListener')]
  Jprinter_StatusChangeListener = interface(JEventListener)
    ['{7D709999-9DD9-4924-8953-EE25E0E85FE7}']
    procedure onPtrStatusChange(P1: JString; P2: JString; P3: Integer); cdecl;
  end;
  TJprinter_StatusChangeListener = class(TJavaGenericImport<Jprinter_StatusChangeListenerClass, Jprinter_StatusChangeListener>) end;

  JDataListenerClass = interface(IJavaClass)
    ['{735C1B09-90DD-4880-A2F5-AD40BD06F74B}']
  end;

  [JavaSignature('com/epson/eposdevice/scanner/DataListener')]
  JDataListener = interface(IJavaInstance)
    ['{F616F418-5085-4325-8A1B-458981274689}']
    procedure onScanData(P1: JString; P2: JString; P3: JString); cdecl;
  end;
  TJDataListener = class(TJavaGenericImport<JDataListenerClass, JDataListener>) end;

  JCommandReplayListenerClass = interface(IJavaClass)
    ['{1B340E13-5D54-4815-AE0C-858C30A61621}']
  end;

  [JavaSignature('com/epson/eposdevice/simpleserial/CommandReplayListener')]
  JCommandReplayListener = interface(IJavaInstance)
    ['{98C9C60F-52C5-4562-B4C9-838FF3514273}']
    procedure onSimpleSerialCommandReplay(P1: JString; P2: JString; P3: TJavaArray<Byte>); cdecl;
  end;
  TJCommandReplayListener = class(TJavaGenericImport<JCommandReplayListenerClass, JCommandReplayListener>) end;

  JBatteryLowEventListenerClass = interface(JEventListenerClass)
    ['{04DC309D-B292-4518-A11D-99C49AE7CEAE}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryLowEventListener')]
  JBatteryLowEventListener = interface(JEventListener)
    ['{630A75C9-0E2A-4656-85BF-99554A0F978C}']
    procedure onBatteryLowEvent(P1: JString); cdecl;
  end;
  TJBatteryLowEventListener = class(TJavaGenericImport<JBatteryLowEventListenerClass, JBatteryLowEventListener>) end;

  JBatteryOkEventListenerClass = interface(JEventListenerClass)
    ['{2D37BA9B-32D5-48C6-9B16-5CF23877E6E6}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryOkEventListener')]
  JBatteryOkEventListener = interface(JEventListener)
    ['{DEE24768-D232-4F1A-9AF1-F4831D9E281C}']
    procedure onBatteryOkEvent(P1: JString); cdecl;
  end;
  TJBatteryOkEventListener = class(TJavaGenericImport<JBatteryOkEventListenerClass, JBatteryOkEventListener>) end;

  JBatteryStatusChangeEventListenerClass = interface(JEventListenerClass)
    ['{0374E614-6679-4CA8-8436-02B3BBF06F01}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryStatusChangeEventListener')]
  JBatteryStatusChangeEventListener = interface(JEventListener)
    ['{955CB8EB-CD76-431D-B428-0B3F3E9FE3AA}']
    procedure onBatteryStatusChangeEvent(P1: JString; P2: Integer); cdecl;
  end;
  TJBatteryStatusChangeEventListener = class(TJavaGenericImport<JBatteryStatusChangeEventListenerClass, JBatteryStatusChangeEventListener>) end;

  JBuilderClass = interface(JObjectClass)
    ['{28FB5E88-6694-4F6A-8880-091A22BF8D36}']
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
    ['{A9D3F78F-4BD2-462D-8FDA-002CCED7E6F8}']
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
    ['{1132F4B0-0359-4BC2-9AAA-463EDE01F648}']
  end;

  [JavaSignature('com/epson/eposprint/CoverOkEventListener')]
  JCoverOkEventListener = interface(JEventListener)
    ['{E768BD9E-ECC7-4CD2-A86C-06E04275E4D9}']
    procedure onCoverOkEvent(P1: JString); cdecl;
  end;
  TJCoverOkEventListener = class(TJavaGenericImport<JCoverOkEventListenerClass, JCoverOkEventListener>) end;

  JCoverOpenEventListenerClass = interface(JEventListenerClass)
    ['{858D3496-AF4D-4D56-A85C-18A2916E0293}']
  end;

  [JavaSignature('com/epson/eposprint/CoverOpenEventListener')]
  JCoverOpenEventListener = interface(JEventListener)
    ['{DBB8EE03-B4C1-483C-9B3F-70D1EC748FBE}']
    procedure onCoverOpenEvent(P1: JString); cdecl;
  end;
  TJCoverOpenEventListener = class(TJavaGenericImport<JCoverOpenEventListenerClass, JCoverOpenEventListener>) end;

  JDrawerClosedEventListenerClass = interface(JEventListenerClass)
    ['{ED4B55CE-0414-4FB2-A4EA-7BBEE9BC35FE}']
  end;

  [JavaSignature('com/epson/eposprint/DrawerClosedEventListener')]
  JDrawerClosedEventListener = interface(JEventListener)
    ['{962D587F-E3CA-4847-AB70-F5CF5D42A2B1}']
    procedure onDrawerClosedEvent(P1: JString); cdecl;
  end;
  TJDrawerClosedEventListener = class(TJavaGenericImport<JDrawerClosedEventListenerClass, JDrawerClosedEventListener>) end;

  JDrawerOpenEventListenerClass = interface(JEventListenerClass)
    ['{D2A90CAD-A9A2-4974-9AA4-56BA486A8AD6}']
  end;

  [JavaSignature('com/epson/eposprint/DrawerOpenEventListener')]
  JDrawerOpenEventListener = interface(JEventListener)
    ['{416C1D67-E778-4DF4-9030-F0D3E178311E}']
    procedure onDrawerOpenEvent(P1: JString); cdecl;
  end;
  TJDrawerOpenEventListener = class(TJavaGenericImport<JDrawerOpenEventListenerClass, JDrawerOpenEventListener>) end;

  Jeposprint_EposExceptionClass = interface(JExceptionClass)
    ['{03612A0D-732A-4308-BC14-D46375CE1577}']
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
    ['{2D699760-7483-4592-AD03-6920052CC56E}']
    function getBatteryStatus: Integer; cdecl;
    function getErrorStatus: Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
  end;
  TJeposprint_EposException = class(TJavaGenericImport<Jeposprint_EposExceptionClass, Jeposprint_EposException>) end;

  Jeposprint_LogClass = interface(JObjectClass)
    ['{B6DEE1BB-B986-41BB-9A4B-06EF21C1CC94}']
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
    ['{256E1633-F3B0-438D-9223-A5A2EC869352}']
  end;
  TJeposprint_Log = class(TJavaGenericImport<Jeposprint_LogClass, Jeposprint_Log>) end;

  JOfflineEventListenerClass = interface(JEventListenerClass)
    ['{836E5B2D-FE86-42AF-9E1A-18B0516C05A6}']
  end;

  [JavaSignature('com/epson/eposprint/OfflineEventListener')]
  JOfflineEventListener = interface(JEventListener)
    ['{923A14F0-F08E-46F2-BB19-F85B8C02E781}']
    procedure onOfflineEvent(P1: JString); cdecl;
  end;
  TJOfflineEventListener = class(TJavaGenericImport<JOfflineEventListenerClass, JOfflineEventListener>) end;

  JOnlineEventListenerClass = interface(JEventListenerClass)
    ['{AD84FAA4-E74A-4AD6-9D82-725945E03485}']
  end;

  [JavaSignature('com/epson/eposprint/OnlineEventListener')]
  JOnlineEventListener = interface(JEventListener)
    ['{85E7C505-608B-4C46-A55F-94F418120191}']
    procedure onOnlineEvent(P1: JString); cdecl;
  end;
  TJOnlineEventListener = class(TJavaGenericImport<JOnlineEventListenerClass, JOnlineEventListener>) end;

  JPaperEndEventListenerClass = interface(JEventListenerClass)
    ['{5D715015-8075-4EE3-901B-1A701FCF698F}']
  end;

  [JavaSignature('com/epson/eposprint/PaperEndEventListener')]
  JPaperEndEventListener = interface(JEventListener)
    ['{AE109032-5CCB-4F75-8E7A-A9D595FB4494}']
    procedure onPaperEndEvent(P1: JString); cdecl;
  end;
  TJPaperEndEventListener = class(TJavaGenericImport<JPaperEndEventListenerClass, JPaperEndEventListener>) end;

  JPaperNearEndEventListenerClass = interface(JEventListenerClass)
    ['{FAD3D9FB-5F35-458A-92DB-3664BAFE49B0}']
  end;

  [JavaSignature('com/epson/eposprint/PaperNearEndEventListener')]
  JPaperNearEndEventListener = interface(JEventListener)
    ['{1D8E79AF-CAC1-42B3-AABC-5B4539D03FE6}']
    procedure onPaperNearEndEvent(P1: JString); cdecl;
  end;
  TJPaperNearEndEventListener = class(TJavaGenericImport<JPaperNearEndEventListenerClass, JPaperNearEndEventListener>) end;

  JPaperOkEventListenerClass = interface(JEventListenerClass)
    ['{2523BC38-6CCE-4D48-90C5-E8FE4457B898}']
  end;

  [JavaSignature('com/epson/eposprint/PaperOkEventListener')]
  JPaperOkEventListener = interface(JEventListener)
    ['{EDB8C11A-5276-4868-9A9D-8672C19F9261}']
    procedure onPaperOkEvent(P1: JString); cdecl;
  end;
  TJPaperOkEventListener = class(TJavaGenericImport<JPaperOkEventListenerClass, JPaperOkEventListener>) end;

  JPowerOffEventListenerClass = interface(JEventListenerClass)
    ['{6CE249E2-289E-4319-8E06-CFC7091C35AB}']
  end;

  [JavaSignature('com/epson/eposprint/PowerOffEventListener')]
  JPowerOffEventListener = interface(JEventListener)
    ['{7E8ADC76-5289-4055-BD0F-07767A9F2CF9}']
    procedure onPowerOffEvent(P1: JString); cdecl;
  end;
  TJPowerOffEventListener = class(TJavaGenericImport<JPowerOffEventListenerClass, JPowerOffEventListener>) end;

  JPrintClass = interface(JObjectClass)
    ['{FC1DE628-912E-42D5-93A2-AB237E5EA541}']
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
    ['{FB257A7C-A2DF-4655-91C7-D2FE1E11D5DF}']
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
    ['{2475CA32-4826-4F1C-B36E-9FD8624FB798}']
  end;

  [JavaSignature('com/epson/eposprint/StatusChangeEventListener')]
  JStatusChangeEventListener = interface(JEventListener)
    ['{0CE0F13B-3CC0-4E92-81EC-41D429D5864F}']
    procedure onStatusChangeEvent(P1: JString; P2: Integer); cdecl;
  end;
  TJStatusChangeEventListener = class(TJavaGenericImport<JStatusChangeEventListenerClass, JStatusChangeEventListener>) end;

  JDevTypeClass = interface(JObjectClass)
    ['{F1FAE646-F064-45A7-9C2D-3EAE9B276162}']
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
    ['{0960611F-C3A8-42C8-916F-D2DC7538DF8F}']
  end;
  TJDevType = class(TJavaGenericImport<JDevTypeClass, JDevType>) end;

  Jepsonio_DeviceInfoClass = interface(JObjectClass)
    ['{93EEB346-D2A3-4879-A77C-78228EA563FA}']
    {class} function init(P1: Integer; P2: JString; P3: JString; P4: JString; P5: JString): Jepsonio_DeviceInfo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/DeviceInfo')]
  Jepsonio_DeviceInfo = interface(JObject)
    ['{E5D860F4-6088-4484-AC51-8AA682BCED85}']
    function getDeviceName: JString; cdecl;
    function getDeviceType: Integer; cdecl;
    function getIpAddress: JString; cdecl;
    function getMacAddress: JString; cdecl;
    function getPrinterName: JString; cdecl;
  end;
  TJepsonio_DeviceInfo = class(TJavaGenericImport<Jepsonio_DeviceInfoClass, Jepsonio_DeviceInfo>) end;

  JEpsonIoClass = interface(JObjectClass)
    ['{AB02BA31-9734-4461-B86C-ED173992D625}']
    {class} function init: JEpsonIo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/EpsonIo')]
  JEpsonIo = interface(JObject)
    ['{45EC69E7-3307-400B-A837-17634270F13A}']
    procedure close; cdecl;
    procedure open(P1: Integer; P2: JString; P3: JString); cdecl; overload;
    procedure open(P1: Integer; P2: JString; P3: JString; P4: JContext); cdecl; overload;
    function read(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
    function write(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
  end;
  TJEpsonIo = class(TJavaGenericImport<JEpsonIoClass, JEpsonIo>) end;

  JEpsonIoExceptionClass = interface(JExceptionClass)
    ['{38559348-80B2-48B2-9671-5254684CC817}']
    {class} function init(P1: Integer): JEpsonIoException; cdecl; overload;
    {class} function init(P1: JString; P2: JThrowable): JEpsonIoException; cdecl; overload;
  end;

  [JavaSignature('com/epson/epsonio/EpsonIoException')]
  JEpsonIoException = interface(JException)
    ['{6C77D60F-CCEA-4225-B850-EA755EBB7E57}']
    function getStatus: Integer; cdecl;
    procedure setStatus(P1: Integer); cdecl;
  end;
  TJEpsonIoException = class(TJavaGenericImport<JEpsonIoExceptionClass, JEpsonIoException>) end;

  Jepsonio_FilterOptionClass = interface(JObjectClass)
    ['{B6DC0816-D1DA-4A5E-93A0-3B9C77439A3B}']
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
    ['{70C07ED6-F4EC-41C1-94EA-530FE7AC2CB7}']
  end;
  TJepsonio_FilterOption = class(TJavaGenericImport<Jepsonio_FilterOptionClass, Jepsonio_FilterOption>) end;

  JFinderClass = interface(JObjectClass)
    ['{2ADEF7D9-61A0-451E-B9A8-4E9285BFAAD2}']
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
    ['{969923C5-3DCA-4B97-9338-BC6A75681888}']
  end;
  TJFinder = class(TJavaGenericImport<JFinderClass, JFinder>) end;

  JIoStatusClass = interface(JObjectClass)
    ['{0F6D6DA9-B9DE-468B-9D0D-08AC6F63DE4D}']
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
    ['{16263D94-976C-4723-8443-F07E3BEFCF48}']
  end;
  TJIoStatus = class(TJavaGenericImport<JIoStatusClass, JIoStatus>) end;

  JNetIFInfoClass = interface(JObjectClass)
    ['{6DFE65E7-64B6-49A2-AB88-2940337658CB}']
    {class} function getNetInfoList(P1: Integer): TJavaObjectArray<JNetIfResult>; cdecl;
    {class} function getNetInfoNum(P1: TJavaArray<Integer>): Integer; cdecl;
    {class} function init: JNetIFInfo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/NetIFInfo')]
  JNetIFInfo = interface(JObject)
    ['{1717C9A9-B478-4E40-9F61-136527517AB9}']
  end;
  TJNetIFInfo = class(TJavaGenericImport<JNetIFInfoClass, JNetIFInfo>) end;

  JNetIfResultClass = interface(JObjectClass)
    ['{E3672D61-91FA-4B41-918D-C08298A0E0C9}']
    {class} function init: JNetIfResult; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/NetIfResult')]
  JNetIfResult = interface(JObject)
    ['{0C33B4B6-8D22-4BF2-8BEB-7CB84E413F6F}']
    function _GetipAddress: TJavaArray<Byte>;
    procedure _SetipAddress(Value: TJavaArray<Byte>);
    function _GetmacAddress: TJavaArray<Byte>;
    procedure _SetmacAddress(Value: TJavaArray<Byte>);
    property ipAddress: TJavaArray<Byte> read _GetipAddress write _SetipAddress;
    property macAddress: TJavaArray<Byte> read _GetmacAddress write _SetmacAddress;
  end;
  TJNetIfResult = class(TJavaGenericImport<JNetIfResultClass, JNetIfResult>) end;

  JSupportUsbClass = interface(JObjectClass)
    ['{63059A4B-D7C7-40B4-AD61-81B66C20DEFD}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<Jepsonio_DeviceInfo>; cdecl;
    {class} function init: JSupportUsb; cdecl;
    {class} function isSupport: JBoolean; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/SupportUsb')]
  JSupportUsb = interface(JObject)
    ['{94658FAC-78BC-4D22-A0AA-405D52E1978C}']
  end;
  TJSupportUsb = class(TJavaGenericImport<JSupportUsbClass, JSupportUsb>) end;

  JAdapterHandlerClass = interface(JHandlerClass)
    ['{57CE5277-C999-4BAF-AB43-318E06DE55FA}']
    {class} function init: JAdapterHandler; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/AdapterHandler')]
  JAdapterHandler = interface(JHandler)
    ['{64D7F292-626E-47BF-B644-62F48419E9F9}']
    function getAdapter: JBluetoothAdapter; cdecl;
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJAdapterHandler = class(TJavaGenericImport<JAdapterHandlerClass, JAdapterHandler>) end;

  JDevBtClass = interface(JObjectClass)
    ['{7741A7A3-BD8D-4947-8049-B2169AC661A6}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<Jepsonio_DeviceInfo>; cdecl;
    {class} function init: JDevBt; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt')]
  JDevBt = interface(JObject)
    ['{907AA42D-BF9A-4D6F-A131-B3CBA38116C9}']
  end;
  TJDevBt = class(TJavaGenericImport<JDevBtClass, JDevBt>) end;

  JDevBt_1Class = interface(JBroadcastReceiverClass)
    ['{96034F06-4253-4032-8571-E7890EAABC58}']
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt$1')]
  JDevBt_1 = interface(JBroadcastReceiver)
    ['{E13F0F2F-EB31-4483-981D-DF8F749C6D55}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJDevBt_1 = class(TJavaGenericImport<JDevBt_1Class, JDevBt_1>) end;

  JDevBt_2Class = interface(JHandlerClass)
    ['{C4830778-A862-4A3B-B9F6-A30B44AFEEEA}']
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt$2')]
  JDevBt_2 = interface(JHandler)
    ['{A36B4576-47A1-4AE2-B858-FFB0E32E9BA7}']
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJDevBt_2 = class(TJavaGenericImport<JDevBt_2Class, JDevBt_2>) end;

  JNetBtClass = interface(JObjectClass)
    ['{46632412-00A2-46B3-B912-403A03D152DF}']
    {class} function close(P1: Integer): Integer; cdecl;
    {class} function init: JNetBt; cdecl;
    {class} function kill(P1: Integer): Integer; cdecl;
    {class} function open(P1: JString; P2: JString; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function read(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function write(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/NetBt')]
  JNetBt = interface(JObject)
    ['{6B345BE8-55BA-4585-BC8D-B4CFE61E0527}']
  end;
  TJNetBt = class(TJavaGenericImport<JNetBtClass, JNetBt>) end;

  JDevUsbClass = interface(JObjectClass)
    ['{7F5F08DC-7299-4178-84E9-BC5AE355CCD3}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<Jepsonio_DeviceInfo>; cdecl;
    {class} function init: JDevUsb; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb')]
  JDevUsb = interface(JObject)
    ['{F1A7A98E-6EC0-4473-88E4-4F9379CD0597}']
  end;
  TJDevUsb = class(TJavaGenericImport<JDevUsbClass, JDevUsb>) end;

  JDevUsb_1Class = interface(JBroadcastReceiverClass)
    ['{B11118AC-2CB9-4768-921F-459F61475946}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$1')]
  JDevUsb_1 = interface(JBroadcastReceiver)
    ['{C58627A3-EB42-41D6-B1C6-9B460D705C6E}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJDevUsb_1 = class(TJavaGenericImport<JDevUsb_1Class, JDevUsb_1>) end;

  JDevUsb_2Class = interface(JObjectClass)
    ['{0E9CBE59-DBF4-4CFF-BC33-BE394DE8A199}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$2')]
  JDevUsb_2 = interface(JObject)
    ['{58A4DC36-0BDA-429F-8B1D-0BEAEDADA61C}']
    procedure run; cdecl;
  end;
  TJDevUsb_2 = class(TJavaGenericImport<JDevUsb_2Class, JDevUsb_2>) end;

  JDevUsb_3Class = interface(JHandlerClass)
    ['{E7E7ABC7-1813-49FC-A0F9-1797A0945B24}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$3')]
  JDevUsb_3 = interface(JHandler)
    ['{8F28FB0A-FDD6-4529-9A3D-70B9997C6299}']
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJDevUsb_3 = class(TJavaGenericImport<JDevUsb_3Class, JDevUsb_3>) end;

  JNetUsbClass = interface(JObjectClass)
    ['{C51448DD-7473-41D0-B766-C2CE801FDCDB}']
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
    ['{EDE285E8-8A89-4D2D-8A64-346B1C50C0AF}']
  end;
  TJNetUsb = class(TJavaGenericImport<JNetUsbClass, JNetUsb>) end;

  JUsbConnecterClass = interface(JObjectClass)
    ['{7BEFEE96-129D-4215-95A4-D2F1E1909F50}']
    {class} function init: JUsbConnecter; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/usb/UsbConnecter')]
  JUsbConnecter = interface(JObject)
    ['{FB71BC7B-4FB2-4E69-AA47-574E55A1899A}']
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
  TRegTypes.RegisterType('Android.JNI.ePOS2.JUsbAccessory', TypeInfo(Android.JNI.ePOS2.JUsbAccessory));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JUsbDevice', TypeInfo(Android.JNI.ePOS2.JUsbDevice));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JUsbDeviceConnection', TypeInfo(Android.JNI.ePOS2.JUsbDeviceConnection));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JUsbEndpoint', TypeInfo(Android.JNI.ePOS2.JUsbEndpoint));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JUsbInterface', TypeInfo(Android.JNI.ePOS2.JUsbInterface));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JUsbManager', TypeInfo(Android.JNI.ePOS2.JUsbManager));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JUsbRequest', TypeInfo(Android.JNI.ePOS2.JUsbRequest));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jepos2_BuildConfig', TypeInfo(Android.JNI.ePOS2.Jepos2_BuildConfig));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JEventListener', TypeInfo(Android.JNI.ePOS2.JEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JConnectionListener', TypeInfo(Android.JNI.ePOS2.JConnectionListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JEpos2CallbackCode', TypeInfo(Android.JNI.ePOS2.JEpos2CallbackCode));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JEpos2Exception', TypeInfo(Android.JNI.ePOS2.JEpos2Exception));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jepos2_Log', TypeInfo(Android.JNI.ePOS2.Jepos2_Log));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeInitializer', TypeInfo(Android.JNI.ePOS2.JNativeInitializer));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JOutputLog', TypeInfo(Android.JNI.ePOS2.JOutputLog));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JBarcodeScanner', TypeInfo(Android.JNI.ePOS2.JBarcodeScanner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JScanListener', TypeInfo(Android.JNI.ePOS2.JScanListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JScannerStatusInfo', TypeInfo(Android.JNI.ePOS2.JScannerStatusInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBox', TypeInfo(Android.JNI.ePOS2.JCommBox));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBox_CommBoxHistoryCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JCommBox_CommBoxHistoryCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBox_CommBoxSendMessageCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JCommBox_CommBoxSendMessageCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBoxStatusInfo', TypeInfo(Android.JNI.ePOS2.JCommBoxStatusInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JGetCommHistoryCallback', TypeInfo(Android.JNI.ePOS2.JGetCommHistoryCallback));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JReceiveListener', TypeInfo(Android.JNI.ePOS2.JReceiveListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JSendMessageCallback', TypeInfo(Android.JNI.ePOS2.JSendMessageCallback));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInfo', TypeInfo(Android.JNI.ePOS2.JDeviceInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDiscovery', TypeInfo(Android.JNI.ePOS2.JDiscovery));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDiscoveryListener', TypeInfo(Android.JNI.ePOS2.JDiscoveryListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JFilterOption', TypeInfo(Android.JNI.ePOS2.JFilterOption));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JKeyPressListener', TypeInfo(Android.JNI.ePOS2.JKeyPressListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jkeyboard_Keyboard', TypeInfo(Android.JNI.ePOS2.Jkeyboard_Keyboard));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JKeyboardStatusInfo', TypeInfo(Android.JNI.ePOS2.JKeyboardStatusInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JReadStringListener', TypeInfo(Android.JNI.ePOS2.JReadStringListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDisplayStatusInfo', TypeInfo(Android.JNI.ePOS2.JDisplayStatusInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JLineDisplay', TypeInfo(Android.JNI.ePOS2.JLineDisplay));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jlinedisplay_ReceiveListener', TypeInfo(Android.JNI.ePOS2.Jlinedisplay_ReceiveListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JLogoKeyCode', TypeInfo(Android.JNI.ePOS2.JLogoKeyCode));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jprinter_Printer', TypeInfo(Android.JNI.ePOS2.Jprinter_Printer));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPrinterStatusInfo', TypeInfo(Android.JNI.ePOS2.JPrinterStatusInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jprinter_ReceiveListener', TypeInfo(Android.JNI.ePOS2.Jprinter_ReceiveListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JStatusChangeListener', TypeInfo(Android.JNI.ePOS2.JStatusChangeListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jsimpleserial_ReceiveListener', TypeInfo(Android.JNI.ePOS2.Jsimpleserial_ReceiveListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JSerialStatusInfo', TypeInfo(Android.JNI.ePOS2.JSerialStatusInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JSimpleSerial', TypeInfo(Android.JNI.ePOS2.JSimpleSerial));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JConnectListener', TypeInfo(Android.JNI.ePOS2.JConnectListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCreateDeviceListener', TypeInfo(Android.JNI.ePOS2.JCreateDeviceListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeleteDeviceListener', TypeInfo(Android.JNI.ePOS2.JDeleteDeviceListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeDevice', TypeInfo(Android.JNI.ePOS2.JNativeDevice));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevice', TypeInfo(Android.JNI.ePOS2.JDevice));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevice_ConnectCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JDevice_ConnectCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevice_CreateDeviceCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JDevice_CreateDeviceCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevice_DeleteDeviceCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JDevice_DeleteDeviceCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeCommBoxManager', TypeInfo(Android.JNI.ePOS2.JNativeCommBoxManager));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBoxManager', TypeInfo(Android.JNI.ePOS2.JCommBoxManager));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement_CommBoxManagerInner', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement_CommBoxManagerInner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeCommBox', TypeInfo(Android.JNI.ePOS2.JNativeCommBox));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jcommbox_CommBox', TypeInfo(Android.JNI.ePOS2.Jcommbox_CommBox));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBoxManager_CommBoxAccessor', TypeInfo(Android.JNI.ePOS2.JCommBoxManager_CommBoxAccessor));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBoxManagerInner_CommBoxInner', TypeInfo(Android.JNI.ePOS2.JCommBoxManagerInner_CommBoxInner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeDisplay', TypeInfo(Android.JNI.ePOS2.JNativeDisplay));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jdisplay_Display', TypeInfo(Android.JNI.ePOS2.Jdisplay_Display));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement_DisplayInner', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement_DisplayInner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement_IHandleObject', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement_IHandleObject));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement_IDeviceObject', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement_IDeviceObject));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeKeyboard', TypeInfo(Android.JNI.ePOS2.JNativeKeyboard));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jeposdevice_keyboard_Keyboard', TypeInfo(Android.JNI.ePOS2.Jeposdevice_keyboard_Keyboard));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement_KeyboardInner', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement_KeyboardInner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativePrinter', TypeInfo(Android.JNI.ePOS2.JNativePrinter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jeposdevice_printer_Printer', TypeInfo(Android.JNI.ePOS2.Jeposdevice_printer_Printer));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement_PrinterInner', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement_PrinterInner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeScanner', TypeInfo(Android.JNI.ePOS2.JNativeScanner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jscanner_Scanner', TypeInfo(Android.JNI.ePOS2.Jscanner_Scanner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement_ScannerInner', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement_ScannerInner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeSimpleSerial', TypeInfo(Android.JNI.ePOS2.JNativeSimpleSerial));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jsimpleserial_SimpleSerial', TypeInfo(Android.JNI.ePOS2.Jsimpleserial_SimpleSerial));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDeviceInnerImplement_SimpleSerialInner', TypeInfo(Android.JNI.ePOS2.JDeviceInnerImplement_SimpleSerialInner));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDisconnectListener', TypeInfo(Android.JNI.ePOS2.JDisconnectListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JEposCallbackCode', TypeInfo(Android.JNI.ePOS2.JEposCallbackCode));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JEposException', TypeInfo(Android.JNI.ePOS2.JEposException));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jeposdevice_Log', TypeInfo(Android.JNI.ePOS2.Jeposdevice_Log));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeDevice_NativeConnectCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JNativeDevice_NativeConnectCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeDevice_NativeCreateDeviceCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JNativeDevice_NativeCreateDeviceCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeDevice_NativeDeleteDeviceCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JNativeDevice_NativeDeleteDeviceCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JReconnectListener', TypeInfo(Android.JNI.ePOS2.JReconnectListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JReconnectingListener', TypeInfo(Android.JNI.ePOS2.JReconnectingListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCloseCommBoxListener', TypeInfo(Android.JNI.ePOS2.JCloseCommBoxListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jcommbox_CommBox_CommBoxHistoryCallbackAdapter', TypeInfo(Android.JNI.ePOS2.Jcommbox_CommBox_CommBoxHistoryCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBox_CommBoxSendDataCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JCommBox_CommBoxSendDataCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBoxManager_CloseCommBoxCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JCommBoxManager_CloseCommBoxCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommBoxManager_OpenCommBoxCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JCommBoxManager_OpenCommBoxCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JGetCommHistoryListener', TypeInfo(Android.JNI.ePOS2.JGetCommHistoryListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeCommBox_NativeCommBoxHistoryCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JNativeCommBox_NativeCommBoxHistoryCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeCommBox_NativeCommBoxSendDataCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JNativeCommBox_NativeCommBoxSendDataCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JNativeCommBoxManager_NativeCloseCommBoxCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter', TypeInfo(Android.JNI.ePOS2.JNativeCommBoxManager_NativeOpenCommBoxCallbackAdapter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JOpenCommBoxListener', TypeInfo(Android.JNI.ePOS2.JOpenCommBoxListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jcommbox_ReceiveListener', TypeInfo(Android.JNI.ePOS2.Jcommbox_ReceiveListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JSendDataListener', TypeInfo(Android.JNI.ePOS2.JSendDataListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jdisplay_ReceiveListener', TypeInfo(Android.JNI.ePOS2.Jdisplay_ReceiveListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jkeyboard_KeyPressListener', TypeInfo(Android.JNI.ePOS2.Jkeyboard_KeyPressListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JStringListener', TypeInfo(Android.JNI.ePOS2.JStringListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JBatteryLowListener', TypeInfo(Android.JNI.ePOS2.JBatteryLowListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JBatteryOkListener', TypeInfo(Android.JNI.ePOS2.JBatteryOkListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JBatteryStatusChangeListener', TypeInfo(Android.JNI.ePOS2.JBatteryStatusChangeListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCoverOkListener', TypeInfo(Android.JNI.ePOS2.JCoverOkListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCoverOpenListener', TypeInfo(Android.JNI.ePOS2.JCoverOpenListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDrawerClosedListener', TypeInfo(Android.JNI.ePOS2.JDrawerClosedListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDrawerOpenListener', TypeInfo(Android.JNI.ePOS2.JDrawerOpenListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jeposdevice_printer_ReceiveListener', TypeInfo(Android.JNI.ePOS2.Jeposdevice_printer_ReceiveListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JJobReceiveListener', TypeInfo(Android.JNI.ePOS2.JJobReceiveListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JOfflineListener', TypeInfo(Android.JNI.ePOS2.JOfflineListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JOnlineListener', TypeInfo(Android.JNI.ePOS2.JOnlineListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPaperEndListener', TypeInfo(Android.JNI.ePOS2.JPaperEndListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPaperNearEndListener', TypeInfo(Android.JNI.ePOS2.JPaperNearEndListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPaperOkListener', TypeInfo(Android.JNI.ePOS2.JPaperOkListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPowerOffListener', TypeInfo(Android.JNI.ePOS2.JPowerOffListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jprinter_StatusChangeListener', TypeInfo(Android.JNI.ePOS2.Jprinter_StatusChangeListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDataListener', TypeInfo(Android.JNI.ePOS2.JDataListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCommandReplayListener', TypeInfo(Android.JNI.ePOS2.JCommandReplayListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JBatteryLowEventListener', TypeInfo(Android.JNI.ePOS2.JBatteryLowEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JBatteryOkEventListener', TypeInfo(Android.JNI.ePOS2.JBatteryOkEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JBatteryStatusChangeEventListener', TypeInfo(Android.JNI.ePOS2.JBatteryStatusChangeEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JBuilder', TypeInfo(Android.JNI.ePOS2.JBuilder));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCoverOkEventListener', TypeInfo(Android.JNI.ePOS2.JCoverOkEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JCoverOpenEventListener', TypeInfo(Android.JNI.ePOS2.JCoverOpenEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDrawerClosedEventListener', TypeInfo(Android.JNI.ePOS2.JDrawerClosedEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDrawerOpenEventListener', TypeInfo(Android.JNI.ePOS2.JDrawerOpenEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jeposprint_EposException', TypeInfo(Android.JNI.ePOS2.Jeposprint_EposException));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jeposprint_Log', TypeInfo(Android.JNI.ePOS2.Jeposprint_Log));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JOfflineEventListener', TypeInfo(Android.JNI.ePOS2.JOfflineEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JOnlineEventListener', TypeInfo(Android.JNI.ePOS2.JOnlineEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPaperEndEventListener', TypeInfo(Android.JNI.ePOS2.JPaperEndEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPaperNearEndEventListener', TypeInfo(Android.JNI.ePOS2.JPaperNearEndEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPaperOkEventListener', TypeInfo(Android.JNI.ePOS2.JPaperOkEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPowerOffEventListener', TypeInfo(Android.JNI.ePOS2.JPowerOffEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JPrint', TypeInfo(Android.JNI.ePOS2.JPrint));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JStatusChangeEventListener', TypeInfo(Android.JNI.ePOS2.JStatusChangeEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevType', TypeInfo(Android.JNI.ePOS2.JDevType));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jepsonio_DeviceInfo', TypeInfo(Android.JNI.ePOS2.Jepsonio_DeviceInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JEpsonIo', TypeInfo(Android.JNI.ePOS2.JEpsonIo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JEpsonIoException', TypeInfo(Android.JNI.ePOS2.JEpsonIoException));
  TRegTypes.RegisterType('Android.JNI.ePOS2.Jepsonio_FilterOption', TypeInfo(Android.JNI.ePOS2.Jepsonio_FilterOption));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JFinder', TypeInfo(Android.JNI.ePOS2.JFinder));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JIoStatus', TypeInfo(Android.JNI.ePOS2.JIoStatus));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNetIFInfo', TypeInfo(Android.JNI.ePOS2.JNetIFInfo));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNetIfResult', TypeInfo(Android.JNI.ePOS2.JNetIfResult));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JSupportUsb', TypeInfo(Android.JNI.ePOS2.JSupportUsb));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JAdapterHandler', TypeInfo(Android.JNI.ePOS2.JAdapterHandler));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevBt', TypeInfo(Android.JNI.ePOS2.JDevBt));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevBt_1', TypeInfo(Android.JNI.ePOS2.JDevBt_1));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevBt_2', TypeInfo(Android.JNI.ePOS2.JDevBt_2));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNetBt', TypeInfo(Android.JNI.ePOS2.JNetBt));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevUsb', TypeInfo(Android.JNI.ePOS2.JDevUsb));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevUsb_1', TypeInfo(Android.JNI.ePOS2.JDevUsb_1));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevUsb_2', TypeInfo(Android.JNI.ePOS2.JDevUsb_2));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JDevUsb_3', TypeInfo(Android.JNI.ePOS2.JDevUsb_3));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JNetUsb', TypeInfo(Android.JNI.ePOS2.JNetUsb));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JUsbConnecter', TypeInfo(Android.JNI.ePOS2.JUsbConnecter));
  TRegTypes.RegisterType('Android.JNI.ePOS2.JVector', TypeInfo(Android.JNI.ePOS2.JVector));
end;

initialization
  RegisterTypes;
end.


