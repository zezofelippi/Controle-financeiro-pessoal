object frmInserirValorProduto: TfrmInserirValorProduto
  Left = 377
  Top = 263
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Inserir Valor no Produto'
  ClientHeight = 152
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 699
    Height = 149
    Align = alTop
    TabOrder = 0
    object Label9: TLabel
      Left = 13
      Top = 12
      Width = 76
      Height = 13
      Caption = 'C'#243'd Fornecedor'
    end
    object Label4: TLabel
      Left = 100
      Top = 13
      Width = 57
      Height = 13
      Caption = 'Fornecedor '
    end
    object Label2: TLabel
      Left = 13
      Top = 51
      Width = 78
      Height = 13
      Caption = 'C'#243'd. Barra / Ref'
    end
    object Label11: TLabel
      Left = 101
      Top = 52
      Width = 37
      Height = 13
      Caption = 'Produto'
    end
    object Label7: TLabel
      Left = 451
      Top = 50
      Width = 40
      Height = 13
      Caption = 'Unidade'
    end
    object Label5: TLabel
      Left = 642
      Top = 48
      Width = 47
      Height = 13
      Caption = 'Valor (R$)'
    end
    object Label8: TLabel
      Left = 535
      Top = 49
      Width = 55
      Height = 13
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 11
      Top = 94
      Width = 25
      Height = 13
      Caption = 'OBS:'
    end
    object txt_cod_fornec: TEdit
      Left = 10
      Top = 26
      Width = 86
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 1
    end
    object txt_fornecedor: TEdit
      Left = 98
      Top = 27
      Width = 352
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 2
    end
    object btnGravar: TBitBtn
      Left = 578
      Top = 15
      Width = 85
      Height = 31
      Caption = 'Gravar'
      TabOrder = 3
      Visible = False
      OnClick = btnGravarClick
    end
    object txt_cod_barra: TEdit
      Left = 10
      Top = 65
      Width = 84
      Height = 21
      CharCase = ecUpperCase
      Color = 14803425
      ReadOnly = True
      TabOrder = 4
    end
    object txt_cod_produto: TEdit
      Left = 22
      Top = 68
      Width = 49
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object txt_produto: TEdit
      Left = 99
      Top = 65
      Width = 351
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 6
    end
    object txt_unidade: TEdit
      Left = 453
      Top = 64
      Width = 39
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 7
    end
    object txt_valor: TCurrencyEdit
      Left = 597
      Top = 63
      Width = 95
      Height = 21
      AutoSize = False
      TabOrder = 0
      OnEnter = txt_valorEnter
      OnExit = txt_valorExit
      OnKeyPress = txt_valorKeyPress
    end
    object txt_Quantidade: TRxCalcEdit
      Left = 501
      Top = 64
      Width = 93
      Height = 21
      AutoSize = False
      Color = 14803425
      DecimalPlaces = 3
      DisplayFormat = '###,##0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object txt_obs: TEdit
      Left = 10
      Top = 112
      Width = 631
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 9
      OnEnter = txt_obsEnter
      OnExit = txt_obsExit
      OnKeyPress = txt_obsKeyPress
    end
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 492
    Top = 18
  end
  object qryTransLocal: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 532
    Top = 18
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 632
    Top = 8
  end
  object qryPesqAux: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 592
    Top = 8
  end
end
