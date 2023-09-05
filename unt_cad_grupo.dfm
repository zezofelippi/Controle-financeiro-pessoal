object frm_cad_grupo: Tfrm_cad_grupo
  Left = 403
  Top = 100
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Grupos'
  ClientHeight = 398
  ClientWidth = 549
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
  object gpb_dados: TGroupBox
    Left = 2
    Top = -1
    Width = 424
    Height = 104
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 51
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label6: TLabel
      Left = 32
      Top = 292
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object Local: TLabel
      Left = 245
      Top = 292
      Width = 26
      Height = 13
      Caption = 'Local'
    end
    object Label17: TLabel
      Left = 12
      Top = 289
      Width = 21
      Height = 18
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 9
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 565
      Top = 132
      Width = 28
      Height = 13
      Caption = 'Desc.'
      Visible = False
    end
    object Label15: TLabel
      Left = 629
      Top = 132
      Width = 59
      Height = 13
      Caption = 'Valor '#224' Vista'
      Visible = False
    end
    object txt_descricao: TEdit
      Left = 8
      Top = 67
      Width = 411
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
    object txt_codigo: TEdit
      Left = 8
      Top = 25
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object che_item_desc: TCheckBox
      Left = 551
      Top = 174
      Width = 97
      Height = 17
      Caption = 'Item com Desc.'
      TabOrder = 2
      Visible = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 428
    Top = -1
    Width = 122
    Height = 220
    TabOrder = 1
    object Label11: TLabel
      Left = 565
      Top = 132
      Width = 28
      Height = 13
      Caption = 'Desc.'
      Visible = False
    end
    object Label13: TLabel
      Left = 629
      Top = 132
      Width = 59
      Height = 13
      Caption = 'Valor '#224' Vista'
      Visible = False
    end
    object Edit4: TEdit
      Left = 562
      Top = 146
      Width = 51
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Visible = False
    end
    object Edit5: TEdit
      Left = 628
      Top = 146
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
    object CheckBox1: TCheckBox
      Left = 551
      Top = 174
      Width = 97
      Height = 17
      Caption = 'Item com Desc.'
      TabOrder = 8
      Visible = False
    end
    object btnNovo: TBitBtn
      Left = 2
      Top = 6
      Width = 115
      Height = 35
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnGravar: TBitBtn
      Left = 2
      Top = 41
      Width = 115
      Height = 35
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnGravarClick
    end
    object btnCancelar: TBitBtn
      Left = 2
      Top = 76
      Width = 115
      Height = 35
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnExcluir: TBitBtn
      Left = 2
      Top = 146
      Width = 115
      Height = 35
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnExcluirClick
    end
    object btnSair: TBitBtn
      Left = 2
      Top = 181
      Width = 115
      Height = 35
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnSairClick
    end
    object btnAlterar: TBitBtn
      Left = 2
      Top = 111
      Width = 115
      Height = 35
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnAlterarClick
    end
  end
  object grdLista: TDBGrid
    Left = 3
    Top = 103
    Width = 421
    Height = 290
    Color = 15794175
    DataSource = dsListaGrupo
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = grdListaDrawColumnCell
    OnDblClick = grdListaDblClick
    OnKeyPress = grdListaKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRP_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRP_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 298
        Visible = True
      end>
  end
  object qryListaGrupo: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from grupos')
    Left = 50
    Top = 145
    object qryListaGrupoGRP_CODIGO: TIntegerField
      FieldName = 'GRP_CODIGO'
      Origin = 'GRUPOS.GRP_CODIGO'
      Required = True
    end
    object qryListaGrupoGRP_DESCRICAO: TIBStringField
      FieldName = 'GRP_DESCRICAO'
      Origin = 'GRUPOS.GRP_DESCRICAO'
      Required = True
      Size = 32
    end
  end
  object dsListaGrupo: TDataSource
    DataSet = qryListaGrupo
    Left = 18
    Top = 145
  end
  object IBTransGrupo: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    Params.Strings = (
      'read_committed'
      'rec_version'
      '')
    AutoStopAction = saNone
    Left = 194
    Top = 145
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTransGrupo
    BufferChunks = 1000
    CachedUpdates = False
    Left = 226
    Top = 146
  end
  object qry_verifica: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 122
    Top = 151
  end
end
