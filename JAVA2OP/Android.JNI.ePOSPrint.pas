{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit Android.JNI.ePOSPrint;

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
  JEventListener = interface;//java.util.EventListener
  JBatteryLowEventListener = interface;//com.epson.eposprint.BatteryLowEventListener
  JBatteryOkEventListener = interface;//com.epson.eposprint.BatteryOkEventListener
  JBatteryStatusChangeEventListener = interface;//com.epson.eposprint.BatteryStatusChangeEventListener
  JBuilder = interface;//com.epson.eposprint.Builder
  JCoverOkEventListener = interface;//com.epson.eposprint.CoverOkEventListener
  JCoverOpenEventListener = interface;//com.epson.eposprint.CoverOpenEventListener
  JDrawerClosedEventListener = interface;//com.epson.eposprint.DrawerClosedEventListener
  JDrawerOpenEventListener = interface;//com.epson.eposprint.DrawerOpenEventListener
  JEposException = interface;//com.epson.eposprint.EposException
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
  JDeviceInfo = interface;//com.epson.epsonio.DeviceInfo
  JEpsonIo = interface;//com.epson.epsonio.EpsonIo
  JEpsonIoException = interface;//com.epson.epsonio.EpsonIoException
  JFilterOption = interface;//com.epson.epsonio.FilterOption
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

  JEventListenerClass = interface(IJavaClass)
    ['{48BD1D07-BCE3-4F68-982B-617B523C7116}']
  end;

  [JavaSignature('java/util/EventListener')]
  JEventListener = interface(IJavaInstance)
    ['{D9ADB67A-5217-4762-9961-710BF18CAD39}']
  end;
  TJEventListener = class(TJavaGenericImport<JEventListenerClass, JEventListener>) end;

  JBatteryLowEventListenerClass = interface(JEventListenerClass)
    ['{2A9E0564-8DBD-4551-859A-BE39402F99EC}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryLowEventListener')]
  JBatteryLowEventListener = interface(JEventListener)
    ['{24D44DB8-F444-4C6F-B39C-F90BA6A87A0F}']
    procedure onBatteryLowEvent(P1: JString); cdecl;
  end;
  TJBatteryLowEventListener = class(TJavaGenericImport<JBatteryLowEventListenerClass, JBatteryLowEventListener>) end;

  JBatteryOkEventListenerClass = interface(JEventListenerClass)
    ['{6DC51E74-AD7C-414D-B482-E8CC73F48926}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryOkEventListener')]
  JBatteryOkEventListener = interface(JEventListener)
    ['{ADFF4F1A-5C76-4114-B209-D68C0030048F}']
    procedure onBatteryOkEvent(P1: JString); cdecl;
  end;
  TJBatteryOkEventListener = class(TJavaGenericImport<JBatteryOkEventListenerClass, JBatteryOkEventListener>) end;

  JBatteryStatusChangeEventListenerClass = interface(JEventListenerClass)
    ['{BA0C517B-61F8-4BA9-BEBE-18A6023D51C9}']
  end;

  [JavaSignature('com/epson/eposprint/BatteryStatusChangeEventListener')]
  JBatteryStatusChangeEventListener = interface(JEventListener)
    ['{ACCE813D-3347-428D-A621-8D55D6CEDC73}']
    procedure onBatteryStatusChangeEvent(P1: JString; P2: Integer); cdecl;
  end;
  TJBatteryStatusChangeEventListener = class(TJavaGenericImport<JBatteryStatusChangeEventListenerClass, JBatteryStatusChangeEventListener>) end;

  JBuilderClass = interface(JObjectClass)
    ['{E5EAC146-60D0-4D31-A1B4-CCEF43957CAC}']
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
    ['{4110A333-725A-47A2-9B2D-D2F9B32B1BFC}']
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
    ['{569F9536-8A79-4E07-948D-2BE1DC223EF3}']
  end;

  [JavaSignature('com/epson/eposprint/CoverOkEventListener')]
  JCoverOkEventListener = interface(JEventListener)
    ['{399DCDAB-3297-4044-9CC0-A8C665F69527}']
    procedure onCoverOkEvent(P1: JString); cdecl;
  end;
  TJCoverOkEventListener = class(TJavaGenericImport<JCoverOkEventListenerClass, JCoverOkEventListener>) end;

  JCoverOpenEventListenerClass = interface(JEventListenerClass)
    ['{6E2C555C-E6B2-4A42-8D91-ACD619239714}']
  end;

  [JavaSignature('com/epson/eposprint/CoverOpenEventListener')]
  JCoverOpenEventListener = interface(JEventListener)
    ['{31B86977-F525-4C77-80A5-83A5076D1D8E}']
    procedure onCoverOpenEvent(P1: JString); cdecl;
  end;
  TJCoverOpenEventListener = class(TJavaGenericImport<JCoverOpenEventListenerClass, JCoverOpenEventListener>) end;

  JDrawerClosedEventListenerClass = interface(JEventListenerClass)
    ['{0440DEB2-8150-4059-B1C4-5F4DA0A72D8A}']
  end;

  [JavaSignature('com/epson/eposprint/DrawerClosedEventListener')]
  JDrawerClosedEventListener = interface(JEventListener)
    ['{94567C08-58A8-4D63-8558-F27A05D9A4E7}']
    procedure onDrawerClosedEvent(P1: JString); cdecl;
  end;
  TJDrawerClosedEventListener = class(TJavaGenericImport<JDrawerClosedEventListenerClass, JDrawerClosedEventListener>) end;

  JDrawerOpenEventListenerClass = interface(JEventListenerClass)
    ['{0DEACDA4-CEC7-435C-949D-941181C347B5}']
  end;

  [JavaSignature('com/epson/eposprint/DrawerOpenEventListener')]
  JDrawerOpenEventListener = interface(JEventListener)
    ['{41A2CAB7-CADC-4336-844B-4FBBA7AEAB32}']
    procedure onDrawerOpenEvent(P1: JString); cdecl;
  end;
  TJDrawerOpenEventListener = class(TJavaGenericImport<JDrawerOpenEventListenerClass, JDrawerOpenEventListener>) end;

  JEposExceptionClass = interface(JExceptionClass)
    ['{1CBD5235-4916-4D8B-AB44-1ADF66BCB5D7}']
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
    {class} function init(P1: Integer): JEposException; cdecl; overload;
    {class} function init(P1: JString; P2: JThrowable): JEposException; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer): JEposException; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer; P3: Integer): JEposException; cdecl; overload;
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
  JEposException = interface(JException)
    ['{611AF68F-1AD3-4F31-AAF7-08F01E7A881E}']
    function getBatteryStatus: Integer; cdecl;
    function getErrorStatus: Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
  end;
  TJEposException = class(TJavaGenericImport<JEposExceptionClass, JEposException>) end;

  Jeposprint_LogClass = interface(JObjectClass)
    ['{BCC0D22E-5020-4E4A-910C-532578D161D3}']
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
    ['{69907941-8940-49E4-9604-378B62133F4D}']
  end;
  TJeposprint_Log = class(TJavaGenericImport<Jeposprint_LogClass, Jeposprint_Log>) end;

  JOfflineEventListenerClass = interface(JEventListenerClass)
    ['{BEBFFA67-2346-4D03-9CA6-ED2E0D081262}']
  end;

  [JavaSignature('com/epson/eposprint/OfflineEventListener')]
  JOfflineEventListener = interface(JEventListener)
    ['{6CAA92E9-5880-4714-A6FC-4C96A9E87CCB}']
    procedure onOfflineEvent(P1: JString); cdecl;
  end;
  TJOfflineEventListener = class(TJavaGenericImport<JOfflineEventListenerClass, JOfflineEventListener>) end;

  JOnlineEventListenerClass = interface(JEventListenerClass)
    ['{0D338510-1390-48FB-BBB1-C21F5B5AAF60}']
  end;

  [JavaSignature('com/epson/eposprint/OnlineEventListener')]
  JOnlineEventListener = interface(JEventListener)
    ['{0613AB4D-226E-4917-9FCE-B88C3CD54275}']
    procedure onOnlineEvent(P1: JString); cdecl;
  end;
  TJOnlineEventListener = class(TJavaGenericImport<JOnlineEventListenerClass, JOnlineEventListener>) end;

  JPaperEndEventListenerClass = interface(JEventListenerClass)
    ['{0A882D2C-DAE8-4433-AB3E-29DE7A3F8E2B}']
  end;

  [JavaSignature('com/epson/eposprint/PaperEndEventListener')]
  JPaperEndEventListener = interface(JEventListener)
    ['{6381B88C-4C8F-4CBF-8B4D-F40EC01CF741}']
    procedure onPaperEndEvent(P1: JString); cdecl;
  end;
  TJPaperEndEventListener = class(TJavaGenericImport<JPaperEndEventListenerClass, JPaperEndEventListener>) end;

  JPaperNearEndEventListenerClass = interface(JEventListenerClass)
    ['{8E52DB62-23A5-4D9E-8649-BEE1A1798B36}']
  end;

  [JavaSignature('com/epson/eposprint/PaperNearEndEventListener')]
  JPaperNearEndEventListener = interface(JEventListener)
    ['{C69676F1-DE60-4925-AD6F-10FB32A7BB40}']
    procedure onPaperNearEndEvent(P1: JString); cdecl;
  end;
  TJPaperNearEndEventListener = class(TJavaGenericImport<JPaperNearEndEventListenerClass, JPaperNearEndEventListener>) end;

  JPaperOkEventListenerClass = interface(JEventListenerClass)
    ['{EF3625CB-5A79-4C77-A0AB-D1294346934A}']
  end;

  [JavaSignature('com/epson/eposprint/PaperOkEventListener')]
  JPaperOkEventListener = interface(JEventListener)
    ['{4AACE4B4-6442-4F70-B8AA-D1DB583AEBF6}']
    procedure onPaperOkEvent(P1: JString); cdecl;
  end;
  TJPaperOkEventListener = class(TJavaGenericImport<JPaperOkEventListenerClass, JPaperOkEventListener>) end;

  JPowerOffEventListenerClass = interface(JEventListenerClass)
    ['{60032E3B-3B03-4FDA-A123-C1A071D81FD0}']
  end;

  [JavaSignature('com/epson/eposprint/PowerOffEventListener')]
  JPowerOffEventListener = interface(JEventListener)
    ['{A98E031D-8291-490C-9BF5-410DF0192D4D}']
    procedure onPowerOffEvent(P1: JString); cdecl;
  end;
  TJPowerOffEventListener = class(TJavaGenericImport<JPowerOffEventListenerClass, JPowerOffEventListener>) end;

  JPrintClass = interface(JObjectClass)
    ['{E170E581-64E2-4924-A79A-74672D64628E}']
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
    ['{DCDFFC90-5253-46A4-B00D-59F33875AB0A}']
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
    ['{D768351B-4FBC-4E3C-9117-BAF0C6A44E5A}']
  end;

  [JavaSignature('com/epson/eposprint/StatusChangeEventListener')]
  JStatusChangeEventListener = interface(JEventListener)
    ['{6DD001C9-89A4-49F8-8A67-7063344627CA}']
    procedure onStatusChangeEvent(P1: JString; P2: Integer); cdecl;
  end;
  TJStatusChangeEventListener = class(TJavaGenericImport<JStatusChangeEventListenerClass, JStatusChangeEventListener>) end;

  JDevTypeClass = interface(JObjectClass)
    ['{64C87800-3A8A-43DE-912A-6A9B00B88260}']
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
    ['{5B5A8FB5-32AE-44E4-9C3C-2EF361B6C37C}']
  end;
  TJDevType = class(TJavaGenericImport<JDevTypeClass, JDevType>) end;

  JDeviceInfoClass = interface(JObjectClass)
    ['{5755B0B6-0D4A-4646-A3FC-8FF1C800F4CB}']
    {class} function init(P1: Integer; P2: JString; P3: JString; P4: JString; P5: JString): JDeviceInfo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/DeviceInfo')]
  JDeviceInfo = interface(JObject)
    ['{DEA14355-BF2A-44AA-9160-7FD632B1533F}']
    function getDeviceName: JString; cdecl;
    function getDeviceType: Integer; cdecl;
    function getIpAddress: JString; cdecl;
    function getMacAddress: JString; cdecl;
    function getPrinterName: JString; cdecl;
  end;
  TJDeviceInfo = class(TJavaGenericImport<JDeviceInfoClass, JDeviceInfo>) end;

  JEpsonIoClass = interface(JObjectClass)
    ['{DB6AC76F-178C-4E11-961E-31B74E14A213}']
    {class} function init: JEpsonIo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/EpsonIo')]
  JEpsonIo = interface(JObject)
    ['{2401ED52-7C6B-4127-8063-3E36B1B8E909}']
    procedure close; cdecl;
    procedure open(P1: Integer; P2: JString; P3: JString); cdecl; overload;
    procedure open(P1: Integer; P2: JString; P3: JString; P4: JContext); cdecl; overload;
    function read(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
    function write(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
  end;
  TJEpsonIo = class(TJavaGenericImport<JEpsonIoClass, JEpsonIo>) end;

  JEpsonIoExceptionClass = interface(JExceptionClass)
    ['{1A42B632-56E2-4E94-8FD3-18A5DA9E11EF}']
    {class} function init(P1: Integer): JEpsonIoException; cdecl; overload;
    {class} function init(P1: JString; P2: JThrowable): JEpsonIoException; cdecl; overload;
  end;

  [JavaSignature('com/epson/epsonio/EpsonIoException')]
  JEpsonIoException = interface(JException)
    ['{0A4DB4C8-27AB-475D-AFC0-CF4BC7F2B616}']
    function getStatus: Integer; cdecl;
    procedure setStatus(P1: Integer); cdecl;
  end;
  TJEpsonIoException = class(TJavaGenericImport<JEpsonIoExceptionClass, JEpsonIoException>) end;

  JFilterOptionClass = interface(JObjectClass)
    ['{F941FE83-84BD-418D-90F7-66AE8ED47E73}']
    {class} function _GetFILTER_NAME: Integer;
    {class} function _GetFILTER_NONE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function init: JFilterOption; cdecl;
    {class} property FILTER_NAME: Integer read _GetFILTER_NAME;
    {class} property FILTER_NONE: Integer read _GetFILTER_NONE;
    {class} property PARAM_DEFAULT: Integer read _GetPARAM_DEFAULT;
  end;

  [JavaSignature('com/epson/epsonio/FilterOption')]
  JFilterOption = interface(JObject)
    ['{F362B453-49E9-4BD5-9D4C-D016C10DBDF3}']
  end;
  TJFilterOption = class(TJavaGenericImport<JFilterOptionClass, JFilterOption>) end;

  JFinderClass = interface(JObjectClass)
    ['{3C60CDD1-46E4-49E6-A045-7DC66D8ABA5E}']
    {class} function _GetFILTER_NAME: Integer;
    {class} function _GetFILTER_NONE: Integer;
    {class} function _GetPARAM_DEFAULT: Integer;
    {class} function getDeviceInfoList(P1: Integer): TJavaObjectArray<JDeviceInfo>; cdecl;
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
    ['{BF00F023-DEE5-49A8-A787-2418E413F0E2}']
  end;
  TJFinder = class(TJavaGenericImport<JFinderClass, JFinder>) end;

  JIoStatusClass = interface(JObjectClass)
    ['{644CAB44-CDE5-4A3B-A944-5F3F6343310F}']
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
    ['{8452E9A7-8B22-4F9B-A117-449EBAD3377F}']
  end;
  TJIoStatus = class(TJavaGenericImport<JIoStatusClass, JIoStatus>) end;

  JNetIFInfoClass = interface(JObjectClass)
    ['{400C3B34-E094-4EED-AE73-466201A5E788}']
    {class} function getNetInfoList(P1: Integer): TJavaObjectArray<JNetIfResult>; cdecl;
    {class} function getNetInfoNum(P1: TJavaArray<Integer>): Integer; cdecl;
    {class} function init: JNetIFInfo; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/NetIFInfo')]
  JNetIFInfo = interface(JObject)
    ['{1EE238E4-FAB9-4A76-9391-748FFA7C5363}']
  end;
  TJNetIFInfo = class(TJavaGenericImport<JNetIFInfoClass, JNetIFInfo>) end;

  JNetIfResultClass = interface(JObjectClass)
    ['{33241928-2800-4E1C-92F6-DFD67F261011}']
    {class} function init: JNetIfResult; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/NetIfResult')]
  JNetIfResult = interface(JObject)
    ['{218E6119-110C-4528-A32B-C6FE07BD1C22}']
    function _GetipAddress: TJavaArray<Byte>;
    procedure _SetipAddress(Value: TJavaArray<Byte>);
    function _GetmacAddress: TJavaArray<Byte>;
    procedure _SetmacAddress(Value: TJavaArray<Byte>);
    property ipAddress: TJavaArray<Byte> read _GetipAddress write _SetipAddress;
    property macAddress: TJavaArray<Byte> read _GetmacAddress write _SetmacAddress;
  end;
  TJNetIfResult = class(TJavaGenericImport<JNetIfResultClass, JNetIfResult>) end;

  JSupportUsbClass = interface(JObjectClass)
    ['{84FE4697-540F-4EAE-A8D6-2C271EA6E63C}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<JDeviceInfo>; cdecl;
    {class} function init: JSupportUsb; cdecl;
    {class} function isSupport: JBoolean; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/SupportUsb')]
  JSupportUsb = interface(JObject)
    ['{4D13CD5F-11B2-47A8-B32F-07742DE9436E}']
  end;
  TJSupportUsb = class(TJavaGenericImport<JSupportUsbClass, JSupportUsb>) end;

  JAdapterHandlerClass = interface(JHandlerClass)
    ['{195C8243-A3FA-4712-8D73-575D82618C5F}']
    {class} function init: JAdapterHandler; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/AdapterHandler')]
  JAdapterHandler = interface(JHandler)
    ['{1CF439EB-8E7B-44B6-AEA7-FF0DD7AF0D1A}']
    function getAdapter: JBluetoothAdapter; cdecl;
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJAdapterHandler = class(TJavaGenericImport<JAdapterHandlerClass, JAdapterHandler>) end;

  JDevBtClass = interface(JObjectClass)
    ['{15B74700-0B9A-4610-9B19-17B9E5A72E59}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<JDeviceInfo>; cdecl;
    {class} function init: JDevBt; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt')]
  JDevBt = interface(JObject)
    ['{1B2B775B-E3EC-41C1-931C-33EAE00F06F4}']
  end;
  TJDevBt = class(TJavaGenericImport<JDevBtClass, JDevBt>) end;

  JDevBt_1Class = interface(JHandlerClass)
    ['{478DC74F-4FD5-4B82-8309-47F7366694CA}']
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt$1')]
  JDevBt_1 = interface(JHandler)
    ['{B929E271-1FD6-415E-95DF-C5F4A02D07D5}']
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJDevBt_1 = class(TJavaGenericImport<JDevBt_1Class, JDevBt_1>) end;

  JDevBt_2Class = interface(JBroadcastReceiverClass)
    ['{EBE265CF-AB8B-4D67-AC87-8E2AFDB2BE4C}']
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/DevBt$2')]
  JDevBt_2 = interface(JBroadcastReceiver)
    ['{525A1114-FD88-4233-A352-0BD0C0773735}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJDevBt_2 = class(TJavaGenericImport<JDevBt_2Class, JDevBt_2>) end;

  JNetBtClass = interface(JObjectClass)
    ['{37D2DA2D-FD72-4ED0-A1AE-218D2668998C}']
    {class} function close(P1: Integer): Integer; cdecl;
    {class} function init: JNetBt; cdecl;
    {class} function kill(P1: Integer): Integer; cdecl;
    {class} function open(P1: JString; P2: JString; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function read(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function write(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/bluetooth/NetBt')]
  JNetBt = interface(JObject)
    ['{E430A2FC-9731-4ABF-8994-B1CAAC7725A9}']
  end;
  TJNetBt = class(TJavaGenericImport<JNetBtClass, JNetBt>) end;

  JDevUsbClass = interface(JObjectClass)
    ['{7102FC93-5362-4869-96BF-5F5E60DB0FA4}']
    {class} function getResult(P1: TJavaArray<Integer>; P2: Integer): TJavaObjectArray<JDeviceInfo>; cdecl;
    {class} function init: JDevUsb; cdecl;
    {class} function start(P1: JContext; P2: Integer; P3: JString): Integer; cdecl;
    {class} function stop: Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb')]
  JDevUsb = interface(JObject)
    ['{B7AF28CB-371A-4160-9F7C-CC7D7F8F03C4}']
  end;
  TJDevUsb = class(TJavaGenericImport<JDevUsbClass, JDevUsb>) end;

  JDevUsb_1Class = interface(JHandlerClass)
    ['{527315FF-B74D-4B5B-93FB-29B67E06DCAE}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$1')]
  JDevUsb_1 = interface(JHandler)
    ['{6FA99AF2-553B-499A-98AC-6571D9D6D6F1}']
    procedure handleMessage(P1: JMessage); cdecl;
  end;
  TJDevUsb_1 = class(TJavaGenericImport<JDevUsb_1Class, JDevUsb_1>) end;

  JDevUsb_2Class = interface(JBroadcastReceiverClass)
    ['{B99D0965-51C3-492A-9A0F-A5C20D36945A}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$2')]
  JDevUsb_2 = interface(JBroadcastReceiver)
    ['{D1F42B69-20C8-4EF6-B67E-6D2074E0A219}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJDevUsb_2 = class(TJavaGenericImport<JDevUsb_2Class, JDevUsb_2>) end;

  JDevUsb_3Class = interface(JObjectClass)
    ['{716CE6B7-22E1-45D5-AD95-A34CF1E92405}']
  end;

  [JavaSignature('com/epson/epsonio/usb/DevUsb$3')]
  JDevUsb_3 = interface(JObject)
    ['{9D8F397D-1795-4ED6-9162-A57B61EE6CF2}']
    procedure run; cdecl;
  end;
  TJDevUsb_3 = class(TJavaGenericImport<JDevUsb_3Class, JDevUsb_3>) end;

  JNetUsbClass = interface(JObjectClass)
    ['{5D4DD1F1-C780-4EE5-8D0C-86309F692367}']
    {class} function close(P1: Integer): Integer; cdecl;
    {class} function enableFlowControl(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function getOnlineStatus(P1: Integer; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function init: JNetUsb; cdecl;
    {class} function kill(P1: Integer): Integer; cdecl;
    {class} function open(P1: JString; P2: JString; P3: TJavaArray<Integer>; P4: JObject): Integer; cdecl;
    {class} function read(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function write(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/usb/NetUsb')]
  JNetUsb = interface(JObject)
    ['{E698666C-BDDD-40B3-B8D6-5344C27DE2C6}']
  end;
  TJNetUsb = class(TJavaGenericImport<JNetUsbClass, JNetUsb>) end;

  JUsbConnecterClass = interface(JObjectClass)
    ['{1A4E8A3A-484B-414E-A83B-31072B49EDB2}']
    {class} function init: JUsbConnecter; cdecl;
  end;

  [JavaSignature('com/epson/epsonio/usb/UsbConnecter')]
  JUsbConnecter = interface(JObject)
    ['{AAE7F6FD-3ED0-460A-A400-47D5193607AA}']
    function balkRead(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Integer>; P4: Integer): Integer; cdecl;
    function balkWrite(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Integer>; P4: Integer): Integer; cdecl;
    function checkDevice(P1: JString): JBoolean; cdecl;
    function checkHandle(P1: Integer): JBoolean; cdecl;
    function close: Integer; cdecl;
    function connect(P1: Integer; P2: JUsbManager; P3: JUsbDevice): Integer; cdecl;
    function enableFlowControl(P1: Integer): Integer; cdecl;
    function getOnlineStatus(P1: TJavaArray<Integer>): Integer; cdecl;
  end;
  TJUsbConnecter = class(TJavaGenericImport<JUsbConnecterClass, JUsbConnecter>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JUsbAccessory', TypeInfo(Android.JNI.ePOSPrint.JUsbAccessory));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JUsbDevice', TypeInfo(Android.JNI.ePOSPrint.JUsbDevice));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JUsbDeviceConnection', TypeInfo(Android.JNI.ePOSPrint.JUsbDeviceConnection));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JUsbEndpoint', TypeInfo(Android.JNI.ePOSPrint.JUsbEndpoint));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JUsbInterface', TypeInfo(Android.JNI.ePOSPrint.JUsbInterface));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JUsbManager', TypeInfo(Android.JNI.ePOSPrint.JUsbManager));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JUsbRequest', TypeInfo(Android.JNI.ePOSPrint.JUsbRequest));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JEventListener', TypeInfo(Android.JNI.ePOSPrint.JEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JBatteryLowEventListener', TypeInfo(Android.JNI.ePOSPrint.JBatteryLowEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JBatteryOkEventListener', TypeInfo(Android.JNI.ePOSPrint.JBatteryOkEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JBatteryStatusChangeEventListener', TypeInfo(Android.JNI.ePOSPrint.JBatteryStatusChangeEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JBuilder', TypeInfo(Android.JNI.ePOSPrint.JBuilder));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JCoverOkEventListener', TypeInfo(Android.JNI.ePOSPrint.JCoverOkEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JCoverOpenEventListener', TypeInfo(Android.JNI.ePOSPrint.JCoverOpenEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDrawerClosedEventListener', TypeInfo(Android.JNI.ePOSPrint.JDrawerClosedEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDrawerOpenEventListener', TypeInfo(Android.JNI.ePOSPrint.JDrawerOpenEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JEposException', TypeInfo(Android.JNI.ePOSPrint.JEposException));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.Jeposprint_Log', TypeInfo(Android.JNI.ePOSPrint.Jeposprint_Log));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JOfflineEventListener', TypeInfo(Android.JNI.ePOSPrint.JOfflineEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JOnlineEventListener', TypeInfo(Android.JNI.ePOSPrint.JOnlineEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JPaperEndEventListener', TypeInfo(Android.JNI.ePOSPrint.JPaperEndEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JPaperNearEndEventListener', TypeInfo(Android.JNI.ePOSPrint.JPaperNearEndEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JPaperOkEventListener', TypeInfo(Android.JNI.ePOSPrint.JPaperOkEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JPowerOffEventListener', TypeInfo(Android.JNI.ePOSPrint.JPowerOffEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JPrint', TypeInfo(Android.JNI.ePOSPrint.JPrint));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JStatusChangeEventListener', TypeInfo(Android.JNI.ePOSPrint.JStatusChangeEventListener));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDevType', TypeInfo(Android.JNI.ePOSPrint.JDevType));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDeviceInfo', TypeInfo(Android.JNI.ePOSPrint.JDeviceInfo));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JEpsonIo', TypeInfo(Android.JNI.ePOSPrint.JEpsonIo));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JEpsonIoException', TypeInfo(Android.JNI.ePOSPrint.JEpsonIoException));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JFilterOption', TypeInfo(Android.JNI.ePOSPrint.JFilterOption));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JFinder', TypeInfo(Android.JNI.ePOSPrint.JFinder));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JIoStatus', TypeInfo(Android.JNI.ePOSPrint.JIoStatus));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JNetIFInfo', TypeInfo(Android.JNI.ePOSPrint.JNetIFInfo));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JNetIfResult', TypeInfo(Android.JNI.ePOSPrint.JNetIfResult));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JSupportUsb', TypeInfo(Android.JNI.ePOSPrint.JSupportUsb));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JAdapterHandler', TypeInfo(Android.JNI.ePOSPrint.JAdapterHandler));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDevBt', TypeInfo(Android.JNI.ePOSPrint.JDevBt));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDevBt_1', TypeInfo(Android.JNI.ePOSPrint.JDevBt_1));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDevBt_2', TypeInfo(Android.JNI.ePOSPrint.JDevBt_2));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JNetBt', TypeInfo(Android.JNI.ePOSPrint.JNetBt));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDevUsb', TypeInfo(Android.JNI.ePOSPrint.JDevUsb));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDevUsb_1', TypeInfo(Android.JNI.ePOSPrint.JDevUsb_1));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDevUsb_2', TypeInfo(Android.JNI.ePOSPrint.JDevUsb_2));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JDevUsb_3', TypeInfo(Android.JNI.ePOSPrint.JDevUsb_3));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JNetUsb', TypeInfo(Android.JNI.ePOSPrint.JNetUsb));
  TRegTypes.RegisterType('Android.JNI.ePOSPrint.JUsbConnecter', TypeInfo(Android.JNI.ePOSPrint.JUsbConnecter));
end;

initialization
  RegisterTypes;
end.


