object frmGerarPedidoCompra_cotacao: TfrmGerarPedidoCompra_cotacao
  Left = 509
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Pedido de Compra'
  ClientHeight = 179
  ClientWidth = 537
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
  object Label9: TLabel
    Left = 13
    Top = 12
    Width = 76
    Height = 13
    Caption = 'C'#243'd Fornecedor'
  end
  object Label4: TLabel
    Left = 103
    Top = 12
    Width = 57
    Height = 13
    Caption = 'Fornecedor '
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 58
    Width = 519
    Height = 77
    Caption = 'Frete'
    TabOrder = 0
    object Label1: TLabel
      Left = 86
      Top = 28
      Width = 74
      Height = 13
      Caption = 'Valor Frete (R$)'
    end
    object Label2: TLabel
      Left = 188
      Top = 27
      Width = 63
      Height = 13
      Caption = 'Data Entrega'
    end
    object txt_valor: TCurrencyEdit
      Left = 57
      Top = 43
      Width = 103
      Height = 21
      AutoSize = False
      TabOrder = 0
      OnEnter = txt_valorEnter
      OnExit = txt_valorExit
      OnKeyPress = txt_valorKeyPress
    end
    object txt_data_previsao: TDateEdit
      Left = 169
      Top = 43
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = txt_data_previsaoEnter
      OnExit = txt_data_previsaoExit
      OnKeyPress = txt_data_previsaoKeyPress
    end
  end
  object btnOk: TBitBtn
    Left = 241
    Top = 144
    Width = 75
    Height = 31
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object txt_cod_fornec: TEdit
    Left = 10
    Top = 26
    Width = 86
    Height = 21
    Color = 14803425
    ReadOnly = True
    TabOrder = 2
  end
  object txt_fornecedor: TEdit
    Left = 101
    Top = 27
    Width = 428
    Height = 21
    Color = 14803425
    ReadOnly = True
    TabOrder = 3
  end
  object txt_cod_cotacao: TEdit
    Left = 360
    Top = 0
    Width = 83
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object qryTotal: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 352
    Top = 144
  end
end
