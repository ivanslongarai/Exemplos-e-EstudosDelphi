unit uValidators;

interface

uses Rtti, SysUtils, Variants, Classes, System.Generics.Collections,
  uValidatedBase;

type
  TDescription = class(TCustomAttribute)
  private
    FDescription: string;
  public
    constructor Create(const ADescription: string);
    property Description: string read FDescription;
  end;

  TValidador = class(TDescription)
  private
  public
    function Validate(AProperty: TRttiProperty; AObject: TObject): Boolean; virtual; abstract;
  end;

  TValidadorString = class(TValidador)
  private
  public
    function Validate(AProperty: TRttiProperty; AObject: TObject): Boolean; override;
  end;

  TValidadorInteger = class(TValidador)
  private
  public
    function Validate(AProperty: TRttiProperty; AObject: TObject): Boolean; override;
  end;

  TValidadorCurrency = class(TValidador)
  private
  public
    function Validate(AProperty: TRttiProperty; AObject: TObject): Boolean; override;
  end;

  TValidadorDate = class(TValidador)
  private
  public
    function Validate(AProperty: TRttiProperty; AObject: TObject): Boolean; override;
  end;

  TValidadorData = class
  public
    class function ValidateData(AObject: TValidatedBase): Boolean;
  end;

implementation

{ TDescription }

constructor TDescription.Create(const ADescription: string);
begin
  FDescription := ADescription;
end;

function TValidadorString.Validate(AProperty: TRttiProperty; AObject: TObject): Boolean;
var
  Value: Variant;

begin
  // Get property value
  Value := AProperty.GetValue(AObject).AsVariant;
  // Validate, it requires no empty value nor 0 value
  Result := VarToStr(Value) <> EmptyStr;
end;

{ TValidadorInteger }

function TValidadorInteger.Validate(AProperty: TRttiProperty; AObject: TObject): Boolean;
var
  Value: Variant;

begin
  // Get property value
  Value := AProperty.GetValue(AObject).AsVariant;
  // Validate, it requires no empty value nor 0 value
  Result := StrToIntDef(VarToStr(Value), 0) <> 0;
end;

{ TValidadorCurrency }

function TValidadorCurrency.Validate(AProperty: TRttiProperty; AObject: TObject): Boolean;
var
  Value: Variant;

begin
  // Get property value
  Value := AProperty.GetValue(AObject).AsVariant;
  // Validate, it requires no empty value nor 0 value
  Result := StrToCurrDef(VarToStr(Value), 0) <> 0;
end;

{ TValidadorDate }

function TValidadorDate.Validate(AProperty: TRttiProperty; AObject: TObject): Boolean;
var
  Value: Variant;

begin
  // Get property value
  Value := AProperty.GetValue(AObject).AsVariant;
  // Validate, it requires no empty value nor 0 value
  Result := VarToDateTime(Value) > 0;
end;

{ TValidadorData }

class function TValidadorData.ValidateData(AObject: TValidatedBase): Boolean;
var
  Context: TRttiContext;
  RttiType: TRttiType;
  Propertyy: TRttiProperty;
  Attribute: TCustomAttribute;
  Value: Variant;
begin
  Result := True;
  // Create Rtti Context
  Context := TRttiContext.Create;
  // Get RTTI info from TPerson class
  RttiType := Context.GetType(AObject.ClassInfo);
  // Going through Object properties
  for Propertyy in RttiType.GetProperties do
  begin
    // Get Property value
    Value := Propertyy.GetValue(AObject).AsVariant;
    // Validate, it requires no empty value nor 0 value
    for Attribute in Propertyy.GetAttributes do
      // Check if it belongs to TValidador class
      if Attribute is TValidador then
      begin
        // Calls it self Validation method
        if not TValidador(Attribute).Validate(Propertyy, TValidador(AObject)) then
        begin
          AObject.GetErrorsList.Add(PWideChar('Value is not valid for: ' + (Attribute as TValidador).Description));
          Result := False;
        end;
      end;
  end;
end;

end.
