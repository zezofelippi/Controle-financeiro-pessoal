object frmBaixaDeUmaVez: TfrmBaixaDeUmaVez
  Left = 238
  Top = 124
  Width = 944
  Height = 496
  BorderIcons = [biSystemMenu]
  Caption = 'Dar Baixa de uma vez em contas selecionadas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 547
    Top = 322
    Width = 211
    Height = 24
    Caption = 'Valor Total das Contas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 375
    Top = 327
    Width = 160
    Height = 20
    Caption = 'Data do pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mmoContas: TMemo
    Left = 3
    Top = 7
    Width = 919
    Height = 308
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object txt_Valor: TCurrencyEdit
    Left = 547
    Top = 347
    Width = 209
    Height = 31
    AutoSize = False
    Color = 14803425
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object txt_data: TDateEdit
    Left = 374
    Top = 348
    Width = 158
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
  end
  object rdgContaAtrasada: TRadioGroup
    Left = 358
    Top = 407
    Width = 233
    Height = 40
    Caption = 'Conta Atrasada ?'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'Sim'
      'N'#227'o')
    ParentFont = False
    TabOrder = 3
  end
  object btnConfirmar: TButton
    Left = 778
    Top = 338
    Width = 126
    Height = 39
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnConfirmarClick
  end
  object txt_valor_saldo: TCurrencyEdit
    Left = 680
    Top = 401
    Width = 77
    Height = 21
    AutoSize = False
    TabOrder = 5
    Visible = False
  end
  object gpbFormaPagamentoFilho: TGroupBox
    Left = 40
    Top = 328
    Width = 321
    Height = 65
    Caption = 'Forma Pagamento Filho'
    TabOrder = 6
    object cboFormaPgto: TDBLookupComboBox
      Left = 7
      Top = 17
      Width = 305
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      ParentFont = False
      TabOrder = 0
    end
  end
  object gpbFormaPagamentoMae: TGroupBox
    Left = 37
    Top = 331
    Width = 321
    Height = 65
    Caption = 'Forma Pagamento M'#227'e'
    TabOrder = 7
    object cboFormaPgtoMae: TDBLookupComboBox
      Left = 7
      Top = 19
      Width = 305
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFomaPagamerntoMae
      ParentFont = False
      TabOrder = 0
    end
  end
  object rdgMaeFilho: TRadioGroup
    Left = 42
    Top = 402
    Width = 311
    Height = 49
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'Filho'
      'M'#227'e')
    ParentFont = False
    TabOrder = 8
    OnClick = rdgMaeFilhoClick
  end
  object dsFormaPgto: TDataSource
    DataSet = qryFormaPgtoFilho
    Left = 568
    Top = 160
  end
  object qryFormaPgtoFilho: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'#39' - '#39'|| ' +
        'TP_DESCRICAO AS DESCRICAO '
      '                      FROM TIPO_PAGAMENTO ORDER BY TP_CODIGO')
    Left = 608
    Top = 160
    object qryFormaPgtoFilhoTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'TIPO_PAGAMENTO.TP_CODIGO'
      Required = True
    end
    object qryFormaPgtoFilhoTP_DESCRICAO: TIBStringField
      FieldName = 'TP_DESCRICAO'
      Origin = 'TIPO_PAGAMENTO.TP_DESCRICAO'
      Size = 64
    end
    object qryFormaPgtoFilhoTP_DEFAULT: TIBStringField
      FieldName = 'TP_DEFAULT'
      Origin = 'TIPO_PAGAMENTO.TP_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qryFormaPgtoFilhoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 488
    Top = 112
  end
  object qry_pesquisa_mes: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 544
    Top = 112
  end
  object qry_pesquisa_ano: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 592
    Top = 112
  end
  object dsFomaPagamerntoMae: TDataSource
    DataSet = qryFormaPgtoMae
    Left = 569
    Top = 207
  end
  object qryFormaPgtoMae: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'#39' - '#39'|| ' +
        'TP_DESCRICAO AS DESCRICAO '
      '                      FROM TIPO_PAGAMENTO ORDER BY TP_CODIGO')
    Left = 609
    Top = 207
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
