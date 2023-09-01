object frmJuntarPessoalSitio: TfrmJuntarPessoalSitio
  Left = 344
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Juntar Despesa Pessoal c/ Despesa Sitio'
  ClientHeight = 402
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 48
    Width = 42
    Height = 13
    Caption = 'Despesa'
  end
  object Label5: TLabel
    Left = 12
    Top = 104
    Width = 64
    Height = 13
    Caption = 'Despesa Sub'
  end
  object Label2: TLabel
    Left = 0
    Top = 16
    Width = 654
    Height = 13
    Caption = 
      '   Despesa Pessoal----------------------------------------------' +
      '-------------------------------------------------------Despesa S' +
      'itio------------------------------------------------------------' +
      '-----'
  end
  object Label3: TLabel
    Left = 355
    Top = 69
    Width = 65
    Height = 13
    Caption = 'Despesa Sitio'
  end
  object cboDespesa: TDBLookupComboBox
    Left = 9
    Top = 65
    Width = 324
    Height = 21
    KeyField = 'TIP_CODIGO'
    ListField = 'DESPESA'
    ListSource = dsDespesa
    TabOrder = 0
  end
  object cboDespesaSub: TDBLookupComboBox
    Left = 10
    Top = 120
    Width = 323
    Height = 21
    KeyField = 'TDS_CODIGO'
    ListField = 'DESPESA_SUB'
    ListSource = dsDespesaSub
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 344
    Top = 28
    Width = 3
    Height = 115
    TabOrder = 2
  end
  object cboDespesaSitio: TDBLookupComboBox
    Left = 352
    Top = 87
    Width = 300
    Height = 21
    KeyField = 'TIP_CODIGO_SIT'
    ListField = 'DESPESA'
    ListSource = dsDespesaSitio
    TabOrder = 3
  end
  object btnJuntar: TButton
    Left = 272
    Top = 168
    Width = 105
    Height = 33
    Caption = 'Juntar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnJuntarClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 213
    Width = 649
    Height = 185
    DataSource = dsJuntar
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'DESPESA_PESSOAL'
        Title.Caption = 'Despesa Pessoal'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESPESA_SIT'
        Title.Caption = 'Despesa Sitio'
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
  object dsDespesa: TDataSource
    DataSet = qryDespesa
    OnDataChange = dsDespesaDataChange
    Left = 128
    Top = 63
  end
  object qryDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'#39' - '#39'|| TIP_DESCR' +
        'ICAO AS DESPESA FROM TIPO_DESPESA')
    Left = 168
    Top = 63
    object qryDespesaTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
    object qryDespesaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qryDespesaTIP_DESCRICAO: TIBStringField
      FieldName = 'TIP_DESCRICAO'
      Origin = 'TIPO_DESPESA.TIP_DESCRICAO'
      Size = 64
    end
  end
  object dsDespesaSub: TDataSource
    DataSet = qryDespesaSub
    Left = 136
    Top = 112
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
    Left = 184
    Top = 112
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
  object qryDespesaSitio: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TIP_CODIGO_SIT, TIP_DESCRICAO_SIT, TIP_CODIGO_SIT ||'#39' - '#39 +
        '|| TIP_DESCRICAO_SIT AS DESPESA FROM TIPO_DESPESA_SITIO')
    Left = 536
    Top = 72
    object qryDespesaSitioTIP_CODIGO_SIT: TIntegerField
      FieldName = 'TIP_CODIGO_SIT'
      Origin = 'TIPO_DESPESA_SITIO.TIP_CODIGO_SIT'
      Required = True
    end
    object qryDespesaSitioTIP_DESCRICAO_SIT: TIBStringField
      FieldName = 'TIP_DESCRICAO_SIT'
      Origin = 'TIPO_DESPESA_SITIO.TIP_DESCRICAO_SIT'
      Size = 64
    end
    object qryDespesaSitioDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
  end
  object dsDespesaSitio: TDataSource
    DataSet = qryDespesaSitio
    Left = 488
    Top = 72
  end
  object dsJuntar: TDataSource
    DataSet = qryJuntar
    Left = 200
    Top = 248
  end
  object qryJuntar: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TD.tip_codigo || '#39' - '#39' || TD.tip_descricao ||'#39' | '#39'||'
      
        '       TDS.tds_codigo || '#39' - '#39' || TDS.tds_descricao AS DESPESA_P' +
        'ESSOAL,'
      
        '       TIDS.tip_codigo_sit || '#39' - '#39' || TIDS.tip_descricao_sit AS' +
        ' DESPESA_SIT'
      
        'FROM  tipo_despesa TD, TIPO_DESPESA_SUB TDS, TIPO_DESPESA_SITIO ' +
        'TIDS')
    Left = 256
    Top = 248
    object qryJuntarDESPESA_PESSOAL: TIBStringField
      FieldName = 'DESPESA_PESSOAL'
      Size = 159
    end
    object qryJuntarDESPESA_SIT: TIBStringField
      FieldName = 'DESPESA_SIT'
      Size = 78
    end
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 424
    Top = 184
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 472
    Top = 184
  end
end
