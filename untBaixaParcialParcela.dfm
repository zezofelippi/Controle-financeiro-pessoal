object frmBaixaParcialParcela: TfrmBaixaParcialParcela
  Left = 386
  Top = 352
  BorderStyle = bsSingle
  Caption = 'Baixa parcial da parcela'
  ClientHeight = 176
  ClientWidth = 425
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
    Left = 336
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btnConfirmarClick
  end
  object txt_valor_saldo: TCurrencyEdit
    Left = 336
    Top = 73
    Width = 77
    Height = 21
    AutoSize = False
    TabOrder = 4
    Visible = False
  end
  object rdgContaAtrasada: TRadioGroup
    Left = 11
    Top = 135
    Width = 264
    Height = 33
    Caption = 'Conta Atrasada ?'
    Columns = 2
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 5
  end
  object gpbFormaPagamentoMae: TGroupBox
    Left = 3
    Top = 55
    Width = 321
    Height = 44
    Caption = 'Pagamento M'#227'e'
    TabOrder = 6
    object cboFormaPgtoMae: TDBLookupComboBox
      Left = 7
      Top = 19
      Width = 306
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgtoMae
      TabOrder = 0
    end
  end
  object gpbFormaPagamentoFilho: TGroupBox
    Left = 8
    Top = 71
    Width = 320
    Height = 47
    Caption = 'Forma Pagamento Filho'
    TabOrder = 7
    object cboFormaPgto: TDBLookupComboBox
      Left = 8
      Top = 16
      Width = 305
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 0
    end
  end
  object rdgMaeFilho: TRadioGroup
    Left = 10
    Top = 101
    Width = 265
    Height = 33
    Columns = 2
    Items.Strings = (
      'Filho'
      'M'#227'e')
    TabOrder = 8
    OnClick = rdgMaeFilhoClick
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
  object dsFormaPgtoMae: TDataSource
    DataSet = qryFormaPgtoMae
    Left = 152
    Top = 113
  end
  object qryFormaPgtoMae: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'#39' - '#39'|| ' +
        'TP_DESCRICAO AS DESCRICAO '
      '                      FROM TIPO_PAGAMENTO_mae ORDER BY TP_CODIGO')
    Left = 192
    Top = 113
    object IntegerField1: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'TIPO_PAGAMENTO.TP_CODIGO'
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'TP_DESCRICAO'
      Origin = 'TIPO_PAGAMENTO.TP_DESCRICAO'
      Size = 64
    end
    object IBStringField2: TIBStringField
      FieldName = 'TP_DEFAULT'
      Origin = 'TIPO_PAGAMENTO.TP_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object IBStringField3: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
end
