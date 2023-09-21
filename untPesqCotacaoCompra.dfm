object frmPesqCotacaoCompra: TfrmPesqCotacaoCompra
  Left = 213
  Top = 173
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Cota'#231#227'o de Compra'
  ClientHeight = 451
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = Filtrare
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 912
    Height = 199
    Align = alTop
    TabOrder = 0
    object Label9: TLabel
      Left = 10
      Top = 71
      Width = 76
      Height = 13
      Caption = 'C'#243'd Fornecedor'
    end
    object Label4: TLabel
      Left = 140
      Top = 70
      Width = 57
      Height = 13
      Caption = 'Fornecedor '
    end
    object Label2: TLabel
      Left = 13
      Top = 112
      Width = 78
      Height = 13
      Caption = 'C'#243'd. Barra / Ref'
    end
    object Label11: TLabel
      Left = 140
      Top = 112
      Width = 37
      Height = 13
      Caption = 'Produto'
    end
    object Label6: TLabel
      Left = 13
      Top = 21
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 11
      Top = 154
      Width = 25
      Height = 13
      Caption = 'OBS:'
    end
    object txt_cod_fornec: TEdit
      Left = 10
      Top = 84
      Width = 100
      Height = 21
      Color = clInfoBk
      TabOrder = 0
      OnEnter = txt_cod_fornecEnter
      OnExit = txt_cod_fornecExit
      OnKeyDown = txt_cod_fornecKeyDown
      OnKeyPress = txt_cod_fornecKeyPress
    end
    object btn_pesq_fornec: TBitBtn
      Left = 115
      Top = 84
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = btn_pesq_fornecClick
      NumGlyphs = 2
    end
    object txt_fornecedor: TEdit
      Left = 139
      Top = 84
      Width = 505
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 2
    end
    object txt_cod_barra: TEdit
      Left = 10
      Top = 126
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      TabOrder = 3
      OnEnter = txt_cod_barraEnter
      OnExit = txt_cod_barraExit
      OnKeyDown = txt_cod_barraKeyDown
      OnKeyPress = txt_cod_barraKeyPress
    end
    object txt_cod_produto: TEdit
      Left = 24
      Top = 126
      Width = 49
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object btn_pesq_prod: TBitBtn
      Left = 113
      Top = 126
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 5
      OnClick = btn_pesq_prodClick
      NumGlyphs = 2
    end
    object txt_produto: TEdit
      Left = 138
      Top = 126
      Width = 508
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 6
    end
    object btnFiltrar: TBitBtn
      Left = 774
      Top = 153
      Width = 125
      Height = 36
      Caption = 'Filtrar'
      TabOrder = 7
      OnClick = btnFiltrarClick
    end
    object txt_codigo: TEdit
      Left = 11
      Top = 36
      Width = 111
      Height = 21
      TabOrder = 8
      OnEnter = txt_codigoEnter
      OnExit = txt_codigoExit
      OnKeyPress = txt_codigoKeyPress
    end
    object GroupBox2: TGroupBox
      Left = 390
      Top = 7
      Width = 254
      Height = 74
      TabOrder = 9
      object Label35: TLabel
        Left = 9
        Top = 13
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label1: TLabel
        Left = 128
        Top = 13
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object dtaInicial: TDateEdit
        Left = 7
        Top = 28
        Width = 116
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnEnter = dtaInicialEnter
        OnExit = dtaInicialExit
        OnKeyPress = dtaInicialKeyPress
      end
      object dtaFinal: TDateEdit
        Left = 128
        Top = 28
        Width = 116
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnEnter = dtaFinalEnter
        OnExit = dtaFinalExit
        OnKeyPress = dtaFinalKeyPress
      end
      object rdb_data: TRadioButton
        Left = 50
        Top = 54
        Width = 48
        Height = 17
        Caption = 'Data'
        TabOrder = 2
      end
      object rdb_vencimento: TRadioButton
        Left = 114
        Top = 54
        Width = 81
        Height = 17
        Caption = 'Vencimento'
        TabOrder = 3
      end
    end
    object txtObs: TEdit
      Left = 10
      Top = 171
      Width = 635
      Height = 21
      TabOrder = 10
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 199
    Width = 912
    Height = 194
    Align = alClient
    Color = 15794175
    DataSource = dsCotacao
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COT_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COT_DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COT_VENCIMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Vencimento'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COT_OBS'
        Title.Caption = 'Obs'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 450
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Caption = 'Valor Cota'#231#227'oR$'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 90
        Visible = True
      end>
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 393
    Width = 912
    Height = 58
    Align = alBottom
    TabOrder = 2
    object Label23: TLabel
      Left = 46
      Top = 21
      Width = 91
      Height = 13
      Caption = 'Cota'#231#245'es vencidas'
    end
    object lbl3: TLabel
      Left = 736
      Top = 15
      Width = 162
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Cotac'#227'o'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Edit1: TEdit
      Left = 10
      Top = 19
      Width = 33
      Height = 19
      AutoSize = False
      Color = 11260666
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object txt_total_cotacao: TCurrencyEdit
      Left = 736
      Top = 32
      Width = 162
      Height = 21
      AutoSize = False
      Color = 14803425
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object qryCotacao: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT C.cot_codigo, C.cot_data, C.cot_vencimento, C.cot_obs,'
      
        ' CAST(SUM(I.cot_valor * I.cot_qtd) as numeric(15,2)) AS VALOR_TO' +
        'TAL'
      'FROM itens_cotacao_compra I, COTACAO_COMPRA C'
      'WHERE I.cot_codigo = C.cot_codigo '
      'GROUP BY C.cot_codigo, C.cot_data, C.cot_vencimento, C.cot_obs ')
    Left = 383
    Top = 184
    object qryCotacaoCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
      Origin = 'COTACAO_COMPRA.COT_CODIGO'
      Required = True
    end
    object qryCotacaoCOT_DATA: TDateTimeField
      FieldName = 'COT_DATA'
      Origin = 'COTACAO_COMPRA.COT_DATA'
    end
    object qryCotacaoCOT_VENCIMENTO: TDateTimeField
      FieldName = 'COT_VENCIMENTO'
      Origin = 'COTACAO_COMPRA.COT_VENCIMENTO'
    end
    object qryCotacaoCOT_OBS: TIBStringField
      FieldName = 'COT_OBS'
      Origin = 'COTACAO_COMPRA.COT_OBS'
      Size = 1000
    end
    object qryCotacaoVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsCotacao: TDataSource
    DataSet = qryCotacao
    Left = 352
    Top = 184
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 496
    Top = 216
  end
end
