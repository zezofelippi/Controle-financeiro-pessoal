object frmContasPagarParcelas: TfrmContasPagarParcelas
  Left = 203
  Top = 191
  Align = alClient
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'frmContasPagarParcelas'
  ClientHeight = 494
  ClientWidth = 1027
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
    Top = 0
    Width = 1027
    Height = 296
    Align = alClient
    DataSource = dsContasPagarParcela
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
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
        FieldName = 'DESPESA'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 150
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
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESPESA_OUTROS'
        Title.Caption = 'OBS'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_DESPESA'
        Title.Alignment = taCenter
        Title.Caption = 'DATA EMISSAO'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_PGTO'
        Title.Alignment = taCenter
        Title.Caption = 'DATA PGTO'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO_CONTAS_PAGAR'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Contas P.'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end>
  end
  object gpbDados: TGroupBox
    Left = 0
    Top = 341
    Width = 1027
    Height = 153
    Align = alBottom
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 27
      Width = 121
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 144
      Top = 27
      Width = 121
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'QTDE Parcelas'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 283
      Top = 27
      Width = 121
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valor Parcela(s)'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 96
      Width = 48
      Height = 13
      Caption = 'Descricao'
    end
    object Label6: TLabel
      Left = 417
      Top = 97
      Width = 25
      Height = 13
      Caption = 'OBS:'
    end
    object Label21: TLabel
      Left = 573
      Top = 30
      Width = 50
      Height = 20
      AutoSize = False
      Color = clInactiveCaption
      ParentColor = False
    end
    object Label22: TLabel
      Left = 629
      Top = 34
      Width = 200
      Height = 13
      Caption = 'Despesa com itens da cota'#231#227'o de compra'
    end
    object txt_total: TCurrencyEdit
      Left = 9
      Top = 48
      Width = 121
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object txt_num_parcela: TRxCalcEdit
      Left = 145
      Top = 48
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnEnter = txt_num_parcelaEnter
      OnExit = txt_num_parcelaExit
      OnKeyPress = txt_num_parcelaKeyPress
    end
    object txt_valor_parcela: TCurrencyEdit
      Left = 284
      Top = 48
      Width = 121
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = txt_valor_parcelaEnter
      OnExit = txt_valor_parcelaExit
      OnKeyPress = txt_valor_parcelaKeyPress
    end
    object btnConfirmar: TButton
      Left = 784
      Top = 102
      Width = 112
      Height = 32
      Caption = 'Confirmar Parcela'
      TabOrder = 3
      OnClick = btnConfirmarClick
    end
    object txt_descricao: TEdit
      Left = 9
      Top = 113
      Width = 397
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 150
      TabOrder = 4
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
    object txt_obs: TEdit
      Left = 410
      Top = 113
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      OnEnter = txt_obsEnter
      OnExit = txt_obsExit
      OnKeyPress = txt_obsKeyPress
    end
    object txt_codigo: TEdit
      Left = 144
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 6
      Visible = False
    end
    object btnCancelar: TButton
      Left = 903
      Top = 101
      Width = 105
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 7
      OnClick = btnCancelarClick
    end
  end
  object gpbSair: TGroupBox
    Left = 0
    Top = 296
    Width = 1027
    Height = 45
    Align = alBottom
    TabOrder = 2
    object btnSair: TButton
      Left = 856
      Top = 9
      Width = 102
      Height = 34
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnAtualizarGrid: TButton
      Left = 64
      Top = -31
      Width = 113
      Height = 25
      Caption = 'btnAtualizarGrid'
      TabOrder = 1
      OnClick = btnAtualizarGridClick
    end
  end
  object qryContasPagarParcela: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_ou' +
        'tros, C.parcela, C.data_despesa, C.CODIGO_CONTAS_PAGAR,'
      
        'T.tip_codigo ||'#39' - '#39'|| T.tip_descricao AS DESPESA, C.COT_CODIGO,' +
        ' C.AT_CODIGO,'
      'TDS.TDS_codigo ||'#39' - '#39'|| TDS.TDS_descricao AS DESPESA_SUB,'
      'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO'
      
        'FROM CONTAS_PAGAR_parcelas C, TIPO_DESPESA T, TIPO_DESPESA_SUB T' +
        'DS ORDER BY C.DATA_PGTO')
    Left = 472
    Top = 96
    object qryContasPagarParcelaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS_PAGAR_PARCELAS.CODIGO'
      Required = True
    end
    object qryContasPagarParcelaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'CONTAS_PAGAR_PARCELAS.DESCRICAO'
      Size = 150
    end
    object qryContasPagarParcelaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CONTAS_PAGAR_PARCELAS.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryContasPagarParcelaDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
      Origin = 'CONTAS_PAGAR_PARCELAS.DATA_PGTO'
    end
    object qryContasPagarParcelaDESPESA_OUTROS: TIBStringField
      FieldName = 'DESPESA_OUTROS'
      Origin = 'CONTAS_PAGAR_PARCELAS.DESPESA_OUTROS'
      Size = 150
    end
    object qryContasPagarParcelaPARCELA: TIBStringField
      FieldName = 'PARCELA'
      Origin = 'CONTAS_PAGAR_PARCELAS.PARCELA'
      Size = 4
    end
    object qryContasPagarParcelaDATA_DESPESA: TDateTimeField
      FieldName = 'DATA_DESPESA'
      Origin = 'CONTAS_PAGAR_PARCELAS.DATA_DESPESA'
    end
    object qryContasPagarParcelaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qryContasPagarParcelaDESPESA_SUB: TIBStringField
      FieldName = 'DESPESA_SUB'
      Size = 78
    end
    object qryContasPagarParcelaTIP_CODIGO: TIntegerField
      FieldName = 'TIP_CODIGO'
      Origin = 'TIPO_DESPESA.TIP_CODIGO'
      Required = True
    end
    object qryContasPagarParcelaTIP_DESCRICAO: TIBStringField
      FieldName = 'TIP_DESCRICAO'
      Origin = 'TIPO_DESPESA.TIP_DESCRICAO'
      Size = 64
    end
    object qryContasPagarParcelaTDS_CODIGO: TIntegerField
      FieldName = 'TDS_CODIGO'
      Origin = 'TIPO_DESPESA_SUB.TDS_CODIGO'
      Required = True
    end
    object qryContasPagarParcelaCODIGO_CONTAS_PAGAR: TIntegerField
      FieldName = 'CODIGO_CONTAS_PAGAR'
      Origin = 'CONTAS_PAGAR_PARCELAS.CODIGO_CONTAS_PAGAR'
    end
    object qryContasPagarParcelaCOT_CODIGO: TIntegerField
      FieldName = 'COT_CODIGO'
      Origin = 'CONTAS_PAGAR_PARCELAS.COT_CODIGO'
    end
    object qryContasPagarParcelaAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'CONTAS_PAGAR_PARCELAS.AT_CODIGO'
    end
  end
  object dsContasPagarParcela: TDataSource
    DataSet = qryContasPagarParcela
    Left = 432
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 232
    object Apagar1: TMenuItem
      Caption = 'Excluir'
      OnClick = Apagar1Click
    end
    object DarbaixadiretonoCadDespesas1: TMenuItem
      Caption = 'Dar baixa direto no  Cad. Despesas'
      OnClick = DarbaixadiretonoCadDespesas1Click
    end
    object DarBaixaParcialnaparcela1: TMenuItem
      Caption = 'Dar Baixa Parcial na Parcela'
      OnClick = DarBaixaParcialnaparcela1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Despesacomitensdacotaodecompra1: TMenuItem
      Caption = 'Despesa com itens da cota'#231#227'o de compra'
      OnClick = Despesacomitensdacotaodecompra1Click
    end
  end
end
