unit uClasses;

interface

uses uInterfaces, SysUtils;

type
  TCar = class(TInterfacedObject, ICar)
  private
    FId: Integer;
    FModel: string;
    FCost: double;
    FPrepared: Boolean;
    FPainted: Boolean;
    FReturn: IReturn;
  public
    function SetId(const AValue: Integer): ICar;
    function SetModel(const AValue: WideString): ICar;
    function SetCost(const AValue: double): ICar;
    function GetId: Integer;
    function GetModel: WideString;
    function GetCost: double;
    function Prepare: ICar;
    function Paint: ICar;
    function SendException: ICar;
    function GetData: WideString;
    function IsDone: Boolean;
    function Return: IReturn;
    class function New: ICar;
    constructor Create;
    destructor Destroy; override;
  end;

  TReturn = class(TInterfacedObject, IReturn)
  private
    FReturnType: TTypeReturn;
    FReturn: WideString;
  public
    function AsReturn: TTypeReturn;
    function GetReturn: WideString;
    class function New(const AReturn: TTypeReturn; const AValue: WideString): IReturn;
    constructor Create(const AReturn: TTypeReturn; const AValue: WideString);
    destructor Destroy; override;
  end;

procedure doReturn(var AResult: IReturn; const AReturn: TTypeReturn; const AValue: WideString);

implementation

{ TReturn }

function TReturn.AsReturn: TTypeReturn;
begin
  Result := FReturnType;
end;

constructor TReturn.Create(const AReturn: TTypeReturn; const AValue: WideString);
begin
  FReturnType := AReturn;
  FReturn := AValue;
end;

destructor TReturn.Destroy;
begin
  //
  inherited;
end;

function TReturn.GetReturn: WideString;
begin
  Result := FReturn;
end;

class function TReturn.New(const AReturn: TTypeReturn; const AValue: WideString): IReturn;
begin
  Result := Self.Create(AReturn, AValue);
end;

{ TCar }

constructor TCar.Create;
begin
  //
end;

destructor TCar.Destroy;
begin
  //
  inherited;
end;

function TCar.GetCost: double;
begin
  Result := FCost;
end;

function TCar.GetData: WideString;
begin
  Result := Format('Id: %d - Model: %s Cost: %n', [FId, FModel, FCost]);
end;

function TCar.GetId: Integer;
begin
  Result := FId;
end;

function TCar.GetModel: WideString;
begin
  Result := FModel;
end;

function TCar.IsDone: Boolean;
begin
  Result := FPrepared and FPainted;
end;

class function TCar.New: ICar;
begin
  Result := Self.Create;
end;

function TCar.Paint: ICar;
begin
  Result := Self;
  FPainted := True;
  doReturn(FReturn, trOk, 'Painted ok');
end;

function TCar.Prepare: ICar;
begin
  Result := Self;
  FPrepared := True;
  doReturn(FReturn, trOk, 'Prepared ok');
end;

function TCar.Return: IReturn;
begin
  Result := FReturn;
end;

function TCar.SendException: ICar;
begin
  Result := Self;
  FPrepared := False;
  FPainted := False;
  doReturn(FReturn, trException, 'It was not prepared nor painted');
end;

function TCar.SetCost(const AValue: double): ICar;
begin
  FCost := AValue;
  Result := Self;
end;

function TCar.SetId(const AValue: Integer): ICar;
begin
  FId := AValue;
  Result := Self;
end;

function TCar.SetModel(const AValue: WideString): ICar;
begin
  FModel := AValue;
  Result := Self;
end;

procedure doReturn(var AResult: IReturn; const AReturn: TTypeReturn; const AValue: WideString);
begin
  AResult := TReturn.New(AReturn, AValue);
end;

end.
