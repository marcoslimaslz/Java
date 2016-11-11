{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit nox;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Util,
  Androidapi.JNI.Os,
  Androidapi.JNI.Net;

type
// ===== Forward declarations =====

  JMercadoria = interface;//br.com.nox.Mercadoria
  Jnox_PrintService = interface;//br.com.nox.PrintService
  JSecondScreen = interface;//br.com.nox.SecondScreen

// ===== Interface declarations =====

  JMercadoriaClass = interface(JObjectClass)
    ['{92CC126E-E079-4FE3-A2BF-67D3104316E7}']
    {class} function init: JMercadoria; cdecl;
  end;

  [JavaSignature('br/com/nox/Mercadoria')]
  JMercadoria = interface(JObject)
    ['{A30BF51C-4C1B-4BFF-8EC9-BAC643081C3F}']
    function getCodigo: JString; cdecl;
    function getDesconto: JFloat; cdecl;
    function getNome: JString; cdecl;
    function getPreco: JFloat; cdecl;
    function getQuantidade: JFloat; cdecl;
    procedure setCodigo(P1: JString); cdecl;
    procedure setDesconto(P1: JFloat); cdecl;
    procedure setNome(P1: JString); cdecl;
    procedure setPreco(P1: JFloat); cdecl;
    procedure setQuantidade(P1: JFloat); cdecl;
  end;
  TJMercadoria = class(TJavaGenericImport<JMercadoriaClass, JMercadoria>) end;

  Jnox_PrintServiceClass = interface(JObjectClass)
    ['{4A30DBB2-9B98-4AD8-9ACC-EDC41A94ED04}']
    {class} function init: Jnox_PrintService; cdecl;
  end;

  [JavaSignature('br/com/nox/PrintService')]
  Jnox_PrintService = interface(JObject)
    ['{C2A14FB9-3CEE-4026-A1AF-AC5C7CDAFD7A}']
    function _GetPoyntReceiptPrintingServiceAction: JString;
    procedure _SetPoyntReceiptPrintingServiceAction(Value: JString);
    procedure Imprimir(P1: TJavaArray<Byte>); cdecl; overload;
    procedure Imprimir(P1: JArrayList); cdecl; overload;
    procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;
    procedure onServiceDisconnected(P1: JComponentName); cdecl;
    property PoyntReceiptPrintingServiceAction: JString read _GetPoyntReceiptPrintingServiceAction write _SetPoyntReceiptPrintingServiceAction;
  end;
  TJnox_PrintService = class(TJavaGenericImport<Jnox_PrintServiceClass, Jnox_PrintService>) end;

  JSecondScreenClass = interface(JObjectClass)
    ['{D69989A5-D0D4-407F-886C-7E4EDDF2CC44}']
    {class} function init: JSecondScreen; cdecl;
  end;

  [JavaSignature('br/com/nox/SecondScreen')]
  JSecondScreen = interface(JObject)
    ['{C073605C-AD62-48BA-8D07-9381B8639BF9}']
    function _GetPoyntSecondScreenServiceAction: JString;
    procedure _SetPoyntSecondScreenServiceAction(Value: JString);
    procedure collectEmailAddress; cdecl;
    procedure collectPhoneNumber; cdecl;
    procedure collectTextEntry(P1: JString); cdecl;
    procedure displayWelcome(P1: JString; P2: TJavaArray<Byte>); cdecl;
    procedure onSecondScreenResultNative(P1: Boolean; P2: JString); cdecl;
    procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;
    procedure onServiceDisconnected(P1: JComponentName); cdecl;
    procedure scanCode; cdecl;
    procedure showItem(P1: JArrayList; P2: JFloat); cdecl;
    property PoyntSecondScreenServiceAction: JString read _GetPoyntSecondScreenServiceAction write _SetPoyntSecondScreenServiceAction;
  end;
  TJSecondScreen = class(TJavaGenericImport<JSecondScreenClass, JSecondScreen>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('nox.JMercadoria', TypeInfo(nox.JMercadoria));
  TRegTypes.RegisterType('nox.Jnox_PrintService', TypeInfo(nox.Jnox_PrintService));
  TRegTypes.RegisterType('nox.JSecondScreen', TypeInfo(nox.JSecondScreen));
end;

initialization
  RegisterTypes;
end.


