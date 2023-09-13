program desp_pessoais;

uses
  Forms,
  unt_menu in 'unt_menu.pas' {frm_menu},
  unt_cad_despesas in 'unt_cad_despesas.pas' {frm_cad_despesas},
  unt_modulo in 'unt_modulo.pas' {dm: TDataModule},
  unt_rel_data_tipo in 'unt_rel_data_tipo.pas' {frm_rel_data_tipo},
  untrel_data_tipo in 'untrel_data_tipo.pas' {frmrel_data_tipo},
//  unt_data_dias_semana in 'unt_data_dias_semana.pas' {frm_data_dias_semana},
  unt_contas_pagar in 'unt_contas_pagar.pas' {frm_contas_pagar},
//  unt_obs in 'unt_obs.pas' {frm_obs},
  untConfirmarBaixaContasPagar in 'untConfirmarBaixaContasPagar.pas' {frmConfirmarBaixaContasPagar},
//  untRelMediaDesp in 'untRelMediaDesp.pas' {frmRelMediaDesp},
//  untRelMediaDesp2 in 'untRelMediaDesp2.pas' {frmRelMediaDesp2},
//  untGraficoDespesa in 'untGraficoDespesa.pas' {frmGraficoDespesa},
//  unt_cad_receitas in 'unt_cad_receitas.pas' {frm_cad_receitas},
//  untRelRecDesp in 'untRelRecDesp.pas' {frmRelRecDesp},
//  untListDespRec in 'untListDespRec.pas' {frmListDespRec},
  untCadTipoDespesa in 'untCadTipoDespesa.pas' {frmCadTipoDespesa},
  untRelContasPagar in 'untRelContasPagar.pas' {frmRelContasPagar},
//  untCadTipoReceita in 'untCadTipoReceita.pas' {frmCadTipoReceita},
//  untTransferenciaFinanceira in 'untTransferenciaFinanceira.pas' {frmTransferenciaFinanceira},
//  untResumoFinal in 'untResumoFinal.pas' {frmResumofinal},
//  untRelTransfFinanc in 'untRelTransfFinanc.pas' {frmRelTransfFinanc},
//  untRelCadReceita in 'untRelCadReceita.pas' {frmRelCadReceita},
  untRelCadDespesa in 'untRelCadDespesa.pas' {frmRelCadDespesa},
  untBaixaParcialParcela in 'untBaixaParcialParcela.pas' {frmBaixaParcialParcela},
//  untContasReceber in 'untContasReceber.pas' {frmContasReceber},
//  untReceberEmprestimo in 'untReceberEmprestimo.pas' {frmReceberEmprestimo},
//  untEmprestimosPagar in 'untEmprestimosPagar.pas' {frmEmprestimosPagar},
//  untPagarEmprestimo in 'untPagarEmprestimo.pas' {frmPagarEmprestimo},
  untJuntarPessoalSitio in 'untJuntarPessoalSitio.pas' {frmJuntarPessoalSitio},
  untRelTipoDespesa in 'untRelTipoDespesa.pas' {frmRelTipoDespesa},
  untContasPagarParcelas in 'untContasPagarParcelas.pas' {frmContasPagarParcelas},
  untBaixaParcialParcela2 in 'untBaixaParcialParcela2.pas' {frmBaixaParcialParcela2},
  untConfirmarBaixaContasPagar2 in 'untConfirmarBaixaContasPagar2.pas' {frmConfirmarBaixaContasPagar2},
//  untAgendaTelefone in 'untAgendaTelefone.pas' {frmAgendaTelefone},
//  untCotacaoCompra in 'untCotacaoCompra.pas' {frm_cotacao_compra},
  untProduto in 'untProduto.pas' {frmProduto},
//  untInserirFornecedorCotacao in 'untInserirFornecedorCotacao.pas' {frmInserirFornecedorCotacao},
  untCadUnidade in 'untCadUnidade.pas' {frmCadUnidade},
  unt_cad_grupo in 'unt_cad_grupo.pas' {frm_cad_grupo},
//  untInserirValorProduto in 'untInserirValorProduto.pas' {frmInserirValorProduto},
//  untRelCotacaoFornecedores in 'untRelCotacaoFornecedores.pas' {frmRelCotacaoFornecedores},
//  untPesqCotacaoCompra in 'untPesqCotacaoCompra.pas' {frmPesqCotacaoCompra},
  untAjudaContasPagar in 'untAjudaContasPagar.pas' {frmAjudaContasPagar},
//  untGerarPedidoCompra_cotacao in 'untGerarPedidoCompra_cotacao.pas' {frmGerarPedidoCompra_cotacao},
//  untCadFormaPgto in 'untCadFormaPgto.pas' {frmCadFormaPgto},
  unt_funcoes in 'unt_funcoes.pas',
  untPesqCotacaoCompraDesp in 'untPesqCotacaoCompraDesp.pas' {frmPesqCotacaoCompraDesp},
  untItensCotacaoCompra in 'untItensCotacaoCompra.pas' {frmItensCotacaoCompra},
  untItensCotacaoContasPagar in 'untItensCotacaoContasPagar.pas' {frmItensCotacaoContasPagar},
//  untRelCotacaoGrupoProd in 'untRelCotacaoGrupoProd.pas' {frmRelCotacaoGrupoProd},
  untProdutosComprados in 'untProdutosComprados.pas' {frmProdutosComprados},
  untConfiguracaoCotacao in 'untConfiguracaoCotacao.pas' {frmConfiguracaoCotacao},
//  untRelCotacaoFornecedorGrupoProd in 'untRelCotacaoFornecedorGrupoProd.pas' {frmRelCotacaoFornecedorGrupoProd},
//  UNTcONVERSAO in 'UNTcONVERSAO.pas' {frmconversor},
  untBaixaDeUmaVez in 'untBaixaDeUmaVez.pas' {frmBaixaDeUmaVez},
  untRelUnidosContasPagarContasPagas in 'untRelUnidosContasPagarContasPagas.pas' {frmRelUnidosContasPagarContasPagas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_menu, frm_menu);
  Application.CreateForm(Tdm, dm);
//  Application.CreateForm(TfrmConfirmarBaixaContasPagar, frmConfirmarBaixaContasPagar);
//  Application.CreateForm(TfrmRelMediaDesp, frmRelMediaDesp);
//  Application.CreateForm(TfrmRelMediaDesp2, frmRelMediaDesp2);
//  Application.CreateForm(TfrmGraficoDespesa, frmGraficoDespesa);
//  Application.CreateForm(Tfrm_cad_receitas, frm_cad_receitas);
//  Application.CreateForm(TfrmRelRecDesp, frmRelRecDesp);
//  Application.CreateForm(TfrmListDespRec, frmListDespRec);
//  Application.CreateForm(TfrmCadTipoDespesa, frmCadTipoDespesa);
  Application.CreateForm(TfrmRelContasPagar, frmRelContasPagar);
//  Application.CreateForm(TfrmCadTipoReceita, frmCadTipoReceita);
//  Application.CreateForm(TfrmTransferenciaFinanceira, frmTransferenciaFinanceira);
//  Application.CreateForm(TfrmResumofinal, frmResumofinal);
//  Application.CreateForm(TfrmRelTransfFinanc, frmRelTransfFinanc);
//  Application.CreateForm(TfrmRelCadReceita, frmRelCadReceita);
  Application.CreateForm(TfrmRelCadDespesa, frmRelCadDespesa);
//  Application.CreateForm(TfrmBaixaParcialParcela, frmBaixaParcialParcela);
//  Application.CreateForm(TfrmContasReceber, frmContasReceber);
//  Application.CreateForm(TfrmReceberEmprestimo, frmReceberEmprestimo);
//  Application.CreateForm(TfrmEmprestimosPagar, frmEmprestimosPagar);
//  Application.CreateForm(TfrmPagarEmprestimo, frmPagarEmprestimo);
//  Application.CreateForm(TfrmJuntarPessoalSitio, frmJuntarPessoalSitio);
  Application.CreateForm(TfrmRelTipoDespesa, frmRelTipoDespesa);
//  Application.CreateForm(TfrmContasPagarParcelas, frmContasPagarParcelas);
//  Application.CreateForm(TfrmBaixaParcialParcela2, frmBaixaParcialParcela2);
//  Application.CreateForm(TfrmConfirmarBaixaContasPagar2, frmConfirmarBaixaContasPagar2);
//  Application.CreateForm(TfrmAgendaTelefone, frmAgendaTelefone);
//  Application.CreateForm(TfrmProduto, frmProduto);
//  Application.CreateForm(TfrmInserirFornecedorCotacao, frmInserirFornecedorCotacao);
//  Application.CreateForm(Tfrm_cad_grupo, frm_cad_grupo);
//  Application.CreateForm(TfrmInserirValorProduto, frmInserirValorProduto);
//  Application.CreateForm(TfrmRelCotacaoFornecedores, frmRelCotacaoFornecedores);
//  Application.CreateForm(TfrmPesqCotacaoCompra, frmPesqCotacaoCompra);
//  Application.CreateForm(TfrmAjudaContasPagar, frmAjudaContasPagar);
//  Application.CreateForm(TfrmGerarPedidoCompra_cotacao, frmGerarPedidoCompra_cotacao);
//  Application.CreateForm(TfrmCadFormaPgto, frmCadFormaPgto);
//  Application.CreateForm(TfrmPesqCotacaoCompraDesp, frmPesqCotacaoCompraDesp);
//  Application.CreateForm(TfrmItensCotacaoCompra, frmItensCotacaoCompra);
//  Application.CreateForm(TfrmItensCotacaoContasPagar, frmItensCotacaoContasPagar);
//  Application.CreateForm(TfrmRelCotacaoGrupoProd, frmRelCotacaoGrupoProd);
//  Application.CreateForm(TfrmProdutosComprados, frmProdutosComprados);
//  Application.CreateForm(TfrmConfiguracaoCotacao, frmConfiguracaoCotacao);
//  Application.CreateForm(TfrmRelCotacaoFornecedorGrupoProd, frmRelCotacaoFornecedorGrupoProd);
//  Application.CreateForm(Tfrmconversor, frmconversor);
//  Application.CreateForm(TfrmBaixaDeUmaVez, frmBaixaDeUmaVez);
//  Application.CreateForm(TfrmRelUnidosContasPagarContasPagas, frmRelUnidosContasPagarContasPagas);
  Application.Run;
end.
