object frm_cad_receitas_mae: Tfrm_cad_receitas_mae
  Left = 244
  Top = 151
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Receitas M'#195'E'
  ClientHeight = 594
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 153
    Width = 775
    Height = 120
    Align = alTop
    Caption = 'Pesquisar Registros'
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label5: TLabel
      Left = 126
      Top = 25
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label7: TLabel
      Left = 9
      Top = 75
      Width = 103
      Height = 13
      Caption = 'Descri'#231#227'o da Receita'
    end
    object Label9: TLabel
      Left = 235
      Top = 22
      Width = 54
      Height = 13
      Caption = 'Forma Pgto'
    end
    object Label11: TLabel
      Left = 432
      Top = 75
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object txt_data_i: TDateEdit
      Left = 8
      Top = 40
      Width = 104
      Height = 20
      NumGlyphs = 2
      TabOrder = 0
      OnEnter = txt_data_iEnter
      OnExit = txt_data_iExit
      OnKeyPress = txt_data_iKeyPress
    end
    object txt_data_f: TDateEdit
      Left = 124
      Top = 40
      Width = 99
      Height = 20
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = txt_data_fEnter
      OnExit = txt_data_fExit
      OnKeyPress = txt_data_fKeyPress
    end
    object btnPesquisar: TButton
      Left = 708
      Top = 82
      Width = 113
      Height = 33
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object cbo_receita_pesquisa: TDBLookupComboBox
      Left = 8
      Top = 92
      Width = 417
      Height = 21
      KeyField = 'CODIGO'
      ListField = 'REC'
      ListSource = ds_receita
      TabOrder = 3
      OnEnter = cbo_receita_pesquisaEnter
      OnExit = cbo_receita_pesquisaExit
      OnKeyPress = cbo_receita_pesquisaKeyPress
    end
    object cboFormaPgtoPesq: TDBLookupComboBox
      Left = 232
      Top = 39
      Width = 329
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 4
      OnEnter = cboFormaPgtoPesqEnter
      OnExit = cboFormaPgtoPesqExit
      OnKeyDown = cboFormaPgtoPesqKeyDown
      OnKeyPress = cboFormaPgtoPesqKeyPress
    end
    object txtObsPesquisa: TEdit
      Left = 432
      Top = 91
      Width = 268
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 273
    Width = 775
    Height = 254
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA'
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECEITA'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR (R$)'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'TIPO'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 200
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 775
    Height = 153
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 14
      Width = 103
      Height = 13
      Caption = 'Descri'#231#227'o da Receita'
    end
    object Label3: TLabel
      Left = 8
      Top = 106
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label4: TLabel
      Left = 115
      Top = 107
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label8: TLabel
      Left = 11
      Top = 59
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object Label10: TLabel
      Left = 203
      Top = 108
      Width = 54
      Height = 13
      Caption = 'Forma Pgto'
    end
    object btnGravar: TButton
      Left = 514
      Top = 115
      Width = 87
      Height = 30
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object txt_Valor: TCurrencyEdit
      Left = 8
      Top = 124
      Width = 91
      Height = 21
      AutoSize = False
      TabOrder = 1
      OnEnter = txt_ValorEnter
      OnExit = txt_ValorExit
      OnKeyPress = txt_valorKeyPress
    end
    object txt_data: TDateEdit
      Left = 112
      Top = 124
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnEnter = txt_dataEnter
      OnExit = txt_dataExit
      OnKeyPress = txt_dataKeyPress
    end
    object txt_desc_receita: TDBLookupComboBox
      Left = 9
      Top = 31
      Width = 488
      Height = 21
      KeyField = 'CODIGO'
      ListField = 'REC'
      ListSource = ds_receita
      TabOrder = 3
      OnEnter = txt_desc_receitaEnter
      OnExit = txt_desc_receitaExit
      OnKeyPress = txt_desc_receitaKeyPress
    end
    object txt_obs: TEdit
      Left = 10
      Top = 75
      Width = 487
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnEnter = txt_obsEnter
      OnExit = txt_obsExit
      OnKeyPress = txt_obsKeyPress
    end
    object cboFormaPgto: TDBLookupComboBox
      Left = 203
      Top = 124
      Width = 294
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 5
      OnEnter = cboFormaPgtoEnter
      OnExit = cboFormaPgtoExit
      OnKeyDown = cboFormaPgtoKeyDown
      OnKeyPress = cboFormaPgtoKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 527
    Width = 775
    Height = 67
    Align = alBottom
    TabOrder = 3
    object Label6: TLabel
      Left = 489
      Top = 13
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label23: TLabel
      Left = 639
      Top = 10
      Width = 121
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total de Registros'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object btnRelatorio: TButton
      Left = 10
      Top = 24
      Width = 111
      Height = 41
      Caption = 'Relatorio'
      TabOrder = 0
      OnClick = btnRelatorioClick
    end
    object txt_total: TCurrencyEdit
      Left = 489
      Top = 32
      Width = 136
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object txtTotalRegistros: TEdit
      Left = 639
      Top = 31
      Width = 121
      Height = 24
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT T.RECEITA, C.VALOR, C.DATA, C.OBS,  C.TP_CODIGO ||'#39' - '#39'||' +
        ' TP.TP_DESCRICAO AS DESCRICAO'
      '                       FROM CAD_RECEITAS_MAE C'
      
        '                       INNER JOIN TIPO_RECEITA T on C.CODIGO = T' +
        '.CODIGO'
      
        '                       INNER JOIN TIPO_PAGAMENTO_MAE TP ON TP.TP' +
        '_CODIGO = C.TP_CODIGO WHERE  1=1'
      '                      ORDER BY C.DATA')
    Left = 224
    Top = 264
    object qryPesquisaRECEITA: TIBStringField
      FieldName = 'RECEITA'
      Origin = 'TIPO_RECEITA.RECEITA'
      Size = 64
    end
    object qryPesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CAD_RECEITAS.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryPesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'CAD_RECEITAS.DATA'
    end
    object qryPesquisaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
    object ibstrngfldPesquisaOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'CAD_RECEITAS.OBS'
      Size = 200
    end
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 144
    Top = 264
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 160
    Top = 320
  end
  object qry_receita: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 112
    Top = 6
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 152
    Top = 6
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 192
    Top = 6
  end
  object qry_tipo_receita: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, CODIGO ||'#39' - '#39'|| RECEITA AS REC FROM TIPO_RECEITA')
    Left = 352
    Top = 8
    object qry_tipo_receitaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_RECEITA.CODIGO'
      Required = True
    end
    object qry_tipo_receitaREC: TIBStringField
      FieldName = 'REC'
      Size = 78
    end
  end
  object ds_receita: TDataSource
    DataSet = qry_tipo_receita
    Left = 320
    Top = 8
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 384
    Top = 8
  end
  object dsFormaPgto: TDataSource
    DataSet = qryFormaPgto
    Left = 344
    Top = 104
  end
  object qryFormaPgto: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'#39' - '#39'|| ' +
        'TP_DESCRICAO AS DESCRICAO '
      '                      FROM TIPO_PAGAMENTO_MAE ORDER BY TP_CODIGO')
    Left = 408
    Top = 104
    object qryFormaPgtoTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'TIPO_PAGAMENTO.TP_CODIGO'
      Required = True
    end
    object qryFormaPgtoTP_DESCRICAO: TIBStringField
      FieldName = 'TP_DESCRICAO'
      Origin = 'TIPO_PAGAMENTO.TP_DESCRICAO'
      Size = 64
    end
    object qryFormaPgtoTP_DEFAULT: TIBStringField
      FieldName = 'TP_DEFAULT'
      Origin = 'TIPO_PAGAMENTO.TP_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qryFormaPgtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
end
