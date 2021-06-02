program consumeDllSharing;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uLoadDll in 'uLoadDll.pas',
  uInterfaces in '..\Interface\uInterfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
