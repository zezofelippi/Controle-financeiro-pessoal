object frmBaixaParcialParcela: TfrmBaixaParcialParcela
  Left = 386
  Top = 352
  BorderStyle = bsSingle
  Caption = 'Baixa parcial da parcela'
  ClientHeight = 133
  ClientWidth = 412
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 96
    Top = 16
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label3: TLabel
    Left = 205
    Top = 13
    Width = 94
    Height = 13
    Caption = 'Data do pagamento'
  end
  object Label6: TLabel
    Left = 8
    Top = 59
    Width = 54
    Height = 13
    Caption = 'Forma Pgto'
  end
  object txt_codigo: TEdit
    Left = 8
    Top = 32
    Width = 81
    Height = 21
    Color = 14803425
    ReadOnly = True
    TabOrder = 0
  end
  object txt_Valor: TCurrencyEdit
    Left = 96
    Top = 32
    Width = 103
    Height = 21
    AutoSize = False
    TabOrder = 1
  end
  object txt_data: TDateEdit
    Left = 204
    Top = 31
    Width = 101
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object btnConfirmar: TButton
    Left = 328
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btnConfirmarClick
  end
  object cboFormaPgto: TDBLookupComboBox
    Left = 8
    Top = 73
    Width = 305
    Height = 21
    KeyField = 'TP_CODIGO'
    ListField = 'DESCRICAO'
    ListSource = dsFormaPgto
    TabOrder = 4
  end
  object txt_valor_saldo: TCurrencyEdit
    Left = 320
    Top = 73
    Width = 77
    Height = 21
    AutoSize = False
    TabOrder = 5
    Visible = False
  end
  object rdgContaAtrasada: TRadioGroup
    Left = 8
    Top = 96
    Width = 233
    Height = 33
    Caption = 'Conta Atrasada ?'
    Columns = 2
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 6
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 32
  end
  object qry_pesquisa_mes: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 136
  end
  object qry_pesquisa_ano: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 64
  end
  object dsFormaPgto: TDataSource
    DataSet = qryFormaPgto
    Left = 152
    Top = 56
  end
  object qryFormaPgto: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'#39' - '#39'|| ' +
        'TP_DESCRICAO AS DESCRICAO '
      '                      FROM TIPO_PAGAMENTO ORDER BY TP_CODIGO')
    Left = 192
    Top = 56
    object qryFormaPgtoTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'TIPO_PAGAMENTO.TP_CODIGO'
      Required = True
    end
    object qryFormaPgtoTP_DESCRICAO: TIBStringField
      FieldName = 'TP_DESCRICAO'
      Origin = 'TIPO_PAGAMENTO.TP_DESCRICAO'
      Size = 64
    end
    object qryFormaPgtoTP_DEFAULT: TIBStringField
      FieldName = 'TP_DEFAULT'
      Origin = 'TIPO_PAGAMENTO.TP_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qryFormaPgtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
end
