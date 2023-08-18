object frmCadTipoDespesa: TfrmCadTipoDespesa
  Left = 248
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cad. Tipo de Despesa'
  ClientHeight = 617
  ClientWidth = 940
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 24
    Width = 926
    Height = 13
    Caption = 
      'Cad. Despesa____________________________________________________' +
      '________________________Cad. Sub. Despesas______________________' +
      '_____________________________'
  end
  object Label4: TLabel
    Left = 8
    Top = 352
    Width = 930
    Height = 13
    Caption = 
      '________________________________________________________________' +
      '________________________________________________________________' +
      '___________________________'
  end
  object gpbDados: TGroupBox
    Left = 0
    Top = 45
    Width = 343
    Height = 111
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object txt_codigo: TEdit
      Left = 17
      Top = 24
      Width = 96
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 0
    end
    object txt_descricao: TEdit
      Left = 16
      Top = 72
      Width = 306
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 346
    Top = 46
    Width = 129
    Height = 175
    TabOrder = 1
    object btnGravar: TButton
      Left = 8
      Top = 55
      Width = 113
      Height = 33
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnAlterar: TButton
      Left = 8
      Top = 90
      Width = 113
      Height = 32
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 8
      Top = 124
      Width = 113
      Height = 32
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnInserir: TButton
      Left = 8
      Top = 20
      Width = 113
      Height = 33
      Caption = 'Inserir'
      TabOrder = 3
      OnClick = btnInserirClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 163
    Width = 336
    Height = 182
    DataSource = dsTipoDespesa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIP_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIP_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 250
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 482
    Top = 41
    Width = 3
    Height = 308
    TabOrder = 3
  end
  object gpbDadosSub: TGroupBox
    Left = 488
    Top = 48
    Width = 321
    Height = 107
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 11
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label6: TLabel
      Left = 8
      Top = 55
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object txt_codigosub: TEdit
      Left = 7
      Top = 25
      Width = 93
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 0
    end
    object txt_descricaosub: TEdit
      Left = 8
      Top = 72
      Width = 308
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = txt_descricaosubEnter
      OnExit = txt_descricaosubExit
      OnKeyPress = txt_descricaosubKeyPress
    end
  end
  object GroupBox4: TGroupBox
    Left = 814
    Top = 48
    Width = 125
    Height = 154
    TabOrder = 5
    object btnInserirSub: TButton
      Left = 8
      Top = 16
      Width = 108
      Height = 30
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btnInserirSubClick
    end
    object btnGravarSub: TButton
      Left = 8
      Top = 47
      Width = 108
      Height = 30
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = btnGravarSubClick
    end
    object btnAlterarSub: TButton
      Left = 8
      Top = 78
      Width = 108
      Height = 30
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarSubClick
    end
    object btnExcluirSub: TButton
      Left = 8
      Top = 109
      Width = 109
      Height = 30
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirSubClick
    end
  end
  object DBGrid2: TDBGrid
    Left = 488
    Top = 160
    Width = 320
    Height = 189
    DataSource = dsTipoDespesaSub
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TDS_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDS_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 230
        Visible = True
      end>
  end
  object txt_Despesa: TEdit
    Left = 8
    Top = 384
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    Color = 16776176
    ReadOnly = True
    TabOrder = 7
  end
  object txt_despesa_sub: TEdit
    Left = 480
    Top = 384
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    Color = 16776176
    ReadOnly = True
    TabOrder = 8
  end
  object DBGrid3: TDBGrid
    Left = 8
    Top = 416
    Width = 857
    Height = 153
    DataSource = dsDespesaSub
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid3DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'DESPESA'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 380
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
        Width = 380
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 862
    Top = 381
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 10
    OnClick = Button1Click
  end
  object txt_cod_despesa: TEdit
    Left = 240
    Top = 408
    Width = 121
    Height = 21
    TabOrder = 11
    Visible = False
  end
  object txt_cod_despesa_sub: TEdit
    Left = 608
    Top = 400
    Width = 121
    Height = 21
    TabOrder = 12
    Visible = False
  end
  object Button2: TButton
    Left = 760
    Top = 576
    Width = 105
    Height = 33
    Caption = 'Relatorio'
    TabOrder = 13
    OnClick = Button2Click
  end
  object qryTipoDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tipo_despesa')
    Left = 200
    Top = 224
    object qryTipoDespesaTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
    object qryTipoDespesaTIP_DESCRICAO: TIBStringField
      FieldName = 'TIP_DESCRICAO'
      Origin = 'TIPO_DESPESA.TIP_DESCRICAO'
      Size = 64
    end
  end
  object dsTipoDespesa: TDataSource
    DataSet = qryTipoDespesa
    Left = 160
    Top = 224
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 376
    Top = 312
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 408
    Top = 312
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 376
    Top = 256
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 256
  end
  object dsTipoDespesaSub: TDataSource
    DataSet = qryTipoDespesaSub
    Left = 552
    Top = 248
  end
  object qryTipoDespesaSub: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tipo_despesa_sub')
    Left = 600
    Top = 248
    object qryTipoDespesaSubTDS_CODIGO: TIntegerField
      FieldName = 'TDS_CODIGO'
      Origin = 'TIPO_DESPESA_SUB.TDS_CODIGO'
      Required = True
    end
    object qryTipoDespesaSubTDS_DESCRICAO: TIBStringField
      FieldName = 'TDS_DESCRICAO'
      Origin = 'TIPO_DESPESA_SUB.TDS_DESCRICAO'
      Size = 64
    end
  end
  object qryDespesaSub: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TD.tip_codigo || '#39' - '#39' || TD.tip_descricao AS DESPESA,'
      
        '       TDS.tds_codigo || '#39' - '#39' || TDS.tds_descricao AS DESPESA_S' +
        'UB'
      'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS')
    Left = 408
    Top = 456
    object qryDespesaSubDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qryDespesaSubDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
  end
  object dsDespesaSub: TDataSource
    DataSet = qryDespesaSub
    Left = 368
    Top = 456
  end
end
