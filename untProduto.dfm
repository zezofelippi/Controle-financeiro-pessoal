object frmProduto: TfrmProduto
  Left = 295
  Top = 150
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Produto'
  ClientHeight = 511
  ClientWidth = 927
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 170
    Width = 927
    Height = 341
    Align = alClient
    Color = 15794175
    DataSource = dsProduto
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
        FieldName = 'PRO_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Produto'
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
        FieldName = 'PRO_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o do Produto'
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'UN_DESCRICAO'
        Title.Alignment = taCenter
        Title.Caption = 'UN'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRP_DESCRICAO'
        Title.Caption = 'Grupo'
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
    Left = 0
    Top = 0
    Width = 927
    Height = 80
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 24
      Width = 62
      Height = 13
      Caption = 'Cod. Produto'
    end
    object Label2: TLabel
      Left = 76
      Top = 24
      Width = 88
      Height = 13
      Caption = 'Descri'#231#227'o Produto'
    end
    object Label3: TLabel
      Left = 436
      Top = 24
      Width = 16
      Height = 13
      Caption = 'UN'
    end
    object Label4: TLabel
      Left = 488
      Top = 23
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object txt_cod_produto: TEdit
      Left = 4
      Top = 40
      Width = 65
      Height = 21
      Color = clScrollBar
      ReadOnly = True
      TabOrder = 0
    end
    object txt_descricao: TEdit
      Left = 76
      Top = 40
      Width = 353
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
    object txt_unidade: TDBLookupComboBox
      Left = 435
      Top = 40
      Width = 49
      Height = 21
      KeyField = 'UN_CODIGO'
      ListField = 'UN_DESCRICAO'
      ListSource = dsUnidade
      TabOrder = 2
      OnEnter = txt_unidadeEnter
      OnExit = txt_unidadeExit
      OnKeyPress = txt_unidadeKeyPress
    end
    object btnGravar: TBitBtn
      Left = 750
      Top = 29
      Width = 105
      Height = 35
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object txt_grupo: TDBLookupComboBox
      Left = 488
      Top = 39
      Width = 257
      Height = 21
      KeyField = 'GRP_CODIGO'
      ListField = 'GRP_DESCRICAO'
      ListSource = dsGrupo
      TabOrder = 4
      OnEnter = txt_grupoEnter
      OnExit = txt_grupoExit
      OnKeyPress = txt_grupoKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 80
    Width = 927
    Height = 90
    Align = alTop
    Caption = 'Pesquisar Dados'
    TabOrder = 2
    object Label5: TLabel
      Left = 680
      Top = 24
      Width = 62
      Height = 13
      Caption = 'Cod. Produto'
    end
    object Label6: TLabel
      Left = 273
      Top = 24
      Width = 88
      Height = 13
      Caption = 'Descri'#231#227'o Produto'
    end
    object Label7: TLabel
      Left = 16
      Top = 23
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object txt_cod_produto_pesq: TEdit
      Left = 680
      Top = 39
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = txt_cod_produto_pesqChange
      OnEnter = txt_cod_produto_pesqEnter
      OnExit = txt_cod_produto_pesqExit
      OnKeyPress = txt_cod_produto_pesqKeyPress
    end
    object txt_descricao_pesq: TEdit
      Left = 273
      Top = 39
      Width = 401
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = txt_descricao_pesqChange
      OnEnter = txt_descricao_pesqEnter
      OnExit = txt_descricao_pesqExit
      OnKeyPress = txt_descricao_pesqKeyPress
    end
    object txt_grupo_pesq: TDBLookupComboBox
      Left = 14
      Top = 39
      Width = 251
      Height = 21
      KeyField = 'GRP_CODIGO'
      ListField = 'GRP_DESCRICAO'
      ListSource = dsGrupoPesq
      TabOrder = 2
      OnClick = txt_grupo_pesqClick
      OnEnter = txt_grupo_pesqEnter
      OnExit = txt_grupo_pesqExit
      OnKeyPress = txt_grupo_pesqKeyPress
      OnKeyUp = txt_grupo_pesqKeyUp
    end
    object rdb_inicio: TRadioButton
      Left = 284
      Top = 67
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 3
      OnClick = rdb_inicioClick
    end
    object rdb_posicao: TRadioButton
      Left = 372
      Top = 67
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 4
      OnClick = rdb_posicaoClick
    end
    object btnPesquisar: TButton
      Left = 816
      Top = 32
      Width = 94
      Height = 33
      Caption = 'Pesquisar'
      TabOrder = 5
      OnClick = btnPesquisarClick
    end
  end
  object qryUnidade: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from unidade')
    Left = 536
    object qryUnidadeUN_CODIGO: TIntegerField
      FieldName = 'UN_CODIGO'
      Origin = 'UNIDADE.UN_CODIGO'
      Required = True
    end
    object qryUnidadeUN_DESCRICAO: TIBStringField
      FieldName = 'UN_DESCRICAO'
      Origin = 'UNIDADE.UN_DESCRICAO'
      Required = True
      Size = 32
    end
  end
  object dsUnidade: TDataSource
    DataSet = qryUnidade
    Left = 488
  end
  object dsGrupo: TDataSource
    DataSet = qryGrupo
    Left = 632
    Top = 8
  end
  object qryGrupo: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from grupo order by grp_descricao')
    Left = 672
    Top = 8
    object qryGrupoGRP_CODIGO: TIntegerField
      FieldName = 'GRP_CODIGO'
      Origin = 'GRUPO.GRP_CODIGO'
      Required = True
    end
    object qryGrupoGRP_DESCRICAO: TIBStringField
      FieldName = 'GRP_DESCRICAO'
      Origin = 'GRUPO.GRP_DESCRICAO'
      Required = True
      Size = 32
    end
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 280
    Top = 208
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 232
    Top = 208
  end
  object qryProduto: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT P.pro_codigo, P.pro_descricao, UN.un_descricao, G.grp_des' +
        'cricao, UN.UN_CODIGO, G.GRP_CODIGO'
      'FROM  PRODUTO P, UNIDADE UN, GRUPO G'
      'WHERE P.un_codigo = UN.un_codigo AND'
      '      P.grp_codigo = G.grp_codigo')
    Left = 504
    Top = 224
    object qryProdutoPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'PRODUTO.PRO_CODIGO'
      Required = True
    end
    object qryProdutoPRO_DESCRICAO: TIBStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRODUTO.PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object qryProdutoUN_DESCRICAO: TIBStringField
      FieldName = 'UN_DESCRICAO'
      Origin = 'UNIDADE.UN_DESCRICAO'
      Required = True
      Size = 32
    end
    object qryProdutoGRP_DESCRICAO: TIBStringField
      FieldName = 'GRP_DESCRICAO'
      Origin = 'GRUPO.GRP_DESCRICAO'
      Required = True
      Size = 32
    end
    object qryProdutoUN_CODIGO: TIntegerField
      FieldName = 'UN_CODIGO'
      Origin = 'UNIDADE.UN_CODIGO'
      Required = True
    end
    object qryProdutoGRP_CODIGO: TIntegerField
      FieldName = 'GRP_CODIGO'
      Origin = 'GRUPO.GRP_CODIGO'
      Required = True
    end
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 472
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 240
    object Alterar1: TMenuItem
      Caption = 'Alterar'
      OnClick = Alterar1Click
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
  object qryGrupoPesq: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from grupo order by grp_descricao')
    Left = 184
    Top = 96
    object qryGrupoPesqGRP_CODIGO: TIntegerField
      FieldName = 'GRP_CODIGO'
      Origin = 'GRUPO.GRP_CODIGO'
      Required = True
    end
    object qryGrupoPesqGRP_DESCRICAO: TIBStringField
      FieldName = 'GRP_DESCRICAO'
      Origin = 'GRUPO.GRP_DESCRICAO'
      Required = True
      Size = 32
    end
  end
  object dsGrupoPesq: TDataSource
    DataSet = qryGrupoPesq
    Left = 152
    Top = 96
  end
end
