object frmRelTipoDespesa: TfrmRelTipoDespesa
  Left = 229
  Top = 107
  Width = 870
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
    Left = 32
    Top = 14
    Width = 794
    Height = 1123
    DataSource = dsTipoDespesa
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
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 304
        Top = 12
        Width = 110
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'Tipo Despesa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 83
      Width = 718
      Height = 47
      DataFields = 'TIP_CODIGO'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 19
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Color = clMenuBar
        ParentColor = False
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 16
          Top = 2
          Width = 59
          Height = 15
          DataField = 'DESPESA'
          DataSource = dsTipoDespesa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 19
        Width = 718
        Height = 18
        object RLDBText3: TRLDBText
          Left = 37
          Top = 2
          Width = 270
          Height = 14
          AutoSize = False
          DataField = 'DESPESA_SUB'
          DataSource = dsTipoDespesa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object qryTipoDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TD.tip_codigo || '#39' - '#39' || TD.tip_descricao AS DESPESA,'
      
        '       TDS.tds_codigo || '#39' - '#39' || TDS.tds_descricao AS DESPESA_S' +
        'UB, TD.TIP_CODIGO'
      'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS')
    Left = 376
    Top = 22
    object qryTipoDespesaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qryTipoDespesaDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qryTipoDespesaTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
  end
  object dsTipoDespesa: TDataSource
    DataSet = qryTipoDespesa
    Left = 336
    Top = 22
  end
end
