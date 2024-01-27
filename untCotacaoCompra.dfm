object frm_cotacao_compra: Tfrm_cotacao_compra
  Left = 172
  Top = 110
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cota'#231#227'o de Compra'
  ClientHeight = 644
  ClientWidth = 1346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1231
    Height = 644
    ActivePage = TabSheet3
    Align = alLeft
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Produto'
      object gpb_dados: TGroupBox
        Left = 0
        Top = 0
        Width = 392
        Height = 120
        Align = alLeft
        TabOrder = 0
        object Label6: TLabel
          Left = 13
          Top = 15
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object lbl_cod_cotacao: TLabel
          Left = 10
          Top = 29
          Width = 109
          Height = 24
          Alignment = taCenter
          AutoSize = False
          Color = 14803425
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Label35: TLabel
          Left = 128
          Top = 18
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label1: TLabel
          Left = 248
          Top = 18
          Width = 56
          Height = 13
          Caption = 'Vencimento'
        end
        object Label3: TLabel
          Left = 13
          Top = 57
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
        end
        object dta_cotacao: TDateEdit
          Left = 126
          Top = 33
          Width = 116
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnEnter = dta_cotacaoEnter
          OnExit = dta_cotacaoExit
          OnKeyPress = dta_cotacaoKeyPress
        end
        object dta_vencimento: TDateEdit
          Left = 246
          Top = 33
          Width = 116
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnEnter = dta_vencimentoEnter
          OnExit = dta_vencimentoExit
          OnKeyPress = dta_vencimentoKeyPress
        end
        object txt_obs: TMemo
          Left = 10
          Top = 73
          Width = 351
          Height = 87
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 2000
          ParentFont = False
          TabOrder = 2
          OnEnter = txt_obsEnter
          OnExit = txt_obsExit
        end
      end
      object gpbProduto: TGroupBox
        Left = 0
        Top = 120
        Width = 1223
        Height = 62
        Align = alBottom
        Caption = 'Produto'
        TabOrder = 1
        object Label2: TLabel
          Left = 13
          Top = 19
          Width = 78
          Height = 13
          Caption = 'C'#243'd. Barra / Ref'
        end
        object Label11: TLabel
          Left = 134
          Top = 19
          Width = 37
          Height = 13
          Caption = 'Produto'
        end
        object Label7: TLabel
          Left = 487
          Top = 18
          Width = 40
          Height = 13
          Caption = 'Unidade'
        end
        object Label8: TLabel
          Left = 556
          Top = 15
          Width = 55
          Height = 13
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_valor: TLabel
          Left = 670
          Top = 14
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object txt_cod_barra: TEdit
          Left = 10
          Top = 33
          Width = 86
          Height = 28
          CharCase = ecUpperCase
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnEnter = txt_cod_barraEnter
          OnExit = txt_cod_barraExit
          OnKeyDown = txt_cod_barraKeyDown
          OnKeyPress = txt_cod_barraKeyPress
        end
        object btn_pesq_prod: TBitBtn
          Left = 103
          Top = 33
          Width = 21
          Height = 21
          Caption = '...'
          TabOrder = 1
          OnClick = btn_pesq_prodClick
          NumGlyphs = 2
        end
        object txt_produto: TEdit
          Left = 130
          Top = 33
          Width = 351
          Height = 28
          Color = 14803425
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object txt_cod_produto: TEdit
          Left = 22
          Top = 36
          Width = 49
          Height = 21
          TabOrder = 3
          Visible = False
        end
        object cbo_unidade: TDBLookupComboBox
          Left = 487
          Top = 33
          Width = 64
          Height = 28
          DropDownRows = 15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'UN_CODIGO'
          ListField = 'UN_DESCRICAO'
          ListSource = dsUnidade
          ParentFont = False
          TabOrder = 4
          OnEnter = cbo_unidadeEnter
          OnExit = cbo_unidadeExit
          OnKeyPress = cbo_unidadeKeyPress
        end
        object edtQuantidade: TRxCalcEdit
          Left = 556
          Top = 33
          Width = 93
          Height = 24
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '###,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 5
          OnEnter = edtQuantidadeEnter
          OnExit = edtQuantidadeExit
          OnKeyPress = edtQuantidadeKeyPress
        end
        object btnInserir: TBitBtn
          Left = 378
          Top = 3
          Width = 48
          Height = 31
          Caption = 'Gravar'
          TabOrder = 6
          Visible = False
          OnClick = btnInserirClick
        end
        object txt_flag: TEdit
          Left = 322
          Top = 7
          Width = 44
          Height = 21
          TabOrder = 7
          Visible = False
        end
        object cheInserirPreco: TCheckBox
          Left = 770
          Top = 8
          Width = 222
          Height = 17
          Caption = 'Inserir pre'#231'o mais barato automaticamente'
          TabOrder = 8
          OnClick = cheInserirPrecoClick
        end
        object cboFornecedor: TDBLookupComboBox
          Left = 770
          Top = 33
          Width = 264
          Height = 21
          KeyField = 'AT_CODIGO'
          ListField = 'AT_NOME'
          ListSource = dtsFornecedorCombo
          TabOrder = 9
          OnCloseUp = cboFornecedorCloseUp
          OnKeyDown = cboFornecedorKeyDown
          OnKeyPress = cboFornecedorKeyPress
        end
        object txt_Valor: TCurrencyEdit
          Left = 667
          Top = 32
          Width = 91
          Height = 23
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnEnter = txt_ValorEnter
          OnExit = txt_ValorExit
          OnKeyPress = txt_ValorKeyPress
        end
        object btnPesquisarFornecedor: TButton
          Left = 1036
          Top = 29
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 11
          OnClick = btnPesquisarFornecedorClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 182
        Width = 1223
        Height = 395
        Align = alBottom
        Color = 15794175
        DataSource = dsProduto
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = PopupMenu1
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        OnKeyDown = DBGrid1KeyDown
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'FOR_INSERIDO'
            Title.Caption = 'chequed'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 15
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITE_ORDEM_INSERCAO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'PRO_CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'Cod. Prod.'
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
            Expanded = False
            FieldName = 'COT_QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
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
            FieldName = 'COT_UNIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'UN'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COT_VALOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Valor Unit. (R$)'
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
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Valor Total R$'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AT_NOME'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Fornecedor Escolhido'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 350
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'COT_OBS'
            Title.Alignment = taCenter
            Title.Caption = 'OBS'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 60
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 577
        Width = 1223
        Height = 39
        Align = alBottom
        TabOrder = 3
        object Label4: TLabel
          Left = 5
          Top = 13
          Width = 200
          Height = 16
          Caption = 'F3 - Inserir Fornecedor/Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 399
          Top = 12
          Width = 46
          Height = 18
          AutoSize = False
          Color = 11581403
          ParentColor = False
        end
        object Label12: TLabel
          Left = 451
          Top = 15
          Width = 119
          Height = 13
          Caption = 'Empate de Fornecedores'
        end
        object imgPagar: TImage
          Left = 212
          Top = 13
          Width = 14
          Height = 13
          Picture.Data = {
            07544269746D61709E020000424D9E0200000000000036000000280000000E00
            00000E000000010018000000000068020000EB0A0000EB0A0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAECDE
            9DCDA9F7FAF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
            FFFFFFFFFFFFE2EFE542A25B02882278B787FAFBFBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0000FFFFFFFFFFFFFFFFFFDFECE2418F501292322CB554067D2179AD
            80FDFEFEFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFE2ECE34080470C79
            221FBB5018CF5324B24C0767137BA781FDFEFEFFFFFFFFFFFFFFFFFF0000FFFF
            FFDEE7DE3F733F0E691B20AE4C0EBB4613C44D17CF5223A64606510A7D9F7EFC
            FEFCFFFFFFFFFFFF0000EDF3ED4C754A0C551220A04509AA3C1EBD5C45D4841C
            C35512C24A21913C064006829F80FCFDFCFFFFFF0000D9E2D7286A2D15812E05
            952F0FA94B55CB8C94E2B948CE8310B44912B342228539063E0687A286FBFCFB
            0000EBF1EC51A06500781D038C3041B974D1EEDEFFFFFF9FE3C034BF710DA53F
            13A43F19742C11490FC6D5C50000FFFFFFCCE2D132944E309A54CCE7D6FFFFFF
            FFFFFFFDFEFE9EDEBC36B26A18953E1189321A732CBBCFBB0000FFFFFFFFFFFF
            D0E5D5CAE1D0FFFFFFFFFFFFFFFFFFFFFFFFFDFDFD9DD5B440A26116843459A9
            70EBF3EB0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFAFCFA9CC9A97CB68BDFEDE3FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FAF8F4F8F5FFFFFFFFFFFF0000FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000}
        end
        object imgNulo: TImage
          Left = 211
          Top = 29
          Width = 17
          Height = 19
        end
        object Label13: TLabel
          Left = 232
          Top = 15
          Width = 155
          Height = 13
          Caption = 'Produto com fornecedor lan'#231'ado'
        end
      end
      object PageControl2: TPageControl
        Left = 392
        Top = 0
        Width = 831
        Height = 120
        ActivePage = TabSheet4
        Align = alClient
        TabOrder = 4
        object TabSheet4: TTabSheet
          Caption = 'Fornecedores Lan'#231'ados'
          ImageIndex = 1
          object DBGrid2: TDBGrid
            Left = 0
            Top = 0
            Width = 823
            Height = 92
            Align = alClient
            Color = 15794175
            DataSource = dsFornecedor
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGrid2CellClick
            OnDrawColumnCell = DBGrid2DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'CHEQUED'
                Title.Color = clNavy
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clNavy
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 20
                Visible = True
              end
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
                Width = 100
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
                Width = 270
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
                Width = 90
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
                Width = 200
                Visible = True
              end>
          end
        end
      end
      object btnConfirmarPreco: TButton
        Left = 608
        Top = 0
        Width = 113
        Height = 25
        Caption = 'F5 Confirmar Pre'#231'o'
        TabOrder = 5
        OnClick = btnConfirmarPrecoClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Fornecedores Lan'#231'ados'
      ImageIndex = 1
      object DBGrid3: TDBGrid
        Left = 2
        Top = 8
        Width = 743
        Height = 225
        Color = 15794175
        DataSource = dsFornecedorLancados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid3DrawColumnCell
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
            Width = 350
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
            Width = 120
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
            Width = 120
            Visible = True
          end>
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 193
        Width = 1223
        Height = 370
        Align = alBottom
        Color = 15794175
        DataSource = dsProdutoLancados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = ExcluirSegundaAba
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid4DrawColumnCell
        OnTitleClick = DBGrid4TitleClick
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
            Title.Caption = 'OBS'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 350
            Visible = True
          end>
      end
      object gpbFornecedor: TGroupBox
        Left = 0
        Top = 563
        Width = 1223
        Height = 53
        Align = alBottom
        TabOrder = 2
        object lbl_excel: TLabel
          Left = 399
          Top = 13
          Width = 90
          Height = 13
          Caption = 'Gerando Planilha...'
          Visible = False
        end
        object Label9: TLabel
          Left = 16
          Top = 24
          Width = 194
          Height = 16
          Caption = 'F4 - Inserir Valor no Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnExcel: TBitBtn
          Left = 218
          Top = 8
          Width = 176
          Height = 42
          Caption = 'Exportar Excel '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnExcelClick
        end
        object pgb_excel: TProgressBar
          Left = 398
          Top = 27
          Width = 412
          Height = 17
          TabOrder = 1
          Visible = False
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Fornecedores Vencedores'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 0
        Top = 504
        Width = 1223
        Height = 112
        Align = alBottom
        TabOrder = 0
        object lbl_excel_2: TLabel
          Left = 249
          Top = 65
          Width = 90
          Height = 13
          Caption = 'Gerando Planilha...'
          Visible = False
        end
        object lbl3: TLabel
          Left = 549
          Top = 12
          Width = 124
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Total dos Itens'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object lbl4: TLabel
          Left = 681
          Top = 12
          Width = 124
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Frete'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object lbl5: TLabel
          Left = 810
          Top = 12
          Width = 131
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Total Geral'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Label5: TLabel
          Left = 974
          Top = 10
          Width = 170
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Total Cota'#231#227'o'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object btnImprimir: TBitBtn
          Left = 5
          Top = 14
          Width = 181
          Height = 38
          Caption = 'Imprimir Fornec. Vencedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnImprimirClick
        end
        object pgb_excel_2: TProgressBar
          Left = 248
          Top = 79
          Width = 961
          Height = 17
          TabOrder = 1
          Visible = False
        end
        object btnExcel2: TBitBtn
          Left = 920
          Top = 51
          Width = 58
          Height = 38
          Caption = 'Exportar Excel '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = btnExcel2Click
        end
        object btnGerarPedidoCompra: TBitBtn
          Left = 5
          Top = 57
          Width = 182
          Height = 40
          Caption = 'F6 - Colocar Valor Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnGerarPedidoCompraClick
        end
        object txt_total_itens: TCurrencyEdit
          Left = 549
          Top = 29
          Width = 124
          Height = 21
          AutoSize = False
          Color = 14803425
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object txt_frete: TCurrencyEdit
          Left = 681
          Top = 29
          Width = 124
          Height = 21
          AutoSize = False
          Color = 14803425
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object txt_total_geral: TCurrencyEdit
          Left = 810
          Top = 29
          Width = 131
          Height = 21
          AutoSize = False
          Color = 14803425
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object txt_total_cotacao: TCurrencyEdit
          Left = 975
          Top = 28
          Width = 168
          Height = 21
          AutoSize = False
          Color = 14803425
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object btnImprimirGrupo: TButton
          Left = 197
          Top = 15
          Width = 133
          Height = 37
          Caption = 'Imprimir por grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = btnImprimirGrupoClick
        end
        object Button1: TButton
          Left = 338
          Top = 17
          Width = 150
          Height = 36
          Caption = 'Imprimir por Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = Button1Click
        end
      end
      object DBGrid7: TDBGrid
        Left = 0
        Top = 217
        Width = 1223
        Height = 287
        Align = alClient
        Color = 15794175
        DataSource = dsProdutoFornecVenc
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid7DrawColumnCell
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
            Title.Caption = 'Descricao do Produto'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 350
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'COT_UNIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'UN'
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
            FieldName = 'COT_QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 110
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
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Total (R$)'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 110
            Visible = True
          end>
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 1223
        Height = 217
        Align = alTop
        TabOrder = 2
        object lbl1: TLabel
          Left = 1091
          Top = 17
          Width = 46
          Height = 18
          AutoSize = False
          Color = 60138
          ParentColor = False
        end
        object lbl2: TLabel
          Left = 907
          Top = 20
          Width = 178
          Height = 13
          Caption = 'Fornecedores c/ produtos comprados'
        end
        object dbgrd1: TDBGrid
          Left = 1
          Top = 1
          Width = 896
          Height = 215
          Align = alLeft
          Color = 15794175
          DataSource = dsFornecedorVencedor
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrd1DrawColumnCell
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FOR_CODIGO'
              Title.Alignment = taCenter
              Title.Caption = 'Cod. Fornecedor'
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
              FieldName = 'AT_NOME'
              Title.Caption = 'Nome do Fornecedor'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 350
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
              Width = 120
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
              Width = 120
              Visible = True
            end>
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Carregar Excel'
      ImageIndex = 3
      object Label16: TLabel
        Left = 872
        Top = 592
        Width = 37
        Height = 16
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gpbCarregarExcel: TGroupBox
        Left = 0
        Top = 0
        Width = 1187
        Height = 585
        TabOrder = 0
        object Label14: TLabel
          Left = 6
          Top = 18
          Width = 88
          Height = 13
          Caption = 'Descri'#231#227'o Produto'
        end
        object Label15: TLabel
          Left = 309
          Top = 18
          Width = 62
          Height = 13
          Caption = 'Cod. Produto'
        end
        object txt_descricao_pesq: TEdit
          Left = 4
          Top = 33
          Width = 296
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = txt_descricao_pesqChange
          OnKeyPress = txt_descricao_pesqKeyPress
        end
        object txt_cod_produto_pesq: TEdit
          Left = 306
          Top = 33
          Width = 75
          Height = 21
          TabOrder = 1
          OnChange = txt_cod_produto_pesqChange
        end
        object rdb_inicio: TRadioButton
          Left = 2
          Top = 61
          Width = 57
          Height = 17
          Caption = 'Inicio'
          TabOrder = 2
          OnClick = rdb_inicioClick
        end
        object rdb_posicao: TRadioButton
          Left = 90
          Top = 61
          Width = 113
          Height = 17
          Caption = 'Qualquer posicao'
          TabOrder = 3
          OnClick = rdb_posicaoClick
        end
        object Button6: TButton
          Left = 300
          Top = 58
          Width = 99
          Height = 22
          Caption = 'Cadastrar Produto'
          TabOrder = 4
          OnClick = Button6Click
        end
        object dbgProdutoExcel: TDBGrid
          Left = 6
          Top = 80
          Width = 393
          Height = 465
          DataSource = dsProdutoExcel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgProdutoExcelDrawColumnCell
          OnDblClick = dbgProdutoExcelDblClick
          OnKeyPress = dbgProdutoExcelKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'PRO_CODIGO'
              Title.Caption = 'Codigo'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
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
              Title.Font.Style = [fsBold]
              Width = 290
              Visible = True
            end>
        end
        object edtProdutoSelecionado: TEdit
          Left = 6
          Top = 554
          Width = 393
          Height = 24
          Color = 14803425
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object cboFornecedorExcel: TDBLookupComboBox
          Left = 408
          Top = 19
          Width = 415
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'AT_CODIGO'
          ListField = 'AT_NOME'
          ListSource = dtsFornecedorCombo
          ParentFont = False
          TabOrder = 7
          OnCloseUp = cboFornecedorCloseUp
          OnKeyDown = cboFornecedorKeyDown
          OnKeyPress = cboFornecedorKeyPress
        end
        object edtCaminhoExcel: TEdit
          Left = 407
          Top = 50
          Width = 417
          Height = 21
          Color = 14803425
          ReadOnly = True
          TabOrder = 8
        end
        object DBGrid5: TDBGrid
          Left = 406
          Top = 74
          Width = 774
          Height = 473
          Color = 15794175
          DataSource = dsCarregarExcel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = popCarregarExcel
          TabOrder = 9
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid5DrawColumnCell
          OnDblClick = DBGrid5DblClick
          OnKeyPress = DBGrid5KeyPress
          OnTitleClick = DBGrid5TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_PRODUTO_EXCEL'
              Title.Caption = 'Cod Produto Excel'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRODUTO_DESCRICAO'
              Title.Caption = 'Produto'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_UNIT'
              Title.Caption = 'Valor Unit'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Caption = 'Valor Total'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end>
        end
        object Button2: TButton
          Left = 828
          Top = 45
          Width = 105
          Height = 25
          Caption = 'Abrir arquivo...'
          TabOrder = 10
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 943
          Top = 44
          Width = 172
          Height = 27
          Caption = 'Jogar Excel na Cota'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 942
          Top = 14
          Width = 173
          Height = 25
          Caption = 'Excluir Produtos da Grid'
          TabOrder = 12
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 1005
          Top = 553
          Width = 114
          Height = 25
          Caption = 'Ligar Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          OnClick = Button5Click
        end
        object edtProdutoSelecionadoExcel: TEdit
          Left = 408
          Top = 553
          Width = 591
          Height = 24
          Color = 14803425
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
      end
      object edtTotalExcel: TCurrencyEdit
        Left = 912
        Top = 589
        Width = 125
        Height = 23
        AutoSize = False
        Color = 14803425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object gpb_botoes: TGroupBox
    Left = 1217
    Top = 0
    Width = 129
    Height = 644
    Align = alRight
    Anchors = []
    TabOrder = 1
    object btn_novo: TBitBtn
      Left = 2
      Top = 7
      Width = 125
      Height = 35
      Caption = 'Incluir [F5]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn_novoClick
    end
    object btn_finalizar: TBitBtn
      Left = 2
      Top = 43
      Width = 125
      Height = 35
      Caption = 'Finalizar [F10]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_finalizarClick
    end
    object btn_excluir: TBitBtn
      Left = 2
      Top = 111
      Width = 125
      Height = 35
      Caption = 'Excluir [F11]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btn_excluirClick
    end
    object btn_pesquisar: TBitBtn
      Left = 2
      Top = 146
      Width = 125
      Height = 35
      Caption = 'Pesquisar [F7]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_pesquisarClick
    end
    object btn_sair: TBitBtn
      Left = 2
      Top = 182
      Width = 125
      Height = 35
      Caption = 'Sair (Esc)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btn_sairClick
    end
    object btn_alterar: TBitBtn
      Left = 2
      Top = 77
      Width = 125
      Height = 35
      Caption = 'Alterar [F9]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btn_alterarClick
    end
  end
  object qryTransLocal: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 836
    Top = 258
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 868
    Top = 258
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 916
    Top = 226
  end
  object qryProduto: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO, I.cot_qtd, I.' +
        'cot_unidade, I.ITENS_COT_CODIGO,'
      
        'I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL,       ' +
        '            '
      
        'i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.at_' +
        'nome,       '
      
        'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_' +
        'VALOR_ANT, ICCF.cot_obs'
      'FROM itens_cotacao_compra I'
      '  INNER JOIN PRODUTO P ON I.pro_codigo = P.pro_codigo'
      ''
      '  INNER JOIN itens_cotacao_compra_fornec ICCF ON'
      
        '  I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_cod' +
        'igo'
      ''
      '  LEFT JOIN agenda_telefone FORN ON'
      '  I.for_codigo_atual = FORN.at_codigo'
      ''
      'WHERE I.cot_codigo=:COT_CODIGO'
      ''
      
        'GROUP BY                                                        ' +
        '            '
      
        'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.co' +
        't_qtd,     I.ITENS_COT_CODIGO,  '
      
        'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_AT' +
        'UAL, FORN.AT_NOME,'
      
        'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_' +
        'VALOR_ANT, ICCF.cot_obs')
    Left = 528
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COT_CODIGO'
        ParamType = ptUnknown
      end>
    object qryProdutoFOR_INSERIDO: TIBStringField
      FieldName = 'FOR_INSERIDO'
      Origin = 'ITENS_COTACAO_COMPRA.FOR_INSERIDO'
      FixedChar = True
      Size = 1
    end
    object qryProdutoITE_ORDEM_INSERCAO: TIntegerField
      FieldName = 'ITE_ORDEM_INSERCAO'
      Origin = 'ITENS_COTACAO_COMPRA.ITE_ORDEM_INSERCAO'
    end
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
    object qryProdutoUN_CODIGO: TIntegerField
      FieldName = 'UN_CODIGO'
      Origin = 'PRODUTO.UN_CODIGO'
    end
    object qryProdutoCOT_QTD: TFloatField
      FieldName = 'COT_QTD'
      Origin = 'ITENS_COTACAO_COMPRA.COT_QTD'
    end
    object qryProdutoCOT_UNIDADE: TIBStringField
      FieldName = 'COT_UNIDADE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_UNIDADE'
      Size = 12
    end
    object qryProdutoCOT_VALOR: TIBBCDField
      FieldName = 'COT_VALOR'
      Origin = 'ITENS_COTACAO_COMPRA.COT_VALOR'
      Precision = 18
      Size = 2
    end
    object qryProdutoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object qryProdutoCOT_EMPATE: TIBStringField
      FieldName = 'COT_EMPATE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_EMPATE'
      FixedChar = True
      Size = 1
    end
    object qryProdutoCOT_CONFIRMAR_PRECO: TIBStringField
      FieldName = 'COT_CONFIRMAR_PRECO'
      Origin = 'ITENS_COTACAO_COMPRA.COT_CONFIRMAR_PRECO'
      FixedChar = True
      Size = 1
    end
    object qryProdutoFOR_CODIGO_ANT: TIntegerField
      FieldName = 'FOR_CODIGO_ANT'
      Origin = 'ITENS_COTACAO_COMPRA.FOR_CODIGO_ANT'
    end
    object qryProdutoCOT_VALOR_ANT: TIBBCDField
      FieldName = 'COT_VALOR_ANT'
      Origin = 'ITENS_COTACAO_COMPRA.COT_VALOR_ANT'
      Precision = 18
      Size = 2
    end
    object qryProdutoFOR_CODIGO_ATUAL: TIntegerField
      FieldName = 'FOR_CODIGO_ATUAL'
      Origin = 'ITENS_COTACAO_COMPRA.FOR_CODIGO_ATUAL'
    end
    object qryProdutoAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
    object qryProdutoCOT_OBS: TIBStringField
      FieldName = 'COT_OBS'
      Origin = 'ITENS_COTACAO_COMPRA_FORNEC.COT_OBS'
      Size = 100
    end
    object qryProdutoITENS_COT_CODIGO: TIntegerField
      FieldName = 'ITENS_COT_CODIGO'
      Origin = 'ITENS_COTACAO_COMPRA.ITENS_COT_CODIGO'
      Required = True
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    OnDataChange = dsProdutoDataChange
    Left = 472
    Top = 291
  end
  object qryUnidade: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM UNIDADE')
    Left = 925
    Top = 492
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
    Left = 925
    Top = 461
  end
  object dsFornecedorLancados: TDataSource
    DataSet = qryFornecedorLancados
    OnDataChange = dsFornecedorLancadosDataChange
    Left = 840
    Top = 437
  end
  object qryFornecedorLancados: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT F.AT_CODIGO, F.AT_NOME,  F.AT_TELEFONE, AT_CELULAR '
      ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I'
      ''
      ' GROUP BY F.AT_codigo, F.AT_nome , F.AT_TELEFONE, AT_CELULAR ')
    Left = 872
    Top = 437
    object qryFornecedorLancadosAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'AGENDA_TELEFONE.AT_CODIGO'
      Required = True
    end
    object qryFornecedorLancadosAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
    object qryFornecedorLancadosAT_TELEFONE: TIBStringField
      FieldName = 'AT_TELEFONE'
      Origin = 'AGENDA_TELEFONE.AT_TELEFONE'
      Size = 16
    end
    object qryFornecedorLancadosAT_CELULAR: TIBStringField
      FieldName = 'AT_CELULAR'
      Origin = 'AGENDA_TELEFONE.AT_CELULAR'
      Size = 16
    end
  end
  object dsProdutoLancados: TDataSource
    DataSet = qryProdutoLancados
    Left = 840
    Top = 469
  end
  object qryProdutoLancados: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, ' +
        'II.COT_OBS, f.at_codigo,'
      ''
      '     (CASE WHEN II.cot_valor = 0 THEN'
      '       0'
      '     ELSE'
      '      II.cot_valor END) AS COT_VALOR'
      ''
      
        '      FROM AGENDA_TELEFONE f, itens_cotacao_compra I,  itens_cot' +
        'acao_compra_fornec II, PRODUTO P'
      
        '      WHERE II.for_codigo = F.AT_codigo AND P.pro_codigo = II.pr' +
        'o_codigo'
      
        '      AND II.pro_codigo = I.pro_codigo and II.cot_codigo = I.cot' +
        '_codigo'
      
        '      AND I.COT_CODIGO =:COT_CODIGO AND II.for_codigo =:FOR_CODI' +
        'GO')
    Left = 872
    Top = 469
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COT_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOR_CODIGO'
        ParamType = ptUnknown
      end>
    object IBStringField3: TIBStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRODUTO.PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object IBStringField4: TIBStringField
      FieldName = 'COT_UNIDADE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_UNIDADE'
      Size = 12
    end
    object FloatField1: TFloatField
      FieldName = 'COT_QTD'
      Origin = 'ITENS_COTACAO_COMPRA.COT_QTD'
      DisplayFormat = '###,##0.000'
    end
    object IBBCDField1: TIBBCDField
      FieldName = 'COT_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutoLancadosPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'PRODUTO.PRO_CODIGO'
      Required = True
    end
    object qryProdutoLancadosCOT_OBS: TIBStringField
      FieldName = 'COT_OBS'
      Origin = 'ITENS_COTACAO_COMPRA_FORNEC.COT_OBS'
      Size = 100
    end
    object qryProdutoLancadosAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'AGENDA_TELEFONE.AT_CODIGO'
      Required = True
    end
  end
  object dsUltCompra: TDataSource
    DataSet = qryUltCompra
    Left = 924
    Top = 387
  end
  object qryUltCompra: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT first 3  C.CMP_DATA, F.FOR_CODIGO, F.FOR_NOME, I.ITE_VALO' +
        'R_UNIT, I.ITE_QTD, I.ITE_UNIDADE'
      ' FROM COMPRA C, ITENS_COMPRA I, PRODUTO P, FORNECEDOR F'
      
        ' WHERE C.CMP_CODIGO = I.CMP_CODIGO AND I.PRO_CODIGO = P.PRO_CODI' +
        'GO AND C.FOR_CODIGO = F.FOR_CODIGO'
      ' AND P.PRO_CODIGO = :PRO_CODIGO ORDER BY C.CMP_DATA desc')
    Left = 924
    Top = 418
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PRO_CODIGO'
        ParamType = ptUnknown
      end>
    object qryUltCompraCMP_DATA: TDateTimeField
      FieldName = 'CMP_DATA'
      Origin = 'COMPRA.CMP_DATA'
      Required = True
    end
    object qryUltCompraFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Origin = 'FORNECEDOR.FOR_CODIGO'
      Required = True
    end
    object qryUltCompraFOR_NOME: TIBStringField
      FieldName = 'FOR_NOME'
      Origin = 'FORNECEDOR.FOR_NOME'
      Required = True
      Size = 64
    end
    object qryUltCompraITE_VALOR_UNIT: TIBBCDField
      FieldName = 'ITE_VALOR_UNIT'
      Origin = 'ITENS_COMPRA.ITE_VALOR_UNIT'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 4
    end
    object qryUltCompraITE_QTD: TFloatField
      FieldName = 'ITE_QTD'
      Origin = 'ITENS_COMPRA.ITE_QTD'
      DisplayFormat = '###,##0.000'
    end
    object qryUltCompraITE_UNIDADE: TIBStringField
      FieldName = 'ITE_UNIDADE'
      Origin = 'ITENS_COMPRA.ITE_UNIDADE'
      Size = 12
    end
  end
  object dsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 832
    Top = 350
  end
  object qryFornecedor: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT F.AT_CODIGO, F.AT_NOME, I.COT_VALOR, I.PRO_CODIGO, I.COT_' +
        'OBS'
      
        ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I, produto ' +
        'p')
    Left = 912
    Top = 350
    object qryFornecedorCOT_VALOR: TIBBCDField
      FieldName = 'COT_VALOR'
      Origin = 'ITENS_COTACAO_COMPRA_FORNEC.COT_VALOR'
      Precision = 18
      Size = 2
    end
    object qryFornecedorPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'ITENS_COTACAO_COMPRA_FORNEC.PRO_CODIGO'
      Required = True
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
      Origin = 'ITENS_COTACAO_COMPRA_FORNEC.COT_OBS'
      Size = 100
    end
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    Left = 872
    Top = 390
    object cdsFornecedorCOT_VALOR: TBCDField
      FieldName = 'COT_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsFornecedorPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Required = True
    end
    object cdsFornecedorCHEQUED: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CHEQUED'
      Size = 1
    end
    object cdsFornecedorAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Required = True
    end
    object cdsFornecedorAT_NOME: TStringField
      FieldName = 'AT_NOME'
      Size = 200
    end
    object cdsFornecedorCOT_OBS: TStringField
      FieldName = 'COT_OBS'
      Size = 100
    end
  end
  object dspFornecedor: TDataSetProvider
    DataSet = qryFornecedor
    Left = 840
    Top = 390
  end
  object dsFornecedorVencedor: TDataSource
    DataSet = qryFornecedorVencedor
    OnDataChange = dsFornecedorVencedorDataChange
    Left = 841
    Top = 519
  end
  object qryFornecedorVencedor: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT I.FOR_CODIGO, F.AT_nome, I.COT_PREVISAO_ENTREGA, '
      
        'I.COT_VALOR_FRETE, F.AT_TELEFONE, AT_CELULAR, I.COT_COMPRA_EFETU' +
        'ADA '
      ''
      ' FROM  itens_cotacao_fornec_venc I, AGENDA_TELEFONE F'
      ' '
      '    group by I.for_codigo, F.AT_nome,'
      '     I.COT_PREVISAO_ENTREGA,  I.COT_COMPRA_EFETUADA ,'
      'I.COT_VALOR_FRETE , F.AT_TELEFONE, AT_CELULAR ')
    Left = 875
    Top = 519
    object qryFornecedorVencedorCOT_PREVISAO_ENTREGA: TDateTimeField
      FieldName = 'COT_PREVISAO_ENTREGA'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_PREVISAO_ENTREGA'
    end
    object qryFornecedorVencedorCOT_VALOR_FRETE: TIBBCDField
      FieldName = 'COT_VALOR_FRETE'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_VALOR_FRETE'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryFornecedorVencedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.FOR_CODIGO'
      Required = True
    end
    object qryFornecedorVencedorAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
    object qryFornecedorVencedorAT_TELEFONE: TIBStringField
      FieldName = 'AT_TELEFONE'
      Origin = 'AGENDA_TELEFONE.AT_TELEFONE'
      Size = 16
    end
    object qryFornecedorVencedorAT_CELULAR: TIBStringField
      FieldName = 'AT_CELULAR'
      Origin = 'AGENDA_TELEFONE.AT_CELULAR'
      Size = 16
    end
    object qryFornecedorVencedorCOT_COMPRA_EFETUADA: TIBStringField
      FieldName = 'COT_COMPRA_EFETUADA'
      Origin = 'ITENS_COTACAO_FORNEC_VENC.COT_COMPRA_EFETUADA'
      FixedChar = True
      Size = 1
    end
  end
  object dsProdutoFornecVenc: TDataSource
    DataSet = qryProdutoFornecVenc
    Left = 842
    Top = 551
  end
  object qryProdutoFornecVenc: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT P.PRO_CODIGO, P.pro_codigo_or, P.pro_descricao, I.cot_uni' +
        'dade, I.cot_qtd, I.cot_valor,'
      ''
      '      SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL,'
      
        '      FX.for_codigo_pro AS COD_FORNEC_FX, FX.descricao_fornecedo' +
        'r AS DESCRICAO_FX'
      ''
      '  FROM produto P, itens_cotacao_compra I, FORNECEDOR F'
      
        '  LEFT JOIN fornecedor_xml FX ON (FX.for_codigo = I.for_codigo_a' +
        'tual AND'
      '                                  FX.pro_codigo = P.pro_codigo)'
      
        '  WHERE I.pro_codigo = P.pro_codigo AND F.for_codigo = I.for_cod' +
        'igo_atual'
      
        '  AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODI' +
        'GO'
      ''
      
        '  GROUP BY P.PRO_CODIGO, P.pro_codigo_or, P.pro_descricao, I.cot' +
        '_unidade, I.cot_qtd, I.cot_valor,'
      '           FX.for_codigo_pro,'
      '           FX.descricao_fornecedor'
      ''
      '  ORDER BY P.pro_codigo_or')
    Left = 875
    Top = 551
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COT_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOR_CODIGO'
        ParamType = ptUnknown
      end>
    object qryProdutoFornecVencPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'PRODUTO.PRO_CODIGO'
      Required = True
    end
    object qryProdutoFornecVencPRO_DESCRICAO: TIBStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRODUTO.PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object qryProdutoFornecVencCOT_UNIDADE: TIBStringField
      FieldName = 'COT_UNIDADE'
      Origin = 'ITENS_COTACAO_COMPRA.COT_UNIDADE'
      Size = 12
    end
    object qryProdutoFornecVencCOT_QTD: TFloatField
      FieldName = 'COT_QTD'
      Origin = 'ITENS_COTACAO_COMPRA.COT_QTD'
      DisplayFormat = '###,##0.000'
    end
    object qryProdutoFornecVencCOT_VALOR: TIBBCDField
      FieldName = 'COT_VALOR'
      Origin = 'ITENS_COTACAO_COMPRA.COT_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object fltfldProdutoFornecVencVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    Left = 466
    Top = 349
  end
  object qryPesqAux: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 967
    Top = 224
  end
  object qry_empresa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '#39'NOME FANTASIA: '#39' || EMP_NOMEFANTASIA AS FANTASIA,'
      '       '#39'RAZAO SOCIAL: '#39' || EMP_NOME AS RAZAO,'
      '       '#39'CNPJ: '#39' || EMP_CNPJ AS CNPJ,'
      
        '       '#39'ENDERECO: '#39' || EMP_ENDERECO || '#39', '#39' || EMP_NUMERO || '#39'  ' +
        '-  '#39' || EMP_BAIRRO AS ENDERECO,'
      
        '       '#39'CIDADE: '#39' || EMP_CIDADE || '#39'  -  '#39' || EMP_UF || '#39'  -  CE' +
        'P: '#39' || EMP_cep AS CIDADE,'
      '       '#39'FONE: '#39' || EMP_TELEFONE AS FONE'
      '  FROM EMPRESA')
    Left = 674
    Top = 534
    object qry_empresaFANTASIA: TIBStringField
      FieldName = 'FANTASIA'
      Required = True
      Size = 79
    end
    object qry_empresaRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 77
    end
    object qry_empresaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Size = 24
    end
    object qry_empresaENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 118
    end
    object qry_empresaCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 75
    end
    object qry_empresaFONE: TIBStringField
      FieldName = 'FONE'
      Size = 24
    end
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 530
    Top = 349
    object cdsProdutoFOR_INSERIDO: TStringField
      FieldName = 'FOR_INSERIDO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoITE_ORDEM_INSERCAO: TIntegerField
      FieldName = 'ITE_ORDEM_INSERCAO'
    end
    object cdsProdutoPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Required = True
    end
    object cdsProdutoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object cdsProdutoUN_CODIGO: TIntegerField
      FieldName = 'UN_CODIGO'
    end
    object cdsProdutoCOT_QTD: TFloatField
      FieldName = 'COT_QTD'
      DisplayFormat = '###,##0.000'
    end
    object cdsProdutoCOT_UNIDADE: TStringField
      FieldName = 'COT_UNIDADE'
      Size = 12
    end
    object cdsProdutoCOT_VALOR: TBCDField
      FieldName = 'COT_VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
    object cdsProdutoCOT_EMPATE: TStringField
      FieldName = 'COT_EMPATE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCOT_CONFIRMAR_PRECO: TStringField
      FieldName = 'COT_CONFIRMAR_PRECO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoFOR_CODIGO_ANT: TIntegerField
      FieldName = 'FOR_CODIGO_ANT'
    end
    object cdsProdutoCOT_VALOR_ANT: TBCDField
      FieldName = 'COT_VALOR_ANT'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFOR_CODIGO_ATUAL: TIntegerField
      FieldName = 'FOR_CODIGO_ATUAL'
    end
    object cdsProdutoAT_NOME: TStringField
      FieldName = 'AT_NOME'
      Size = 200
    end
    object cdsProdutoCOT_OBS: TStringField
      FieldName = 'COT_OBS'
      Size = 100
    end
    object cdsProdutoITENS_COT_CODIGO: TIntegerField
      FieldName = 'ITENS_COT_CODIGO'
      Required = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 172
    Top = 264
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
    object Prximomaisbarato1: TMenuItem
      Caption = 'Pr'#243'ximo mais barato'
      OnClick = Prximomaisbarato1Click
    end
  end
  object qryFornecedorCombo: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT AT_CODIGO, AT_NOME'
      'FROM AGENDA_TELEFONE WHERE AT_COTACAO ='#39'S'#39
      'ORDER BY AT_NOME')
    Left = 764
    Top = 201
    object qryFornecedorComboAT_CODIGO: TIntegerField
      FieldName = 'AT_CODIGO'
      Origin = 'AGENDA_TELEFONE.AT_CODIGO'
      Required = True
    end
    object qryFornecedorComboAT_NOME: TIBStringField
      FieldName = 'AT_NOME'
      Origin = 'AGENDA_TELEFONE.AT_NOME'
      Size = 200
    end
  end
  object dtsFornecedorCombo: TDataSource
    DataSet = qryFornecedorCombo
    Left = 705
    Top = 200
  end
  object ExcluirSegundaAba: TPopupMenu
    Left = 291
    Top = 342
    object ExcluirItemda2Aba1: TMenuItem
      Caption = 'Excluir Item da 2'#186' Aba'
      OnClick = ExcluirItemda2Aba1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Excel Arquivo|*.xls'
    Left = 1164
    Top = 224
  end
  object qryCarregarExcel: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from carregar_excel_cotacao')
    Left = 1183
    Top = 272
    object qryCarregarExcelPRODUTO_DESCRICAO: TIBStringField
      FieldName = 'PRODUTO_DESCRICAO'
      Origin = 'CARREGAR_EXCEL_COTACAO.PRODUTO_DESCRICAO'
      Size = 200
    end
    object qryCarregarExcelVALOR_UNIT: TIBBCDField
      FieldName = 'VALOR_UNIT'
      Origin = 'CARREGAR_EXCEL_COTACAO.VALOR_UNIT'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryCarregarExcelQTDE: TIBBCDField
      FieldName = 'QTDE'
      Origin = 'CARREGAR_EXCEL_COTACAO.QTDE'
      DisplayFormat = '###,##0.000'
      Precision = 18
      Size = 3
    end
    object qryCarregarExcelVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'CARREGAR_EXCEL_COTACAO.VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryCarregarExcelCOD_PRODUTO_EXCEL: TIBStringField
      FieldName = 'COD_PRODUTO_EXCEL'
      Origin = 'CARREGAR_EXCEL_COTACAO.COD_PRODUTO_EXCEL'
      Size = 40
    end
    object qryCarregarExcelID: TIntegerField
      FieldName = 'ID'
      Origin = 'CARREGAR_EXCEL_COTACAO.ID'
      Required = True
    end
    object qryCarregarExcelDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'CARREGAR_EXCEL_COTACAO.DESCONTO'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsCarregarExcel: TDataSource
    DataSet = qryCarregarExcel
    Left = 1151
    Top = 272
  end
  object dsProdutoExcel: TDataSource
    DataSet = qryProdutoExcel
    Left = 260
    Top = 160
  end
  object qryProdutoExcel: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select pro_codigo, pro_descricao, un_descricao from produto P, u' +
        'nidade u')
    Left = 300
    Top = 160
    object qryProdutoExcelPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'PRODUTO.PRO_CODIGO'
      Required = True
    end
    object qryProdutoExcelPRO_DESCRICAO: TIBStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRODUTO.PRO_DESCRICAO'
      Required = True
      Size = 64
    end
    object qryProdutoExcelUN_DESCRICAO: TIBStringField
      FieldName = 'UN_DESCRICAO'
      Origin = 'UNIDADE.UN_DESCRICAO'
      Required = True
      Size = 32
    end
  end
  object qryTransLocalCompra: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 900
    Top = 288
  end
  object qryTransLocalCompraFornec: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 932
    Top = 288
  end
  object qryTransLocalFornecMeu: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 964
    Top = 288
  end
  object popCarregarExcel: TPopupMenu
    Left = 540
    Top = 224
    object InserirItemIndividualmente1: TMenuItem
      Caption = 'Inserir Item Individualmente'
      OnClick = InserirItemIndividualmente1Click
    end
  end
end
