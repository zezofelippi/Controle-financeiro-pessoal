object frmItensCotacaoContasPagar: TfrmItensCotacaoContasPagar
  Left = 305
  Top = 209
  BorderStyle = bsSingle
  Caption = 'Itens Cotacao Compra'
  ClientHeight = 408
  ClientWidth = 811
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
  object Label4: TLabel
    Left = 584
    Top = 36
    Width = 121
    Height = 19
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
  object Memo1: TMemo
    Left = 71
    Top = 5
    Width = 737
    Height = 27
    Color = 14803425
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 84
    Width = 801
    Height = 322
    Caption = 'Cotacao de Compra'
    TabOrder = 1
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
    object btnGravar: TButton
      Left = 696
      Top = 24
      Width = 97
      Height = 33
      Caption = 'Gravar Cota'#231#227'o'
      TabOrder = 5
      OnClick = btnGravarClick
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
    object txt_codigo: TEdit
      Left = 24
      Top = 280
      Width = 121
      Height = 21
      TabOrder = 7
      Visible = False
    end
  end
  object mmoCodigo: TMemo
    Left = 8
    Top = 8
    Width = 57
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object txtTotalContasSelecionadas: TCurrencyEdit
    Left = 584
    Top = 56
    Width = 121
    Height = 21
    AutoSize = False
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
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
      '       ORDER BY P.pro_DESCRICAO')
    Left = 296
    Top = 178
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
  object qry_Pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 178
  end
  object dsCotacao: TDataSource
    DataSet = qryCotacao
    Left = 264
    Top = 178
  end
end
