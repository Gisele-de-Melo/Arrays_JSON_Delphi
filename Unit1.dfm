object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Arrays JSON em Delphi'
  ClientHeight = 290
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 97
    Height = 25
    Caption = 'Criar JSON Array'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 111
    Top = 16
    Width = 106
    Height = 25
    Caption = 'Ler JSON Array'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 47
    Width = 393
    Height = 226
    TabOrder = 2
  end
  object Button3: TButton
    Left = 223
    Top = 16
    Width = 178
    Height = 25
    Caption = 'Adicionar Elemento JSON Array'
    TabOrder = 3
    OnClick = Button3Click
  end
end
