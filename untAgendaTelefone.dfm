object frmAgendaTelefone: TfrmAgendaTelefone
  Left = 253
  Top = 127
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Agenda (Telefone)'
  ClientHeight = 472
  ClientWidth = 906
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 232
    Width = 906
    Height = 240
    Align = alClient
    DataSource = dsAgenda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AT_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_NOME'
        Title.Caption = 'Nome'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 330
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_ENDERECO'
        Title.Caption = 'Endereco'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 310
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_BAIRRO'
        Title.Caption = 'Bairro'
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
        FieldName = 'AT_CIDADE'
        Title.Caption = 'Cidade'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_UF'
        Title.Caption = 'UF'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_TELEFONE'
        Title.Caption = 'Telefone'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_CELULAR'
        Title.Caption = 'Celular'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_EMAIL'
        Title.Caption = 'Email'
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
  object gpbDados: TGroupBox
    Left = 0
    Top = 0
    Width = 906
    Height = 111
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label2: TLabel
      Left = 68
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label10: TLabel
      Left = 608
      Top = 50
      Width = 27
      Height = 13
      Caption = 'Fone '
    end
    object Label12: TLabel
      Left = 691
      Top = 50
      Width = 32
      Height = 13
      Caption = 'Celular'
    end
    object Label3: TLabel
      Left = 519
      Top = 10
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 8
      Top = 52
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label8: TLabel
      Left = 340
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label9: TLabel
      Left = 576
      Top = 49
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object Label15: TLabel
      Left = 796
      Top = 48
      Width = 25
      Height = 13
      Caption = 'Email'
    end
    object txt_codigo: TEdit
      Left = 4
      Top = 24
      Width = 60
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 0
    end
    object txt_descricao: TEdit
      Left = 68
      Top = 24
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 200
      TabOrder = 1
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
    object txt_telefone: TMaskEdit
      Left = 605
      Top = 64
      Width = 81
      Height = 21
      EditMask = '!\(99\)0000-0000;1;_'
      MaxLength = 13
      TabOrder = 2
      Text = '(  )    -    '
      OnEnter = txt_telefoneEnter
      OnExit = txt_telefoneExit
      OnKeyPress = txt_telefoneKeyPress
    end
    object txt_celular: TMaskEdit
      Left = 689
      Top = 64
      Width = 96
      Height = 21
      EditMask = '!\(99\)00000-0000;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '(  )     -    '
      OnEnter = txt_celularEnter
      OnExit = txt_celularExit
      OnKeyPress = txt_celularKeyPress
    end
    object txt_endereco: TEdit
      Left = 520
      Top = 24
      Width = 406
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 200
      TabOrder = 4
      OnEnter = txt_enderecoEnter
      OnExit = txt_enderecoExit
      OnKeyPress = txt_enderecoKeyPress
    end
    object rdg_opcao: TRadioGroup
      Left = 1180
      Top = 8
      Width = 86
      Height = 92
      Items.Strings = (
        'Cliente'
        'Fornecedor'
        'Os Dois'
        'Nenhum')
      TabOrder = 5
    end
    object txt_bairro: TEdit
      Left = 5
      Top = 66
      Width = 324
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
      OnEnter = txt_bairroEnter
      OnExit = txt_bairroExit
      OnKeyPress = txt_bairroKeyPress
    end
    object txt_cidade: TEdit
      Left = 336
      Top = 65
      Width = 227
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
      OnEnter = txt_cidadeEnter
      OnExit = txt_cidadeExit
      OnKeyPress = txt_cidadeKeyPress
    end
    object txt_uf: TEdit
      Left = 571
      Top = 64
      Width = 23
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
      OnEnter = txt_ufEnter
      OnExit = txt_ufExit
      OnKeyPress = txt_ufKeyPress
    end
    object txt_email: TEdit
      Left = 796
      Top = 62
      Width = 373
      Height = 21
      TabOrder = 9
      OnEnter = txt_emailEnter
      OnExit = txt_emailExit
      OnKeyPress = txt_emailKeyPress
    end
  end
  object gpb_pesquisa: TGroupBox
    Left = 0
    Top = 111
    Width = 906
    Height = 121
    Align = alTop
    TabOrder = 2
    object Label6: TLabel
      Left = 398
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label23: TLabel
      Left = 692
      Top = 68
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label11: TLabel
      Left = 692
      Top = 88
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label13: TLabel
      Left = 796
      Top = 68
      Width = 37
      Height = 13
      Caption = 'Os Dois'
    end
    object Label14: TLabel
      Left = 796
      Top = 88
      Width = 40
      Height = 13
      Caption = 'Nenhum'
    end
    object txt_codigo_pesq: TEdit
      Left = 398
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = txt_codigo_pesqChange
      OnEnter = txt_codigo_pesqEnter
      OnExit = txt_codigo_pesqExit
      OnKeyPress = txt_codigo_pesqKeyPress
    end
    object txt_nome_pesq: TEdit
      Left = 8
      Top = 32
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = txt_nome_pesqChange
      OnEnter = txt_nome_pesqEnter
      OnExit = txt_nome_pesqExit
      OnKeyPress = txt_nome_pesqKeyPress
    end
    object rdg_opcao_pesq: TRadioGroup
      Left = 521
      Top = 8
      Width = 129
      Height = 111
      Items.Strings = (
        'Cliente'
        'Fornecedor'
        'Os Dois'
        'Nenhum'
        'Todos')
      TabOrder = 2
      OnClick = rdg_opcao_pesqClick
    end
    object btnPesquisa: TBitBtn
      Left = 652
      Top = 16
      Width = 97
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 3
      OnClick = btnPesquisaClick
    end
    object rdb_inicio: TRadioButton
      Left = 12
      Top = 59
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 4
      OnClick = rdb_inicioClick
    end
    object rdb_posicao: TRadioButton
      Left = 76
      Top = 59
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 5
      OnClick = rdb_posicaoClick
    end
    object Edit2: TEdit
      Left = 656
      Top = 66
      Width = 33
      Height = 15
      AutoSize = False
      Color = clLime
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
    object Edit1: TEdit
      Left = 656
      Top = 86
      Width = 33
      Height = 15
      AutoSize = False
      Color = 8421631
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
    object Edit3: TEdit
      Left = 760
      Top = 66
      Width = 33
      Height = 15
      AutoSize = False
      Color = clYellow
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
    end
    object Edit4: TEdit
      Left = 760
      Top = 86
      Width = 33
      Height = 15
      AutoSize = False
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
    end
    object GroupBox1: TGroupBox
      Left = 1022
      Top = 10
      Width = 249
      Height = 105
      TabOrder = 10
      object Label4: TLabel
        Left = 34
        Top = 10
        Width = 206
        Height = 13
        Caption = 'Clique bot'#227'o direito p/ alterar dados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnInserir: TButton
        Left = 7
        Top = 31
        Width = 113
        Height = 33
        Caption = 'Inserir'
        TabOrder = 0
        OnClick = btnInserirClick
      end
      object btnGravar: TButton
        Left = 7
        Top = 66
        Width = 113
        Height = 33
        Caption = 'Gravar'
        TabOrder = 1
        OnClick = btnGravarClick
      end
      object btnExcluir: TButton
        Left = 127
        Top = 67
        Width = 113
        Height = 32
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = btnExcluirClick
      end
      object btnAlterar: TButton
        Left = 127
        Top = 32
        Width = 113
        Height = 32
        Caption = 'Alterar'
        TabOrder = 3
        OnClick = btnAlterarClick
      end
    end
  end
  object dsAgenda: TDataSource
    DataSet = qryAgenda
    Left = 272
    Top = 264
  end
  object qryAgenda: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Agenda_Telefone')
    Left = 312
    Top = 264
    object qryAgendaAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'AGENDA_TELEFONE.AT_CODIGO'
      Required = True
    end
    object qryAgendaAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
    object qryAgendaAT_ENDERECO: TIBStringField
      FieldName = 'AT_ENDERECO'
      Origin = 'AGENDA_TELEFONE.AT_ENDERECO'
      Size = 200
    end
    object qryAgendaAT_TELEFONE: TIBStringField
      FieldName = 'AT_TELEFONE'
      Origin = 'AGENDA_TELEFONE.AT_TELEFONE'
      Size = 16
    end
    object qryAgendaAT_CELULAR: TIBStringField
      FieldName = 'AT_CELULAR'
      Origin = 'AGENDA_TELEFONE.AT_CELULAR'
      Size = 16
    end
    object qryAgendaAT_TIPO: TIBStringField
      FieldName = 'AT_TIPO'
      Origin = 'AGENDA_TELEFONE.AT_TIPO'
      FixedChar = True
      Size = 1
    end
    object qryAgendaAT_BAIRRO: TIBStringField
      FieldName = 'AT_BAIRRO'
      Origin = 'AGENDA_TELEFONE.AT_BAIRRO'
      Size = 64
    end
    object qryAgendaAT_CIDADE: TIBStringField
      FieldName = 'AT_CIDADE'
      Origin = 'AGENDA_TELEFONE.AT_CIDADE'
      Size = 64
    end
    object qryAgendaAT_UF: TIBStringField
      FieldName = 'AT_UF'
      Origin = 'AGENDA_TELEFONE.AT_UF'
      FixedChar = True
      Size = 2
    end
    object qryAgendaAT_EMAIL: TIBStringField
      FieldName = 'AT_EMAIL'
      Origin = 'AGENDA_TELEFONE.AT_EMAIL'
      Size = 60
    end
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 312
    Top = 304
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 360
    Top = 296
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
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 280
    object AlterarDados1: TMenuItem
      Caption = 'Alterar Dados'
      OnClick = AlterarDados1Click
    end
  end
end
