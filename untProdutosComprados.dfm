object frmProdutosComprados: TfrmProdutosComprados
  Left = 152
  Top = 224
  Width = 1111
  Height = 500
  Caption = 'Produtos comprados'
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 1095
    Height = 90
    Align = alTop
    Caption = 'Pesquisar Dados'
    TabOrder = 0
    object Label5: TLabel
      Left = 640
      Top = 24
      Width = 62
      Height = 13
      Caption = 'Cod. Produto'
    end
    object Label6: TLabel
      Left = 273
      Top = 24
      Width = 88
      Height = 13
      Caption = 'Descri'#231#227'o Produto'
    end
    object Label7: TLabel
      Left = 16
      Top = 23
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object Label35: TLabel
      Left = 730
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 828
      Top = 23
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object txt_cod_produto_pesq: TEdit
      Left = 640
      Top = 39
      Width = 74
      Height = 21
      TabOrder = 0
      OnChange = txt_cod_produto_pesqChange
      OnKeyPress = txt_cod_produto_pesqKeyPress
    end
    object txt_descricao_pesq: TEdit
      Left = 273
      Top = 39
      Width = 358
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = txt_descricao_pesqChange
      OnKeyPress = txt_descricao_pesqKeyPress
    end
    object txt_grupo_pesq: TDBLookupComboBox
      Left = 14
      Top = 39
      Width = 251
      Height = 21
      KeyField = 'GRP_CODIGO'
      ListField = 'GRP_DESCRICAO'
      ListSource = dsGrupoPesq
      TabOrder = 2
      OnClick = txt_grupo_pesqClick
      OnKeyDown = txt_grupo_pesqKeyDown
      OnKeyPress = txt_grupo_pesqKeyPress
      OnKeyUp = txt_grupo_pesqKeyUp
    end
    object rdb_inicio: TRadioButton
      Left = 284
      Top = 67
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 3
      OnClick = rdb_inicioClick
    end
    object rdb_posicao: TRadioButton
      Left = 372
      Top = 67
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 4
      OnClick = rdb_posicaoClick
    end
    object btnPesquisar: TButton
      Left = 931
      Top = 31
      Width = 75
      Height = 33
      Caption = 'Pesquisar'
      TabOrder = 5
      OnClick = btnPesquisarClick
    end
    object dtaInicial: TDateEdit
      Left = 726
      Top = 39
      Width = 94
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 6
    end
    object dtaFinal: TDateEdit
      Left = 826
      Top = 38
      Width = 95
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 7
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 90
    Width = 1095
    Height = 316
    Align = alClient
    Color = 15794175
    DataSource = dsProduto
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
        FieldName = 'PRO_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Prod'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o do Produto'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 310
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COT_QTD'
        Title.Alignment = taCenter
        Title.Caption = 'QTDE'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 60
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
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COT_VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o R$'
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
        FieldName = 'VALOR_TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Valor Total (R$)'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COT_VENCIMENTO'
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
        FieldName = 'AT_NOME'
        Title.Caption = 'Fornecedor'
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
        FieldName = 'COT_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Cota'#231#227'o'
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
        Title.Alignment = taCenter
        Title.Caption = 'OBS'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 60
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 406
    Width = 1095
    Height = 55
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      Left = 360
      Top = 10
      Width = 16
      Height = 13
      Caption = 'UN'
    end
    object Label2: TLabel
      Left = 255
      Top = 11
      Width = 30
      Height = 13
      Caption = 'QTDE'
    end
    object Label3: TLabel
      Left = 390
      Top = 9
      Width = 68
      Height = 13
      Caption = 'Valor Total R$'
    end
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 25
      AutoSize = False
      Color = 10210815
      ParentColor = False
    end
    object Label8: TLabel
      Left = 78
      Top = 21
      Width = 166
      Height = 16
      Caption = 'Itens lan'#231'ados no financeiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 545
      Top = 24
      Width = 456
      Height = 13
      Caption = 
        'OBS: Itens com UN diferentes N'#195'O v'#227'o mostrar QTDE e Valor Total ' +
        'R$ corretos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtUnidade: TEdit
      Left = 360
      Top = 25
      Width = 25
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 0
    end
    object txtQtde: TEdit
      Left = 255
      Top = 26
      Width = 101
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 1
    end
    object txtValorTotal: TEdit
      Left = 390
      Top = 24
      Width = 147
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 2
    end
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 456
    Top = 168
  end
  object qryProduto: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT P.PRO_CODIGO, PRO_DESCRICAO, I.COT_QTD, I.COT_VALOR,     ' +
        '   '
      
        'SUM(I.COT_QTD * I.COT_VALOR) AS VALOR_TOTAL,                    ' +
        '   '
      
        'I.COT_UNIDADE, COTA.COT_VENCIMENTO, FORN.at_nome, COTA.cot_codig' +
        'o,'
      'ifv.cot_compra_efetuada, ICCF.cot_obs'
      
        'FROM cotacao_compra COTA                                        ' +
        '   '
      
        'INNER JOIN itens_cotacao_compra I ON                            ' +
        '   '
      
        'COTA.cot_codigo = I.cot_codigo                                  ' +
        '   '
      
        'INNER JOIN agenda_telefone FORN ON                              ' +
        '   '
      
        'I.for_codigo_atual = FORN.at_codigo                             ' +
        '   '
      
        'INNER JOIN produto p ON                                         ' +
        '   '
      
        'I.pro_codigo = P.pro_codigo                                     ' +
        '   '
      
        'INNER JOIN GRUPO GR ON                                          ' +
        '   '
      
        'P.grp_codigo = GR.grp_codigo                                    ' +
        '   '
      
        'INNER JOIN itens_cotacao_fornec_venc Ifv ON                     ' +
        '   '
      
        'cota.cot_codigo = ifv.cot_codigo and forn.at_codigo = ifv.for_co' +
        'digo'
      ''
      'INNER JOIN itens_cotacao_compra_fornec ICCF ON'
      
        'COTA.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_co' +
        'digo'
      ''
      
        'WHERE COTA.finalizado = '#39'S'#39' AND COTA.COT_VENCIMENTO BETWEEN :DAT' +
        'A1 AND :DATA2 AND COTA.cot_codigo=:COT_CODIGO'
      
        'GROUP BY P.PRO_CODIGO, PRO_DESCRICAO, I.COT_QTD, I.COT_VALOR,   ' +
        '   '
      
        'I.COT_UNIDADE, COTA.COT_VENCIMENTO, FORN.at_nome, COTA.cot_codig' +
        'o,'
      'ifv.cot_compra_efetuada, ICCF.cot_obs')
    Left = 496
    Top = 167
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COT_CODIGO'
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
    object qryProdutoCOT_UNIDADE: TIBStringField
      FieldName = 'COT_UNIDADE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_UNIDADE'
      Size = 12
    end
    object qryProdutoCOT_VENCIMENTO: TDateTimeField
      FieldName = 'COT_VENCIMENTO'
      Origin = 'COTACAO_COMPRA.COT_VENCIMENTO'
    end
    object qryProdutoAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
    object qryProdutoCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
      Origin = 'COTACAO_COMPRA.COT_CODIGO'
      Required = True
    end
    object qryProdutoCOT_COMPRA_EFETUADA: TIBStringField
      FieldName = 'COT_COMPRA_EFETUADA'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_COMPRA_EFETUADA'
      FixedChar = True
      Size = 1
    end
    object qryProdutoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
    object qryProdutoCOT_OBS: TIBStringField
      FieldName = 'COT_OBS'
      Origin = 'ITENS_COTACAO_COMPRA_FORNEC.COT_OBS'
      Size = 100
    end
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 496
    Top = 224
  end
  object dsGrupoPesq: TDataSource
    DataSet = qryGrupoPesq
    Left = 152
    Top = 96
  end
  object qryGrupoPesq: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from grupo order by grp_descricao')
    Left = 184
    Top = 96
    object qryGrupoPesqGRP_CODIGO: TIntegerField
      FieldName = 'GRP_CODIGO'
      Origin = 'GRUPO.GRP_CODIGO'
      Required = True
    end
    object qryGrupoPesqGRP_DESCRICAO: TIBStringField
      FieldName = 'GRP_DESCRICAO'
      Origin = 'GRUPO.GRP_DESCRICAO'
      Required = True
      Size = 32
    end
  end
end
