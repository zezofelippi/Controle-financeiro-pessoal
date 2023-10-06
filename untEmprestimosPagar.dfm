object frmEmprestimosPagar: TfrmEmprestimosPagar
  Left = 155
  Top = 183
  BorderStyle = bsSingle
  Caption = 'Emprestimos a Pagar'
  ClientHeight = 490
  ClientWidth = 1034
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
    Width = 617
    Height = 49
    AutoSize = False
    Caption = 'EMPRESTIMOS A PAGAR'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 52
    Width = 1027
    Height = 64
    TabOrder = 0
    object Label3: TLabel
      Left = 183
      Top = 12
      Width = 64
      Height = 13
      Caption = 'Valor a Pagar'
    end
    object Label4: TLabel
      Left = 79
      Top = 13
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label1: TLabel
      Left = 540
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
      Left = 270
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
      Left = 537
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
      Left = 938
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
      Left = 269
      Top = 28
      Width = 264
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 5
      OnEnter = cboFormaPgtoEnter
      OnExit = cboFormaPgtoExit
      OnKeyPress = cboFormaPgtoKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 117
    Width = 1027
    Height = 372
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 18
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label5: TLabel
      Left = 121
      Top = 18
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label6: TLabel
      Left = 575
      Top = 299
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total a Pagar'
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
      Top = 310
      Width = 30
      Height = 13
      Caption = 'Pagos'
    end
    object Label7: TLabel
      Left = 124
      Top = 310
      Width = 53
      Height = 13
      Caption = 'Nao Pagos'
    end
    object Label9: TLabel
      Left = 717
      Top = 299
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Pago'
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
      Left = 858
      Top = 299
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total  Saldo a Pagar'
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
      Left = 698
      Top = 19
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object Label14: TLabel
      Left = 492
      Top = 18
      Width = 54
      Height = 13
      Caption = 'Forma Pgto'
    end
    object txt_data_i: TDateEdit
      Left = 6
      Top = 33
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
      Top = 33
      Width = 101
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = txt_data_fEnter
      OnExit = txt_data_fExit
      OnKeyPress = txt_data_fKeyPress
    end
    object DBGrid1: TDBGrid
      Left = 7
      Top = 99
      Width = 1011
      Height = 196
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
          FieldName = 'VALOR_A_PAGAR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor a Pagar'
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
          FieldName = 'VALOR_PAGO'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Pago'
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
          FieldName = 'SALDO_A_PAGAR'
          Title.Alignment = taCenter
          Title.Caption = 'Saldo a Pagar'
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
      Top = 10
      Width = 260
      Height = 44
      Columns = 3
      Items.Strings = (
        'Pagos'
        'Nao Pagos'
        'Todos')
      TabOrder = 3
    end
    object btnPesquisar: TButton
      Left = 921
      Top = 24
      Width = 91
      Height = 31
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = btnPesquisarClick
    end
    object txt_total_a_pagar: TCurrencyEdit
      Left = 575
      Top = 315
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
      Top = 308
      Width = 33
      Height = 15
      AutoSize = False
      Color = 11260666
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
      Top = 308
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
    object txt_total_pago: TCurrencyEdit
      Left = 717
      Top = 315
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
    object txt_total_saldo_a_pagar: TCurrencyEdit
      Left = 858
      Top = 315
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
      Left = 696
      Top = 35
      Width = 221
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 10
      OnEnter = TXT_OBS_pesqEnter
      OnExit = TXT_OBS_pesqExit
      OnKeyPress = TXT_OBS_pesqKeyPress
    end
    object rdb_inicio: TRadioButton
      Left = 720
      Top = 63
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 11
    end
    object rdb_posicao: TRadioButton
      Left = 808
      Top = 63
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 12
    end
    object btn1: TButton
      Left = 248
      Top = 296
      Width = 233
      Height = 40
      Caption = 'Consultar Pagamentos'
      TabOrder = 13
      OnClick = btn1Click
    end
    object cboFormaPgtoPesquisa: TDBLookupComboBox
      Left = 489
      Top = 35
      Width = 205
      Height = 21
      KeyField = 'TP_CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPgto
      TabOrder = 14
    end
    object Button1: TButton
      Left = 717
      Top = 340
      Width = 140
      Height = 25
      Caption = 'OBS Sobre Total Pago...'
      TabOrder = 15
      OnClick = Button1Click
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
      
        'SELECT EP.*, TP.tp_codigo || '#39' - '#39' || TP.tp_descricao AS DESCRIC' +
        'AO, PP.PG_DATA  FROM EMPRESTIMOS_A_PAGAR EP'
      
        '                     INNER JOIN TIPO_PAGAMENTO TP ON EP.TP_CODIG' +
        'O = TP.TP_CODIGO'
      'LEFT JOIN PAGTO_EMPRESTIMOS_A_PAGAR PP ON PP.codigo = EP.codigo')
    Left = 379
    Top = 200
    object qryEmprestimoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPRESTIMOS_A_PAGAR.CODIGO'
      Required = True
    end
    object qryEmprestimoVALOR_A_PAGAR: TIBBCDField
      FieldName = 'VALOR_A_PAGAR'
      Origin = 'EMPRESTIMOS_A_PAGAR.VALOR_A_PAGAR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryEmprestimoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'EMPRESTIMOS_A_PAGAR.DATA'
    end
    object qryEmprestimoOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'EMPRESTIMOS_A_PAGAR.OBS'
      Size = 100
    end
    object qryEmprestimoVALOR_PAGO: TIBBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'EMPRESTIMOS_A_PAGAR.VALOR_PAGO'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryEmprestimoSALDO_A_PAGAR: TIBBCDField
      FieldName = 'SALDO_A_PAGAR'
      Origin = 'EMPRESTIMOS_A_PAGAR.SALDO_A_PAGAR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryEmprestimoTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'EMPRESTIMOS_A_PAGAR.TP_CODIGO'
    end
    object qryEmprestimoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 78
    end
  end
  object dsEmprestimo: TDataSource
    DataSet = qryEmprestimo
    Left = 307
    Top = 200
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
    Left = 347
    Top = 304
    object Receber1: TMenuItem
      Caption = 'Receber'
      OnClick = Receber1Click
    end
  end
  object dsFormaPgto: TDataSource
    DataSet = qryFormaPgto
    Left = 336
    Top = 16
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
    Left = 424
    Top = 16
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
