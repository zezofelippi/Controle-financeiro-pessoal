object frm_obs: Tfrm_obs
  Left = 316
  Top = 215
  BorderStyle = bsDialog
  Caption = 'OBS'
  ClientHeight = 365
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
    Left = 608
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = btn_gravarClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 72
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
  object qry_lembretes: TIBQuery
    Database = dm.BD
    Transaction = IBTRANSLOCAL
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 48
  end
  object IBTRANSLOCAL: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 344
    Top = 48
  end
  object qry_mostra_dados: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM LEMBRETES ORDER BY CODIGO')
    Left = 408
    Top = 136
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
    Top = 136
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 448
    Top = 48
  end
end
