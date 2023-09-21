unit untGerarPedidoCompra_cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DB,
  IBCustomDataSet, IBQuery, DBCtrls;

type
  TfrmGerarPedidoCompra_cotacao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txt_valor: TCurrencyEdit;
    txt_data_previsao: TDateEdit;
    Label2: TLabel;
    btnOk: TBitBtn;
    Label9: TLabel;
    txt_cod_fornec: TEdit;
    txt_fornecedor: TEdit;
    Label4: TLabel;
    txt_cod_cotacao: TEdit;
    qryTotal: TIBQuery;
    procedure txt_valorEnter(Sender: TObject);
    procedure txt_valorExit(Sender: TObject);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_data_previsaoEnter(Sender: TObject);
    procedure txt_data_previsaoExit(Sender: TObject);
    procedure txt_data_previsaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbo_pagamentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarPedidoCompra_cotacao: TfrmGerarPedidoCompra_cotacao;

implementation

uses untCotacaoCompra, unt_modulo;


{$R *.dfm}

procedure TfrmGerarPedidoCompra_cotacao.txt_valorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure TfrmGerarPedidoCompra_cotacao.txt_valorExit(Sender: TObject);
begin
  txt_valor.Color := clWindow;
end;

procedure TfrmGerarPedidoCompra_cotacao.txt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data_previsao.SetFocus;
end;

procedure TfrmGerarPedidoCompra_cotacao.txt_data_previsaoEnter(
  Sender: TObject);
begin
  txt_data_previsao.Color := $00F5EEDE;
end;

procedure TfrmGerarPedidoCompra_cotacao.txt_data_previsaoExit(
  Sender: TObject);
begin
  txt_data_previsao.Color := clwindow;
end;

procedure TfrmGerarPedidoCompra_cotacao.txt_data_previsaoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key =#13 then
    BTNoK.SetFocus;
end;

procedure TfrmGerarPedidoCompra_cotacao.btnOkClick(Sender: TObject);
var
  cod_pedido : integer;
  total : real;
begin
  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja gerar pedido de compra ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDNO:
  begin
    exit;
  end;
  end;

  if (txt_valor.Value = 0)  then
  begin
    mensagem:= 'Informe o valor!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    txt_valor.SetFocus;
    exit;
  end;

  if txt_data_previsao.Text = '  /  /    ' then
  begin
    mensagem:= 'Informe a previsão de entrega!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    txt_data_previsao.SetFocus;
    exit;
  end;
    
  if (not frm_cotacao_compra.IBTransLocal.InTransaction) then
     frm_cotacao_compra.IBTransLocal.StartTransaction;

  frm_cotacao_compra.qryTransLocal.Close;
  frm_cotacao_compra.qryTransLocal.SQL.Clear;
  frm_cotacao_compra.qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET COT_PREVISAO_ENTREGA=:COT_PREVISAO_ENTREGA,                              '+
                                           ' COT_VALOR_FRETE=:COT_VALOR_FRETE WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL    '+
                                           ' AND PRO_CODIGO=:PRO_CODIGO                                                                              ');
  frm_cotacao_compra.qryTransLocal.ParamByName('COT_CODIGO').AsString  := txt_Cod_Cotacao.Text;
  frm_cotacao_compra.qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := txt_cod_fornec.Text;
  frm_cotacao_compra.qryTransLocal.ParamByName('PRO_CODIGO').AsString := frm_cotacao_compra.qryProdutoFornecVenc.fieldbyname('PRO_CODIGO').AsString;
  frm_cotacao_compra.qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := txt_data_previsao.Text;
  frm_cotacao_compra.qryTransLocal.ParamByName('COT_VALOR_FRETE').AsFloat := txt_valor.Value;

  frm_cotacao_compra.qryTransLocal.ExecSQL;

  frm_cotacao_compra.qryTransLocal.Close;
  frm_cotacao_compra.qryTransLocal.SQL.Clear;
  frm_cotacao_compra.qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_FORNEC_VENC SET COT_PREVISAO_ENTREGA=:COT_PREVISAO_ENTREGA,          '+
                                           ' COT_VALOR_FRETE=:COT_VALOR_FRETE WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
  frm_cotacao_compra.qryTransLocal.ParamByName('COT_CODIGO').AsString  := txt_Cod_Cotacao.Text;
  frm_cotacao_compra.qryTransLocal.ParamByName('FOR_CODIGO').AsString := txt_cod_fornec.Text;
  frm_cotacao_compra.qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := txt_data_previsao.Text;
  frm_cotacao_compra.qryTransLocal.ParamByName('COT_VALOR_FRETE').AsFloat := txt_valor.Value;
  frm_cotacao_compra.qryTransLocal.ExecSQL;

  frm_cotacao_compra.IBTransLocal.Commit;

  /////////ATUALIZA GRID DOS FORNECEDORES GANHADORES//////////

  frm_cotacao_compra.qryFornecedorVencedor.Close;
  frm_cotacao_compra.qryFornecedorVencedor.SQL.Clear;
  frm_cotacao_compra.qryFornecedorVencedor.SQL.Add('SELECT I.FOR_CODIGO, F.AT_nome, F.AT_CELULAR, F.AT_TELEFONE,                                              '+
                                                   'I.COT_PREVISAO_ENTREGA, I.COT_VALOR_FRETE                                                                 '+
                                                   'FROM  itens_cotacao_fornec_venc I,  AGENDA_TELEFONE F                                                     '+
                                                   'WHERE  F.AT_codigo = I.for_codigo                                                                         '+
                                                   'AND I.COT_CODIGO =:COT_CODIGO                                                                             '+
                                                   'group by I.for_codigo, F.AT_nome, F.AT_CELULAR, F.AT_TELEFONE, I.COT_PREVISAO_ENTREGA, I.COT_VALOR_FRETE  '+
                                                   'ORDER BY I.for_codigo                                                                                     ');
  frm_cotacao_compra.qryFornecedorVencedor.ParamByName('COT_CODIGO').AsString := txt_cod_cotacao.Text;
  frm_cotacao_compra.qryFornecedorVencedor.Open;
  frm_cotacao_compra.qryFornecedorVencedor.FetchAll;

  /////////FIM ATUALIZA GRID DOS FORNECEDORES GANHADORES//////////

  close;

end;

procedure TfrmGerarPedidoCompra_cotacao.FormShow(Sender: TObject);
begin
  txt_valor.Value :=  frm_cotacao_compra.qryFornecedorVencedor.FieldByName('COT_VALOR_FRETE').AsFloat;
  txt_data_previsao.Text := frm_cotacao_compra.qryFornecedorVencedor.FieldByName('COT_PREVISAO_ENTREGA').AsString;

end;

procedure TfrmGerarPedidoCompra_cotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  btnOk.SetFocus;
  Action:= caFree;
end;

procedure TfrmGerarPedidoCompra_cotacao.cbo_pagamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key =#13 then
    btnOk.SetFocus;
end;

end.
