unit untItensCotacaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ToolEdit, CurrEdit, Grids, DBGrids, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmItensCotacaoCompra = class(TForm)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbl4: TLabel;
    txtFornecedor: TEdit;
    txt_cod_fornecedor: TEdit;
    txtCotacao: TEdit;
    DBGrid7: TDBGrid;
    txt_total: TCurrencyEdit;
    qryCotacao: TIBQuery;
    dsCotacao: TDataSource;
    qry_Pesquisa: TIBQuery;
    qryCotacaoPRO_CODIGO: TIntegerField;
    qryCotacaoPRO_DESCRICAO: TIBStringField;
    qryCotacaoCOT_UNIDADE: TIBStringField;
    qryCotacaoCOT_QTD: TFloatField;
    qryCotacaoCOT_VALOR: TIBBCDField;
    qryCotacaoVALOR_TOTAL: TFloatField;
    txt_obs: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  pesquisar : string;
    { Public declarations }
  end;

var
  frmItensCotacaoCompra: TfrmItensCotacaoCompra;

implementation

uses unt_modulo, unt_rel_data_tipo, untContasPagarParcelas,
  untRelUnidosContasPagarContasPagas,
  untRelUnidosContasPagarContasPagas_mae, unt_rel_data_tipo_mae;

{$R *.dfm}

procedure TfrmItensCotacaoCompra.FormShow(Sender: TObject);
begin
  if pesquisar = 'Cad_Despesa Contas_Pagar' then
  begin
    txtCotacao.Text := frmRelUnidosContasPagarContasPagas.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    txt_cod_fornecedor.Text := frmRelUnidosContasPagarContasPagas.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;

    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT AT_NOME FROM AGENDA_TELEFONE WHERE AT_CODIGO=:AT_CODIGO');
    qry_pesquisa.ParamByName('AT_CODIGO').AsString := txt_cod_fornecedor.Text;
    qry_pesquisa.Open;

    txtFornecedor.Text := qry_pesquisa.fieldbyname('AT_NOME').AsString;

    qryCotacao.Close;
    qryCotacao.SQL.Clear;
    qryCotacao.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,   '+
                       ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                    '+
                       ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                      '+
                       ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual         '+
                       ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO               '+
                       ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor  '+
                       ' ORDER BY P.pro_DESCRICAO                                                       ');
    qryCotacao.ParamByName('COT_CODIGO').AsString := frmRelUnidosContasPagarContasPagas.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    qryCotacao.ParamByName('FOR_CODIGO').AsString := frmRelUnidosContasPagarContasPagas.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;
    qryCotacao.Open; 
       
    qry_Pesquisa.close;
    qry_Pesquisa.SQL.Clear;
    qry_Pesquisa.SQL.Add('SELECT SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                         '+
                         ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                 '+
                         ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual    '+
                         ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO          ');
    qry_Pesquisa.ParamByName('COT_CODIGO').AsString := frmRelUnidosContasPagarContasPagas.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    qry_Pesquisa.ParamByName('FOR_CODIGO').AsString := frmRelUnidosContasPagarContasPagas.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;
    qry_Pesquisa.Open;

    txt_total.Value := qry_Pesquisa.fieldbyname('VALOR_TOTAL').asfloat;

    qry_Pesquisa.close;
    qry_Pesquisa.SQL.Clear;
    qry_Pesquisa.SQL.Add('SELECT COT_OBS FROM cotacao_compra '+
                         ' WHERE COT_CODIGO =:COT_CODIGO     ');
    qry_Pesquisa.ParamByName('COT_CODIGO').AsString := txtCotacao.Text;
    qry_Pesquisa.Open;

    txt_obs.Text := qry_Pesquisa.fieldbyname('COT_OBS').AsString;

  end;

  if pesquisar = 'Cad_Despesa_mae Contas_Pagar' then
  begin
    txtCotacao.Text := frmRelUnidosContasPagarContasPagas_mae.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    txt_cod_fornecedor.Text := frmRelUnidosContasPagarContasPagas_mae.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;

    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT AT_NOME FROM AGENDA_TELEFONE WHERE AT_CODIGO=:AT_CODIGO');
    qry_pesquisa.ParamByName('AT_CODIGO').AsString := txt_cod_fornecedor.Text;
    qry_pesquisa.Open;

    txtFornecedor.Text := qry_pesquisa.fieldbyname('AT_NOME').AsString;

    qryCotacao.Close;
    qryCotacao.SQL.Clear;
    qryCotacao.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,   '+
                       ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                    '+
                       ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                      '+
                       ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual         '+
                       ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO               '+
                       ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor  '+
                       ' ORDER BY P.pro_DESCRICAO                                                       ');
    qryCotacao.ParamByName('COT_CODIGO').AsString := frmRelUnidosContasPagarContasPagas_mae.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    qryCotacao.ParamByName('FOR_CODIGO').AsString := frmRelUnidosContasPagarContasPagas_mae.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;
    qryCotacao.Open; 
       
    qry_Pesquisa.close;
    qry_Pesquisa.SQL.Clear;
    qry_Pesquisa.SQL.Add('SELECT SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                         '+
                         ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                 '+
                         ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual    '+
                         ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO          ');
    qry_Pesquisa.ParamByName('COT_CODIGO').AsString := frmRelUnidosContasPagarContasPagas_mae.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    qry_Pesquisa.ParamByName('FOR_CODIGO').AsString := frmRelUnidosContasPagarContasPagas_mae.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;
    qry_Pesquisa.Open;

    txt_total.Value := qry_Pesquisa.fieldbyname('VALOR_TOTAL').asfloat;

    qry_Pesquisa.close;
    qry_Pesquisa.SQL.Clear;
    qry_Pesquisa.SQL.Add('SELECT COT_OBS FROM cotacao_compra '+
                         ' WHERE COT_CODIGO =:COT_CODIGO     ');
    qry_Pesquisa.ParamByName('COT_CODIGO').AsString := txtCotacao.Text;
    qry_Pesquisa.Open;

    txt_obs.Text := qry_Pesquisa.fieldbyname('COT_OBS').AsString;

  end;

  if pesquisar = 'Cad_Despesa' then
  begin
    txtCotacao.Text := frm_rel_data_tipo.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    txt_cod_fornecedor.Text := frm_rel_data_tipo.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;

    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT AT_NOME FROM AGENDA_TELEFONE WHERE AT_CODIGO=:AT_CODIGO');
    qry_pesquisa.ParamByName('AT_CODIGO').AsString := txt_cod_fornecedor.Text;
    qry_pesquisa.Open;

    txtFornecedor.Text := qry_pesquisa.fieldbyname('AT_NOME').AsString;

    qryCotacao.Close;
    qryCotacao.SQL.Clear;
    qryCotacao.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,                  '+
                       ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                                   '+
                       ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                                     '+
                       ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual                        '+
                       ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO                              '+
                       ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor                 '+
                       ' ORDER BY P.pro_DESCRICAO                                                                      ');
    qryCotacao.ParamByName('COT_CODIGO').AsString := frm_rel_data_tipo.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    qryCotacao.ParamByName('FOR_CODIGO').AsString := frm_rel_data_tipo.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;
    qryCotacao.Open;

    qry_Pesquisa.close;
    qry_Pesquisa.SQL.Clear;
    qry_Pesquisa.SQL.Add('SELECT SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                         '+
                         ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                 '+
                         ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual    '+
                         ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO          ');
    qry_Pesquisa.ParamByName('COT_CODIGO').AsString := frm_rel_data_tipo.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    qry_Pesquisa.ParamByName('FOR_CODIGO').AsString := frm_rel_data_tipo.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;
    qry_Pesquisa.Open;

    txt_total.Value := qry_Pesquisa.fieldbyname('VALOR_TOTAL').asfloat;

  end;

  if pesquisar = 'Cad_Despesa_mae' then
  begin
    txtCotacao.Text := frm_rel_data_tipo_mae.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    txt_cod_fornecedor.Text := frm_rel_data_tipo_mae.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;

    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT AT_NOME FROM AGENDA_TELEFONE WHERE AT_CODIGO=:AT_CODIGO');
    qry_pesquisa.ParamByName('AT_CODIGO').AsString := txt_cod_fornecedor.Text;
    qry_pesquisa.Open;

    txtFornecedor.Text := qry_pesquisa.fieldbyname('AT_NOME').AsString;

    qryCotacao.Close;
    qryCotacao.SQL.Clear;
    qryCotacao.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,                  '+
                       ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                                   '+
                       ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                                     '+
                       ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual                        '+
                       ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO                              '+
                       ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor                 '+
                       ' ORDER BY P.pro_DESCRICAO                                                                      ');
    qryCotacao.ParamByName('COT_CODIGO').AsString := frm_rel_data_tipo_mae.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    qryCotacao.ParamByName('FOR_CODIGO').AsString := frm_rel_data_tipo_mae.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;
    qryCotacao.Open;

    qry_Pesquisa.close;
    qry_Pesquisa.SQL.Clear;
    qry_Pesquisa.SQL.Add('SELECT SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                         '+
                         ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                 '+
                         ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual    '+
                         ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO          ');
    qry_Pesquisa.ParamByName('COT_CODIGO').AsString := frm_rel_data_tipo_mae.qry_pesquisa.fieldbyname('COT_CODIGO').AsString;
    qry_Pesquisa.ParamByName('FOR_CODIGO').AsString := frm_rel_data_tipo_mae.qry_pesquisa.fieldbyname('AT_CODIGO').AsString;
    qry_Pesquisa.Open;

    txt_total.Value := qry_Pesquisa.fieldbyname('VALOR_TOTAL').asfloat;

  end;

  if pesquisar = 'Contas_Pagar' then
  begin
    txtCotacao.Text := frmContasPagarParcelas.qryContasPagarParcela.fieldbyname('COT_CODIGO').AsString;
    txt_cod_fornecedor.Text := frmContasPagarParcelas.qryContasPagarParcela.fieldbyname('AT_CODIGO').AsString;

    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT AT_NOME FROM AGENDA_TELEFONE WHERE AT_CODIGO=:AT_CODIGO');
    qry_pesquisa.ParamByName('AT_CODIGO').AsString := txt_cod_fornecedor.Text;
    qry_pesquisa.Open;

    txtFornecedor.Text := qry_pesquisa.fieldbyname('AT_NOME').AsString;

    qryCotacao.Close;
    qryCotacao.SQL.Clear;
    qryCotacao.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,   '+
                       ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                    '+
                       ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                      '+
                       ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual         '+
                       ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO               '+
                       ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor  '+
                       ' ORDER BY P.pro_DESCRICAO                                                       ');
    qryCotacao.ParamByName('COT_CODIGO').AsString := frmContasPagarParcelas.qryContasPagarParcela.fieldbyname('COT_CODIGO').AsString;
    qryCotacao.ParamByName('FOR_CODIGO').AsString := frmContasPagarParcelas.qryContasPagarParcela.fieldbyname('AT_CODIGO').AsString;
    qryCotacao.Open;

    qry_Pesquisa.close;
    qry_Pesquisa.SQL.Clear;
    qry_Pesquisa.SQL.Add('SELECT SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                         '+
                         ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                 '+
                         ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual    '+
                         ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO          ');
    qry_Pesquisa.ParamByName('COT_CODIGO').AsString := frmContasPagarParcelas.qryContasPagarParcela.fieldbyname('COT_CODIGO').AsString;
    qry_Pesquisa.ParamByName('FOR_CODIGO').AsString := frmContasPagarParcelas.qryContasPagarParcela.fieldbyname('AT_CODIGO').AsString;
    qry_Pesquisa.Open;

    txt_total.Value := qry_Pesquisa.fieldbyname('VALOR_TOTAL').asfloat;

  end;


end;

end.
