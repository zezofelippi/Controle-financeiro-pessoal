object frmCadFormaPgto: TfrmCadFormaPgto
  Left = 521
  Top = 165
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Forma Pagamento'
  ClientHeight = 344
  ClientWidth = 471
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
    Top = 1
    Width = 344
    Height = 127
    Caption = 'Dados Gerais'
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label2: TLabel
      Left = 7
      Top = 60
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 16
      Top = 104
      Width = 39
      Height = 17
      AutoSize = False
      Color = clAqua
      ParentColor = False
    end
    object Label4: TLabel
      Left = 60
      Top = 106
      Width = 174
      Height = 13
      Caption = 'Forma Pgto default no cad. despesa '
    end
    object txt_codigo: TEdit
      Left = 6
      Top = 36
      Width = 83
      Height = 21
      Color = 14803425
      TabOrder = 0
      OnEnter = txt_codigoEnter
      OnExit = txt_codigoExit
    end
    object txt_descricao: TEdit
      Left = 6
      Top = 76
      Width = 291
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 18
      TabOrder = 1
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
    object che_default: TCheckBox
      Left = 104
      Top = 32
      Width = 153
      Height = 17
      Caption = 'Default no Cad. Despesa'
      TabOrder = 2
    end
  end
  object gpb_botoes: TGroupBox
    Left = 350
    Top = 0
    Width = 120
    Height = 221
    TabOrder = 1
    object btn_inserir: TBitBtn
      Left = 4
      Top = 7
      Width = 113
      Height = 35
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn_inserirClick
    end
    object btn_gravar: TBitBtn
      Left = 4
      Top = 41
      Width = 113
      Height = 35
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_gravarClick
    end
    object btn_cancelar: TBitBtn
      Left = 4
      Top = 75
      Width = 113
      Height = 35
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btn_cancelarClick
    end
    object btn_alterar: TBitBtn
      Left = 4
      Top = 109
      Width = 113
      Height = 35
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btn_alterarClick
    end
    object btn_excluir: TBitBtn
      Left = 4
      Top = 143
      Width = 113
      Height = 35
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_excluirClick
    end
    object btn_sair: TBitBtn
      Left = 4
      Top = 179
      Width = 113
      Height = 35
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btn_sairClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 132
    Width = 338
    Height = 209
    Color = 15794175
    DataSource = dsUnidade
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
        FieldName = 'TP_CODIGO'
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
        FieldName = 'TP_DESCRICAO'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o Forma Pgto'
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
  object IBTransUnidade: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    Params.Strings = (
      'read_committed'
      'rec_version'
      '')
    AutoStopAction = saNone
    Left = 48
    Top = 216
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTransUnidade
    BufferChunks = 1000
    CachedUpdates = False
    Left = 80
    Top = 216
  end
  object qry_verifica: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 232
    Top = 248
  end
  object dsUnidade: TDataSource
    DataSet = qryTipoPgto
    Left = 32
    Top = 136
  end
  object qryTipoPgto: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TIPO_PAGAMENTO')
    Left = 72
    Top = 136
    object qryTipoPgtoTP_CODIGO: TIntegerField
      FieldName = 'TP_CODIGO'
      Origin = 'TIPO_PAGAMENTO.TP_CODIGO'
      Required = True
    end
    object qryTipoPgtoTP_DESCRICAO: TIBStringField
      FieldName = 'TP_DESCRICAO'
      Origin = 'TIPO_PAGAMENTO.TP_DESCRICAO'
      Size = 64
    end
    object qryTipoPgtoTP_DEFAULT: TIBStringField
      FieldName = 'TP_DEFAULT'
      Origin = 'TIPO_PAGAMENTO.TP_DEFAULT'
      FixedChar = True
      Size = 1
    end
  end
end
