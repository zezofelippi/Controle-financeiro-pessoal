object frmContasReceber: TfrmContasReceber
  Left = 158
  Top = 126
  BorderStyle = bsSingle
  Caption = 'Contas a Receber'
  ClientHeight = 501
  ClientWidth = 1054
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
  object Label11: TLabel
    Left = 8
    Top = 8
    Width = 577
    Height = 41
    AutoSize = False
    Caption = 'EMPRESTIMOS A RECEBER'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 54
    Width = 1046
    Height = 69
    TabOrder = 0
    object Label3: TLabel
      Left = 183
      Top = 12
      Width = 81
      Height = 13
      Caption = 'Valor Emprestimo'
    end
    object Label4: TLabel
      Left = 79
      Top = 13
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label1: TLabel
      Left = 559
      Top = 12
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object Label8: TLabel
      Left = 9
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label13: TLabel
      Left = 278
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Forma Pgto'
    end
    object txt_Valor: TCurrencyEdit
      Left = 179
      Top = 28
      Width = 87
      Height = 21
      AutoSize = False
      TabOrder = 0
      OnEnter = txt_ValorEnter
      OnExit = txt_ValorExit
      OnKeyPress = txt_ValorKeyPress
    end
    object txt_data: TDateEdit
      Left = 76
      Top = 28
      Width = 99
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = txt_dataEnter
      OnExit = txt_dataExit
      OnKeyPress = txt_dataKeyPress
    end
    object txt_obs: TEdit
      Left = 556
      Top = 28
      Width = 396
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
      OnEnter = txt_obsEnter
      OnExit = txt_obsExit
      OnKeyPress = txt_obsKeyPress
    end
    object btnGravar: TButton
      Left = 957
      Top = 24
      Width = 81
      Height = 29
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object txt_codigo: TEdit
      Left = 8
      Top = 28
      Width = 64
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 4
    end
    object cboFormaPgto: TDBLookupComboBox
      Left = 277
      Top = 28
      Width = 275
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 5
      OnKeyPress = cboFormaPgtoKeyPress
    end
    object txt_valor_saldo: TCurrencyEdit
      Left = 560
      Top = 48
      Width = 77
      Height = 21
      AutoSize = False
      TabOrder = 6
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 118
    Width = 1046
    Height = 380
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 11
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label5: TLabel
      Left = 121
      Top = 11
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label6: TLabel
      Left = 615
      Top = 307
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Emprestado'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label23: TLabel
      Left = 44
      Top = 318
      Width = 30
      Height = 13
      Caption = 'Pagos'
    end
    object Label7: TLabel
      Left = 124
      Top = 318
      Width = 53
      Height = 13
      Caption = 'Nao Pagos'
    end
    object Label9: TLabel
      Left = 757
      Top = 307
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Recebido'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 898
      Top = 307
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total a Receber'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 725
      Top = 11
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object Label14: TLabel
      Left = 484
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Forma Pgto'
    end
    object txt_data_i: TDateEdit
      Left = 6
      Top = 26
      Width = 104
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnEnter = txt_data_iEnter
      OnExit = txt_data_iExit
      OnKeyPress = txt_data_iKeyPress
    end
    object txt_data_f: TDateEdit
      Left = 117
      Top = 26
      Width = 101
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = txt_data_fEnter
      OnExit = txt_data_fExit
      OnKeyPress = txt_data_fKeyPress
    end
    object DBGrid1: TDBGrid
      Left = 6
      Top = 86
      Width = 1035
      Height = 213
      DataSource = dsEmprestimo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = PopupMenu1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'Codigo'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_EMPRESTIMO'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Emprestado'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_RECEBIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Recebido'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Tipo'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO_A_RECEBER'
          Title.Alignment = taCenter
          Title.Caption = 'Saldo a Receber'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 370
          Visible = True
        end>
    end
    object rdg_opcao: TRadioGroup
      Left = 224
      Top = 7
      Width = 253
      Height = 44
      Columns = 3
      Items.Strings = (
        'Pagos'
        'Nao Pagos'
        'Todos')
      TabOrder = 3
    end
    object btnPesquisar: TButton
      Left = 944
      Top = 21
      Width = 91
      Height = 31
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = btnPesquisarClick
    end
    object txt_total_emprestado: TCurrencyEdit
      Left = 615
      Top = 323
      Width = 136
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object Edit2: TEdit
      Left = 8
      Top = 316
      Width = 33
      Height = 15
      AutoSize = False
      Color = clAqua
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object Edit3: TEdit
      Left = 88
      Top = 316
      Width = 33
      Height = 15
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
    object txt_total_recebido: TCurrencyEdit
      Left = 757
      Top = 323
      Width = 136
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object txt_total_a_receber: TCurrencyEdit
      Left = 898
      Top = 323
      Width = 136
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object TXT_OBS_pesq: TEdit
      Left = 723
      Top = 27
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 10
      OnEnter = TXT_OBS_pesqEnter
      OnExit = TXT_OBS_pesqExit
      OnKeyPress = TXT_OBS_pesqKeyPress
    end
    object rdb_inicio: TRadioButton
      Left = 726
      Top = 55
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 11
    end
    object rdb_posicao: TRadioButton
      Left = 814
      Top = 55
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 12
    end
    object btn1: TButton
      Left = 280
      Top = 304
      Width = 177
      Height = 33
      Caption = 'Consultar Recebimentos'
      TabOrder = 13
      OnClick = btn1Click
    end
    object Button1: TButton
      Left = 757
      Top = 348
      Width = 144
      Height = 25
      Caption = 'OBS Sobre Total Recebido...'
      TabOrder = 14
      OnClick = Button1Click
    end
    object cboFormaPgtoPesquisa: TDBLookupComboBox
      Left = 481
      Top = 28
      Width = 235
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 15
    end
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTRANSLOCAL
    BufferChunks = 1000
    CachedUpdates = False
    Left = 635
    Top = 232
  end
  object IBTRANSLOCAL: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    Params.Strings = (
      'read_committed'
      'rec_version'
      '')
    AutoStopAction = saNone
    Left = 635
    Top = 200
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 531
    Top = 264
  end
  object qryEmprestimo: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT ER.*, TP.tp_codigo || '#39' - '#39' || TP.tp_descricao AS DESCRIC' +
        'AO, PR.PG_DATA'
      'FROM EMPRESTIMOS_A_RECEBER ER'
      'INNER JOIN tipo_pagamento TP ON ER.tp_codigo = TP.tp_codigo'
      
        'lEFT JOIN PAGTO_EMPRESTIMOS_A_RECEBER PR ON ER.CODIGO = PR.CODIG' +
        'O')
    Left = 371
    Top = 216
    object qryEmprestimoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPRESTIMOS_A_RECEBER.CODIGO'
      Required = True
    end
    object qryEmprestimoVALOR_EMPRESTIMO: TIBBCDField
      FieldName = 'VALOR_EMPRESTIMO'
      Origin = 'EMPRESTIMOS_A_RECEBER.VALOR_EMPRESTIMO'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryEmprestimoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'EMPRESTIMOS_A_RECEBER.DATA'
    end
    object qryEmprestimoOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'EMPRESTIMOS_A_RECEBER.OBS'
      Size = 100
    end
    object qryEmprestimoVALOR_RECEBIDO: TIBBCDField
      FieldName = 'VALOR_RECEBIDO'
      Origin = 'EMPRESTIMOS_A_RECEBER.VALOR_RECEBIDO'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryEmprestimoSALDO_A_RECEBER: TIBBCDField
      FieldName = 'SALDO_A_RECEBER'
      Origin = 'EMPRESTIMOS_A_RECEBER.SALDO_A_RECEBER'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryEmprestimoTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'EMPRESTIMOS_A_RECEBER.TP_CODIGO'
    end
    object qryEmprestimoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
  object dsEmprestimo: TDataSource
    DataSet = qryEmprestimo
    Left = 275
    Top = 216
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 467
    Top = 192
  end
  object PopupMenu1: TPopupMenu
    Left = 371
    Top = 336
    object Receber1: TMenuItem
      Caption = 'Receber'
      OnClick = Receber1Click
    end
  end
  object dsFormaPgto: TDataSource
    DataSet = qryFormaPgto
    Left = 608
    Top = 8
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
    Left = 696
    Top = 8
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
