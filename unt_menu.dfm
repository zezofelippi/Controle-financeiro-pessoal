object frm_menu: Tfrm_menu
  Left = 278
  Top = 175
  Width = 886
  Height = 463
  Caption = 'Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 96
    Width = 1219
    Height = 37
    Caption = 
      'Qualquer mudan'#231'a direto no banco de dados em relacao '#224' despesa d' +
      'o s'#237'tio (6-S'#237'tio) ,'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 48
    Top = 136
    Width = 698
    Height = 37
    Caption = 'mudar tamb'#233'm nas tabelas que envolvam o s'#237'tio.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 200
    Top = 8
    object Despesas1: TMenuItem
      Caption = 'Despesas'
      object CadDespesas1: TMenuItem
        Caption = 'Cad. Despesas'
        OnClick = CadDespesas1Click
      end
      object ipoDespesa1: TMenuItem
        Caption = 'Cad. Tipo Despesa'
        OnClick = ipoDespesa1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Lembrete1: TMenuItem
        Caption = 'Contas Pagar'
        OnClick = Lembrete1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object RelGeral1: TMenuItem
        Caption = 'Rel. Geral'
        OnClick = RelGeral1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object JuntarDesppessoalcdespsitio1: TMenuItem
        Caption = 'Juntar (Desp. pessoal c/ desp. sitio)'
        OnClick = JuntarDesppessoalcdespsitio1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object CotaodeCompras1: TMenuItem
        Caption = 'Cota'#231#227'o de Compras'
        object CotacaodeCompras1: TMenuItem
          Caption = 'Cotacao de Compras'
          OnClick = CotacaodeCompras1Click
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object ItensComprados1: TMenuItem
          Caption = 'Itens Comprados'
          OnClick = ItensComprados1Click
        end
        object N10: TMenuItem
          Caption = '-'
        end
        object Produto1: TMenuItem
          Caption = 'Produto'
          OnClick = Produto1Click
        end
        object Unidade1: TMenuItem
          Caption = 'Unidade'
          OnClick = Unidade1Click
        end
        object Grupo1: TMenuItem
          Caption = 'Grupo'
          OnClick = Grupo1Click
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object Configurao1: TMenuItem
          Caption = 'Configura'#231#227'o'
          OnClick = Configurao1Click
        end
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object RelatorioUnidoC1: TMenuItem
        Caption = 'Relatorio Unido (Contas a  Pagar c/ Contas Pagas)'
        OnClick = RelatorioUnidoC1Click
      end
    end
    object ransFinanceira1: TMenuItem
      Caption = 'Financeiro'
      object CadTipoReceita2: TMenuItem
        Caption = 'Cad. Tipo Receita'
        OnClick = CadTipoReceita2Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object CadReceita1: TMenuItem
        Caption = 'Cad. Receita'
        OnClick = CadReceita1Click
      end
      object ransferenciaFinanceira1: TMenuItem
        Caption = 'Transferencia Financeira'
        OnClick = ransferenciaFinanceira1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object EmprestimoaReceber1: TMenuItem
        Caption = 'Emprestimo a Receber'
        OnClick = EmprestimoaReceber1Click
      end
      object EmprestimosaPagar1: TMenuItem
        Caption = 'Emprestimos a Pagar'
        OnClick = EmprestimosaPagar1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object FormadePagamento1: TMenuItem
        Caption = 'Forma de Pagamento'
        OnClick = FormadePagamento1Click
      end
    end
    object RelatorioGeral1: TMenuItem
      Caption = 'Relatorio Geral'
      object ReceitasXDespesas1: TMenuItem
        Caption = 'Receitas X Despesas'
        OnClick = ReceitasXDespesas1Click
      end
      object ResumoGeral1: TMenuItem
        Caption = 'Resumo Geral'
        OnClick = ResumoGeral1Click
      end
    end
    object Obs1: TMenuItem
      Caption = 'Obs'
      object AgendaTelefone1: TMenuItem
        Caption = 'Agenda (Telefone)'
        OnClick = AgendaTelefone1Click
      end
      object OBS2: TMenuItem
        Caption = 'OBS'
        OnClick = OBS2Click
      end
    end
    object N3: TMenuItem
      Caption = '|||||'
    end
    object Conversao1: TMenuItem
      Caption = 'Conversao'
      object DataemDiassemana1: TMenuItem
        Caption = 'Data em Dias semana'
        OnClick = DataemDiassemana1Click
      end
      object CONVERTER1: TMenuItem
        Caption = 'CONVERTER'
        OnClick = CONVERTER1Click
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 'FortesReport v3.23 \251 Copyright '#169' 1999-2004 Fortes Inform'#225'tica'
    ViewerOptions = []
    FontEncoding = feNoEncoding
    DisplayName = 'Documento PDF'
    Left = 256
    Top = 8
  end
end