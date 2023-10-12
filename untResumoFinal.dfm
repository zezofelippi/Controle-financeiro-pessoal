object frmResumofinal: TfrmResumofinal
  Left = 249
  Top = 58
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Resumo Final'
  ClientHeight = 487
  ClientWidth = 841
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
  object Label3: TLabel
    Left = 150
    Top = 77
    Width = 109
    Height = 20
    Caption = 'Data Anterior'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 680
    Top = 74
    Width = 84
    Height = 20
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 836
    Height = 65
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 121
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label15: TLabel
      Left = 320
      Top = 24
      Width = 297
      Height = 13
      Caption = 'OBS: O PROCESSAMENTO DOS DADOS COME'#199'A NO DIA :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 424
      Top = 40
      Width = 69
      Height = 13
      Caption = '01/10/2009'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txt_data_i: TDateEdit
      Left = 6
      Top = 28
      Width = 104
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object txt_data_f: TDateEdit
      Left = 117
      Top = 28
      Width = 101
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnProcessar: TButton
      Left = 232
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Processar'
      TabOrder = 2
      OnClick = btnProcessarClick
    end
    object TXT_DATA_SETEMBRO: TDateEdit
      Left = 549
      Top = 4
      Width = 92
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 489
    Width = 891
    Height = 304
    TabOrder = 1
    object Label4: TLabel
      Left = 131
      Top = 74
      Width = 41
      Height = 20
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 69
      Top = 100
      Width = 23
      Height = 13
      Caption = 'DIN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 69
      Top = 159
      Width = 26
      Height = 13
      Caption = 'DEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 39
      Top = 245
      Width = 58
      Height = 13
      Caption = 'DESPESA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 28
      Top = 277
      Width = 74
      Height = 13
      Caption = 'TOTAL/FAT.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 231
      Top = 74
      Width = 72
      Height = 20
      Caption = 'Despesa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 328
      Top = 74
      Width = 106
      Height = 20
      Caption = 'Trans. Finan.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 666
      Top = 74
      Width = 104
      Height = 20
      Caption = 'Faturamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 805
      Top = 72
      Width = 41
      Height = 20
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 11
      Top = 256
      Width = 840
      Height = 13
      Caption = 
        '________________________________________________________________' +
        '________________________________________________________________' +
        '____________'
    end
    object Label17: TLabel
      Left = 69
      Top = 128
      Width = 26
      Height = 13
      Caption = 'CHE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 441
      Top = 75
      Width = 99
      Height = 20
      Caption = 'Emp. a Rec.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 545
      Top = 75
      Width = 109
      Height = 20
      Caption = 'Emp. a Pagar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 22
      Top = 191
      Width = 76
      Height = 13
      Caption = 'EMP. A REC.'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label21: TLabel
      Left = 10
      Top = 217
      Width = 89
      Height = 13
      Caption = 'EMP. A PAGAR'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object txt_din_total: TCurrencyEdit
      Left = 103
      Top = 95
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object txt_dep_total: TCurrencyEdit
      Left = 103
      Top = 157
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object txt_total_despesa: TCurrencyEdit
      Left = 103
      Top = 242
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object txt_total_ant: TCurrencyEdit
      Left = 103
      Top = 274
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object txt_din_despesa: TCurrencyEdit
      Left = 219
      Top = 95
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object txt_dep_despesa: TCurrencyEdit
      Left = 219
      Top = 157
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object txt_despesa: TCurrencyEdit
      Left = 219
      Top = 242
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object txt_din_trans: TCurrencyEdit
      Left = 332
      Top = 95
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object txt_dep_trans: TCurrencyEdit
      Left = 332
      Top = 157
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object txt_despesa_trans: TCurrencyEdit
      Left = 332
      Top = 242
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object txt_din_fat: TCurrencyEdit
      Left = 670
      Top = 95
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object txt_dep_fat: TCurrencyEdit
      Left = 670
      Top = 157
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object txt_despesa_fat: TCurrencyEdit
      Left = 670
      Top = 242
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object txt_total_fat: TCurrencyEdit
      Left = 669
      Top = 273
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object txt_din_total_final: TCurrencyEdit
      Left = 777
      Top = 93
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object txt_dep_total_final: TCurrencyEdit
      Left = 777
      Top = 155
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object txt_despesa_total_final: TCurrencyEdit
      Left = 777
      Top = 240
      Width = 97
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
    object txt_total_final: TCurrencyEdit
      Left = 777
      Top = 272
      Width = 97
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
    object txt_che_total: TCurrencyEdit
      Left = 103
      Top = 125
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 219
      Top = 125
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 19
    end
    object txt_che_trans: TCurrencyEdit
      Left = 332
      Top = 125
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 20
    end
    object txt_che_fat: TCurrencyEdit
      Left = 670
      Top = 125
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 21
    end
    object txt_che_total_final: TCurrencyEdit
      Left = 777
      Top = 123
      Width = 97
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 22
    end
    object txt_rec_din: TCurrencyEdit
      Left = 441
      Top = 94
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 23
    end
    object txt_rec_che: TCurrencyEdit
      Left = 441
      Top = 124
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 24
    end
    object txt_rec_dep: TCurrencyEdit
      Left = 441
      Top = 156
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 25
    end
    object CurrencyEdit5: TCurrencyEdit
      Left = 441
      Top = 241
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 26
    end
    object txt_pgto_din: TCurrencyEdit
      Left = 549
      Top = 94
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 27
    end
    object txt_pgto_che: TCurrencyEdit
      Left = 549
      Top = 124
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 28
    end
    object txt_pgto_dep: TCurrencyEdit
      Left = 549
      Top = 156
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 29
    end
    object CurrencyEdit9: TCurrencyEdit
      Left = 549
      Top = 241
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 30
    end
    object txt_total_rec_ant: TCurrencyEdit
      Left = 103
      Top = 185
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 31
    end
    object CurrencyEdit11: TCurrencyEdit
      Left = 219
      Top = 185
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 32
    end
    object CurrencyEdit12: TCurrencyEdit
      Left = 332
      Top = 185
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 33
    end
    object txt_emp_rec: TCurrencyEdit
      Left = 441
      Top = 184
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 34
    end
    object TCurrencyEdit
      Left = 549
      Top = 184
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 35
    end
    object CurrencyEdit15: TCurrencyEdit
      Left = 670
      Top = 185
      Width = 97
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 36
    end
    object txt_total_rec: TCurrencyEdit
      Left = 777
      Top = 183
      Width = 97
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 37
    end
    object txt_total_pgto_ant: TCurrencyEdit
      Left = 103
      Top = 212
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 38
    end
    object CurrencyEdit18: TCurrencyEdit
      Left = 219
      Top = 212
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 39
    end
    object CurrencyEdit19: TCurrencyEdit
      Left = 332
      Top = 212
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 40
    end
    object CurrencyEdit20: TCurrencyEdit
      Left = 441
      Top = 211
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 41
    end
    object txt_emp_pgto: TCurrencyEdit
      Left = 549
      Top = 211
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 42
    end
    object CurrencyEdit22: TCurrencyEdit
      Left = 670
      Top = 212
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 43
    end
    object txt_total_pgto: TCurrencyEdit
      Left = 777
      Top = 210
      Width = 97
      Height = 21
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 44
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 120
    Width = 833
    Height = 356
    DataSource = dsGrid
    FixedColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
  end
  object txt_data_ant: TDateEdit
    Left = 148
    Top = 97
    Width = 99
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object txt_Data_final: TDateEdit
    Left = 666
    Top = 98
    Width = 107
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 688
    Top = 376
  end
  object cdsGrid: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 96
  end
  object dsGrid: TDataSource
    DataSet = cdsGrid
    Left = 432
    Top = 96
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 584
    Top = 64
  end
  object qryPesqAux: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 616
    Top = 64
  end
end
