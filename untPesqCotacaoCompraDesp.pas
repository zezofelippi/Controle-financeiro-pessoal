unit untPesqCotacaoCompraDesp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, IBCustomDataSet, IBQuery;

type
  TfrmPesqCotacaoCompraDesp = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    txt_cod_fornec: TEdit;
    btn_pesq_fornec: TBitBtn;
    txt_fornecedor: TEdit;
    Label4: TLabel;
    txt_codigo: TEdit;
    Label6: TLabel;
    btnPesquisar: TButton;
    DBGrd1: TDBGrid;
    DBGrid2: TDBGrid;
    qryPesquisa: TIBQuery;
    qryFornecedor: TIBQuery;
    qryFornecedorFOR_CODIGO: TIntegerField;
    qryFornecedorAT_NOME: TIBStringField;
    qryFornecedorCOT_PREVISAO_ENTREGA: TDateTimeField;
    qryFornecedorCOT_VALOR_FRETE: TIBBCDField;
    qryFornecedorAT_TELEFONE: TIBStringField;
    qryFornecedorAT_CELULAR: TIBStringField;
    qryProduto: TIBQuery;
    qryProdutoPRO_CODIGO: TIntegerField;
    qryProdutoPRO_DESCRICAO: TIBStringField;
    qryProdutoCOT_UNIDADE: TIBStringField;
    qryProdutoCOT_QTD: TFloatField;
    qryProdutoCOT_VALOR: TIBBCDField;
    qryProdutoVALOR_TOTAL: TFloatField;
    dsFornecedor: TDataSource;
    dsProduto: TDataSource;
    qryFornecedorCOT_CODIGO: TIntegerField;
    qryFornecedorCOT_COMPRA_EFETUADA: TIBStringField;
    lbl2: TLabel;
    lbl1: TLabel;
    procedure txt_cod_fornecExit(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dsFornecedorDataChange(Sender: TObject; Field: TField);
    procedure DBGrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txt_codigoEnter(Sender: TObject);
    procedure txt_codigoExit(Sender: TObject);
    procedure txt_codigoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_fornecEnter(Sender: TObject);
    procedure txt_cod_fornecKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrd1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pesquisar: string;
  end;

var
  frmPesqCotacaoCompraDesp: TfrmPesqCotacaoCompraDesp;
  mensagem : string;

implementation

uses unt_modulo, unt_cad_despesas, untItensCotacaoContasPagar;

{$R *.dfm}

procedure TfrmPesqCotacaoCompraDesp.txt_cod_fornecExit(Sender: TObject);
begin
  if txt_cod_fornec.Text = '' then
    txt_fornecedor.Clear
  else
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT AT_NOME FROM AGENDA_TELEFONE WHERE AT_CODIGO = '+txt_cod_fornec.Text);
    qryPesquisa.Open;

    txt_fornecedor.Text:= qryPesquisa.FieldByName('AT_NOME').AsString;

    if qryPesquisa.IsEmpty then
    begin
      mensagem:= 'Fornecedor não encontrado!';
      Application.MessageBox(Pchar(mensagem), 'Atenção', MB_OK+MB_ICONWARNING);
      txt_cod_fornec.Clear;
      txt_fornecedor.Clear;
      txt_cod_fornec.SetFocus;
    end;

  end;

  txt_cod_fornec.Color := clinfobk;

end;

procedure TfrmPesqCotacaoCompraDesp.btnPesquisarClick(Sender: TObject);
var
  fornecedor, cotacao : string;
begin

  if txt_codigo.Text <> '' then
    cotacao := ' AND I.COT_CODIGO = ' + txt_codigo.Text
  else
    cotacao := '';

  if txt_cod_fornec.Text <> '' then
    fornecedor := ' AND I.FOR_CODIGO = ' + #39 + txt_cod_fornec.Text  + #39
  else
    fornecedor := '';

  qryFornecedor.Close;
  qryFornecedor.SQL.Clear;
  qryFornecedor.SQL.Add(' SELECT I.COT_CODIGO, I.FOR_CODIGO, F.AT_nome, I.COT_PREVISAO_ENTREGA,                       '+
                        ' I.COT_VALOR_FRETE, F.AT_TELEFONE, F.AT_CELULAR, I.COT_COMPRA_EFETUADA                       '+
                        ' FROM  itens_cotacao_fornec_venc I,  AGENDA_TELEFONE F                                       '+
                        ' WHERE  F.AT_codigo = I.for_codigo                                                           '+
                          fornecedor + cotacao                                                                         +
                        ' AND (COT_FORNEC_PARTICIPANTE <> ' + #39 + 'N'+ #39 + ' OR COT_FORNEC_PARTICIPANTE IS NULL)  '+
                        ' group by I.COT_CODIGO, I.for_codigo, F.AT_nome, F.AT_TELEFONE, F.AT_CELULAR,                '+
                        ' I.COT_PREVISAO_ENTREGA, I.COT_VALOR_FRETE, I.COT_COMPRA_EFETUADA                            '+
                        ' ORDER BY I.COT_CODIGO, I.for_codigo                                                         ');
  qryFornecedor.Open;
  qryFornecedor.FetchAll;


end;

procedure TfrmPesqCotacaoCompraDesp.dsFornecedorDataChange(Sender: TObject;
  Field: TField);
begin

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,   '+
                     ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                    '+
                     ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                      '+
                     ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual         '+
                     ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO               '+
                     ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor  '+
                     ' ORDER BY P.pro_DESCRICAO                                                       ');
  qryProduto.ParamByName('COT_CODIGO').AsString := qryFornecedor.fieldbyname('COT_CODIGO').AsString;
  qryProduto.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('FOR_CODIGO').AsString;
  qryProduto.Open;
 
end;

procedure TfrmPesqCotacaoCompraDesp.DBGrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  IF (qryFornecedor.FieldByName('COT_COMPRA_EFETUADA').AsString = 'S' ) then
    dbgrd1.Canvas.Brush.Color := $0000EAEA;

  if (gdSelected in state) then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Font.Style  := [fsbold];
      dbgrd1.Canvas.Brush.Color := clWhite;

      IF (qryFornecedor.FieldByName('COT_COMPRA_EFETUADA').AsString = 'S' ) then
        dbgrd1.Canvas.Brush.Color := $0000EAEA;
    end;
  end;

  dbgrd1.Canvas.Font.Color:= clBlack;
  dbgrd1.Canvas.FillRect(Rect);
  dbgrd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPesqCotacaoCompraDesp.txt_codigoEnter(Sender: TObject);
begin
  txt_Codigo.Color := $00F5EEDE;
end;

procedure TfrmPesqCotacaoCompraDesp.txt_codigoExit(Sender: TObject);
begin
  txt_codigo.Color := clwindow;
end;

procedure TfrmPesqCotacaoCompraDesp.txt_codigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_Cod_fornec.SetFocus;
end;

procedure TfrmPesqCotacaoCompraDesp.txt_cod_fornecEnter(Sender: TObject);
begin
  txt_Cod_fornec.Color := $00F5EEDE;
end;

procedure TfrmPesqCotacaoCompraDesp.txt_cod_fornecKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnPesquisar.SetFocus;
end;

procedure TfrmPesqCotacaoCompraDesp.DBGrd1DblClick(Sender: TObject);
begin

  IF (qryFornecedor.FieldByName('COT_COMPRA_EFETUADA').AsString = 'S' ) then
  begin
    showmessage('Este fornecedor ja foi inserido em alguma despesa');
    exit;
  end;

  if pesquisar = 'Cad_Despesa' then
  begin
    frm_cad_despesas.txtCotacao.Text := qryFornecedor.fieldbyname('COT_CODIGO').AsString;
    frm_cad_despesas.txt_cod_fornecedor.Text := qryFornecedor.fieldbyname('FOR_CODIGO').AsString;
    frm_cad_despesas.txtFornecedor.Text := qryFornecedor.fieldbyname('AT_NOME').AsString;

    frm_cad_despesas.qryCotacao.Close;
    frm_cad_despesas.qryCotacao.SQL.Clear;
    frm_cad_despesas.qryCotacao.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,   '+
                                        ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                    '+
                                        ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                      '+
                                        ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual         '+
                                        ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO               '+
                                        ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor  '+
                                        ' ORDER BY P.pro_DESCRICAO                                                       ');
    frm_cad_despesas.qryCotacao.ParamByName('COT_CODIGO').AsString := qryFornecedor.fieldbyname('COT_CODIGO').AsString;
    frm_cad_despesas.qryCotacao.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('FOR_CODIGO').AsString;
    frm_cad_despesas.qryCotacao.Open;

    frm_cad_despesas.qry_Pesquisa.close;
    frm_cad_despesas.qry_Pesquisa.SQL.Clear;
    frm_cad_despesas.qry_Pesquisa.SQL.Add('SELECT SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                         '+
                                          ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                 '+
                                          ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual    '+
                                          ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO          ');
    frm_cad_despesas.qry_Pesquisa.ParamByName('COT_CODIGO').AsString := qryFornecedor.fieldbyname('COT_CODIGO').AsString;
    frm_cad_despesas.qry_Pesquisa.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('FOR_CODIGO').AsString;
    frm_cad_despesas.qry_Pesquisa.Open;

    frm_cad_despesas.txt_total.Value := frm_cad_despesas.qry_Pesquisa.fieldbyname('VALOR_TOTAL').asfloat;

    CLOSE;

  end;

  if pesquisar = 'Contas_Pagar' then
  begin
    frmItensCotacaoContasPagar.txtCotacao.Text := qryFornecedor.fieldbyname('COT_CODIGO').AsString;
    frmItensCotacaoContasPagar.txt_cod_fornecedor.Text := qryFornecedor.fieldbyname('FOR_CODIGO').AsString;
    frmItensCotacaoContasPagar.txtFornecedor.Text := qryFornecedor.fieldbyname('AT_NOME').AsString;

    frmItensCotacaoContasPagar.qryCotacao.Close;
    frmItensCotacaoContasPagar.qryCotacao.SQL.Clear;
    frmItensCotacaoContasPagar.qryCotacao.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,   '+
                                                  ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                    '+
                                                  ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                      '+
                                                  ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual         '+
                                                  ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO               '+
                                                  ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor  '+
                                                  ' ORDER BY P.pro_DESCRICAO                                                       ');
    frmItensCotacaoContasPagar.qryCotacao.ParamByName('COT_CODIGO').AsString := qryFornecedor.fieldbyname('COT_CODIGO').AsString;
    frmItensCotacaoContasPagar.qryCotacao.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('FOR_CODIGO').AsString;
    frmItensCotacaoContasPagar.qryCotacao.Open;

    frmItensCotacaoContasPagar.qry_Pesquisa.close;
    frmItensCotacaoContasPagar.qry_Pesquisa.SQL.Clear;
    frmItensCotacaoContasPagar.qry_Pesquisa.SQL.Add('SELECT SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                             '+
                                                    ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                     '+
                                                    ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual        '+
                                                    ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO              ');
    frmItensCotacaoContasPagar.qry_Pesquisa.ParamByName('COT_CODIGO').AsString := qryFornecedor.fieldbyname('COT_CODIGO').AsString;
    frmItensCotacaoContasPagar.qry_Pesquisa.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('FOR_CODIGO').AsString;
    frmItensCotacaoContasPagar.qry_Pesquisa.Open;

    frmItensCotacaoContasPagar.txt_total.Value := frmItensCotacaoContasPagar.qry_Pesquisa.fieldbyname('VALOR_TOTAL').asfloat;

    CLOSE;

 end;

end;

end.
