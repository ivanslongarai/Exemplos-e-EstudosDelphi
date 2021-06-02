object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Validating properties with RTTI'
  ClientHeight = 447
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnTest: TButton
    Left = 32
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 0
    OnClick = btnTestClick
  end
  object cbForceError: TCheckBox
    Left = 128
    Top = 36
    Width = 97
    Height = 17
    Caption = 'Force Error'
    TabOrder = 1
  end
end
