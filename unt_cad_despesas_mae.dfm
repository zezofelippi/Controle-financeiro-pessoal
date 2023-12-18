object frm_cad_despesas_mae: Tfrm_cad_despesas_mae
  Left = 243
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Despesa M'#195'E'
  ClientHeight = 465
  ClientWidth = 809
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
    Left = 11
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Despesa'
  end
  object Label2: TLabel
    Left = 8
    Top = 63
    Width = 108
    Height = 13
    Caption = 'Descri'#231#227'o da Despesa'
  end
  object Label3: TLabel
    Left = 508
    Top = 63
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label4: TLabel
    Left = 615
    Top = 64
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label5: TLabel
    Left = 412
    Top = 16
    Width = 64
    Height = 13
    Caption = 'Despesa Sub'
  end
  object Label6: TLabel
    Left = 8
    Top = 104
    Width = 54
    Height = 13
    Caption = 'Forma Pgto'
  end
  object txt_outra_despesa: TEdit
    Left = 8
    Top = 81
    Width = 489
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 150
    TabOrder = 0
    OnEnter = txt_outra_despesaEnter
    OnExit = txt_outra_despesaExit
    OnKeyPress = txt_outra_despesaKeyPress
  end
  object Button1: TButton
    Left = 714
    Top = 73
    Width = 85
    Height = 29
    Caption = 'Gravar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object txt_Valor: TCurrencyEdit
    Left = 508
    Top = 81
    Width = 91
    Height = 21
    AutoSize = False
    TabOrder = 2
    OnEnter = txt_ValorEnter
    OnExit = txt_ValorExit
    OnKeyPress = txt_valorKeyPress
  end
  object txt_data: TDateEdit
    Left = 612
    Top = 81
    Width = 88
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
    OnEnter = txt_dataEnter
    OnExit = txt_dataExit
    OnKeyPress = txt_dataKeyPress
  end
  object cboDespesa: TDBLookupComboBox
    Left = 9
    Top = 33
    Width = 392
    Height = 21
    KeyField = 'TIP_CODIGO'
    ListField = 'DESPESA'
    ListSource = dsDespesa
    TabOrder = 4
    OnEnter = cboDespesaEnter
    OnExit = cboDespesaExit
    OnKeyPress = cboDespesaKeyPress
  end
  object cboDespesaSub: TDBLookupComboBox
    Left = 410
    Top = 32
    Width = 391
    Height = 21
    KeyField = 'TDS_CODIGO'
    ListField = 'DESPESA_SUB'
    ListSource = dsDespesaSub
    TabOrder = 5
    OnEnter = cboDespesaSubEnter
    OnExit = cboDespesaSubExit
    OnKeyPress = cboDespesaSubKeyPress
  end
  object cboFormaPgto: TDBLookupComboBox
    Left = 8
    Top = 120
    Width = 305
    Height = 21
    KeyField = 'TP_CODIGO'
    ListField = 'DESCRICAO'
    ListSource = dsFormaPgto
    TabOrder = 6
  end
  object txt_valor_saldo: TCurrencyEdit
    Left = 616
    Top = 8
    Width = 77
    Height = 21
    AutoSize = False
    TabOrder = 7
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 144
    Width = 801
    Height = 322
    Caption = 'Cotacao de Compra'
    TabOrder = 8
    object Label7: TLabel
      Left = 95
      Top = 19
      Width = 79
      Height = 13
      Caption = 'Cod. Fornecedor'
    end
    object Label8: TLabel
      Left = 181
      Top = 20
      Width = 85
      Height = 13
      Caption = 'Nome Fornecedor'
    end
    object Label9: TLabel
      Left = 10
      Top = 21
      Width = 51
      Height = 13
      Caption = 'COTACAO'
    end
    object lbl4: TLabel
      Left = 661
      Top = 276
      Width = 124
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total'
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
    object txtFornecedor: TEdit
      Left = 179
      Top = 36
      Width = 396
      Height = 21
      CharCase = ecUpperCase
      Color = 14803425
      ReadOnly = True
      TabOrder = 0
    end
    object Button2: TButton
      Left = 584
      Top = 25
      Width = 97
      Height = 33
      Caption = 'Pesq. Cotacao'
      TabOrder = 1
      OnClick = Button2Click
    end
    object txt_cod_fornecedor: TEdit
      Left = 95
      Top = 36
      Width = 79
      Height = 21
      CharCase = ecUpperCase
      Color = 14803425
      ReadOnly = True
      TabOrder = 2
    end
    object txtCotacao: TEdit
      Left = 8
      Top = 37
      Width = 82
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 3
    end
    object DBGrid7: TDBGrid
      Left = 7
      Top = 63
      Width = 788
      Height = 210
      Color = 15794175
      DataSource = dsCotacao
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PRO_CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'Cod. Produto'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_DESCRICAO'
          Title.Caption = 'Descricao do Produto'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 320
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'COT_UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'UN'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COT_QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COT_VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor (R$)'
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
          FieldName = 'VALOR_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Total (R$)'
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
    object Button3: TButton
      Left = 696
      Top = 24
      Width = 97
      Height = 33
      Caption = 'Limpar Cota'#231#227'o'
      TabOrder = 5
      OnClick = Button3Click
    end
    object txt_total: TCurrencyEdit
      Left = 661
      Top = 293
      Width = 124
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
      TabOrder = 6
    end
  end
  object qry_despesa: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 696
    Top = 7
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 736
    Top = 7
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 776
    Top = 7
  end
  object qryDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'#39' - '#39'|| TIP_DESCR' +
        'ICAO AS DESPESA FROM TIPO_DESPESA')
    Left = 160
    Top = 23
    object qryDespesaTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
    object qryDespesaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qryDespesaTIP_DESCRICAO: TIBStringField
      FieldName = 'TIP_DESCRICAO'
      Origin = 'TIPO_DESPESA.TIP_DESCRICAO'
      Size = 64
    end
  end
  object dsDespesa: TDataSource
    DataSet = qryDespesa
    OnDataChange = dsDespesaDataChange
    Left = 120
    Top = 23
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 288
    Top = 8
  end
  object dsDespesaSub: TDataSource
    DataSet = qryDespesaSub
    Left = 528
    Top = 16
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
    Left = 576
    Top = 16
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
  object qry_pesquisa_ano: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 336
    Top = 8
  end
  object qry_pesquisa_mes: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 320
    Top = 40
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
    Left = 248
    Top = 112
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
  object dsFormaPgto: TDataSource
    DataSet = qryFormaPgto
    Left = 208
    Top = 112
  end
  object qryCotacao: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd,' +
        ' I.cot_valor,'
      ''
      '      SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL'
      ''
      '       FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F'
      
        '       WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for' +
        '_codigo_atual'
      
        '       AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR' +
        '_CODIGO'
      ''
      
        '       GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.' +
        'cot_qtd, I.cot_valor'
      ''
      '       ORDER BY P.pro_DESCRICAO'
      '')
    Left = 424
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COT_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOR_CODIGO'
        ParamType = ptUnknown
      end>
    object qryCotacaoPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'PRODUTO.PRO_CODIGO'
      Required = True
    end
    object qryCotacaoPRO_DESCRICAO: TIBStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRODUTO.PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object qryCotacaoCOT_UNIDADE: TIBStringField
      FieldName = 'COT_UNIDADE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_UNIDADE'
      Size = 12
    end
    object qryCotacaoCOT_QTD: TFloatField
      FieldName = 'COT_QTD'
      Origin = 'ITENS_COTACAO_COMPRA.COT_QTD'
      DisplayFormat = '###,##0.000'
    end
    object qryCotacaoCOT_VALOR: TIBBCDField
      FieldName = 'COT_VALOR'
      Origin = 'ITENS_COTACAO_COMPRA.COT_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryCotacaoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
  end
  object dsCotacao: TDataSource
    DataSet = qryCotacao
    Left = 376
    Top = 272
  end
end
