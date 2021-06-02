unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uClasses, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnTest: TButton;
    cbForceError: TCheckBox;
    procedure btnTestClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnTestClick(Sender: TObject);
var
  oPerson : TPerson;
  oCar    : TCar;
begin

  oPerson := TPerson.Create;
  try
    if not cbForceError.Checked then
    begin
      oPerson.Id       := 5;
      oPerson.Name     := 'Ivan';
      oPerson.Birthday := Now;
      oPerson.Salary := 1200.0;
    end;
    if not oPerson.ValidateData then
      ShowMessage(oPerson.GetErrorsList.Text)
    else
      ShowMessage('The class data is ok!')
  finally
    FreeAndNil(oPerson);
  end;

  oCar := TCar.Create;
  try
    if not cbForceError.Checked then
    begin
      oCar.Id     := 5;
      oCar.Model  := 'Honda';
      oCar.Cost   := 1200.0;
      oCar.SoldIn := Now;
    end;
    if not oCar.ValidateData then
      ShowMessage(oCar.GetErrorsList.Text)
    else
      ShowMessage('The class data is ok!')
  finally
    FreeAndNil(oCar);
  end;

end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
