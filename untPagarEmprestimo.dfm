object frmPagarEmprestimo: TfrmPagarEmprestimo
  Left = 139
  Top = 240
  BorderStyle = bsSingle
  Caption = 'Pagar Emprestimo'
  ClientHeight = 410
  ClientWidth = 1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 773
    Top = 367
    Width = 136
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Total Pago'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 8
    Width = 1089
    Height = 67
    TabOrder = 0
    object Label8: TLabel
      Left = 9
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label4: TLabel
      Left = 79
      Top = 13
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label3: TLabel
      Left = 183
      Top = 12
      Width = 52
      Height = 13
      Caption = 'Valor Pago'
    end
    object Label1: TLabel
      Left = 542
      Top = 12
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object Label13: TLabel
      Left = 270
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Forma Pgto'
    end
    object txt_codigo: TEdit
      Left = 8
      Top = 28
      Width = 64
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 0
    end
    object txt_data: TDateEdit
      Left = 76
      Top = 28
      Width = 99
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = txt_dataEnter
      OnExit = txt_dataExit
      OnKeyPress = txt_dataKeyPress
    end
    object txt_Valor: TCurrencyEdit
      Left = 179
      Top = 28
      Width = 87
      Height = 21
      AutoSize = False
      TabOrder = 2
      OnEnter = txt_ValorEnter
      OnExit = txt_ValorExit
      OnKeyPress = txt_ValorKeyPress
    end
    object txt_obs: TEdit
      Left = 539
      Top = 28
      Width = 398
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 3
      OnEnter = txt_obsEnter
      OnExit = txt_obsExit
      OnKeyPress = txt_obsKeyPress
    end
    object btnGravar: TButton
      Left = 944
      Top = 21
      Width = 81
      Height = 29
      Caption = 'Gravar'
      TabOrder = 4
      OnClick = btnGravarClick
    end
    object cboFormaPgto: TDBLookupComboBox
      Left = 269
      Top = 28
      Width = 264
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 5
      OnEnter = cboFormaPgtoEnter
      OnExit = cboFormaPgtoExit
      OnKeyPress = cboFormaPgtoKeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 7
    Top = 167
    Width = 1083
    Height = 194
    DataSource = dsRecebido
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PG_CODIGO'
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
        FieldName = 'PG_DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
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
        FieldName = 'PG_VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor Pago'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Tipo'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_OBS'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 470
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Empr'#233'stimo a Pagar'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object txt_total_recebido: TCurrencyEdit
    Left = 773
    Top = 383
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
    TabOrder = 2
  end
  object gpb1: TGroupBox
    Left = 0
    Top = 77
    Width = 1088
    Height = 84
    TabOrder = 3
    object lbl1: TLabel
      Left = 8
      Top = 11
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object lbl2: TLabel
      Left = 121
      Top = 11
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object lbl3: TLabel
      Left = 527
      Top = 10
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object Label14: TLabel
      Left = 241
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Forma Pgto'
    end
    object edt_data_i: TDateEdit
      Left = 6
      Top = 26
      Width = 104
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object edt_data_f: TDateEdit
      Left = 117
      Top = 26
      Width = 101
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object edt_OBS_pesq: TEdit
      Left = 525
      Top = 26
      Width = 445
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object btnPesquisar: TButton
      Left = 990
      Top = 17
      Width = 91
      Height = 31
      Caption = 'Pesquisar'
      TabOrder = 3
      OnClick = btnPesquisarClick
    end
    object rdb_inicio: TRadioButton
      Left = 577
      Top = 55
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 4
    end
    object rdb_posicao: TRadioButton
      Left = 665
      Top = 55
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 5
    end
    object cboFormaPgtoPesquisa: TDBLookupComboBox
      Left = 238
      Top = 25
      Width = 275
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 6
    end
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTRANSLOCAL
    BufferChunks = 1000
    CachedUpdates = False
    Left = 608
    Top = 288
  end
  object IBTRANSLOCAL: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 640
    Top = 288
  end
  object qryRecebido: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT EP.*, EP.TP_CODIGO ||'#39' - '#39'|| TP.TP_DESCRICAO AS DESCRICAO' +
        ' FROM PAGTO_EMPRESTIMOS_A_PAGAR EP'
      
        '        INNER JOIN TIPO_PAGAMENTO TP ON EP.TP_CODIGO = TP.TP_COD' +
        'IGO'
      '        WHERE CODIGO=:CODIGO ORDER BY PG_CODIGO')
    Left = 296
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryRecebidoPG_CODIGO: TIntegerField
      FieldName = 'PG_CODIGO'
      Origin = 'PAGTO_EMPRESTIMOS_A_PAGAR.PG_CODIGO'
      Required = True
    end
    object qryRecebidoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PAGTO_EMPRESTIMOS_A_PAGAR.CODIGO'
      Required = True
    end
    object qryRecebidoPG_VALOR: TIBBCDField
      FieldName = 'PG_VALOR'
      Origin = 'PAGTO_EMPRESTIMOS_A_PAGAR.PG_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryRecebidoPG_DATA: TDateTimeField
      FieldName = 'PG_DATA'
      Origin = 'PAGTO_EMPRESTIMOS_A_PAGAR.PG_DATA'
    end
    object qryRecebidoPG_OBS: TIBStringField
      FieldName = 'PG_OBS'
      Origin = 'PAGTO_EMPRESTIMOS_A_PAGAR.PG_OBS'
      Size = 100
    end
    object qryRecebidoTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'PAGTO_EMPRESTIMOS_A_PAGAR.TP_CODIGO'
    end
    object qryRecebidoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
  object dsRecebido: TDataSource
    DataSet = qryRecebido
    Left = 232
    Top = 136
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 136
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 528
    Top = 144
  end
  object dsFormaPgto: TDataSource
    DataSet = qryFormaPgto
    Left = 384
    Top = 8
  end
  object qryFormaPgto: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'#39' - '#39'|| ' +
        'TP_DESCRICAO AS DESCRICAO '
      '                      FROM TIPO_PAGAMENTO ORDER BY TP_CODIGO')
    Left = 472
    Top = 8
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
