object frmRelCadReceita: TfrmRelCadReceita
  Left = 256
  Top = 167
  Width = 870
  Height = 506
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
    Left = 32
    Top = 4
    Width = 794
    Height = 1123
    DataSource = ds_pesquisa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 33
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 324
        Top = 6
        Width = 70
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'Receitas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_data: TRLLabel
        Left = 6
        Top = 16
        Width = 49
        Height = 16
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 192
      Width = 718
      Height = 105
      DataSource = dsTotal
      object RLBand7: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 21
        BandType = btColumnHeader
        Color = clMenuBar
        ParentColor = False
        Transparent = False
        object RLLabel8: TRLLabel
          Left = 8
          Top = 2
          Width = 85
          Height = 16
          Caption = 'Tipo de Pgto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel9: TRLLabel
          Left = 541
          Top = 1
          Width = 66
          Height = 16
          Caption = 'Valor (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand8: TRLBand
        Left = 0
        Top = 21
        Width = 718
        Height = 19
        object RLDBText6: TRLDBText
          Left = 8
          Top = 0
          Width = 175
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsTotal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText7: TRLDBText
          Left = 503
          Top = 0
          Width = 104
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = dsTotal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand9: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 33
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBResult3: TRLDBResult
          Left = 477
          Top = 5
          Width = 131
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = dsTotal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 382
          Top = 5
          Width = 87
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLSubDetail2: TRLSubDetail
      Left = 38
      Top = 71
      Width = 718
      Height = 121
      DataSource = ds_pesquisa
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 718
        Height = 107
        DataFields = 'MES'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 17
          BandType = btTitle
          Color = clMenuBar
          ParentColor = False
          Transparent = False
          BeforePrint = RLBand2BeforePrint
          object lblMes_ano: TRLLabel
            Left = 4
            Top = 1
            Width = 233
            Height = 15
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 41
          Width = 718
          Height = 18
          object RLDBText3: TRLDBText
            Left = 69
            Top = 1
            Width = 190
            Height = 14
            AutoSize = False
            DataField = 'DESCR'
            DataSource = ds_pesquisa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText4: TRLDBText
            Left = 522
            Top = 2
            Width = 87
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VALOR'
            DataSource = ds_pesquisa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText1: TRLDBText
            Left = 3
            Top = 1
            Width = 62
            Height = 13
            Alignment = taCenter
            AutoSize = False
            DataField = 'DATA'
            DataSource = ds_pesquisa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText2: TRLDBText
            Left = 614
            Top = 2
            Width = 103
            Height = 15
            AutoSize = False
            DataField = 'DESCRICAO'
            DataSource = ds_pesquisa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText5: TRLDBText
            Left = 263
            Top = 1
            Width = 255
            Height = 14
            AutoSize = False
            DataField = 'OBS'
            DataSource = ds_pesquisa
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
          Top = 59
          Width = 718
          Height = 30
          BandType = btSummary
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLLabel2: TRLLabel
            Left = 430
            Top = 4
            Width = 87
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult1: TRLDBResult
            Left = 522
            Top = 4
            Width = 88
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VALOR'
            DataSource = ds_pesquisa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Info = riSum
            ParentFont = False
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 17
          Width = 718
          Height = 24
          BandType = btTitle
          object RLLabel5: TRLLabel
            Left = 522
            Top = 7
            Width = 87
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Valor (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel7: TRLLabel
            Left = 68
            Top = 7
            Width = 191
            Height = 16
            AutoSize = False
            Caption = 'Receita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel3: TRLLabel
            Left = 4
            Top = 8
            Width = 60
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel6: TRLLabel
            Left = 613
            Top = 7
            Width = 104
            Height = 16
            AutoSize = False
            Caption = 'Forma Pgto '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel11: TRLLabel
            Left = 262
            Top = 7
            Width = 256
            Height = 16
            AutoSize = False
            Caption = 'Obs'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT EXTRACT(month FROM CR.DATA) AS MES, EXTRACT(YEAR FROM CR.' +
        'DATA) AS ANO,'
      '    TR.CODIGO ||'#39' - '#39'|| TR.RECEITA AS DESCR,'
      '    CR.DATA, CR.VALOR, CR.OBS, REC_CODIGO,'
      '    CR.TP_CODIGO ||'#39' - '#39'|| TP.TP_DESCRICAO AS DESCRICAO'
      '     FROM CAD_RECEITAS CR'
      '     INNER JOIN TIPO_RECEITA TR ON CR.CODIGO = TR.CODIGO'
      '     INNER JOIN TIPO_PAGAMENTO TP ON TP.TP_CODIGO = CR.TP_CODIGO'
      ''
      '     WHERE  1=1'
      
        '    GROUP BY EXTRACT(MONTH FROM CR.DATA), EXTRACT(YEAR FROM CR.D' +
        'ATA), CR.DATA,'
      
        '    CR.VALOR, TR.RECEITA, CR.OBS, REC_CODIGO, TR.CODIGO, CR.TP_C' +
        'ODIGO, TP.TP_DESCRICAO'
      
        '    order by EXTRACT(YEAR FROM CR.DATA), EXTRACT(month FROM CR.D' +
        'ATA)')
    Left = 384
    Top = 12
    object qry_pesquisaMES: TSmallintField
      FieldName = 'MES'
    end
    object qry_pesquisaANO: TSmallintField
      FieldName = 'ANO'
    end
    object qry_pesquisaDESCR: TIBStringField
      FieldName = 'DESCR'
      Size = 78
    end
    object qry_pesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'CAD_RECEITAS.DATA'
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CAD_RECEITAS.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaREC_CODIGO: TIntegerField
      FieldName = 'REC_CODIGO'
      Origin = 'CAD_RECEITAS.REC_CODIGO'
      Required = True
    end
    object qry_pesquisaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
    object ibstrngfld_pesquisaOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'CAD_RECEITAS.OBS'
      Size = 200
    end
  end
  object ds_pesquisa: TDataSource
    DataSet = qry_pesquisa
    Left = 336
    Top = 12
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT  CR.tp_codigo, SUM(CR.valor) AS VALOR,'
      'CR.TP_CODIGO ||'#39' - '#39'|| TP.TP_DESCRICAO AS DESCRICAO '
      '    FROM CAD_RECEITAS CR'
      '     INNER JOIN TIPO_PAGAMENTO TP ON TP.TP_CODIGO = CR.TP_CODIGO'
      ''
      '     WHERE  1=1'
      '    GROUP BY CR.tp_codigo, TP.TP_DESCRICAO '
      '    order by CR.tp_codigo')
    Left = 584
    Top = 12
    object qryTotalTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'CAD_RECEITAS.TP_CODIGO'
    end
    object qryTotalVALOR: TIBBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryTotalDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
  object dsTotal: TDataSource
    DataSet = qryTotal
    Left = 520
    Top = 12
  end
end
