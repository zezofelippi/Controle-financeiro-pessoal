object frm_contas_pagar: Tfrm_contas_pagar
  Left = 212
  Top = 207
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contas a pagar'
  ClientHeight = 496
  ClientWidth = 1019
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1019
    Height = 216
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 6
      Top = 55
      Width = 48
      Height = 13
      Caption = 'Descricao'
    end
    object Label3: TLabel
      Left = 567
      Top = 10
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label1: TLabel
      Left = 763
      Top = 9
      Width = 80
      Height = 13
      Caption = 'Data Pagamento'
    end
    object Label5: TLabel
      Left = 6
      Top = 9
      Width = 81
      Height = 13
      Caption = 'Tipo de Despesa'
    end
    object Label6: TLabel
      Left = 406
      Top = 56
      Width = 25
      Height = 13
      Caption = 'OBS:'
    end
    object Label7: TLabel
      Left = 868
      Top = 9
      Width = 39
      Height = 13
      Caption = ' Parcela'
    end
    object Label10: TLabel
      Left = 660
      Top = 11
      Width = 65
      Height = 13
      Caption = 'Data Emiss'#227'o'
    end
    object Label12: TLabel
      Left = 989
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label11: TLabel
      Left = 271
      Top = 10
      Width = 64
      Height = 13
      Caption = 'Despesa Sub'
    end
    object txt_descricao: TEdit
      Left = 6
      Top = 70
      Width = 397
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 150
      TabOrder = 0
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
    object Button1: TButton
      Left = 989
      Top = 61
      Width = 89
      Height = 30
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object txt_valor: TCurrencyEdit
      Left = 565
      Top = 24
      Width = 86
      Height = 21
      AutoSize = False
      TabOrder = 2
      OnEnter = txt_valorEnter
      OnExit = txt_valorExit
      OnKeyPress = txt_valorKeyPress
    end
    object txt_data_pgto: TDateEdit
      Left = 763
      Top = 24
      Width = 98
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
      OnEnter = txt_data_pgtoEnter
      OnExit = txt_data_pgtoExit
      OnKeyPress = txt_data_pgtoKeyPress
    end
    object txt_obs: TEdit
      Left = 407
      Top = 69
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnEnter = txt_obsEnter
      OnExit = txt_obsExit
      OnKeyPress = txt_obsKeyPress
    end
    object txt_num_parcela: TEdit
      Left = 868
      Top = 23
      Width = 69
      Height = 21
      TabOrder = 5
      OnEnter = txt_num_parcelaEnter
      OnExit = txt_num_parcelaExit
      OnKeyPress = txt_num_parcelaKeyPress
    end
    object GroupBox4: TGroupBox
      Left = 6
      Top = 96
      Width = 1003
      Height = 91
      Caption = 'Pesquisa '
      TabOrder = 6
      object Label8: TLabel
        Left = 7
        Top = 17
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label9: TLabel
        Left = 108
        Top = 17
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object Label13: TLabel
        Left = 205
        Top = 12
        Width = 64
        Height = 13
        Caption = 'Tipo despesa'
      end
      object Label14: TLabel
        Left = 620
        Top = 12
        Width = 93
        Height = 13
        Caption = 'Descri'#231#227'o Despesa'
      end
      object Label15: TLabel
        Left = 418
        Top = 13
        Width = 88
        Height = 13
        Caption = 'Tipo Despesa Sub'
      end
      object txt_data_i: TDateEdit
        Left = 5
        Top = 29
        Width = 96
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object txt_data_f: TDateEdit
        Left = 104
        Top = 29
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
      object btnPesquisar: TButton
        Left = 922
        Top = 25
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
        OnClick = btnPesquisarClick
      end
      object cboDespesa_pesquisa: TDBLookupComboBox
        Left = 203
        Top = 28
        Width = 209
        Height = 21
        KeyField = 'TIP_CODIGO'
        ListField = 'DESPESA'
        ListSource = dsDespesa_pesquisa
        TabOrder = 3
        OnKeyDown = cboDespesa_pesquisaKeyDown
      end
      object txt_descricao_despesa: TEdit
        Left = 618
        Top = 27
        Width = 299
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
        OnEnter = txt_descricao_despesaEnter
        OnExit = txt_descricao_despesaExit
        OnKeyPress = txt_descricao_despesaKeyPress
      end
      object rdb_inicio: TRadioButton
        Left = 644
        Top = 51
        Width = 57
        Height = 17
        Caption = 'Inicio'
        TabOrder = 5
      end
      object rdb_posicao: TRadioButton
        Left = 732
        Top = 51
        Width = 113
        Height = 17
        Caption = 'Qualquer posicao'
        TabOrder = 6
      end
      object cboDespesa_pesquisaSub: TDBLookupComboBox
        Left = 415
        Top = 28
        Width = 199
        Height = 21
        KeyField = 'TDS_CODIGO'
        ListField = 'DESPESA_SUB'
        ListSource = dsDespesa_pesquisaSub
        TabOrder = 7
        OnKeyDown = cboDespesa_pesquisaSubKeyDown
      end
      object rdg_data: TRadioGroup
        Left = 4
        Top = 50
        Width = 206
        Height = 39
        Columns = 2
        Items.Strings = (
          'Por Emissao'
          'Por Vencimento')
        TabOrder = 8
      end
    end
    object txt_data_despesa: TDateEdit
      Left = 659
      Top = 24
      Width = 99
      Height = 21
      NumGlyphs = 2
      TabOrder = 7
      OnEnter = txt_data_despesaEnter
      OnExit = txt_data_despesaExit
      OnKeyPress = txt_data_despesaKeyPress
    end
    object txt_codigo: TEdit
      Left = 989
      Top = 31
      Width = 75
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 8
    end
    object cboDespesa: TDBLookupComboBox
      Left = 7
      Top = 24
      Width = 255
      Height = 21
      KeyField = 'TIP_CODIGO'
      ListField = 'DESPESA'
      ListSource = dsDespesa
      TabOrder = 9
      OnEnter = cboDespesaEnter
      OnExit = cboDespesaExit
      OnKeyPress = cboDespesaKeyPress
    end
    object cboDespesaSub: TDBLookupComboBox
      Left = 269
      Top = 24
      Width = 286
      Height = 21
      KeyField = 'TDS_CODIGO'
      ListField = 'DESPESA_SUB'
      ListSource = dsDespesaSub
      TabOrder = 10
      OnEnter = cboDespesaSubEnter
      OnExit = cboDespesaSubExit
      OnKeyPress = cboDespesaSubKeyPress
    end
    object chb_selecionar: TCheckBox
      Left = 9
      Top = 196
      Width = 135
      Height = 17
      Caption = 'Selecionar Todos ?'
      TabOrder = 11
      OnClick = chb_selecionarClick
    end
    object rdg_opcao: TRadioGroup
      Left = 776
      Top = 56
      Width = 185
      Height = 41
      Columns = 2
      Items.Strings = (
        'Venda'
        'Devolu'#231#227'o')
      TabOrder = 12
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 366
    Width = 1019
    Height = 130
    Align = alBottom
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 121
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 251
      Top = 22
      Width = 121
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Selecionado'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label17: TLabel
      Left = 734
      Top = 14
      Width = 50
      Height = 20
      AutoSize = False
      Color = clAqua
      ParentColor = False
    end
    object Label18: TLabel
      Left = 792
      Top = 18
      Width = 163
      Height = 13
      Caption = 'Vendas reunidas p/ gerar parcelas'
    end
    object Label19: TLabel
      Left = 734
      Top = 41
      Width = 50
      Height = 20
      AutoSize = False
      Color = 4227327
      ParentColor = False
    end
    object Label20: TLabel
      Left = 792
      Top = 45
      Width = 52
      Height = 13
      Caption = 'Devolu'#231#227'o'
    end
    object Label21: TLabel
      Left = 973
      Top = 14
      Width = 50
      Height = 20
      AutoSize = False
      Color = clInactiveCaption
      ParentColor = False
    end
    object Label22: TLabel
      Left = 1030
      Top = 18
      Width = 200
      Height = 13
      Caption = 'Despesa com itens da cota'#231#227'o de compra'
    end
    object Label23: TLabel
      Left = 9
      Top = 81
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
    object Label24: TLabel
      Left = 253
      Top = 79
      Width = 180
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Registros Selecionados'
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
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object Button2: TButton
      Left = 144
      Top = 32
      Width = 94
      Height = 31
      Caption = 'Relatorio'
      TabOrder = 1
      OnClick = Button2Click
    end
    object btnInserirParcelas: TButton
      Left = 384
      Top = 32
      Width = 217
      Height = 33
      Caption = 'Reunir vendas p/ gerar parcela(s)'
      TabOrder = 2
      OnClick = btnInserirParcelasClick
    end
    object txt_total_parcelas: TCurrencyEdit
      Left = 251
      Top = 42
      Width = 121
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object btnAjuda: TButton
      Left = 654
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Ajuda ---->'
      TabOrder = 4
      OnClick = btnAjudaClick
    end
    object txtTotalRegistros: TEdit
      Left = 8
      Top = 103
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
      TabOrder = 5
    end
    object txtTotalRegistrosSelecionados: TEdit
      Left = 254
      Top = 100
      Width = 178
      Height = 24
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 216
    Width = 1019
    Height = 150
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 1015
      Height = 133
      Align = alClient
      DataSource = ds_mostra_dados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CHECKED'
          Title.Color = clNavy
          Width = 20
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
          Width = 50
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
          Width = 150
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
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 320
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESPESA_OUTROS'
          Title.Caption = 'OBS'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 300
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
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_DESPESA'
          Title.Alignment = taCenter
          Title.Caption = 'DATA EMISSAO'
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
          FieldName = 'DATA_PGTO'
          Title.Alignment = taCenter
          Title.Caption = 'DATA PGTO'
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
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'N.Parc.'
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
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 232
    object Apagar1: TMenuItem
      Caption = 'Excluir'
      OnClick = Apagar1Click
    end
    object DarbaixadiretonoCadDespesas1: TMenuItem
      Caption = 'Dar baixa direto no  Cad. Despesas'
      OnClick = DarbaixadiretonoCadDespesas1Click
    end
    object DarBaixaParcialnaparcela1: TMenuItem
      Caption = 'Dar Baixa Parcial na Parcela'
      OnClick = DarBaixaParcialnaparcela1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Darbaixanascontasreunidasemparcelas1: TMenuItem
      Caption = 'Dar baixa nas contas reunidas em parcelas'
      OnClick = Darbaixanascontasreunidasemparcelas1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ItensCotaoCompra1: TMenuItem
      Caption = 'Itens Cota'#231#227'o Compra'
      OnClick = ItensCotaoCompra1Click
    end
    object DarBaixaemtodasascontasselecionadasdeumavez1: TMenuItem
      Caption = 'Dar Baixa em todas as contas selecionadas de uma vez'
      OnClick = DarBaixaemtodasascontasselecionadasdeumavez1Click
    end
  end
  object qry_mostra_dados: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_ou' +
        'tros, C.parcela, C.data_despesa, C.CODIGO_CONTAS_PAGAR_PARC, C.C' +
        'OT_CODIGO, C.AT_CODIGO,'
      'T.tip_codigo ||'#39' - '#39'|| T.tip_descricao AS DESPESA,'
      'TDS.TDS_codigo ||'#39' - '#39'|| TDS.TDS_descricao AS DESPESA_SUB,'
      'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO'
      
        'FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS ORDER ' +
        'BY C.DATA_PGTO')
    Left = 488
    Top = 232
    object qry_mostra_dadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS_PAGAR.CODIGO'
      Required = True
    end
    object qry_mostra_dadosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'CONTAS_PAGAR.DESCRICAO'
      Size = 150
    end
    object qry_mostra_dadosVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CONTAS_PAGAR.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_mostra_dadosDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
      Origin = 'CONTAS_PAGAR.DATA_PGTO'
    end
    object qry_mostra_dadosDESPESA_OUTROS: TIBStringField
      FieldName = 'DESPESA_OUTROS'
      Origin = 'CONTAS_PAGAR.DESPESA_OUTROS'
      Size = 150
    end
    object qry_mostra_dadosPARCELA: TIBStringField
      FieldName = 'PARCELA'
      Origin = 'CONTAS_PAGAR.PARCELA'
      Size = 4
    end
    object qry_mostra_dadosDATA_DESPESA: TDateTimeField
      FieldName = 'DATA_DESPESA'
      Origin = 'CONTAS_PAGAR.DATA_DESPESA'
    end
    object qry_mostra_dadosDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qry_mostra_dadosTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
    object qry_mostra_dadosTIP_DESCRICAO: TIBStringField
      FieldName = 'TIP_DESCRICAO'
      Origin = 'TIPO_DESPESA.TIP_DESCRICAO'
      Size = 64
    end
    object qry_mostra_dadosDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qry_mostra_dadosTDS_CODIGO: TIntegerField
      FieldName = 'TDS_CODIGO'
      Origin = 'TIPO_DESPESA_SUB.TDS_CODIGO'
      Required = True
    end
    object qry_mostra_dadosCODIGO_CONTAS_PAGAR_PARC: TIntegerField
      FieldName = 'CODIGO_CONTAS_PAGAR_PARC'
      Origin = 'CONTAS_PAGAR.CODIGO_CONTAS_PAGAR_PARC'
    end
    object qry_mostra_dadosCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
      Origin = 'CONTAS_PAGAR.COT_CODIGO'
    end
    object qry_mostra_dadosAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'CONTAS_PAGAR.AT_CODIGO'
    end
  end
  object qry_soma: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 152
  end
  object ds_mostra_dados: TDataSource
    DataSet = cdsMostraDados
    Left = 448
    Top = 232
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 320
    Top = 152
  end
  object qry_contas_pagar: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 288
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 192
    Top = 288
  end
  object qryDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'#39' - '#39'|| TIP_DESCR' +
        'ICAO AS DESPESA FROM TIPO_DESPESA')
    Left = 160
    Top = 16
    object qryDespesaTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
    object qryDespesaTIP_DESCRICAO: TIBStringField
      FieldName = 'TIP_DESCRICAO'
      Origin = 'TIPO_DESPESA.TIP_DESCRICAO'
      Size = 64
    end
    object qryDespesaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
  end
  object dsDespesa: TDataSource
    DataSet = qryDespesa
    OnDataChange = dsDespesaDataChange
    Left = 120
    Top = 16
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 952
    Top = 349
  end
  object dsDespesa_pesquisa: TDataSource
    DataSet = qry_despesa_pesquisa
    OnDataChange = dsDespesa_pesquisaDataChange
    Left = 270
    Top = 104
  end
  object qry_despesa_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'#39' - '#39'|| TIP_DESCR' +
        'ICAO AS DESPESA FROM TIPO_DESPESA')
    Left = 310
    Top = 104
    object qry_despesa_pesquisaTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
    object qry_despesa_pesquisaTIP_DESCRICAO: TIBStringField
      FieldName = 'TIP_DESCRICAO'
      Origin = 'TIPO_DESPESA.TIP_DESCRICAO'
      Size = 64
    end
    object qry_despesa_pesquisaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
  end
  object dsDespesaSub: TDataSource
    DataSet = qryDespesaSub
    Left = 416
    Top = 16
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
    Left = 464
    Top = 16
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
  object dsDespesa_pesquisaSub: TDataSource
    DataSet = qryDespesa_pesquisaSub
    Left = 542
    Top = 104
  end
  object qryDespesa_pesquisaSub: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TDS.tds_codigo || '#39' - '#39' || TDS.tds_descricao AS DESPESA_S' +
        'UB, TDS.tds_codigo'
      'FROM TIPO_DESPESA_SUB TDS')
    Left = 574
    Top = 112
    object qryDespesa_pesquisaSubDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qryDespesa_pesquisaSubTDS_CODIGO: TIntegerField
      FieldName = 'TDS_CODIGO'
      Origin = 'TIPO_DESPESA_SUB.TDS_CODIGO'
      Required = True
    end
  end
  object cdsMostraDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMostraDados'
    Left = 488
    Top = 274
    object cdsMostraDadosCHECKED: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CHECKED'
    end
    object cdsMostraDadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsMostraDadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdsMostraDadosVALOR: TBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsMostraDadosDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
    end
    object cdsMostraDadosDESPESA_OUTROS: TStringField
      FieldName = 'DESPESA_OUTROS'
      Size = 150
    end
    object cdsMostraDadosPARCELA: TStringField
      FieldName = 'PARCELA'
      Size = 4
    end
    object cdsMostraDadosDATA_DESPESA: TDateTimeField
      FieldName = 'DATA_DESPESA'
    end
    object cdsMostraDadosDESPESA: TStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object cdsMostraDadosTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Required = True
    end
    object cdsMostraDadosTIP_DESCRICAO: TStringField
      FieldName = 'TIP_DESCRICAO'
      Size = 64
    end
    object cdsMostraDadosDESPESA_SUB: TStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object cdsMostraDadosTDS_CODIGO: TIntegerField
      FieldName = 'TDS_CODIGO'
      Required = True
    end
    object cdsMostraDadosCODIGO_CONTAS_PAGAR_PARC: TIntegerField
      FieldName = 'CODIGO_CONTAS_PAGAR_PARC'
    end
    object cdsMostraDadosCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
    end
    object cdsMostraDadosAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
    end
  end
  object dspMostraDados: TDataSetProvider
    DataSet = qry_mostra_dados
    Left = 448
    Top = 274
  end
end
