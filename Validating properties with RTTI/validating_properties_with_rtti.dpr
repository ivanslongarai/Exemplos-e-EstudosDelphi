program validating_properties_with_rtti;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uClasses in 'uClasses.pas',
  uValidators in 'uValidators.pas',
  uValidatedBase in 'uValidatedBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
