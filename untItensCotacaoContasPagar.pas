unit untItensCotacaoContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmItensCotacaoContasPagar = class(TForm)
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbl4: TLabel;
    txtFornecedor: TEdit;
    Button2: TButton;
    txt_cod_fornecedor: TEdit;
    txtCotacao: TEdit;
    DBGrid7: TDBGrid;
    btnGravar: TButton;
    txt_total: TCurrencyEdit;
    txt_codigo: TEdit;
    qryCotacao: TIBQuery;
    qry_Pesquisa: TIBQuery;
    dsCotacao: TDataSource;
    qryCotacaoPRO_CODIGO: TIntegerField;
    qryCotacaoPRO_DESCRICAO: TIBStringField;
    qryCotacaoCOT_UNIDADE: TIBStringField;
    qryCotacaoCOT_QTD: TFloatField;
    qryCotacaoCOT_VALOR: TIBBCDField;
    qryCotacaoVALOR_TOTAL: TFloatField;
    mmoCodigo: TMemo;
    Label4: TLabel;
    txtTotalContasSelecionadas: TCurrencyEdit;
    procedure Button2Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItensCotacaoContasPagar: TfrmItensCotacaoContasPagar;

implementation

uses unt_modulo, untPesqCotacaoCompraDesp, unt_contas_pagar;

{$R *.dfm}

procedure TfrmItensCotacaoContasPagar.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqCotacaoCompraDesp, frmPesqCotacaoCompraDesp);
  frmPesqCotacaoCompraDesp.pesquisar := 'Contas_Pagar';
  frmPesqCotacaoCompraDesp.ShowModal;
end;

procedure TfrmItensCotacaoContasPagar.btnGravarClick(Sender: TObject);
var
  i : integer;
begin
  if mmoCodigo.Text = '' then
  begin
    showmessage('Marque com chicked as conta(s) desejada(s)');
    exit;
  end;

  for i:=0 to mmoCodigo.Lines.Count do
  begin

    if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
      frm_contas_pagar.IBTRANSLOCAL.StartTransaction;
    frm_contas_pagar.qry_contas_pagar.Close;
    frm_contas_pagar.qry_contas_pagar.SQL.Clear;
    frm_contas_pagar.qry_contas_pagar.SQL.Add('UPDATE CONTAS_PAGAR SET COT_CODIGO=:COT_CODIGO, AT_CODIGO=:AT_CODIGO '+
                                              ' WHERE CODIGO=:CODIGO                                                ');
    frm_contas_pagar.qry_contas_pagar.ParamByName('CODIGO').AsString       := mmoCodigo.Lines.Strings[i];
    frm_contas_pagar.qry_contas_pagar.ParamByName('COT_CODIGO').AsString   := txtCotacao.Text;
    frm_contas_pagar.qry_contas_pagar.ParamByName('AT_CODIGO').AsString    := txt_cod_fornecedor.text;

    frm_contas_pagar.qry_contas_pagar.ExecSQL;
    frm_contas_pagar.IBTRANSLOCAL.Commit;

  end;

  if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
      frm_contas_pagar.IBTRANSLOCAL.InTransaction;
  frm_contas_pagar.qry_contas_pagar.Close;
  frm_contas_pagar.qry_contas_pagar.SQL.Clear;
  frm_contas_pagar.qry_contas_pagar.SQL.Add('UPDATE ITENS_COTACAO_FORNEC_VENC SET COT_COMPRA_EFETUADA=:COT_COMPRA_EFETUADA '+
                                            ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO                      ');
  frm_contas_pagar.qry_contas_pagar.ParamByName('COT_CODIGO').AsString :=  txtCotacao.Text;
  frm_contas_pagar.qry_contas_pagar.ParamByName('FOR_CODIGO').AsString  :=  txt_Cod_Fornecedor.Text;
  frm_contas_pagar.qry_contas_pagar.ParamByName('COT_COMPRA_EFETUADA').AsString  :=  'S';
  frm_contas_pagar.qry_contas_pagar.ExecSQL;
  frm_contas_pagar.IBTRANSLOCAL.Commit;


  close;

end;

procedure TfrmItensCotacaoContasPagar.FormShow(Sender: TObject);
var
  total: real;
  item_checked, item_com_cotacao: boolean;
begin

  frm_contas_pagar.cdsMostraDados.First;

  total:= 0;

  item_checked:= false;
  item_com_cotacao:= false;

  while not frm_contas_pagar.cdsMostraDados.Eof do
  begin

    if (frm_contas_pagar.cdsMostraDados.FieldByName('CHECKED').AsString = 'T') then
    begin
       total := total + frm_contas_pagar.cdsMostraDados.fieldbyname('valor').asfloat;
       item_checked:= true;
    end;

    if (frm_contas_pagar.cdsMostraDados.fieldbyname('COT_CODIGO').AsString <> '') and (frm_contas_pagar.cdsMostraDados.FieldByName('CHECKED').AsString = 'T') then
    begin

       item_com_cotacao:= true;

       txtCotacao.Text := frm_contas_pagar.cdsMostraDados.fieldbyname('COT_CODIGO').AsString;
       txt_cod_fornecedor.Text := frm_contas_pagar.cdsMostraDados.fieldbyname('AT_CODIGO').AsString;

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
       qryCotacao.ParamByName('COT_CODIGO').AsString := frm_contas_pagar.cdsMostraDados.fieldbyname('COT_CODIGO').AsString;
       qryCotacao.ParamByName('FOR_CODIGO').AsString := frm_contas_pagar.cdsMostraDados.fieldbyname('AT_CODIGO').AsString;
       qryCotacao.Open;

       qry_Pesquisa.close;
       qry_Pesquisa.SQL.Clear;
       qry_Pesquisa.SQL.Add('SELECT SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                         '+
                            ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                 '+
                            ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual    '+
                            ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO          ');
       qry_Pesquisa.ParamByName('COT_CODIGO').AsString := frm_contas_pagar.cdsMostraDados.fieldbyname('COT_CODIGO').AsString;
       qry_Pesquisa.ParamByName('FOR_CODIGO').AsString := frm_contas_pagar.cdsMostraDados.fieldbyname('AT_CODIGO').AsString;
       qry_Pesquisa.Open;

       txt_total.Value := qry_Pesquisa.fieldbyname('VALOR_TOTAL').asfloat;

    end;

    frm_contas_pagar.cdsMostraDados.Next;

  end;

  txtTotalContasSelecionadas.Value := total;

  if item_com_cotacao= false then
  begin
    if item_checked = false then
       btnGravar.Enabled := false
    else
       btnGravar.Enabled := true;
  end
  else
  begin
    btnGravar.Enabled := false;
  end;

end;

end.
