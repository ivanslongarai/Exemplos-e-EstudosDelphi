unit uValidatedBase;

interface
uses System.Classes, SysUtils;

type
  TValidatedBase = class
  private
    FErrorsList: TStringList;
  public
    function GetErrorsList : TStringList;
    function ValidateData : Boolean;
    constructor Create;
    destructor Destroy; override;
   end;

implementation

{ TValidatedBase }

uses uValidators;

constructor TValidatedBase.Create;
begin
  inherited Create;
  FErrorsList := TStringList.Create;
end;

destructor TValidatedBase.Destroy;
begin
  FreeAndNil(FErrorsList);
  inherited;
end;

function TValidatedBase.GetErrorsList: TStringList;
begin
  Result := FErrorsList;
end;

function TValidatedBase.ValidateData: Boolean;
begin
  Result := TValidadorData.ValidateData(Self);
end;

end.
