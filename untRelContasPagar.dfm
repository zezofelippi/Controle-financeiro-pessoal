object frmRelContasPagar: TfrmRelContasPagar
  Left = 258
  Top = 179
  Width = 870
  Height = 500
  Caption = 'frmRelContasPagar'
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
    Left = 40
    Top = 32
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
      Height = 31
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 298
        Top = 5
        Width = 122
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'Contas '#224' Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_data: TRLLabel
        Left = 5
        Top = 11
        Width = 49
        Height = 16
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 93
      Width = 718
      Height = 74
      DataFields = 'MES'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btColumnHeader
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
        Top = 17
        Width = 718
        Height = 16
        BeforePrint = RLBand3BeforePrint
        object RLDBText2: TRLDBText
          Left = 92
          Top = 2
          Width = 80
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DATA_PGTO'
          DataSource = ds_pesquisa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 178
          Top = 1
          Width = 452
          Height = 14
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
        object RLDBText4: TRLDBText
          Left = 631
          Top = 0
          Width = 83
          Height = 14
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
          Top = 3
          Width = 80
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DATA_DESPESA'
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
        Top = 33
        Width = 718
        Height = 26
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBResult1: TRLDBResult
          Left = 617
          Top = 5
          Width = 98
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = ds_pesquisa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 573
          Top = 5
          Width = 36
          Height = 14
          Caption = 'Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 69
      Width = 718
      Height = 24
      BandType = btTitle
      object RLLabel3: TRLLabel
        Left = 178
        Top = 8
        Width = 450
        Height = 16
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 89
        Top = 8
        Width = 84
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data Venc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 630
        Top = 6
        Width = 84
        Height = 16
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
      object RLLabel7: TRLLabel
        Left = 2
        Top = 8
        Width = 84
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data Emissao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 167
      Width = 718
      Height = 28
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult2: TRLDBResult
        Left = 618
        Top = 5
        Width = 98
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR'
        DataSource = ds_pesquisa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 541
        Top = 5
        Width = 68
        Height = 14
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT EXTRACT(month FROM DATA_PGTO) AS MES, '
      'EXTRACT(YEAR FROM DATA_PGTO) AS ANO,'
      'CODIGO,'
      'DATA_PGTO, DATA_DESPESA, DESCRICAO, VALOR'
      '    FROM CONTAS_PAGAR '
      '    GROUP BY EXTRACT(MONTH FROM DATA_PGTO), '
      'EXTRACT(YEAR FROM DATA_PGTO),'
      'CODIGO,'
      'DATA_PGTO, DESCRICAO, VALOR, DATA_DESPESA')
    Left = 168
    object qry_pesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS_PAGAR.CODIGO'
      Required = True
    end
    object qry_pesquisaDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
      Origin = 'CONTAS_PAGAR.DATA_PGTO'
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
    object qry_pesquisaMES: TSmallintField
      FieldName = 'MES'
    end
    object qry_pesquisaANO: TSmallintField
      FieldName = 'ANO'
    end
    object qry_pesquisaDATA_DESPESA: TDateTimeField
      FieldName = 'DATA_DESPESA'
      Origin = 'CONTAS_PAGAR.DATA_DESPESA'
    end
  end
  object ds_pesquisa: TDataSource
    DataSet = qry_pesquisa
    Left = 128
  end
end
