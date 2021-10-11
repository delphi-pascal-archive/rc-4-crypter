object Form1: TForm1
  Left = 235
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'RC-4 Crypter'
  ClientHeight = 163
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 8
    Top = 32
    Width = 305
    Height = 25
    Caption = 'Crypt file'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 8
    Width = 305
    Height = 17
    Smooth = True
    Step = 1
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 64
    Width = 193
    Height = 24
    TabOrder = 2
    Text = 'sample text'
  end
  object Edit2: TEdit
    Left = 8
    Top = 96
    Width = 193
    Height = 24
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 8
    Top = 128
    Width = 193
    Height = 24
    TabOrder = 4
  end
  object Button2: TButton
    Left = 208
    Top = 64
    Width = 105
    Height = 25
    Caption = 'Crypt text'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 96
    Width = 105
    Height = 25
    Caption = 'Uncrypt text'
    TabOrder = 6
    OnClick = Button3Click
  end
end
