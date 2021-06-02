library dllSharing;

uses
  System.SysUtils,
  System.Classes,
  uInterfaces in '..\Interface\uInterfaces.pas',
  uClasses in 'uClasses.pas';

{$R *.res}

function New : ICar; stdcall;
begin
  Result:= TCar.New;
end;

procedure GetInterface(var AInterface : ICar); stdcall;
begin
  AInterface := TCar.New;
end;

exports New, GetInterface;

begin

  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

end.
