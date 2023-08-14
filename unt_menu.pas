unit unt_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, RLFilters, RLPDFFilter, StdCtrls;

type
  Tfrm_menu = class(TForm)
    MainMenu1: TMainMenu;
    Despesas1: TMenuItem;
    Conversao1: TMenuItem;
    DataemDiassemana1: TMenuItem;
    Lembrete1: TMenuItem;
    ipoDespesa1: TMenuItem;
    CadDespesas1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    RelGeral1: TMenuItem;
    ransFinanceira1: TMenuItem;
    RelatorioGeral1: TMenuItem;
    N3: TMenuItem;
    ReceitasXDespesas1: TMenuItem;
    Obs1: TMenuItem;
    OBS2: TMenuItem;
    CadReceita1: TMenuItem;
    CadTipoReceita2: TMenuItem;
    N4: TMenuItem;
    ransferenciaFinanceira1: TMenuItem;
    ResumoGeral1: TMenuItem;
    N6: TMenuItem;
    EmprestimoaReceber1: TMenuItem;
    EmprestimosaPagar1: TMenuItem;
    N5: TMenuItem;
    JuntarDesppessoalcdespsitio1: TMenuItem;
    RLPDFFilter1: TRLPDFFilter;
    AgendaTelefone1: TMenuItem;
    N7: TMenuItem;
    CotaodeCompras1: TMenuItem;
    CotacaodeCompras1: TMenuItem;
    Produto1: TMenuItem;
    Unidade1: TMenuItem;
    Grupo1: TMenuItem;
    N8: TMenuItem;
    FormadePagamento1: TMenuItem;
    lbl1: TLabel;
    lbl2: TLabel;
    N9: TMenuItem;
    ItensComprados1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Configurao1: TMenuItem;
    CONVERTER1: TMenuItem;
    N12: TMenuItem;
    RelatorioUnidoC1: TMenuItem;
    procedure DataemDiassemana1Click(Sender: TObject);
    procedure Lembrete1Click(Sender: TObject);
    procedure ipoDespesa1Click(Sender: TObject);
    procedure CadDespesas1Click(Sender: TObject);
    procedure RelGeral1Click(Sender: TObject);
    procedure Rel1Click(Sender: TObject);
    procedure RelMediaporGraficos1Click(Sender: TObject);
    procedure ReceitasXDespesas1Click(Sender: TObject);
    procedure OBS2Click(Sender: TObject);
    procedure CadReceita1Click(Sender: TObject);
    procedure CadTipoReceita2Click(Sender: TObject);
    procedure ransferenciaFinanceira1Click(Sender: TObject);
    procedure ResumoGeral1Click(Sender: TObject);
    procedure EmprestimoaReceber1Click(Sender: TObject);
    procedure EmprestimosaPagar1Click(Sender: TObject);
    procedure JuntarDesppessoalcdespsitio1Click(Sender: TObject);
    procedure AgendaTelefone1Click(Sender: TObject);
    procedure CotacaodeCompras1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure FormadePagamento1Click(Sender: TObject);
    procedure ItensComprados1Click(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure CONVERTER1Click(Sender: TObject);
    procedure RelatorioUnidoC1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_menu: Tfrm_menu;

implementation

{uses unt_cad_despesas, untrel_data_tipo, unt_rel_data_tipo,
  unt_data_dias_semana, unt_obs, unt_contas_pagar, untRelMediaDesp,
  untGraficoDespesa, unt_cad_receitas, untListDespRec, untCadTipoDespesa,
  untCadTipoReceita, untTransferenciaFinanceira, untResumoFinal,
  untContasReceber, untPagarEmprestimo, untEmprestimosPagar,
  untJuntarPessoalSitio, untAgendaTelefone, untCotacaoCompra,
  untCadUnidade, unt_cad_grupo, untProduto, untCadFormaPgto,
  untProdutosComprados, untConfiguracaoCotacao, UNTcONVERSAO,
  untRelUnidosContasPagarContasPagas;  }


{$R *.dfm}

procedure Tfrm_menu.DataemDiassemana1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_data_dias_semana, frm_data_dias_semana);
//frm_data_dias_semana.show;
end;

procedure Tfrm_menu.Lembrete1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_contas_pagar, frm_contas_pagar);
//frm_contas_pagar.show;

end;

procedure Tfrm_menu.ipoDespesa1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmCadTipoDespesa, frmCadTipoDespesa);
//frmCadTipoDespesa.show;
end;

procedure Tfrm_menu.CadDespesas1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_cad_despesas, frm_cad_despesas);
//frm_cad_despesas.show;
end;

procedure Tfrm_menu.RelGeral1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_rel_data_tipo, frm_rel_data_tipo);
//frm_rel_data_tipo.show;
end;

procedure Tfrm_menu.Rel1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmRelMediaDesp, frmRelMediaDesp);
//frmRelMediaDesp.show;
end;

procedure Tfrm_menu.RelMediaporGraficos1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmGraficoDespesa, frmGraficoDespesa);
//frmGraficoDespesa.show;
end;

procedure Tfrm_menu.ReceitasXDespesas1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmListDespRec, frmListDespRec);
//frmListDespRec.show;
end;

procedure Tfrm_menu.OBS2Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_obs, frm_obs);
//frm_obs.show;
end;

procedure Tfrm_menu.CadReceita1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_cad_receitas, frm_cad_receitas);
//frm_cad_receitas.show;
end;

procedure Tfrm_menu.CadTipoReceita2Click(Sender: TObject);
begin
//Application.CreateForm(TfrmCadTipoReceita, frmCadTipoReceita);
//frmCadTipoReceita.show;
end;

procedure Tfrm_menu.ransferenciaFinanceira1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmTransferenciaFinanceira, frmTransferenciaFinanceira);
//frmTransferenciaFinanceira.show;
end;

procedure Tfrm_menu.ResumoGeral1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmResumoFinal, frmResumoFinal);
//frmResumoFinal.show;
end;

procedure Tfrm_menu.EmprestimoaReceber1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmContasReceber, frmContasReceber);
//frmContasReceber.show;
end;

procedure Tfrm_menu.EmprestimosaPagar1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmEmprestimosPagar, frmEmprestimosPagar);
//frmEmprestimosPagar.show;
end;

procedure Tfrm_menu.JuntarDesppessoalcdespsitio1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmJuntarPessoalSitio, frmJuntarPessoalSitio);
//frmJuntarPessoalSitio.show;
end;

procedure Tfrm_menu.AgendaTelefone1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmAgendaTelefone, frmAgendaTelefone);
//frmAgendaTelefone.show;
end;

procedure Tfrm_menu.CotacaodeCompras1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_cotacao_compra, frm_cotacao_compra);
//frm_cotacao_compra.show;
end;

procedure Tfrm_menu.Unidade1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmCadUnidade, frmCadUnidade);
//frmCadUnidade.show;
end;

procedure Tfrm_menu.Grupo1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_cad_grupo, frm_cad_grupo);
//frm_cad_grupo.show;
end;

procedure Tfrm_menu.Produto1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmProduto, frmProduto);
//frmProduto.show;
end;

procedure Tfrm_menu.FormadePagamento1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmCadFormaPgto, frmCadFormaPgto);
//frmCadFormaPgto.show;
end;

procedure Tfrm_menu.ItensComprados1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmProdutosComprados, frmProdutosComprados);
//frmProdutosComprados.show;
end;

procedure Tfrm_menu.Configurao1Click(Sender: TObject);
begin
//  Application.CreateForm(TfrmConfiguracaoCotacao, frmConfiguracaoCotacao);
// frmConfiguracaoCotacao.show;
end;

procedure Tfrm_menu.CONVERTER1Click(Sender: TObject);
begin
//  Application.CreateForm(Tfrmconversor, frmconversor);
//  frmconversor.show;

end;

procedure Tfrm_menu.RelatorioUnidoC1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmRelUnidosContasPagarContasPagas, frmRelUnidosContasPagarContasPagas);
//frmRelUnidosContasPagarContasPagas.show;
end;

end.
