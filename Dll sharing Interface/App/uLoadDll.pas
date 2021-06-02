unit uLoadDll;

interface

uses uInterfaces;

type
  TGetInterface = procedure(var AInterface: ICar); stdcall;

  TLoadDll = class
  private
    FHandle: THandle;
    FCar: ICar;
    FGetInterface: TGetInterface;
  public
    constructor Create;
    destructor Destroy; override;
    function GetLicenceInterface: ICar;
    function LoadDll(const AName: string): Boolean;
  end;

implementation

uses Windows;

{ TLoadDll }

constructor TLoadDll.Create;
begin
  LoadDll('dllSharing.dll');
end;

destructor TLoadDll.Destroy;
begin
  FCar := nil;
  FreeLibrary(FHandle);
  inherited;
end;

function TLoadDll.GetLicenceInterface: ICar;
begin
  FGetInterface(FCar);
  Result := FCar;
end;

function TLoadDll.LoadDll(const AName: string): Boolean;
var
  LibHandle: THandle;
begin
  LibHandle := LoadLibrary(PChar(AName));
  if (LibHandle <> 0) then
  begin
    @FGetInterface := GetProcAddress(LibHandle, 'GetInterface');
    if @FGetInterface <> nil then
    begin
      Result := True;
      Exit;
    end;
    FreeLibrary(LibHandle);
  end;
  Result := False;
end;

end.
