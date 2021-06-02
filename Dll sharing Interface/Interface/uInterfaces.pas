unit uInterfaces;

interface

type
  TTypeReturn = (trOk, trException);

  IReturn = interface
    ['{5C640BB5-5E16-4473-B9FE-6F89480024B3}']
    function AsReturn : TTypeReturn;
    function GetReturn : WideString;
  end;

  ICar = interface
    ['{156BCB47-248F-4D46-B497-FFF6BB8C9C58}']
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
    function Return : IReturn;
  end;

implementation

end.
