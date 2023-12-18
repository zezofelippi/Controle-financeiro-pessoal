object frmListDespRec_mae: TfrmListDespRec_mae
  Left = 575
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Receita X Despesa M'#195'E'
  ClientHeight = 182
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 45
    Top = 24
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object Label2: TLabel
    Left = 158
    Top = 24
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object txt_data_i: TDateEdit
    Left = 43
    Top = 39
    Width = 104
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object txt_data_f: TDateEdit
    Left = 154
    Top = 39
    Width = 101
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 81
    Top = 90
    Width = 137
    Height = 25
    Caption = 'Visualizar Dados'
    TabOrder = 2
    OnClick = Button1Click
  end
  object RDG_TIPO: TRadioGroup
    Left = 40
    Top = 128
    Width = 230
    Height = 49
    Columns = 3
    Items.Strings = (
      'Por Mes'
      'Por Ano')
    TabOrder = 3
  end
end
