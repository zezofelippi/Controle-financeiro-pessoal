object frm_rel_data_tipo_mae: Tfrm_rel_data_tipo_mae
  Left = 372
  Top = 227
  Align = alClient
  BorderStyle = bsDialog
  Caption = 'Relatorio Geral M'#227'e'
  ClientHeight = 474
  ClientWidth = 1137
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1137
    Height = 155
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 12
      Top = 69
      Width = 64
      Height = 13
      Caption = 'Tipo despesa'
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 3
      Height = 13
    end
    object Label5: TLabel
      Left = 470
      Top = 72
      Width = 74
      Height = 13
      Caption = 'Despesa outros'
    end
    object Label15: TLabel
      Left = 248
      Top = 72
      Width = 64
      Height = 13
      Caption = 'Despesa Sub'
    end
    object lbl5: TLabel
      Left = 704
      Top = 120
      Width = 496
      Height = 20
      Caption = 'Data cart'#227'o '#233' a data de quando foi feita a compra com cart'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 789
      Top = 82
      Width = 137
      Height = 25
      Caption = 'Visualizar Dados'
      TabOrder = 0
      OnClick = Button1Click
    end
    object txt_despesa_outros: TEdit
      Left = 469
      Top = 86
      Width = 308
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = txt_despesa_outrosEnter
      OnExit = txt_despesa_outrosExit
      OnKeyPress = txt_despesa_outrosKeyPress
    end
    object GroupBox2: TGroupBox
      Left = 431
      Top = 7
      Width = 578
      Height = 60
      Caption = 'Dias da Semana'
      TabOrder = 2
      object Label7: TLabel
        Left = 11
        Top = 18
        Width = 43
        Height = 13
        Caption = 'Segunda'
      end
      object Label8: TLabel
        Left = 91
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Ter'#231'a'
      end
      object Label9: TLabel
        Left = 171
        Top = 19
        Width = 32
        Height = 13
        Caption = 'Quarta'
      end
      object Label10: TLabel
        Left = 252
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Quinta'
      end
      object Label11: TLabel
        Left = 331
        Top = 20
        Width = 27
        Height = 13
        Caption = 'Sexta'
      end
      object Label12: TLabel
        Left = 414
        Top = 19
        Width = 37
        Height = 13
        Caption = 'Sabado'
      end
      object Label13: TLabel
        Left = 495
        Top = 19
        Width = 42
        Height = 13
        Caption = 'Domingo'
      end
      object cbo_segunda: TComboBox
        Left = 8
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'SEGUNDA')
      end
      object cbo_terca: TComboBox
        Left = 88
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'TERCA')
      end
      object cbo_quarta: TComboBox
        Left = 168
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'QUARTA')
      end
      object cbo_quinta: TComboBox
        Left = 250
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          'QUINTA')
      end
      object cbo_sexta: TComboBox
        Left = 330
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 4
        Items.Strings = (
          'SEXTA')
      end
      object cbo_sabado: TComboBox
        Left = 410
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 5
        Items.Strings = (
          'SABADO')
      end
      object cbo_domingo: TComboBox
        Left = 491
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 6
        Items.Strings = (
          'DOMINGO')
      end
    end
    object rdb_inicio: TRadioButton
      Left = 480
      Top = 112
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 3
    end
    object rdb_posicao: TRadioButton
      Left = 568
      Top = 112
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 4
    end
    object cboDespesa: TDBLookupComboBox
      Left = 8
      Top = 86
      Width = 231
      Height = 21
      KeyField = 'TIP_CODIGO'
      ListField = 'DESPESA'
      ListSource = dsDespesa
      TabOrder = 5
      OnEnter = cboDespesaEnter
      OnExit = cboDespesaExit
      OnKeyDown = cboDespesaKeyDown
      OnKeyPress = cboDespesaKeyPress
    end
    object cboDespesaSub: TDBLookupComboBox
      Left = 246
      Top = 86
      Width = 218
      Height = 21
      KeyField = 'TDS_CODIGO'
      ListField = 'DESPESA_SUB'
      ListSource = dsDespesaSub
      TabOrder = 6
      OnEnter = cboDespesaSubEnter
      OnExit = cboDespesaSubExit
      OnKeyDown = cboDespesaSubKeyDown
      OnKeyPress = cboDespesaSubKeyPress
    end
    object rdgContasAtraso: TRadioGroup
      Left = 8
      Top = 112
      Width = 233
      Height = 41
      Caption = 'Contas Pagas c/ Atraso ?'
      Columns = 3
      Items.Strings = (
        'Sim'
        'Nao'
        'Todos')
      TabOrder = 7
    end
    object gpb1: TGroupBox
      Left = 7
      Top = 6
      Width = 225
      Height = 62
      Caption = 'Data do pagamento das despesas'
      TabOrder = 8
      object lbl1: TLabel
        Left = 8
        Top = 24
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object lbl2: TLabel
        Left = 121
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object txt_data_i: TDateEdit
        Left = 6
        Top = 39
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
        Top = 39
        Width = 101
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        OnEnter = txt_data_fEnter
        OnExit = txt_data_fExit
        OnKeyPress = txt_data_fKeyPress
      end
    end
    object gpb2: TGroupBox
      Left = 234
      Top = 8
      Width = 195
      Height = 61
      Caption = 'Data da despesas c/ cart'#227'o'
      TabOrder = 9
      object lbl3: TLabel
        Left = 8
        Top = 24
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object lbl4: TLabel
        Left = 121
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object edtDatainicialCartao: TDateEdit
        Left = 7
        Top = 37
        Width = 91
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edtDataFinalCartao: TDateEdit
        Left = 106
        Top = 36
        Width = 86
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 409
    Width = 1137
    Height = 65
    Align = alBottom
    TabOrder = 1
    object Label6: TLabel
      Left = 613
      Top = 11
      Width = 153
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label17: TLabel
      Left = 198
      Top = 14
      Width = 50
      Height = 20
      AutoSize = False
      Color = clInactiveCaption
      ParentColor = False
    end
    object Label18: TLabel
      Left = 255
      Top = 18
      Width = 200
      Height = 13
      Caption = 'Despesa com itens da cota'#231#227'o de compra'
    end
    object Label23: TLabel
      Left = 953
      Top = 10
      Width = 121
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total de Registros'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 789
      Top = 12
      Width = 136
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Cart'#227'o'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object txt_total: TCurrencyEdit
      Left = 615
      Top = 33
      Width = 150
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object btnRelatorio: TButton
      Left = 8
      Top = 19
      Width = 88
      Height = 29
      Caption = 'Relatorio'
      TabOrder = 1
      OnClick = btnRelatorioClick
    end
    object txtTotalRegistros: TEdit
      Left = 952
      Top = 31
      Width = 121
      Height = 24
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object txtTotalCartao: TCurrencyEdit
      Left = 789
      Top = 34
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
      TabOrder = 3
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 155
    Width = 1137
    Height = 254
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 1133
      Height = 237
      Align = alClient
      DataSource = ds_pesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
      Columns = <
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESPESA'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESPESA_SUB'
          Title.Caption = 'DESPESA SUB'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESPESA_OUTROS'
          Title.Caption = 'DESCRI'#199#195'O DA DESPESA'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_CARTAO'
          Title.Alignment = taCenter
          Title.Caption = 'DATA CART'#195'O'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEMANA'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 120
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CONTAS_PAGAR_ID'
          Title.Caption = 'Cod. Contas Pagar'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CA.codigo, CA.despesa_outros, CA.valor, CA.data, CA.seman' +
        'a,'
      'T.tip_codigo ||'#39' - '#39'|| T.tip_descricao AS DESPESA,'
      'TDS.TDS_codigo ||'#39' - '#39'|| TDS.TDS_descricao AS DESPESA_SUB,'
      'COT_CODIGO, AT_cODIGO, CA.DATA_CARTAO, CA.CONTAS_PAGAR_ID    '
      'FROM CAD_DESPESA CA, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS'
      'WHERE T.tip_codigo=CA.tip_codigo')
    Left = 368
    Top = 136
    object qry_pesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CAD_DESPESA.CODIGO'
      Required = True
    end
    object qry_pesquisaDESPESA_OUTROS: TIBStringField
      FieldName = 'DESPESA_OUTROS'
      Origin = 'CAD_DESPESA.DESPESA_OUTROS'
      Size = 150
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CAD_DESPESA.VALOR'
      DisplayFormat = 'R$ ###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'CAD_DESPESA.DATA'
    end
    object qry_pesquisaSEMANA: TIBStringField
      FieldName = 'SEMANA'
      Origin = 'CAD_DESPESA.SEMANA'
      Size = 15
    end
    object qry_pesquisaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qry_pesquisaDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qry_pesquisaCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
      Origin = 'CAD_DESPESA.COT_CODIGO'
    end
    object qry_pesquisaAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'CAD_DESPESA.AT_CODIGO'
    end
    object dtmfld_pesquisaDATA_CARTAO: TDateTimeField
      FieldName = 'DATA_CARTAO'
      Origin = 'CAD_DESPESA.DATA_CARTAO'
    end
    object qry_pesquisaCONTAS_PAGAR_ID: TIntegerField
      FieldName = 'CONTAS_PAGAR_ID'
      Origin = 'CAD_DESPESA.CONTAS_PAGAR_ID'
    end
  end
  object ds_pesquisa: TDataSource
    DataSet = qry_pesquisa
    Left = 328
    Top = 169
  end
  object qry_soma: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 464
    Top = 137
  end
  object qryDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 83
  end
  object dsDespesa: TDataSource
    DataSet = qryDespesa
    OnDataChange = dsDespesaDataChange
    Left = 112
    Top = 83
  end
  object dsDespesaSub: TDataSource
    DataSet = qryDespesaSub
    Left = 336
    Top = 83
  end
  object qryDespesaSub: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TDS.tds_codigo || '#39' - '#39' || TDS.tds_descricao AS DESPESA_S' +
        'UB, TDS.tds_codigo'
      'FROM TIPO_DESPESA_SUB TDS')
    Left = 384
    Top = 83
    object qryDespesaSubDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qryDespesaSubTDS_CODIGO: TIntegerField
      FieldName = 'TDS_CODIGO'
      Origin = 'TIPO_DESPESA_SUB.TDS_CODIGO'
      Required = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 235
    object Despesacomitensdacotaodecompra1: TMenuItem
      Caption = 'Despesa com itens da cota'#231#227'o de compra'
      OnClick = Despesacomitensdacotaodecompra1Click
    end
  end
end
