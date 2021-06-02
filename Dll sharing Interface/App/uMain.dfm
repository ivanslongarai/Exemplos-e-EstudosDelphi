object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'consumeDllSharing'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnSendOk: TButton
    Left = 215
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Send Ok'
    TabOrder = 0
    OnClick = btnSendOkClick
  end
  object btnSendException: TButton
    Left = 296
    Top = 72
    Width = 97
    Height = 25
    Caption = 'Send Exception'
    TabOrder = 1
    OnClick = btnSendExceptionClick
  end
end
