object frmItensCotacaoCompra: TfrmItensCotacaoCompra
  Left = 340
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Itens Cota'#231#227'o Compra'
  ClientHeight = 445
  ClientWidth = 805
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 1
    Width = 801
    Height = 432
    Caption = 'Cotacao de Compra'
    TabOrder = 0
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
      Top = 387
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
    object txt_cod_fornecedor: TEdit
      Left = 95
      Top = 36
      Width = 79
      Height = 21
      CharCase = ecUpperCase
      Color = 14803425
      ReadOnly = True
      TabOrder = 1
    end
    object txtCotacao: TEdit
      Left = 8
      Top = 37
      Width = 82
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 2
    end
    object DBGrid7: TDBGrid
      Left = 7
      Top = 174
      Width = 788
      Height = 210
      Color = 15794175
      DataSource = dsCotacao
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 3
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
    object txt_total: TCurrencyEdit
      Left = 661
      Top = 404
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
      TabOrder = 4
    end
    object txt_obs: TMemo
      Left = 10
      Top = 73
      Width = 759
      Height = 87
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2000
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
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
    Left = 248
    Top = 233
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
    Left = 208
    Top = 233
  end
  object qry_Pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 384
    Top = 233
  end
end
