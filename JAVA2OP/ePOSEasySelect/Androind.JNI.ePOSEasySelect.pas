{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit ePOSEasySelect\Androind.JNI.ePOSEasySelect;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Util,
  Androidapi.JNI.Os;

type
// ===== Forward declarations =====

  JTag = interface;//android.nfc.Tag
  JDeviceType = interface;//com.epson.easyselect.DeviceType
  JEasySelect = interface;//com.epson.easyselect.EasySelect
  JEasySelectInfo = interface;//com.epson.easyselect.EasySelectInfo
  JNdefBTSSP = interface;//com.epson.easyselect.NdefBTSSP
  JNdefBTSSP_EIR = interface;//com.epson.easyselect.NdefBTSSP$EIR
  JNdefController = interface;//com.epson.easyselect.NdefController
  JNdefText = interface;//com.epson.easyselect.NdefText
  JQrCodeController = interface;//com.epson.easyselect.QrCodeController

// ===== Interface declarations =====

  JTagClass = interface(JObjectClass)
    ['{B4ABEB98-817E-4028-B212-62E971069F34}']
    {class} function _GetCREATOR: JParcelable_Creator;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/nfc/Tag')]
  JTag = interface(JObject)
    ['{110F4A27-1DD0-4D81-AE18-8D1FAB9DBA5C}']
    function describeContents: Integer; cdecl;
    function getId: TJavaArray<Byte>; cdecl;
    function getTechList: TJavaObjectArray<JString>; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTag = class(TJavaGenericImport<JTagClass, JTag>) end;

  JDeviceTypeClass = interface(JObjectClass)
    ['{5A2683E0-EB72-4A4B-B683-CE8EE2538AC9}']
    {class} function init: JDeviceType; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/DeviceType')]
  JDeviceType = interface(JObject)
    ['{AE6FA2BB-DC47-4CDF-8333-A514E0B2A323}']
  end;
  TJDeviceType = class(TJavaGenericImport<JDeviceTypeClass, JDeviceType>) end;

  JEasySelectClass = interface(JObjectClass)
    ['{63EC7B1A-4CF9-407A-B23B-1541AED94907}']
    {class} function _GetPARSE_NFC_TIMEOUT_DEFAULT: Integer;
    {class} function init: JEasySelect; cdecl;
    {class} property PARSE_NFC_TIMEOUT_DEFAULT: Integer read _GetPARSE_NFC_TIMEOUT_DEFAULT;
  end;

  [JavaSignature('com/epson/easyselect/EasySelect')]
  JEasySelect = interface(JObject)
    ['{5FE9A03D-F643-460D-A358-60E7A4CA9C98}']
    function createQR(P1: JString; P2: Integer; P3: JString): JString; cdecl;
    function parseNFC(P1: JTag): JEasySelectInfo; cdecl; overload;
    function parseNFC(P1: JTag; P2: Integer): JArrayList; cdecl; overload;
    function parseQR(P1: JString): JEasySelectInfo; cdecl;
  end;
  TJEasySelect = class(TJavaGenericImport<JEasySelectClass, JEasySelect>) end;

  JEasySelectInfoClass = interface(JObjectClass)
    ['{8D5F6FA6-558C-4A92-92C1-8DE941937730}']
    {class} function init: JEasySelectInfo; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/EasySelectInfo')]
  JEasySelectInfo = interface(JObject)
    ['{0DD5A00F-CCF6-4D6D-A690-0C9D272D4053}']
    function _GetdeviceType: Integer;
    procedure _SetdeviceType(Value: Integer);
    function _GetmacAddress: JString;
    procedure _SetmacAddress(Value: JString);
    function _GetprinterName: JString;
    procedure _SetprinterName(Value: JString);
    property deviceType: Integer read _GetdeviceType write _SetdeviceType;
    property macAddress: JString read _GetmacAddress write _SetmacAddress;
    property printerName: JString read _GetprinterName write _SetprinterName;
  end;
  TJEasySelectInfo = class(TJavaGenericImport<JEasySelectInfoClass, JEasySelectInfo>) end;

  JNdefBTSSPClass = interface(JObjectClass)
    ['{FDE4B4E0-84EE-419A-837E-C18BD4A29A8F}']
    {class} function init: JNdefBTSSP; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/NdefBTSSP')]
  JNdefBTSSP = interface(JObject)
    ['{4258081D-6991-4719-862E-AF4980C9F20E}']
  end;
  TJNdefBTSSP = class(TJavaGenericImport<JNdefBTSSPClass, JNdefBTSSP>) end;

  JNdefBTSSP_EIRClass = interface(JObjectClass)
    ['{89057397-AE8A-43E0-A112-810C28A581DD}']
    {class} function _GetEIR_TYPE_COD: Integer;
    {class} function _GetEIR_TYPE_COMPLETE_128BIT_UUID_LIST: Integer;
    {class} function _GetEIR_TYPE_COMPLETE_16BIT_UUID_LIST: Integer;
    {class} function _GetEIR_TYPE_COMPLETE_32BIT_UUID_LIST: Integer;
    {class} function _GetEIR_TYPE_COMPLETE_LOCAL_NAME: Integer;
    {class} function _GetEIR_TYPE_MORE_128BIT_UUID_LIST: Integer;
    {class} function _GetEIR_TYPE_MORE_16BIT_UUID_LIST: Integer;
    {class} function _GetEIR_TYPE_MORE_32BIT_UUID_LIST: Integer;
    {class} function _GetEIR_TYPE_SHORT_LOCAL_NAME: Integer;
    {class} function _GetEIR_TYPE_SIMPLE_PAIRING_HASH: Integer;
    {class} function _GetEIR_TYPE_SIMPLE_PAIRING_RANDOMIZER: Integer;
    {class} property EIR_TYPE_COD: Integer read _GetEIR_TYPE_COD;
    {class} property EIR_TYPE_COMPLETE_128BIT_UUID_LIST: Integer read _GetEIR_TYPE_COMPLETE_128BIT_UUID_LIST;
    {class} property EIR_TYPE_COMPLETE_16BIT_UUID_LIST: Integer read _GetEIR_TYPE_COMPLETE_16BIT_UUID_LIST;
    {class} property EIR_TYPE_COMPLETE_32BIT_UUID_LIST: Integer read _GetEIR_TYPE_COMPLETE_32BIT_UUID_LIST;
    {class} property EIR_TYPE_COMPLETE_LOCAL_NAME: Integer read _GetEIR_TYPE_COMPLETE_LOCAL_NAME;
    {class} property EIR_TYPE_MORE_128BIT_UUID_LIST: Integer read _GetEIR_TYPE_MORE_128BIT_UUID_LIST;
    {class} property EIR_TYPE_MORE_16BIT_UUID_LIST: Integer read _GetEIR_TYPE_MORE_16BIT_UUID_LIST;
    {class} property EIR_TYPE_MORE_32BIT_UUID_LIST: Integer read _GetEIR_TYPE_MORE_32BIT_UUID_LIST;
    {class} property EIR_TYPE_SHORT_LOCAL_NAME: Integer read _GetEIR_TYPE_SHORT_LOCAL_NAME;
    {class} property EIR_TYPE_SIMPLE_PAIRING_HASH: Integer read _GetEIR_TYPE_SIMPLE_PAIRING_HASH;
    {class} property EIR_TYPE_SIMPLE_PAIRING_RANDOMIZER: Integer read _GetEIR_TYPE_SIMPLE_PAIRING_RANDOMIZER;
  end;

  [JavaSignature('com/epson/easyselect/NdefBTSSP$EIR')]
  JNdefBTSSP_EIR = interface(JObject)
    ['{19A34C69-E703-45BD-BB5C-F6D9DADAAF42}']
  end;
  TJNdefBTSSP_EIR = class(TJavaGenericImport<JNdefBTSSP_EIRClass, JNdefBTSSP_EIR>) end;

  JNdefControllerClass = interface(JObjectClass)
    ['{16632D33-44EB-4615-AE3D-FE047A7F4A7C}']
    {class} function init: JNdefController; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/NdefController')]
  JNdefController = interface(JObject)
    ['{0732B1A4-9219-4B9E-8A83-8EC577B11863}']
  end;
  TJNdefController = class(TJavaGenericImport<JNdefControllerClass, JNdefController>) end;

  JNdefTextClass = interface(JObjectClass)
    ['{39D7B5F6-F990-4A48-A430-DD4D1527999C}']
    {class} function init: JNdefText; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/NdefText')]
  JNdefText = interface(JObject)
    ['{714005B2-4020-40CC-945A-A551E7D0F8D5}']
  end;
  TJNdefText = class(TJavaGenericImport<JNdefTextClass, JNdefText>) end;

  JQrCodeControllerClass = interface(JObjectClass)
    ['{389F484D-463E-4477-8E70-FD2181CEC51C}']
    {class} function init: JQrCodeController; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/QrCodeController')]
  JQrCodeController = interface(JObject)
    ['{F235C5C6-7CEF-4154-9B67-89453D0339BD}']
  end;
  TJQrCodeController = class(TJavaGenericImport<JQrCodeControllerClass, JQrCodeController>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JTag', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JTag));
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JDeviceType', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JDeviceType));
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JEasySelect', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JEasySelect));
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JEasySelectInfo', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JEasySelectInfo));
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JNdefBTSSP', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JNdefBTSSP));
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JNdefBTSSP_EIR', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JNdefBTSSP_EIR));
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JNdefController', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JNdefController));
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JNdefText', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JNdefText));
  TRegTypes.RegisterType('ePOSEasySelect\Androind.JNI.ePOSEasySelect.JQrCodeController', TypeInfo(ePOSEasySelect\Androind.JNI.ePOSEasySelect.JQrCodeController));
end;

initialization
  RegisterTypes;
end.


