{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit Android.JNI.ePOSEasySelect;

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
    ['{7CECF862-794D-48E5-9E6F-FF8C66ECAF84}']
    {class} function init: JDeviceType; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/DeviceType')]
  JDeviceType = interface(JObject)
    ['{B6429FF0-5A6A-4480-B65E-5BE4AD1EFF7E}']
  end;
  TJDeviceType = class(TJavaGenericImport<JDeviceTypeClass, JDeviceType>) end;

  JEasySelectClass = interface(JObjectClass)
    ['{7E3E8CE4-BF10-4770-9048-D4A2CF1DB6CD}']
    {class} function _GetPARSE_NFC_TIMEOUT_DEFAULT: Integer;
    {class} function init: JEasySelect; cdecl;
    {class} property PARSE_NFC_TIMEOUT_DEFAULT: Integer read _GetPARSE_NFC_TIMEOUT_DEFAULT;
  end;

  [JavaSignature('com/epson/easyselect/EasySelect')]
  JEasySelect = interface(JObject)
    ['{95D87956-FBB2-475B-84FF-34665017587B}']
    function createQR(P1: JString; P2: Integer; P3: JString): JString; cdecl;
    function parseNFC(P1: JTag): JEasySelectInfo; cdecl; overload;
    function parseNFC(P1: JTag; P2: Integer): JArrayList; cdecl; overload;
    function parseQR(P1: JString): JEasySelectInfo; cdecl;
  end;
  TJEasySelect = class(TJavaGenericImport<JEasySelectClass, JEasySelect>) end;

  JEasySelectInfoClass = interface(JObjectClass)
    ['{0DCB16F6-12FF-49EA-BF4F-B406E9FE0CCF}']
    {class} function init: JEasySelectInfo; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/EasySelectInfo')]
  JEasySelectInfo = interface(JObject)
    ['{76707BDE-4545-4F30-A1E7-CB94DB817E1F}']
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
    ['{41640710-0DEF-4605-84BC-55AA876B3388}']
    {class} function init: JNdefBTSSP; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/NdefBTSSP')]
  JNdefBTSSP = interface(JObject)
    ['{FC540BDF-E380-44EA-AB30-F271B3676B01}']
  end;
  TJNdefBTSSP = class(TJavaGenericImport<JNdefBTSSPClass, JNdefBTSSP>) end;

  JNdefBTSSP_EIRClass = interface(JObjectClass)
    ['{1CA7AF03-B7D3-4035-8787-B330D99B7AD7}']
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
    ['{E08924F0-ADF8-49E0-ACE1-5F14E56F95E8}']
  end;
  TJNdefBTSSP_EIR = class(TJavaGenericImport<JNdefBTSSP_EIRClass, JNdefBTSSP_EIR>) end;

  JNdefControllerClass = interface(JObjectClass)
    ['{08962ED9-C32E-4277-8174-D8EEE98353EB}']
    {class} function init: JNdefController; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/NdefController')]
  JNdefController = interface(JObject)
    ['{5124F0EC-9C6F-461A-B1EE-AF5AAC70BF5A}']
  end;
  TJNdefController = class(TJavaGenericImport<JNdefControllerClass, JNdefController>) end;

  JNdefTextClass = interface(JObjectClass)
    ['{A54B4FD6-06F8-44E6-9EA9-699090364365}']
    {class} function init: JNdefText; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/NdefText')]
  JNdefText = interface(JObject)
    ['{FFD4D55C-BCC2-48BA-8AF4-A57D100CD101}']
  end;
  TJNdefText = class(TJavaGenericImport<JNdefTextClass, JNdefText>) end;

  JQrCodeControllerClass = interface(JObjectClass)
    ['{05F8C886-6BC1-43E5-8D90-7642A759D239}']
    {class} function init: JQrCodeController; cdecl;
  end;

  [JavaSignature('com/epson/easyselect/QrCodeController')]
  JQrCodeController = interface(JObject)
    ['{AE5A36B3-074B-4F09-A613-C4A14B89A8E4}']
  end;
  TJQrCodeController = class(TJavaGenericImport<JQrCodeControllerClass, JQrCodeController>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JTag', TypeInfo(Android.JNI.ePOSEasySelect.JTag));
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JDeviceType', TypeInfo(Android.JNI.ePOSEasySelect.JDeviceType));
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JEasySelect', TypeInfo(Android.JNI.ePOSEasySelect.JEasySelect));
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JEasySelectInfo', TypeInfo(Android.JNI.ePOSEasySelect.JEasySelectInfo));
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JNdefBTSSP', TypeInfo(Android.JNI.ePOSEasySelect.JNdefBTSSP));
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JNdefBTSSP_EIR', TypeInfo(Android.JNI.ePOSEasySelect.JNdefBTSSP_EIR));
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JNdefController', TypeInfo(Android.JNI.ePOSEasySelect.JNdefController));
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JNdefText', TypeInfo(Android.JNI.ePOSEasySelect.JNdefText));
  TRegTypes.RegisterType('Android.JNI.ePOSEasySelect.JQrCodeController', TypeInfo(Android.JNI.ePOSEasySelect.JQrCodeController));
end;

initialization
  RegisterTypes;
end.


