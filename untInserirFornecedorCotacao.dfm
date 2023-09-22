object frmInserirFornecedorCotacao: TfrmInserirFornecedorCotacao
  Left = 279
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Inserir fornecedor'
  ClientHeight = 467
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 863
    Height = 336
    Align = alTop
    TabOrder = 0
    object Label9: TLabel
      Left = 13
      Top = 251
      Width = 76
      Height = 13
      Caption = 'C'#243'd Fornecedor'
    end
    object Label4: TLabel
      Left = 126
      Top = 253
      Width = 57
      Height = 13
      Caption = 'Fornecedor '
    end
    object Label2: TLabel
      Left = 13
      Top = 156
      Width = 57
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 105
      Top = 155
      Width = 64
      Height = 20
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 701
      Top = 158
      Width = 68
      Height = 20
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 12
      Width = 124
      Height = 16
      Caption = 'Ultimo fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 425
      Top = 12
      Width = 94
      Height = 16
      Caption = 'Ult. Valor(R$)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 479
      Top = 248
      Width = 47
      Height = 13
      Caption = 'Valor (R$)'
    end
    object Label6: TLabel
      Left = 14
      Top = 294
      Width = 19
      Height = 13
      Caption = 'Obs'
    end
    object Label8: TLabel
      Left = 8
      Top = 94
      Width = 192
      Height = 20
      Caption = 'Fornecedor mais barato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 513
      Top = 92
      Width = 83
      Height = 20
      Caption = 'Valor (R$)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 646
      Top = 91
      Width = 45
      Height = 20
      Caption = 'Data '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 535
      Top = 13
      Width = 38
      Height = 16
      Caption = 'Data '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 664
      Top = 11
      Width = 29
      Height = 16
      Caption = 'Obs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txt_cod_fornec: TEdit
      Left = 10
      Top = 267
      Width = 86
      Height = 21
      Color = clInfoBk
      TabOrder = 0
      OnEnter = txt_cod_fornecEnter
      OnExit = txt_cod_fornecExit
      OnKeyDown = txt_cod_fornecKeyDown
      OnKeyPress = txt_cod_fornecKeyPress
    end
    object btn_pesq_fornec: TBitBtn
      Left = 99
      Top = 266
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = btn_pesq_fornecClick
      NumGlyphs = 2
    end
    object txt_fornecedor: TEdit
      Left = 124
      Top = 267
      Width = 319
      Height = 21
      Color = 14803425
      ReadOnly = True
      TabOrder = 2
    end
    object btnGravar: TBitBtn
      Left = 450
      Top = 300
      Width = 85
      Height = 31
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object txt_cod_barra: TEdit
      Left = 10
      Top = 178
      Width = 86
      Height = 32
      CharCase = ecUpperCase
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object txt_cod_produto: TEdit
      Left = 22
      Top = 181
      Width = 49
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object txt_produto: TEdit
      Left = 99
      Top = 178
      Width = 588
      Height = 32
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object txt_unidade: TEdit
      Left = 700
      Top = 178
      Width = 39
      Height = 32
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object txt_ultimo_fornecedor: TEdit
      Left = 11
      Top = 29
      Width = 407
      Height = 28
      CharCase = ecUpperCase
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object txt_valor: TCurrencyEdit
      Left = 447
      Top = 266
      Width = 80
      Height = 21
      AutoSize = False
      TabOrder = 9
      OnEnter = txt_valorEnter
      OnExit = txt_valorExit
      OnKeyPress = txt_valorKeyPress
    end
    object txt_flag: TEdit
      Left = 803
      Top = 18
      Width = 27
      Height = 21
      TabOrder = 10
      Visible = False
    end
    object txt_ult_valor: TCurrencyEdit
      Left = 423
      Top = 28
      Width = 102
      Height = 28
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object txt_obs: TEdit
      Left = 11
      Top = 308
      Width = 430
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 12
      OnEnter = txt_obsEnter
      OnExit = txt_obsExit
      OnKeyPress = txt_obsKeyPress
    end
    object txtFornecedorBarato: TEdit
      Left = 9
      Top = 115
      Width = 492
      Height = 32
      CharCase = ecUpperCase
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object txtValorBarato: TCurrencyEdit
      Left = 510
      Top = 114
      Width = 121
      Height = 32
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object txtDataBarato: TDateEdit
      Left = 644
      Top = 113
      Width = 148
      Height = 34
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object txtDataUltCompra: TDateEdit
      Left = 531
      Top = 28
      Width = 126
      Height = 27
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
    object txtObsUlt: TEdit
      Left = 663
      Top = 28
      Width = 192
      Height = 28
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 336
    Width = 863
    Height = 131
    Align = alClient
    DataSource = dsFornecedor
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AT_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Fornec.'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AT_NOME'
        Title.Caption = 'Nome do Fornecedor'
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
        FieldName = 'COT_VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor (R$)'
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
        FieldName = 'COT_OBS'
        Title.Caption = 'Obs'
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
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 800
    Top = 290
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 596
    Top = 284
  end
  object qryTransLocal: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 636
    Top = 284
  end
  object dsFornecedor: TDataSource
    DataSet = qryFornecedor
    Left = 96
    Top = 216
  end
  object qryFornecedor: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT F.AT_CODIGO, F.AT_NOME, I.COT_VALOR, I.COT_OBS'
      ' FROM AGENDA_TELEFONE f, itens_cotacao_compra I'
      ' ')
    Left = 136
    Top = 216
    object qryFornecedorCOT_VALOR: TIBBCDField
      FieldName = 'COT_VALOR'
      Origin = 'ITENS_COTACAO_COMPRA.COT_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryFornecedorAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'AGENDA_TELEFONE.AT_CODIGO'
      Required = True
    end
    object qryFornecedorAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
    object qryFornecedorCOT_OBS: TIBStringField
      FieldName = 'COT_OBS'
      Origin = 'ITENS_COTACAO_COMPRA.COT_OBS'
      Size = 100
    end
  end
  object qryPesqAux: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 800
    Top = 250
  end
  object PopupMenu1: TPopupMenu
    Left = 745
    Top = 343
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
end
