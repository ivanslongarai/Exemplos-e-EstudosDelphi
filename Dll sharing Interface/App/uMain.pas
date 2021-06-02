unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnSendOk: TButton;
    btnSendException: TButton;
    procedure btnSendOkClick(Sender: TObject);
    procedure btnSendExceptionClick(Sender: TObject);
  private
  public
    procedure ExecWithOutErros;
    procedure ExecWithErros;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uInterfaces, uLoadDll;

procedure TfrmMain.btnSendExceptionClick(Sender: TObject);
begin
  ExecWithErros;
end;

procedure TfrmMain.btnSendOkClick(Sender: TObject);
begin
  ExecWithoutErros;
end;

procedure TfrmMain.ExecWithErros;
var
  LoadDll: TLoadDll;
  LCar: ICar;

begin

  LoadDll := TLoadDll.Create;
  try
    LCar := LoadDll.GetLicenceInterface;
    LCar.SetId(123)
      .SetModel('Honda')
      .SetCost(220000.00)
      .Prepare
      .Paint
      .SendException;
    if LCar.Return.AsReturn = trException then
      ShowMessage(LCar.Return.GetReturn);
  finally
    FreeAndNil(LoadDll);
  end;

end;

procedure TfrmMain.ExecWithOutErros;
var
  LoadDll: TLoadDll;
  LCar: ICar;

begin

  LoadDll := TLoadDll.Create;

  try
    LCar := LoadDll.GetLicenceInterface;
    LCar.SetId(123)
      .SetModel('Honda')
      .SetCost(220000.00)
      .Prepare
      .Paint;
    if LCar.Return.AsReturn = trok then
    begin
      if LCar.IsDone then
        ShowMessage(LCar.GetData);
    end;
  finally
    FreeAndNil(LoadDll);
  end;

end;

initialization

{$WARNINGS OFF}
  ReportMemoryLeaksOnShutdown := DebugHook > 0;
{$WARNINGS ON}

end.
