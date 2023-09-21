object frmRelCotacaoFornecedores: TfrmRelCotacaoFornecedores
  Left = 275
  Top = 123
  Width = 933
  Height = 518
  Caption = 'Relatorio de Fornecedores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frFornecedores: TRLReport
    Left = 24
    Top = 24
    Width = 794
    Height = 1123
    DataSource = dsFornecedores
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ExpressionParser = RLExpressionParser1
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 57
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLLabel8: TRLLabel
        Left = 264
        Top = 8
        Width = 170
        Height = 16
        Caption = 'Fornecedores Vencedores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 8
        Top = 33
        Width = 53
        Height = 15
        Caption = 'Cota'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt_cotacao: TRLLabel
        Left = 64
        Top = 33
        Width = 78
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 150
        Top = 33
        Width = 82
        Height = 15
        Caption = 'Data Cotacao:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt_data_cotacao: TRLLabel
        Left = 235
        Top = 33
        Width = 95
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 346
        Top = 34
        Width = 103
        Height = 15
        Caption = 'Data Vencimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt_data_vencimento: TRLLabel
        Left = 452
        Top = 34
        Width = 112
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 95
      Width = 718
      Height = 140
      DataFields = 'FOR_CODIGO_ATUAL'
      BeforePrint = RLGroup1BeforePrint
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 20
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLLabel1: TRLLabel
          Left = 5
          Top = 4
          Width = 73
          Height = 14
          Caption = 'Fornecedor :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 82
          Top = 4
          Width = 407
          Height = 14
          AutoSize = False
          DataField = 'FORNEC'
          DataSource = dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 500
          Top = 4
          Width = 102
          Height = 14
          Caption = 'Previs'#227'o Entrega :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText7: TRLDBText
          Left = 605
          Top = 4
          Width = 99
          Height = 14
          AutoSize = False
          DataField = 'COT_PREVISAO_ENTREGA'
          DataSource = dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 20
        Width = 718
        Height = 17
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLLabel2: TRLLabel
          Left = 13
          Top = 2
          Width = 86
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = 'Cod. Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 104
          Top = 2
          Width = 354
          Height = 14
          AutoSize = False
          Caption = 'Descri'#231#227'o do Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 462
          Top = 2
          Width = 24
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = 'UN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 489
          Top = 2
          Width = 69
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 561
          Top = 2
          Width = 77
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel18: TRLLabel
          Left = 641
          Top = 2
          Width = 74
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 37
        Width = 718
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        BeforePrint = RLBand4BeforePrint
        object RLDBText2: TRLDBText
          Left = 4
          Top = 0
          Width = 94
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'PRO_CODIGO'
          DataSource = dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 104
          Top = 1
          Width = 354
          Height = 14
          AutoSize = False
          DataField = 'PRO_DESCRICAO'
          DataSource = dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 462
          Top = 1
          Width = 24
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'COT_UNIDADE'
          DataSource = dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 489
          Top = 1
          Width = 69
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'COT_QTD'
          DataSource = dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 561
          Top = 1
          Width = 77
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'COT_VALOR'
          DataSource = dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText8: TRLDBText
          Left = 641
          Top = 1
          Width = 74
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataFormula = 'COT_QTD * COT_VALOR'
          DataSource = dsFornecedores
          DisplayMask = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 52
        Width = 718
        Height = 67
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        BeforePrint = RLBand5BeforePrint
        object RLLabel7: TRLLabel
          Left = 558
          Top = 2
          Width = 73
          Height = 16
          Caption = 'Sub.Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 636
          Top = 3
          Width = 79
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataFormula = 'COT_QTD * COT_VALOR'
          DataSource = dsFornecedores
          DisplayMask = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 586
          Top = 20
          Width = 45
          Height = 16
          Caption = 'Frete :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 587
          Top = 40
          Width = 44
          Height = 16
          Caption = 'Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txt_frete: TRLDBResult
          Left = 635
          Top = 21
          Width = 79
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataSource = dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object txt_total: TRLDBResult
          Left = 635
          Top = 41
          Width = 79
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataSource = dsFornecedores
          DisplayMask = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 235
      Width = 718
      Height = 67
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      BeforePrint = RLBand6BeforePrint
      object RLLabel9: TRLLabel
        Left = 520
        Top = 2
        Width = 112
        Height = 16
        Caption = 'Sub. Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 636
        Top = 3
        Width = 79
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataFormula = 'COT_QTD * COT_VALOR'
        DataSource = dsFornecedores
        DisplayMask = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 551
        Top = 20
        Width = 81
        Height = 16
        Caption = 'Total Frete :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 549
        Top = 40
        Width = 83
        Height = 16
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt_geral_frete: TRLDBResult
        Left = 636
        Top = 21
        Width = 79
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataSource = dsFornecedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object txt_total_geral: TRLDBResult
        Left = 636
        Top = 42
        Width = 79
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataSource = dsFornecedores
        DisplayMask = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object dsFornecedores: TDataSource
    DataSet = qryFornecedores
    Left = 304
    Top = 16
  end
  object qryFornecedores: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT I.COT_CODIGO, P.PRO_CODIGO, P.pro_descricao, I.cot_unidad' +
        'e, I.cot_qtd, I.cot_valor,'
      
        '  I.FOR_CODIGO_ATUAL ||'#39' - '#39'|| F.AT_nome as fornec, i.for_codigo' +
        '_atual,'
      '  II.cot_previsao_entrega, II.cot_valor_frete'
      
        '  FROM produto P, itens_cotacao_compra I, itens_cotacao_fornec_v' +
        'enc II,  AGENDA_TELEFONE F'
      
        '  WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codi' +
        'go_atual'
      
        '  AND I.COT_CODIGO =:COT_CODIGO AND II.cot_codigo = I.cot_codigo' +
        ' AND II.for_codigo = F.AT_codigo'
      ''
      '  ORDER BY I.for_codigo_atual, P.pro_codigo')
    Left = 344
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COT_CODIGO'
        ParamType = ptUnknown
      end>
    object qryFornecedoresPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'PRODUTO.PRO_CODIGO'
      Required = True
    end
    object qryFornecedoresPRO_DESCRICAO: TIBStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRODUTO.PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object qryFornecedoresCOT_UNIDADE: TIBStringField
      FieldName = 'COT_UNIDADE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_UNIDADE'
      Size = 12
    end
    object qryFornecedoresCOT_QTD: TFloatField
      FieldName = 'COT_QTD'
      Origin = 'ITENS_COTACAO_COMPRA.COT_QTD'
      DisplayFormat = '###,##0.000'
    end
    object qryFornecedoresCOT_VALOR: TIBBCDField
      FieldName = 'COT_VALOR'
      Origin = 'ITENS_COTACAO_COMPRA.COT_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryFornecedoresFORNEC: TIBStringField
      FieldName = 'FORNEC'
      Size = 78
    end
    object qryFornecedoresFOR_CODIGO_ATUAL: TIntegerField
      FieldName = 'FOR_CODIGO_ATUAL'
      Origin = 'ITENS_COTACAO_COMPRA.FOR_CODIGO_ATUAL'
    end
    object qryFornecedoresCOT_PREVISAO_ENTREGA: TDateTimeField
      FieldName = 'COT_PREVISAO_ENTREGA'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_PREVISAO_ENTREGA'
    end
    object qryFornecedoresCOT_VALOR_FRETE: TIBBCDField
      FieldName = 'COT_VALOR_FRETE'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_VALOR_FRETE'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryFornecedoresCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
      Origin = 'ITENS_COTACAO_COMPRA.COT_CODIGO'
      Required = True
    end
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 584
    Top = 8
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 448
    Top = 24
  end
  object qryPesqAux: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 536
    Top = 24
  end
end
