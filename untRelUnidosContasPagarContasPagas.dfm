object frmRelUnidosContasPagarContasPagas: TfrmRelUnidosContasPagarContasPagas
  Left = 111
  Top = 132
  Width = 1133
  Height = 577
  BorderIcons = [biSystemMenu]
  Caption = 'Relatorio de uni'#227'o contas a pagar com contas pagas'
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 129
    Width = 1117
    Height = 342
    Align = alClient
    DataSource = ds_pesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
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
        FieldName = 'DATAPGTO'
        Title.Alignment = taCenter
        Title.Caption = 'Data Compra'
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
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
        FieldName = 'DESPESA'
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
        FieldName = 'DESPESA_SUB'
        Title.Caption = 'DESPESA SUB'
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
        FieldName = 'DESCRICAO'
        Title.Caption = 'DESCRI'#199#195'O DA DESPESA'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1117
    Height = 129
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 252
      Top = 17
      Width = 64
      Height = 13
      Caption = 'Tipo despesa'
    end
    object Label5: TLabel
      Left = 248
      Top = 60
      Width = 74
      Height = 13
      Caption = 'Despesa outros'
    end
    object Label15: TLabel
      Left = 488
      Top = 20
      Width = 64
      Height = 13
      Caption = 'Despesa Sub'
    end
    object gpb1: TGroupBox
      Left = 7
      Top = 18
      Width = 225
      Height = 62
      Caption = 'Data do pagamento das despesas'
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 24
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object lbl2: TLabel
        Left = 121
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object txt_data_i: TDateEdit
        Left = 6
        Top = 39
        Width = 104
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object txt_data_f: TDateEdit
        Left = 117
        Top = 39
        Width = 101
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object cboDespesa: TDBLookupComboBox
      Left = 248
      Top = 34
      Width = 231
      Height = 21
      KeyField = 'TIP_CODIGO'
      ListField = 'DESPESA'
      ListSource = dsDespesa
      TabOrder = 1
      OnExit = cboDespesaExit
      OnKeyDown = cboDespesaKeyDown
    end
    object txt_despesa_outros: TEdit
      Left = 247
      Top = 74
      Width = 308
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object rdb_inicio: TRadioButton
      Left = 256
      Top = 100
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 3
    end
    object rdb_posicao: TRadioButton
      Left = 344
      Top = 100
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 4
    end
    object cboDespesaSub: TDBLookupComboBox
      Left = 486
      Top = 34
      Width = 218
      Height = 21
      KeyField = 'TDS_CODIGO'
      ListField = 'DESPESA_SUB'
      ListSource = dsDespesaSub
      TabOrder = 5
      OnKeyDown = cboDespesaSubKeyDown
    end
    object Button1: TButton
      Left = 564
      Top = 70
      Width = 137
      Height = 25
      Caption = 'Visualizar Dados'
      TabOrder = 6
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 471
    Width = 1117
    Height = 67
    Align = alBottom
    TabOrder = 2
    object Label6: TLabel
      Left = 613
      Top = 11
      Width = 153
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label23: TLabel
      Left = 781
      Top = 12
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
    object txt_total: TCurrencyEdit
      Left = 615
      Top = 33
      Width = 150
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object txtTotalRegistros: TEdit
      Left = 781
      Top = 33
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
      TabOrder = 1
    end
  end
  object ds_pesquisa: TDataSource
    DataSet = qry_pesquisa
    Left = 344
    Top = 185
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT C.data_despesa AS DATAPGTO,'
      '  C.codigo, C.descricao, C.valor,'
      '  T.tip_codigo ||'#39' - '#39'|| T.tip_descricao AS DESPESA,'
      
        '  TDS.TDS_codigo ||'#39' - '#39'|| TDS.TDS_descricao AS DESPESA_SUB, C.C' +
        'OT_CODIGO, C.AT_CODIGO'
      '  FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS'
      '')
    Left = 392
    Top = 184
    object qry_pesquisaDATAPGTO: TDateTimeField
      FieldName = 'DATAPGTO'
      Origin = 'CONTAS_PAGAR.DATA_DESPESA'
    end
    object qry_pesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS_PAGAR.CODIGO'
      Required = True
    end
    object qry_pesquisaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'CONTAS_PAGAR.DESCRICAO'
      Size = 150
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CONTAS_PAGAR.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qry_pesquisaDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qry_pesquisaCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
      Origin = 'CONTAS_PAGAR.COT_CODIGO'
    end
    object qry_pesquisaAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'CONTAS_PAGAR.AT_CODIGO'
    end
  end
  object dsDespesa: TDataSource
    DataSet = qryDespesa
    Left = 344
    Top = 11
  end
  object qryDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 384
    Top = 11
  end
  object dsDespesaSub: TDataSource
    DataSet = qryDespesaSub
    Left = 568
    Top = 11
  end
  object qryDespesaSub: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TDS.tds_codigo || '#39' - '#39' || TDS.tds_descricao AS DESPESA_S' +
        'UB, TDS.tds_codigo'
      'FROM TIPO_DESPESA_SUB TDS')
    Left = 616
    Top = 11
    object qryDespesaSubDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qryDespesaSubTDS_CODIGO: TIntegerField
      FieldName = 'TDS_CODIGO'
      Origin = 'TIPO_DESPESA_SUB.TDS_CODIGO'
      Required = True
    end
  end
  object qry_soma: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 512
    Top = 201
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 280
    object ItensCotao1: TMenuItem
      Caption = 'Itens Cota'#231#227'o'
      OnClick = ItensCotao1Click
    end
  end
end
