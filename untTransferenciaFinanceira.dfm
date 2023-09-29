object frmTransferenciaFinanceira: TfrmTransferenciaFinanceira
  Left = 253
  Top = 144
  Align = alClient
  BorderStyle = bsSingle
  Caption = 'Transferencia Financeira'
  ClientHeight = 516
  ClientWidth = 830
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
    Top = 113
    Width = 830
    Height = 63
    Align = alTop
    Caption = 'Pesquisar Registros'
    TabOrder = 0
    object Label5: TLabel
      Left = 9
      Top = 20
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label6: TLabel
      Left = 137
      Top = 20
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label7: TLabel
      Left = 266
      Top = 15
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label9: TLabel
      Left = 546
      Top = 12
      Width = 25
      Height = 13
      Caption = 'Para:'
    end
    object txt_Data_i: TDateEdit
      Left = 7
      Top = 35
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnEnter = txt_Data_iEnter
      OnExit = txt_Data_iExit
      OnKeyPress = txt_Data_iKeyPress
    end
    object txt_data_f: TDateEdit
      Left = 135
      Top = 34
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = txt_data_fEnter
      OnExit = txt_data_fExit
      OnKeyPress = txt_data_fKeyPress
    end
    object btnPesquisar: TButton
      Left = 803
      Top = 17
      Width = 102
      Height = 33
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object cbo_de_pesq: TDBLookupComboBox
      Left = 264
      Top = 32
      Width = 273
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsTipoReceita
      TabOrder = 3
      OnKeyDown = cbo_de_pesqKeyDown
    end
    object cbo_para_pesq: TDBLookupComboBox
      Left = 541
      Top = 30
      Width = 252
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsTipoReceita
      TabOrder = 4
      OnKeyDown = cbo_para_pesqKeyDown
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 176
    Width = 830
    Height = 271
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
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DE'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARA'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 250
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
        Width = 90
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
        Width = 500
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 830
    Height = 113
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label2: TLabel
      Left = 202
      Top = 20
      Width = 25
      Height = 13
      Caption = 'Para:'
    end
    object Label3: TLabel
      Left = 494
      Top = 19
      Width = 47
      Height = 13
      Caption = 'Valor (R$)'
    end
    object Label4: TLabel
      Left = 388
      Top = 20
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label8: TLabel
      Left = 10
      Top = 62
      Width = 25
      Height = 13
      Caption = 'OBS:'
    end
    object cbo_de: TDBLookupComboBox
      Left = 8
      Top = 35
      Width = 185
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsTipoReceita
      TabOrder = 0
      OnEnter = cbo_deEnter
      OnExit = cbo_deExit
      OnKeyPress = cbo_deKeyPress
    end
    object cbo_para: TDBLookupComboBox
      Left = 200
      Top = 35
      Width = 185
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsTipoReceita
      TabOrder = 1
      OnEnter = cbo_paraEnter
      OnExit = cbo_paraExit
      OnKeyPress = cbo_paraKeyPress
    end
    object txt_valor: TCurrencyEdit
      Left = 494
      Top = 35
      Width = 94
      Height = 21
      AutoSize = False
      TabOrder = 2
      OnEnter = txt_valorEnter
      OnExit = txt_valorExit
      OnKeyPress = txt_valorKeyPress
    end
    object btnGravar: TButton
      Left = 593
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object txt_data: TDateEdit
      Left = 387
      Top = 35
      Width = 104
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
      OnEnter = txt_dataEnter
      OnExit = txt_dataExit
      OnKeyPress = txt_dataKeyPress
    end
    object txt_obs: TEdit
      Left = 8
      Top = 76
      Width = 657
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 5
      OnEnter = txt_obsEnter
      OnExit = txt_obsExit
      OnKeyPress = txt_obsKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 447
    Width = 830
    Height = 69
    Align = alBottom
    TabOrder = 3
    object Label10: TLabel
      Left = 561
      Top = 19
      Width = 112
      Height = 13
      Caption = 'Total Transfer'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnRelatorio: TButton
      Left = 20
      Top = 16
      Width = 117
      Height = 41
      Caption = 'Relatorio'
      TabOrder = 0
      OnClick = btnRelatorioClick
    end
    object txt_valor_saldo: TCurrencyEdit
      Left = 527
      Top = 33
      Width = 145
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object qry_transLocal: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 536
    Top = 312
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 608
    Top = 312
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 568
    Top = 264
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TF.data, TF.valor, TF.obs,'
      '       TF.tp_codigo_de ||'#39' - '#39'|| TP.tp_descricao as DE,'
      '       TF.tp_codigo_para ||'#39' - '#39'|| TPP.tp_descricao as PARA'
      ''
      '     FROM TIPO_PAGAMENTO TP'
      
        '        INNER JOIN transferencia_financeira TF ON TF.tp_codigo_d' +
        'e = TP.tp_codigo'
      
        '        INNER JOIN TIPO_PAGAMENTO TPP ON TPP.tp_codigo = TF.tp_c' +
        'odigo_para')
    Left = 752
    Top = 328
    object qryPesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'TRANSFERENCIA_FINANCEIRA.DATA'
    end
    object qryPesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'TRANSFERENCIA_FINANCEIRA.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryPesquisaOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'TRANSFERENCIA_FINANCEIRA.OBS'
      Size = 100
    end
    object qryPesquisaDE: TIBStringField
      FieldName = 'DE'
      Size = 78
    end
    object qryPesquisaPARA: TIBStringField
      FieldName = 'PARA'
      Size = 78
    end
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 704
    Top = 328
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 728
    Top = 376
  end
  object qryTipoReceita: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'#39' - '#39'|| ' +
        'TP_DESCRICAO AS DESCRICAO '
      '                      FROM TIPO_PAGAMENTO ORDER BY TP_CODIGO')
    Left = 328
    Top = 65528
    object qryTipoReceitaTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'TIPO_PAGAMENTO.TP_CODIGO'
      Required = True
    end
    object qryTipoReceitaTP_DESCRICAO: TIBStringField
      FieldName = 'TP_DESCRICAO'
      Origin = 'TIPO_PAGAMENTO.TP_DESCRICAO'
      Size = 64
    end
    object qryTipoReceitaTP_DEFAULT: TIBStringField
      FieldName = 'TP_DEFAULT'
      Origin = 'TIPO_PAGAMENTO.TP_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qryTipoReceitaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
  object dsTipoReceita: TDataSource
    DataSet = qryTipoReceita
    Left = 288
    Top = 65528
  end
end
