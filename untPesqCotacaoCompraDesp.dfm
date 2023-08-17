object frmPesqCotacaoCompraDesp: TfrmPesqCotacaoCompraDesp
  Left = 281
  Top = 124
  BorderStyle = bsSingle
  Caption = 'Pesquisa Cotacao Compra'
  ClientHeight = 462
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 854
    Height = 237
    Align = alTop
    TabOrder = 0
    object Label9: TLabel
      Left = 138
      Top = 7
      Width = 76
      Height = 13
      Caption = 'C'#243'd Fornecedor'
    end
    object Label4: TLabel
      Left = 268
      Top = 6
      Width = 57
      Height = 13
      Caption = 'Fornecedor '
    end
    object Label6: TLabel
      Left = 13
      Top = 5
      Width = 76
      Height = 13
      Caption = 'C'#243'digo Cota'#231#227'o'
    end
    object lbl2: TLabel
      Left = 164
      Top = 204
      Width = 178
      Height = 13
      Caption = 'Fornecedores c/ produtos comprados'
    end
    object lbl1: TLabel
      Left = 112
      Top = 201
      Width = 46
      Height = 18
      AutoSize = False
      Color = 60138
      ParentColor = False
    end
    object txt_cod_fornec: TEdit
      Left = 138
      Top = 20
      Width = 100
      Height = 21
      Color = clInfoBk
      TabOrder = 1
      OnEnter = txt_cod_fornecEnter
      OnExit = txt_cod_fornecExit
      OnKeyPress = txt_cod_fornecKeyPress
    end
    object btn_pesq_fornec: TBitBtn
      Left = 243
      Top = 20
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 2
      NumGlyphs = 2
    end
    object txt_fornecedor: TEdit
      Left = 267
      Top = 20
      Width = 454
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 3
    end
    object txt_codigo: TEdit
      Left = 11
      Top = 20
      Width = 111
      Height = 21
      TabOrder = 0
      OnEnter = txt_codigoEnter
      OnExit = txt_codigoExit
      OnKeyPress = txt_codigoKeyPress
    end
    object btnPesquisar: TButton
      Left = 728
      Top = 13
      Width = 105
      Height = 30
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = btnPesquisarClick
    end
    object DBGrd1: TDBGrid
      Left = 8
      Top = 56
      Width = 833
      Height = 140
      DataSource = dsFornecedor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrd1DrawColumnCell
      OnDblClick = DBGrd1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COT_CODIGO'
          Title.Caption = 'Cod. Cota'#231#227'o'
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
          FieldName = 'FOR_CODIGO'
          Title.Caption = 'Cod. Fornecedor'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AT_NOME'
          Title.Caption = 'Nome do Fornecedor'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 450
          Visible = True
        end>
    end
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 240
    Width = 843
    Height = 219
    DataSource = dsProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o do produto'
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
        FieldName = 'COT_QTD'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde'
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
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COT_VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor Unit.'
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
        FieldName = 'VALOR_TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Valor Total'
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
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 176
    Top = 32
  end
  object qryFornecedor: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT I.COT_CODIGO,  I.FOR_CODIGO, F.AT_nome, I.COT_PREVISAO_EN' +
        'TREGA, '
      
        'I.COT_VALOR_FRETE, F.AT_TELEFONE, AT_CELULAR, I.COT_COMPRA_EFETU' +
        'ADA '
      ''
      ' FROM  itens_cotacao_fornec_venc I, AGENDA_TELEFONE F'
      ' '
      '    group by I.COT_CODIGO, I.for_codigo, F.AT_nome,'
      '     I.COT_PREVISAO_ENTREGA, '
      'I.COT_VALOR_FRETE , F.AT_TELEFONE, AT_CELULAR,'
      'I.COT_COMPRA_EFETUADA  '
      '')
    Left = 368
    Top = 72
    object qryFornecedorCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_CODIGO'
      Required = True
    end
    object qryFornecedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.FOR_CODIGO'
      Required = True
    end
    object qryFornecedorAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
    object qryFornecedorCOT_PREVISAO_ENTREGA: TDateTimeField
      FieldName = 'COT_PREVISAO_ENTREGA'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_PREVISAO_ENTREGA'
    end
    object qryFornecedorCOT_VALOR_FRETE: TIBBCDField
      FieldName = 'COT_VALOR_FRETE'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object qryFornecedorAT_TELEFONE: TIBStringField
      FieldName = 'AT_TELEFONE'
      Origin = 'AGENDA_TELEFONE.AT_TELEFONE'
      Size = 16
    end
    object qryFornecedorAT_CELULAR: TIBStringField
      FieldName = 'AT_CELULAR'
      Origin = 'AGENDA_TELEFONE.AT_CELULAR'
      Size = 16
    end
    object qryFornecedorCOT_COMPRA_EFETUADA: TIBStringField
      FieldName = 'COT_COMPRA_EFETUADA'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_COMPRA_EFETUADA'
      FixedChar = True
      Size = 1
    end
  end
  object qryProduto: TIBQuery
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
      ''
      ''
      ''
      '')
    Left = 384
    Top = 256
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
    object qryProdutoPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'PRODUTO.PRO_CODIGO'
      Required = True
    end
    object qryProdutoPRO_DESCRICAO: TIBStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRODUTO.PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object qryProdutoCOT_UNIDADE: TIBStringField
      FieldName = 'COT_UNIDADE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_UNIDADE'
      Size = 12
    end
    object qryProdutoCOT_QTD: TFloatField
      FieldName = 'COT_QTD'
      Origin = 'ITENS_COTACAO_COMPRA.COT_QTD'
      DisplayFormat = '###,##0.000'
    end
    object qryProdutoCOT_VALOR: TIBBCDField
      FieldName = 'COT_VALOR'
      Origin = 'ITENS_COTACAO_COMPRA.COT_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
  end
  object dsFornecedor: TDataSource
    DataSet = qryFornecedor
    OnDataChange = dsFornecedorDataChange
    Left = 320
    Top = 72
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 344
    Top = 256
  end
end
