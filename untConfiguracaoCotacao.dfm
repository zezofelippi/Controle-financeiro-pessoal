object frmConfiguracaoCotacao: TfrmConfiguracaoCotacao
  Left = 364
  Top = 247
  Width = 247
  Height = 226
  Caption = 'frmConfiguracaoCotacao'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 21
    Width = 169
    Height = 13
    Caption = 'Data limite p/ produtos mais baratos'
  end
  object dta_cotacao: TDateEdit
    Left = 25
    Top = 40
    Width = 117
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
  end
  object btnGravarData: TButton
    Left = 146
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 1
    OnClick = btnGravarDataClick
  end
  object qryPesquisar: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 133
    Top = 71
  end
  object qryTransLocal: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 15
    Top = 69
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 56
    Top = 72
  end
end
