unit untInserirValorProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ToolEdit, CurrEdit, StdCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TfrmInserirValorProduto = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    txt_cod_fornec: TEdit;
    txt_fornecedor: TEdit;
    btnGravar: TBitBtn;
    txt_cod_barra: TEdit;
    txt_cod_produto: TEdit;
    txt_produto: TEdit;
    txt_unidade: TEdit;
    txt_valor: TCurrencyEdit;
    txt_Quantidade: TRxCalcEdit;
    Label8: TLabel;
    IBTransLocal: TIBTransaction;
    qryTransLocal: TIBQuery;
    qryPesquisa: TIBQuery;
    qryPesqAux: TIBQuery;
    Label1: TLabel;
    txt_obs: TEdit;
    procedure txt_valorEnter(Sender: TObject);
    procedure txt_valorExit(Sender: TObject);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInserirValorProduto: TfrmInserirValorProduto;

implementation

uses untCotacaoCompra, unt_modulo;

{$R *.dfm}

procedure TfrmInserirValorProduto.txt_valorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure TfrmInserirValorProduto.txt_valorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure TfrmInserirValorProduto.txt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;

  if key=#27 then
    close;

end;

procedure TfrmInserirValorProduto.btnGravarClick(Sender: TObject);
var
  cod_fornec, empate, cod_cotacao : string;
  valor : real;
  i : integer;
begin

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA_FORNEC SET COT_VALOR=:COT_VALOR, COT_OBS=:COT_OBS        '+
                        ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo and FOR_CODIGO=:FOR_CODIGO ');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryTransLocal.ParamByName('FOR_CODIGO').AsString := txt_cod_fornec.Text;
  qryTransLocal.ParamByName('COT_VALOR').AsFloat   := txt_valor.Value;
  qryTransLocal.ParamByName('COT_OBS').AsString    := txt_OBS.Text;

  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  //////VERIFICA VALOR VENCEDOR//////////

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT F.AT_CODIGO, F.AT_NOME, I.COT_VALOR                                                                                   '+
                      ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I, produto p                                                            '+
                      ' WHERE I.for_codigo = F.AT_codigo AND p.pro_codigo = i.pro_codigo and I.COT_CODIGO =:COT_CODIGO and i.pro_codigo=:pro_codigo '+
                      ' ORDER BY I.COT_VALOR                                                                                                        ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryPesquisa.Open;
  qryPesquisa.First;

  valor := 999999999;
  cod_fornec := '';
  empate := '';
  i:= 0;

  while not qryPesquisa.Eof do
  begin
    if (qryPesquisa.FieldByName('COT_VALOR').AsString <> '') AND (qryPesquisa.FieldByName('COT_VALOR').Asfloat > 0 ) then
    begin
      if qryPesquisa.FieldByName('COT_VALOR').AsFloat <= valor then
      begin
        valor := qryPesquisa.FieldByName('COT_VALOR').AsFloat;
        cod_fornec := qryPesquisa.FieldByName('AT_CODIGO').asstring;

        if qryPesquisa.FieldByName('COT_VALOR').AsFloat = valor then
        begin
          empate := 'S';
          i:= i+1;
        end;

      end;
    end;
    qryPesquisa.Next;
  end;

  if cod_fornec <> '' then
  begin
    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET COT_VALOR=:COT_VALOR, FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL, '+
                          ' COT_EMPATE=:COT_EMPATE, COT_DATA_COMPRA_ULT=:COT_DATA_COMPRA_ULT, COT_OBS=:COT_OBS       '+
                          ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo                                 ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cod_fornec;
    qryTransLocal.ParamByName('COT_VALOR').AsFloat   := valor;
    qryTransLocal.ParamByName('COT_OBS').AsString := txt_obs.Text;
    qryTransLocal.ParamByName('COT_DATA_COMPRA_ULT').AsString := frm_cotacao_compra.dta_vencimento.Text;

    if (empate = 'S') and (i>=2) then
      qryTransLocal.ParamByName('COT_EMPATE').AsString := 'S'
    else
      qryTransLocal.ParamByName('COT_EMPATE').AsString := '';

    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;

  end;

  /////FIM VERIFICA VALOR VENCEDOR/////////

  /////VERIFICA SE FORNECEDOR PARTICIPA DOS CAMPEOES/////////

  if cod_fornec <> '' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC   '+
                        ' WHERE COT_CODIGO=:COT_CODIGO                      ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.First;

    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    WHILE not qryPesquisa.Eof do
    begin
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO_ATUAL FROM ITENS_COTACAO_COMPRA                    '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO_ATUAL').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;
      qryPesqAux.Open;

      IF qryPesqAux.IsEmpty then
      begin
        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_FORNEC_VENC                    '+
                              ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;

        qryTransLocal.ExecSQL;
      end;

      qryPesquisa.Next;
    end;

    IBTransLocal.Commit;

    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FOR_CODIGO_ATUAL, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE              '+
                        ' FROM ITENS_COTACAO_COMPRA                                                  '+
                        ' WHERE COT_CODIGO=:COT_CODIGO AND                                           '+
                        ' (FOR_CODIGO_ATUAL IS NOT null or FOR_CODIGO_ATUAL <> '+ #39 + ''+ #39 + ') ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.First;

    while not qryPesquisa.Eof do
    begin
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC   '+
         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
      qryPesqAux.Open;

      if qryPesqAux.IsEmpty then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                             '+
                              ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE ) '+
                              ' VALUES                                                           '+
                              ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA, :COT_VALOR_FRETE ) ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
        qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := qryPesquisa.fieldbyname('COT_PREVISAO_ENTREGA').AsString;
        qryTransLocal.ParamByName('COT_VALOR_FRETE').AsString := qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsString;

        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;

      end;
    qryPesquisa.Next;

    end;

  end;
  frm_cotacao_compra.qryProdutoFornecVenc.Close;
  frm_cotacao_compra.qryProdutoFornecVenc.SQL.Clear;
  frm_cotacao_compra.qryProdutoFornecVenc.SQL.Add('SELECT P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,     '+
                                                  ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                     '+
                                                  ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                       '+
                                                  ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual          '+
                                                  ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO                '+
                                                  ' GROUP BY P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor  '+
                                                  ' ORDER BY P.pro_codigo                                                           ');
  frm_cotacao_compra.qryProdutoFornecVenc.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  frm_cotacao_compra.qryProdutoFornecVenc.ParamByName('FOR_CODIGO').AsString := txt_cod_fornec.Text;
  frm_cotacao_compra.qryProdutoFornecVenc.Open;

  cod_cotacao := ' I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;

  frm_cotacao_compra.qryProduto.Close;
  frm_cotacao_compra.qryProduto.SQL.Clear;
  frm_cotacao_compra.qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  ');
  frm_cotacao_compra.qryProduto.SQL.Add('ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  ');
  frm_cotacao_compra.qryProduto.SQL.Add('FROM itens_cotacao_compra I INNER JOIN                                                  ');
  frm_cotacao_compra.qryProduto.SQL.Add('  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              ');
  frm_cotacao_compra.qryProduto.SQL.Add('LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       ');
  frm_cotacao_compra.qryProduto.SQL.Add(' AND ICCF.for_codigo = I.for_codigo_atual                                               ');
  frm_cotacao_compra.qryProduto.SQL.Add('LEFT JOIN agenda_telefone FORN ON                                                       ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.for_codigo_atual = FORN.at_codigo                                                     ');
  frm_cotacao_compra.qryProduto.SQL.Add('WHERE ' + cod_cotacao                                                                    );
  frm_cotacao_compra.qryProduto.SQL.Add('GROUP BY I.ITENS_COT_CODIGO,                                                            ');
  frm_cotacao_compra.qryProduto.SQL.Add('P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs ');
  frm_cotacao_compra.qryProduto.Open;
  if frm_cotacao_compra.campo <> '' then
    frm_cotacao_compra.qryProduto.SQL.Add(' ORDER BY ' + frm_cotacao_compra.campo  );

  frm_cotacao_compra.qryProduto.Open;

  frm_cotacao_compra.cdsProduto.Close;
  frm_cotacao_compra.cdsProduto.FetchParams;
  frm_cotacao_compra.cdsProduto.Open;

  /////FIM ATUALIZA GRIDS/////////////

  close;

end;

procedure TfrmInserirValorProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmInserirValorProduto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#27 then
    close;
end;

procedure TfrmInserirValorProduto.txt_obsEnter(Sender: TObject);
begin
  txt_obs.color := $00F5EEDE;
end;

procedure TfrmInserirValorProduto.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure TfrmInserirValorProduto.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.Click;

  if key=#27 then
    close;
end;

end.
