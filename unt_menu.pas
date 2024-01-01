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
    N12: TMenuItem;
    RelatorioUnidoC1: TMenuItem;
    N13: TMenuItem;
    DespesasMe1: TMenuItem;
    CadDespesaMe1: TMenuItem;
    RelGeralMe1: TMenuItem;
    RelatrioUnidoMe1: TMenuItem;
    FinanceiroMe1: TMenuItem;
    CadReceitaMe1: TMenuItem;
    ransfe1: TMenuItem;
    N3: TMenuItem;
    FormaPagamentoMe1: TMenuItem;
    RelatrioGeralMe1: TMenuItem;
    ReceitasXDespesasMe1: TMenuItem;
    ResumoGeralMe1: TMenuItem;
    N14: TMenuItem;
    FilhoMe1: TMenuItem;
    DespesasPagas1: TMenuItem;
    RelatrioUnidoTotal1: TMenuItem;
    N15: TMenuItem;
    ReceitasXDespesasGeral1: TMenuItem;
    ResumoFinalGeral1: TMenuItem;
    EmprestimosaReceber1: TMenuItem;
    EmprstimosaPagar1: TMenuItem;
    N16: TMenuItem;
    procedure DataemDiassemana1Click(Sender: TObject);
    procedure Lembrete1Click(Sender: TObject);
    procedure ipoDespesa1Click(Sender: TObject);
    procedure CadDespesas1Click(Sender: TObject);
    procedure RelGeral1Click(Sender: TObject);
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
    procedure RelatorioUnidoC1Click(Sender: TObject);
    procedure CadDespesaMe1Click(Sender: TObject);
    procedure RelGeralMe1Click(Sender: TObject);
    procedure RelatrioUnidoMe1Click(Sender: TObject);
    procedure CadReceitaMe1Click(Sender: TObject);
    procedure ransfe1Click(Sender: TObject);
    procedure FormaPagamentoMe1Click(Sender: TObject);
    procedure ReceitasXDespesasMe1Click(Sender: TObject);
    procedure ResumoGeralMe1Click(Sender: TObject);
    procedure EmprestimosaReceber1Click(Sender: TObject);
    procedure EmprstimosaPagar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_menu: Tfrm_menu;

implementation

uses unt_cad_despesas, untCadTipoDespesa, unt_contas_pagar,
  unt_rel_data_tipo, untJuntarPessoalSitio, untCadUnidade, unt_cad_grupo,
  untProduto, untProdutosComprados, untConfiguracaoCotacao,
  untRelUnidosContasPagarContasPagas, untAgendaTelefone, untCotacaoCompra,
  untCadTipoReceita, unt_cad_receitas, untTransferenciaFinanceira,
  untContasReceber, untEmprestimosPagar, untCadFormaPgto, untListDespRec,
  untResumoFinal, unt_obs, unt_data_dias_semana, unt_cad_despesas_mae,
  unt_rel_data_tipo_mae, untRelUnidosContasPagarContasPagas_mae,
  unt_cad_receitas_mae, untTransferenciaFinanceira_mae,
  untCadFormaPgto_mae, untListDespRec_mae, untResumoFinal_mae,
  untContasReceber_mae, untEmprestimosPagar_mae;


{$R *.dfm}

procedure Tfrm_menu.DataemDiassemana1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_data_dias_semana, frm_data_dias_semana);
  frm_data_dias_semana.show;
end;

procedure Tfrm_menu.Lembrete1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_contas_pagar, frm_contas_pagar);
  frm_contas_pagar.show;

end;

procedure Tfrm_menu.ipoDespesa1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTipoDespesa, frmCadTipoDespesa);
  frmCadTipoDespesa.show;
end;

procedure Tfrm_menu.CadDespesas1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_despesas, frm_cad_despesas);
  frm_cad_despesas.show;
end;

procedure Tfrm_menu.RelGeral1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rel_data_tipo, frm_rel_data_tipo);
  frm_rel_data_tipo.show;
end;

procedure Tfrm_menu.ReceitasXDespesas1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListDespRec, frmListDespRec);
  frmListDespRec.show;
end;

procedure Tfrm_menu.OBS2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_obs, frm_obs);
  frm_obs.show;
end;

procedure Tfrm_menu.CadReceita1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_receitas, frm_cad_receitas);
  frm_cad_receitas.show;
end;

procedure Tfrm_menu.CadTipoReceita2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTipoReceita, frmCadTipoReceita);
  frmCadTipoReceita.show;
end;

procedure Tfrm_menu.ransferenciaFinanceira1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmTransferenciaFinanceira, frmTransferenciaFinanceira);
  frmTransferenciaFinanceira.show;
end;

procedure Tfrm_menu.ResumoGeral1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmResumoFinal, frmResumoFinal);
  frmResumoFinal.show;
end;

procedure Tfrm_menu.EmprestimoaReceber1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmContasReceber, frmContasReceber);
  frmContasReceber.show;
end;

procedure Tfrm_menu.EmprestimosaPagar1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmEmprestimosPagar, frmEmprestimosPagar);
  frmEmprestimosPagar.show;
end;

procedure Tfrm_menu.JuntarDesppessoalcdespsitio1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmJuntarPessoalSitio, frmJuntarPessoalSitio);
  frmJuntarPessoalSitio.show;
end;

procedure Tfrm_menu.AgendaTelefone1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmAgendaTelefone, frmAgendaTelefone);
  frmAgendaTelefone.show;
end;

procedure Tfrm_menu.CotacaodeCompras1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cotacao_compra, frm_cotacao_compra);
  frm_cotacao_compra.show;
end;

procedure Tfrm_menu.Unidade1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadUnidade, frmCadUnidade);
  frmCadUnidade.show;
end;

procedure Tfrm_menu.Grupo1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_grupo, frm_cad_grupo);
  frm_cad_grupo.show;
end;

procedure Tfrm_menu.Produto1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmProduto, frmProduto);
  frmProduto.show;
end;

procedure Tfrm_menu.FormadePagamento1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadFormaPgto, frmCadFormaPgto);
  frmCadFormaPgto.show;
end;

procedure Tfrm_menu.ItensComprados1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmProdutosComprados, frmProdutosComprados);
  frmProdutosComprados.show;
end;

procedure Tfrm_menu.Configurao1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmConfiguracaoCotacao, frmConfiguracaoCotacao);
  frmConfiguracaoCotacao.show;
end;

procedure Tfrm_menu.RelatorioUnidoC1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelUnidosContasPagarContasPagas, frmRelUnidosContasPagarContasPagas);
  frmRelUnidosContasPagarContasPagas.show;
end;

procedure Tfrm_menu.CadDespesaMe1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_despesas_mae, frm_cad_despesas_mae);
  frm_cad_despesas_mae.show;
end;

procedure Tfrm_menu.RelGeralMe1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rel_data_tipo_mae, frm_rel_data_tipo_mae);
  frm_rel_data_tipo_mae.show;
end;

procedure Tfrm_menu.RelatrioUnidoMe1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelUnidosContasPagarContasPagas_mae, frmRelUnidosContasPagarContasPagas_mae);
  frmRelUnidosContasPagarContasPagas_mae.show;
end;

procedure Tfrm_menu.CadReceitaMe1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_receitas_mae, frm_cad_receitas_mae);
  frm_cad_receitas_mae.show;
end;

procedure Tfrm_menu.ransfe1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmTransferenciaFinanceira_mae, frmTransferenciaFinanceira_mae);
  frmTransferenciaFinanceira_mae.show;
end;

procedure Tfrm_menu.FormaPagamentoMe1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadFormaPgto_mae, frmCadFormaPgto_mae);
  frmCadFormaPgto_mae.show;
end;

procedure Tfrm_menu.ReceitasXDespesasMe1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListDespRec_mae, frmListDespRec_mae);
  frmListDespRec_mae.show;
end;

procedure Tfrm_menu.ResumoGeralMe1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmResumoFinal_mae, frmResumoFinal_mae);
  frmResumoFinal_mae.show;
end;

procedure Tfrm_menu.EmprestimosaReceber1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmContasReceber_mae, frmContasReceber_mae);
  frmContasReceber_mae.show;
end;

procedure Tfrm_menu.EmprstimosaPagar1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmEmprestimosPagar_mae, frmEmprestimosPagar_mae);
  frmEmprestimosPagar_mae.show;
end;

end.
