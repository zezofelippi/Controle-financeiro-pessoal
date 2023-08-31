object frmRelCadDespesa: TfrmRelCadDespesa
  Left = 228
  Top = 168
  Width = 929
  Height = 512
  VertScrollBar.Position = 59
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
    Left = 24
    Top = -29
    Width = 794
    Height = 1123
    DataSource = ds_pesquisar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 45
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 319
        Top = 12
        Width = 80
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_data: TRLLabel
        Left = 8
        Top = 24
        Width = 49
        Height = 16
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 107
      Width = 718
      Height = 218
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
          Left = 12
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
      object RLBand5: TRLBand
        Left = 0
        Top = 153
        Width = 718
        Height = 30
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel2: TRLLabel
          Left = 534
          Top = 7
          Width = 87
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total Mes:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 629
          Top = 7
          Width = 88
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = ds_pesquisar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
        end
      end
      object RLGroup4: TRLGroup
        Left = 0
        Top = 17
        Width = 718
        Height = 136
        DataFields = 'TIP_MES'
        object RLBand9: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 17
          BandType = btTitle
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLDBText6: TRLDBText
            Left = 82
            Top = 2
            Width = 42
            Height = 15
            DataField = 'DESCR'
            DataSource = ds_pesquisar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object RLLabel10: TRLLabel
            Left = 20
            Top = 1
            Width = 60
            Height = 16
            AutoSize = False
            Caption = 'Despesa :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
        end
        object RLBand7: TRLBand
          Left = 0
          Top = 87
          Width = 718
          Height = 21
          BandType = btSummary
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLDBResult4: TRLDBResult
            Left = 644
            Top = 1
            Width = 72
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VALOR'
            DataSource = ds_pesquisar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Info = riSum
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 546
            Top = 1
            Width = 96
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total Despesa:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLGroup5: TRLGroup
          Left = 0
          Top = 17
          Width = 718
          Height = 70
          DataFields = 'SUB_MES'
          object RLBand10: TRLBand
            Left = 0
            Top = 16
            Width = 718
            Height = 18
            BeforePrint = RLBand10BeforePrint
            object RLDBText8: TRLDBText
              Left = 149
              Top = 2
              Width = 508
              Height = 14
              AutoSize = False
              DataField = 'DESPESA_OUTROS'
              DataSource = ds_pesquisar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText9: TRLDBText
              Left = 661
              Top = 2
              Width = 55
              Height = 15
              Alignment = taRightJustify
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
            object RLDBText10: TRLDBText
              Left = 31
              Top = 2
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              DataField = 'DATA'
              DataSource = ds_pesquisar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText11: TRLDBText
              Left = 88
              Top = 2
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              DataField = 'CODIGO'
              DataSource = ds_pesquisar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLBand11: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 16
            BandType = btTitle
            object RLDBText12: TRLDBText
              Left = 124
              Top = 0
              Width = 77
              Height = 14
              DataField = 'DESPESA_SUB'
              DataSource = ds_pesquisar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
            end
            object RLLabel11: TRLLabel
              Left = 34
              Top = 0
              Width = 88
              Height = 16
              AutoSize = False
              Caption = 'Sub. Despesa :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
            end
          end
          object RLBand3: TRLBand
            Left = 0
            Top = 34
            Width = 718
            Height = 26
            BandType = btSummary
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLDBResult3: TRLDBResult
              Left = 644
              Top = 5
              Width = 72
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VALOR'
              DataSource = ds_pesquisar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Info = riSum
              ParentFont = False
            end
            object RLLabel6: TRLLabel
              Left = 513
              Top = 4
              Width = 129
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Total Sub. Despesa:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 325
      Width = 718
      Height = 53
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel4: TRLLabel
        Left = 532
        Top = 7
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
      object RLDBResult2: TRLDBResult
        Left = 629
        Top = 7
        Width = 88
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR'
        DataSource = ds_pesquisar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 83
      Width = 718
      Height = 24
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel5: TRLLabel
        Left = 660
        Top = 7
        Width = 57
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
        Left = 88
        Top = 7
        Width = 56
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 31
        Top = 8
        Width = 56
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 148
        Top = 7
        Width = 271
        Height = 16
        AutoSize = False
        Caption = 'Descri'#231#227'o da Despesa'
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
      
        'SELECT EXTRACT(month FROM CA.DATA) AS MES, EXTRACT(YEAR FROM CA.' +
        'DATA) AS ANO, TD.TIP_CODIGO, TDS.TDS_CODIGO,'
      'TDS.TDS_codigo ||'#39' - '#39'|| TDS.TDS_descricao AS DESPESA_SUB,    '
      'TD.TIP_CODIGO ||'#39' - '#39'|| TD.TIP_DESCRICAO AS DESCR, CA.CODIGO,'
      'CA.DATA, CA.VALOR, CA.SEMANA, CA.DESPESA_OUTROS,'
      'td.tip_codigo ||'#39'-'#39'|| EXTRACT(month FROM CA.DATA) AS tip_MES,'
      'tds.tds_codigo ||'#39'-'#39'|| EXTRACT(month FROM CA.DATA) AS sub_mes'
      'FROM CAD_DESPESA CA, TIPO_DESPESA TD, TIPO_DESPESA_SUB TDS '
      
        'where TD.TIP_CODIGO = CA.TIP_CODIGO and tds.tds_codigo = ca.tds_' +
        'codigo'
      'GROUP BY EXTRACT(MONTH FROM CA.DATA),'
      
        'EXTRACT(YEAR FROM CA.DATA), CA.DATA, CA.VALOR, CA.SEMANA, CA.DES' +
        'PESA_OUTROS, TD.tip_descricao, TD.tip_codigo, CA.CODIGO,'
      'TDS.TDS_CODIGO, TDS.TDS_DESCRICAO, TD.TIP_CODIGO, TDS.TDS_CODIGO')
    Left = 416
    Top = 8
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
      Origin = 'CAD_DESPESA.DATA'
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CAD_DESPESA.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaSEMANA: TIBStringField
      FieldName = 'SEMANA'
      Origin = 'CAD_DESPESA.SEMANA'
      Size = 15
    end
    object qry_pesquisaDESPESA_OUTROS: TIBStringField
      FieldName = 'DESPESA_OUTROS'
      Origin = 'CAD_DESPESA.DESPESA_OUTROS'
      Size = 150
    end
    object qry_pesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CAD_DESPESA.CODIGO'
      Required = True
    end
    object qry_pesquisaDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qry_pesquisaTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
    object qry_pesquisaTDS_CODIGO: TIntegerField
      FieldName = 'TDS_CODIGO'
      Origin = 'TIPO_DESPESA_SUB.TDS_CODIGO'
      Required = True
    end
    object qry_pesquisaTIP_MES: TIBStringField
      FieldName = 'TIP_MES'
      Size = 18
    end
    object qry_pesquisaSUB_MES: TIBStringField
      FieldName = 'SUB_MES'
      Size = 18
    end
  end
  object ds_pesquisar: TDataSource
    DataSet = qry_pesquisa
    Left = 360
    Top = 8
  end
end
