object frmCadTipoReceita: TfrmCadTipoReceita
  Left = 382
  Top = 211
  BorderStyle = bsSingle
  Caption = 'Tipo de Receita'
  ClientHeight = 373
  ClientWidth = 581
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
  object gpbDados: TGroupBox
    Left = 4
    Top = -1
    Width = 447
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
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 111
    Width = 443
    Height = 262
    DataSource = dsTipoReceita
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
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
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
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
        FieldName = 'RECEITA'
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 300
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 451
    Top = -2
    Width = 129
    Height = 175
    TabOrder = 2
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
  object dsTipoReceita: TDataSource
    DataSet = qryTipoReceita
    Left = 176
    Top = 152
  end
  object qryTipoReceita: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tipo_receita')
    Left = 216
    Top = 152
    object qryTipoReceitaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_RECEITA.CODIGO'
      Required = True
    end
    object qryTipoReceitaRECEITA: TIBStringField
      FieldName = 'RECEITA'
      Origin = 'TIPO_RECEITA.RECEITA'
      Size = 64
    end
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 216
    Top = 192
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 264
    Top = 184
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 472
    Top = 208
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 504
    Top = 208
  end
end
