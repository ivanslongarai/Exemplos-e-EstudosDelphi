unit uClasses;

interface

uses
  SysUtils, Variants, Classes, uValidators, uValidatedBase;

type
  TPerson = class(TValidatedBase)
  private
    FName: string;
    FBirthday: TDateTime;
    FId: Integer;
    FSalary: Currency;
  public
    [TValidadorInteger('Person Id')]
    property Id: Integer read FId write FId;
    [TValidadorString('Person Name')]
    property Name: string read FName write FName;
    [TValidadorCurrency('Person Salary')]
    property Salary: Currency read FSalary write FSalary;
    [TValidadorDate('Person Birthday')]
    property Birthday: TDateTime read FBirthday write FBirthday;
  end;

type
  TCar = class(TValidatedBase)
  private
    FCost: Currency;
    FModel: string;
    FId: Integer;
    FSoldIn: TDateTime;
  public
    [TValidadorInteger('Car Id')]
    property Id: Integer read FId write FId;
    [TValidadorString('Car Model')]
    property Model: string read FModel write FModel;
    [TValidadorCurrency('Car Cost')]
    property Cost: Currency read FCost write FCost;
    [TValidadorDate('Car SoldIn')]
    property SoldIn: TDateTime read FSoldIn write FSoldIn;
  end;

implementation

end.
