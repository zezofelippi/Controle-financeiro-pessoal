object frmRelCotacaoGrupoProd: TfrmRelCotacaoGrupoProd
  Left = 217
  Top = 116
  Width = 870
  Height = 500
  Caption = 'object frRelatorio: TRLReport'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frRelatorio: TRLReport
    Left = 16
    Top = 11
    Width = 404
    Height = 1123
    DataSource = ds_pesquisar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 107.000000000000000000
    PageSetup.PaperHeight = 297.000000000000000000
    object RLGroup4: TRLGroup
      Left = 19
      Top = 52
      Width = 366
      Height = 65
      DataFields = 'GRP_DESCRICAO'
      object RLBand9: TRLBand
        Left = 0
        Top = 0
        Width = 366
        Height = 27
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText6: TRLDBText
          Left = 3
          Top = 7
          Width = 101
          Height = 15
          DataField = 'GRP_DESCRICAO'
          DataSource = ds_pesquisar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand11: TRLBand
        Left = 0
        Top = 27
        Width = 366
        Height = 16
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        object RLDBText12: TRLDBText
          Left = 57
          Top = 0
          Width = 235
          Height = 14
          AutoSize = False
          DataField = 'PRO_DESCRICAO'
          DataSource = ds_pesquisar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 293
          Top = 0
          Width = 30
          Height = 14
          AutoSize = False
          DataField = 'VALOR'
          DataSource = ds_pesquisar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 326
          Top = 1
          Width = 35
          Height = 14
          AutoSize = False
          DataField = 'AT_NOME'
          DataSource = ds_pesquisar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 3
          Top = 0
          Width = 30
          Height = 14
          AutoSize = False
          DataField = 'COT_QTD'
          DataSource = ds_pesquisar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 35
          Top = 0
          Width = 25
          Height = 14
          AutoSize = False
          DataField = 'COT_UNIDADE'
          DataSource = ds_pesquisar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RLBand1: TRLBand
      Left = 19
      Top = 38
      Width = 366
      Height = 14
      BandType = btTitle
      object lblCotacao: TRLLabel
        Left = 290
        Top = 0
        Width = 72
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object ds_pesquisar: TDataSource
    DataSet = qry_pesquisa
    Left = 360
    Top = 8
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      ' SELECT GRP_DESCRICAO, PRO_DESCRICAO, ITE.COT_VALOR AS VALOR,'
      '  SUBSTRING(AT_NOME from 1 for 4) AS AT_NOME, AT_CODIGO,'
      '  ITE.COT_QTD, ITE.COT_UNIDADE  '
      '  FROM COTACAO_COMPRA COTA'
      '                                             '
      
        '  INNER JOIN ITENS_COTACAO_COMPRA ITE ON                        ' +
        '           '
      '  COTA.cot_codigo = ITE.cot_codigo'
      '                                         '
      '  LEFT JOIN AGENDA_TELEFONE FORN ON'
      '  ITE.for_codigo_atual = FORN.at_codigo'
      '                                     '
      
        '  INNER JOIN PRODUTO PROD ON                                    ' +
        '           '
      '  ITE.pro_codigo = PROD.pro_codigo'
      '                                           '
      
        '  INNER JOIN GRUPO GRU ON                                       ' +
        '           '
      
        '  PROD.grp_codigo = GRU.grp_codigo                              ' +
        '           '
      '                                 '
      '  GROUP BY GRP_DESCRICAO, PRO_DESCRICAO, ITE.COT_VALOR,'
      '  AT_NOME, AT_CODIGO, ITE.COT_QTD, ITE.COT_UNIDADE  ')
    Left = 416
    Top = 8
    object qry_pesquisaGRP_DESCRICAO: TIBStringField
      FieldName = 'GRP_DESCRICAO'
      Origin = 'GRUPO.GRP_DESCRICAO'
      Required = True
      Size = 32
    end
    object qry_pesquisaPRO_DESCRICAO: TIBStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRODUTO.PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
    object qry_pesquisaAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'AGENDA_TELEFONE.AT_CODIGO'
      Required = True
    end
    object qry_pesquisaCOT_QTD: TFloatField
      FieldName = 'COT_QTD'
      Origin = 'ITENS_COTACAO_COMPRA.COT_QTD'
      DisplayFormat = '###,##0.000'
    end
    object qry_pesquisaCOT_UNIDADE: TIBStringField
      FieldName = 'COT_UNIDADE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_UNIDADE'
      Size = 12
    end
  end
end
