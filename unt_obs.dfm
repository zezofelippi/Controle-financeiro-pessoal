object frm_obs: Tfrm_obs
  Left = 316
  Top = 215
  BorderStyle = bsDialog
  Caption = 'OBS'
  ClientHeight = 445
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 1
    Width = 22
    Height = 13
    Caption = 'OBS'
  end
  object btn_gravar: TButton
    Left = 688
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = btn_gravarClick
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 145
    Width = 905
    Height = 289
    DataSource = ds_mostra_dados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
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
        FieldName = 'DESCRICAO'
        Title.Caption = 'OBS'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 800
        Visible = True
      end>
  end
  object txt_obs: TEdit
    Left = 4
    Top = 16
    Width = 681
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 2
    OnEnter = txt_obsEnter
    OnExit = txt_obsExit
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 43
    Width = 677
    Height = 99
    Caption = 'Pesquisar Registro'
    TabOrder = 3
    object Label5: TLabel
      Left = 13
      Top = 18
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object txt_obs_pesquisa: TEdit
      Left = 12
      Top = 35
      Width = 413
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object rdb_inicio: TRadioButton
      Left = 52
      Top = 63
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 1
    end
    object rdb_posicao: TRadioButton
      Left = 111
      Top = 62
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 2
    end
    object Button1: TButton
      Left = 444
      Top = 26
      Width = 137
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object qry_lembretes: TIBQuery
    Database = dm.BD
    Transaction = IBTRANSLOCAL
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 8
  end
  object IBTRANSLOCAL: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 344
    Top = 8
  end
  object qry_mostra_dados: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM LEMBRETES ORDER BY CODIGO')
    Left = 432
    Top = 224
    object qry_mostra_dadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'LEMBRETES.CODIGO'
      Required = True
    end
    object qry_mostra_dadosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'LEMBRETES.DESCRICAO'
      Size = 250
    end
  end
  object ds_mostra_dados: TDataSource
    DataSet = qry_mostra_dados
    Left = 376
    Top = 216
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 456
  end
end
