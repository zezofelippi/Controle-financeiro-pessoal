object frmRelTransfFinanc: TfrmRelTransfFinanc
  Left = 323
  Top = 145
  Width = 875
  Height = 500
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
    Top = 30
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
        Left = 262
        Top = 6
        Width = 194
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'Transferencia Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_data: TRLLabel
        Left = 5
        Top = 15
        Width = 49
        Height = 16
      end
    end
    object RLSubDetail2: TRLSubDetail
      Left = 38
      Top = 71
      Width = 718
      Height = 95
      DataSource = ds_pesquisa
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 718
        Height = 83
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
          BeforePrint = RLBand3BeforePrint
          object RLDBText3: TRLDBText
            Left = 68
            Top = 1
            Width = 149
            Height = 14
            AutoSize = False
            DataField = 'DE'
            DataSource = ds_pesquisa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText4: TRLDBText
            Left = 367
            Top = 2
            Width = 84
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
            Left = 220
            Top = 2
            Width = 144
            Height = 14
            AutoSize = False
            DataField = 'PARA'
            DataSource = ds_pesquisa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText5: TRLDBText
            Left = 456
            Top = 2
            Width = 261
            Height = 15
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
        object RLBand4: TRLBand
          Left = 0
          Top = 17
          Width = 718
          Height = 24
          BandType = btTitle
          object RLLabel5: TRLLabel
            Left = 367
            Top = 7
            Width = 84
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
            Width = 149
            Height = 16
            Alignment = taJustify
            AutoSize = False
            Caption = 'DE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel2: TRLLabel
            Left = 220
            Top = 7
            Width = 144
            Height = 16
            Alignment = taJustify
            AutoSize = False
            Caption = 'PARA'
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
            Width = 62
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
          object RLLabel12: TRLLabel
            Left = 454
            Top = 8
            Width = 262
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
    object bndTipoPgto: TRLSubDetail
      Left = 38
      Top = 166
      Width = 718
      Height = 56
      DataSource = dsTipoPgto
      object RLBand5: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 21
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel13: TRLLabel
          Left = 361
          Top = 2
          Width = 21
          Height = 16
          Caption = 'DE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 514
          Top = 2
          Width = 40
          Height = 16
          Caption = 'PARA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 655
          Top = 2
          Width = 47
          Height = 16
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 4
          Top = 1
          Width = 143
          Height = 16
          Caption = 'TIPO DE PAGAMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 21
        Width = 718
        Height = 19
        BeforePrint = RLBand7BeforePrint
        object txt_de: TRLDBText
          Left = 300
          Top = 2
          Width = 85
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
        end
        object txt_para: TRLDBText
          Left = 460
          Top = 1
          Width = 96
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
        end
        object txt_total: TRLDBText
          Left = 633
          Top = 0
          Width = 70
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLDBText9: TRLDBText
          Left = 4
          Top = 1
          Width = 285
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsTipoPgto
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
      
        'SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) ' +
        'AS ANO,'
      '     TF.data, TF.valor, TF.obs,'
      '     TF.tp_codigo_de ||'#39' - '#39'|| TP.tp_descricao as DE,'
      '     TF.tp_codigo_para ||'#39' - '#39'|| TPP.tp_descricao as PARA'
      ''
      'FROM TIPO_PAGAMENTO TP'
      
        '        INNER JOIN transferencia_financeira TF ON TF.tp_codigo_d' +
        'e = TP.tp_codigo'
      
        '        INNER JOIN TIPO_PAGAMENTO TPP ON TPP.tp_codigo = TF.tp_c' +
        'odigo_para'
      ''
      ''
      'GROUP BY EXTRACT(MONTH FROM DATA), EXTRACT(YEAR FROM DATA),'
      
        'TF.data, TF.valor, TF.obs, TF.tp_codigo_de, TP.tp_descricao, TF.' +
        'tp_codigo_para, TPP.tp_descricao'
      'order by EXTRACT(YEAR FROM DATA), EXTRACT(month FROM DATA)'
      '')
    Left = 448
    Top = 24
    object qry_pesquisaMES: TSmallintField
      FieldName = 'MES'
    end
    object qry_pesquisaANO: TSmallintField
      FieldName = 'ANO'
    end
    object qry_pesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'TRANSFERENCIA_FINANCEIRA.DATA'
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'TRANSFERENCIA_FINANCEIRA.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'TRANSFERENCIA_FINANCEIRA.OBS'
      Size = 100
    end
    object qry_pesquisaDE: TIBStringField
      FieldName = 'DE'
      Size = 78
    end
    object qry_pesquisaPARA: TIBStringField
      FieldName = 'PARA'
      Size = 78
    end
  end
  object ds_pesquisa: TDataSource
    DataSet = qry_pesquisa
    Left = 408
    Top = 24
  end
  object qryTipoPgto: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TP_CODIGO, TP_CODIGO || '#39'-'#39'|| TP_DESCRICAO AS DESCRICAO'
      ''
      'FROM TIPO_PAGAMENTO'
      ''
      'ORDER BY TP_CODIGO')
    Left = 696
    Top = 8
    object qryTipoPgtoTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'TIPO_PAGAMENTO.TP_CODIGO'
      Required = True
    end
    object qryTipoPgtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 76
    end
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 656
    Top = 72
  end
  object dsTipoPgto: TDataSource
    DataSet = qryTipoPgto
    Left = 616
    Top = 8
  end
end
