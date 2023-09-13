unit untProdutosComprados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery,
  Mask, ToolEdit;

type
  TfrmProdutosComprados = class(TForm)
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    txt_cod_produto_pesq: TEdit;
    txt_descricao_pesq: TEdit;
    txt_grupo_pesq: TDBLookupComboBox;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    btnPesquisar: TButton;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtUnidade: TEdit;
    Label2: TLabel;
    txtQtde: TEdit;
    Label3: TLabel;
    txtValorTotal: TEdit;
    dsProduto: TDataSource;
    qryProduto: TIBQuery;
    qryProdutoPRO_CODIGO: TIntegerField;
    qryProdutoPRO_DESCRICAO: TIBStringField;
    qryProdutoCOT_QTD: TFloatField;
    qryProdutoCOT_VALOR: TIBBCDField;
    qryProdutoCOT_UNIDADE: TIBStringField;
    qryProdutoCOT_VENCIMENTO: TDateTimeField;
    qryProdutoAT_NOME: TIBStringField;
    qryProdutoCOT_CODIGO: TIntegerField;
    qryTotal: TIBQuery;
    dsGrupoPesq: TDataSource;
    qryGrupoPesq: TIBQuery;
    qryGrupoPesqGRP_CODIGO: TIntegerField;
    qryGrupoPesqGRP_DESCRICAO: TIBStringField;
    qryProdutoCOT_COMPRA_EFETUADA: TIBStringField;
    Label4: TLabel;
    Label8: TLabel;
    Label35: TLabel;
    dtaInicial: TDateEdit;
    dtaFinal: TDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    qryProdutoVALOR_TOTAL: TFloatField;
    qryProdutoCOT_OBS: TIBStringField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure txt_grupo_pesqClick(Sender: TObject);
    procedure txt_grupo_pesqKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_grupo_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure txt_descricao_pesqChange(Sender: TObject);
    procedure rdb_inicioClick(Sender: TObject);
    procedure rdb_posicaoClick(Sender: TObject);
    procedure txt_descricao_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_produto_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_produto_pesqChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txt_grupo_pesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutosComprados: TfrmProdutosComprados;

implementation

uses
  unt_modulo;

{$R *.dfm}

procedure TfrmProdutosComprados.btnPesquisarClick(Sender: TObject);
var
  codigo, descricao, grupo, data1, data2, dta : string;
begin

  if txt_cod_produto_pesq.Text <> '' then
     codigo  := ' AND P.PRO_CODIGO = ' + txt_cod_produto_pesq.Text
  else
     codigo  := '';

  if (txt_descricao_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
     descricao  := ' AND UPPER(P.PRO_DESCRICAO) LIKE UPPER('+ #39 + txt_descricao_pesq.Text + '%' + #39 + ')'
  else if (txt_descricao_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
     descricao  := ' AND UPPER(P.PRO_DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_descricao_pesq.Text + '%' + #39 + ')'
  else
     descricao  := '';


  if (txt_grupo_pesq.Text <> '') then
     grupo  := ' AND p.grp_codigo =' +  inttostr(txt_grupo_pesq.KeyValue)
  else
     grupo  := '';


  data1 := Copy(dtaInicial.Text,4,3) + Copy(dtaInicial.Text,1,3) + Copy(dtaInicial.Text,7,4);
  data2 := Copy(dtaFinal.Text,4,3) + Copy(dtaFinal.Text,1,3) + Copy(dtaFinal.Text,7,4);

  if (dtaInicial.Text <> '  /  /    ') and (dtaFinal.Text <> '  /  /    ') then
  begin
    dta := ' AND COTA.COT_VENCIMENTO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39;
  end
  else
  begin
    dta := '';
  end;   


  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT P.PRO_CODIGO, PRO_DESCRICAO, I.COT_QTD, I.COT_VALOR,                                '+
                     'SUM(I.COT_QTD * I.COT_VALOR) AS VALOR_TOTAL,                                               '+
                     'I.COT_UNIDADE, COTA.COT_VENCIMENTO, FORN.at_nome, COTA.cot_codigo,                         '+
                     'ifv.cot_compra_efetuada, ICCF.cot_obs                                                      '+
                     'FROM cotacao_compra COTA                                                                   '+
                     'INNER JOIN itens_cotacao_compra I ON                                                       '+
                     'COTA.cot_codigo = I.cot_codigo                                                             '+
                     'INNER JOIN agenda_telefone FORN ON                                                         '+
                     'I.for_codigo_atual = FORN.at_codigo                                                        '+
                     'INNER JOIN produto p ON                                                                    '+
                     'I.pro_codigo = P.pro_codigo                                                                '+
                     'INNER JOIN GRUPO GR ON                                                                     '+
                     'P.grp_codigo = GR.grp_codigo                                                               '+
                     'INNER JOIN itens_cotacao_fornec_venc Ifv ON                                                '+
                     'cota.cot_codigo = ifv.cot_codigo and forn.at_codigo = ifv.for_codigo                       '+
                     'INNER JOIN itens_cotacao_compra_fornec ICCF ON                                             '+
                     'COTA.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                     'AND ICCF.for_codigo = I.for_codigo_atual                                                   '+
                     'WHERE COTA.finalizado = ''S'' ' + grupo + descricao + codigo + dta                          +
                     'GROUP BY P.PRO_CODIGO, PRO_DESCRICAO, I.COT_QTD, I.COT_VALOR,   ICCF.cot_obs,              '+
                     'I.COT_UNIDADE, COTA.COT_VENCIMENTO, FORN.at_nome, COTA.cot_codigo, ifv.cot_compra_efetuada '+
                     ' ORDER BY P.PRO_DESCRICAO');
  qryProduto.Open;
  qryProduto.FetchAll;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(I.COT_QTD) AS QTDE,  SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL,                   '+
                   'I.cot_unidade  FROM COTACAO_COMPRA COTA                                                        '+
                   'INNER JOIN itens_cotacao_compra I ON                                                           '+
                   'COTA.cot_codigo = I.cot_codigo                                                                 '+
                   'INNER JOIN PRODUTO P ON                                                                        '+
                   'P.pro_codigo = I.pro_codigo                                                                    '+
                   'WHERE COTA.finalizado = ''S'' ' + grupo + descricao + codigo + dta + ' GROUP BY I.cot_unidade  ');
  qryTotal.Open;


  txtQtde.Text := formatfloat('###,##0.000', qryTotal.fieldbyname('QTDE').AsFloat);
  txtValorTotal.Text := formatfloat('###,##0.00', qryTotal.fieldbyname('VALOR_TOTAL').AsFloat);
  txtUnidade.Text := qryTotal.fieldbyname('cot_unidade').AsString; 
  

end;

procedure TfrmProdutosComprados.txt_grupo_pesqClick(Sender: TObject);
begin
  btnPesquisar.Click;
end;

procedure TfrmProdutosComprados.txt_grupo_pesqKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btnPesquisar.Click;
end;

procedure TfrmProdutosComprados.txt_grupo_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    if not (qryproduto.IsEmpty) and (txt_grupo_pesq.Text <> '') then
      dbgrid1.SetFocus
    else
      txt_descricao_pesq.SetFocus;
  end;
end;

procedure TfrmProdutosComprados.txt_descricao_pesqChange(Sender: TObject);
begin
  btnPesquisar.Click;
end;

procedure TfrmProdutosComprados.rdb_inicioClick(Sender: TObject);
begin
  txt_descricao_pesq.SetFocus;
end;

procedure TfrmProdutosComprados.rdb_posicaoClick(Sender: TObject);
begin
  txt_descricao_pesq.SetFocus;
end;

procedure TfrmProdutosComprados.txt_descricao_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    if not (qryproduto.IsEmpty) and (txt_descricao_pesq.Text <> '') then
      dbgrid1.SetFocus
    else
      txt_cod_produto_pesq.SetFocus;
  end;
end;

procedure TfrmProdutosComprados.txt_cod_produto_pesqKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    if not (qryproduto.IsEmpty) and (txt_cod_produto_pesq.Text <> '') then
      dbgrid1.SetFocus
    else
      txt_grupo_pesq.SetFocus;
  end;
end;

procedure TfrmProdutosComprados.txt_cod_produto_pesqChange(
  Sender: TObject);
begin
  btnPesquisar.Click;
end;

procedure TfrmProdutosComprados.FormShow(Sender: TObject);
begin
  qryGrupoPesq.Close;
  qryGrupoPesq.Open;
  qryGrupoPesq.FetchAll;
end;

procedure TfrmProdutosComprados.txt_grupo_pesqKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    txt_grupo_pesq.KeyValue := -1;

end;

procedure TfrmProdutosComprados.DBGrid1TitleClick(Column: TColumn);
var
  campo: string;
  codigo, descricao, grupo, data1, data2, dta : string;
begin
  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

  if txt_cod_produto_pesq.Text <> '' then
     codigo  := ' AND P.PRO_CODIGO = ' + txt_cod_produto_pesq.Text
  else
     codigo  := '';

  if (txt_descricao_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
     descricao  := ' AND UPPER(P.PRO_DESCRICAO) LIKE UPPER('+ #39 + txt_descricao_pesq.Text + '%' + #39 + ')'
  else if (txt_descricao_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
     descricao  := ' AND UPPER(P.PRO_DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_descricao_pesq.Text + '%' + #39 + ')'
  else
     descricao  := '';


  if (txt_grupo_pesq.Text <> '') then
     grupo  := ' AND p.grp_codigo =' +  inttostr(txt_grupo_pesq.KeyValue)
  else
     grupo  := '';

  data1 := Copy(dtaInicial.Text,4,3) + Copy(dtaInicial.Text,1,3) + Copy(dtaInicial.Text,7,4);
  data2 := Copy(dtaFinal.Text,4,3) + Copy(dtaFinal.Text,1,3) + Copy(dtaFinal.Text,7,4);

  if (dtaInicial.Text <> '  /  /    ') and (dtaFinal.Text <> '  /  /    ') then
  begin
    dta := ' AND COTA.COT_VENCIMENTO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39;
  end
  else
  begin
    dta := '';
  end;


   if (campo = 'PRO_CODIGO') or (campo = 'pro_descricao') then
      campo := 'P.' + campo
   else if (campo = 'cot_unidade') or (campo = 'cot_qtd') or (campo = 'cot_valor') or
      (campo = 'FOR_CODIGO_ANT')  then
      campo := 'I.' + campo
   else if (campo = 'COT_VENCIMENTO') or (campo = 'cot_codigo') Then
      campo := 'COTA.' + campo
   else if (campo = 'AT_NOME') Then
      campo := '8'
   else
    campo := '' + campo ;

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT P.PRO_CODIGO, PRO_DESCRICAO, I.COT_QTD, I.COT_VALOR,                                '+
                     'SUM(I.COT_QTD * I.COT_VALOR) AS VALOR_TOTAL,                                               '+
                     'I.COT_UNIDADE, COTA.COT_VENCIMENTO, FORN.at_nome, COTA.cot_codigo,                         '+
                     'ifv.cot_compra_efetuada, ICCF.cot_obs                                                      '+
                     'FROM cotacao_compra COTA                                                                   '+
                     'INNER JOIN itens_cotacao_compra I ON                                                       '+
                     'COTA.cot_codigo = I.cot_codigo                                                             '+
                     'INNER JOIN agenda_telefone FORN ON                                                         '+
                     'I.for_codigo_atual = FORN.at_codigo                                                        '+
                     'INNER JOIN produto p ON                                                                    '+
                     'I.pro_codigo = P.pro_codigo                                                                '+
                     'INNER JOIN GRUPO GR ON                                                                     '+
                     'P.grp_codigo = GR.grp_codigo                                                               '+
                     'INNER JOIN itens_cotacao_fornec_venc Ifv ON                                                '+
                     'cota.cot_codigo = ifv.cot_codigo and forn.at_codigo = ifv.for_codigo                       '+
                     'INNER JOIN itens_cotacao_compra_fornec ICCF ON                                             '+
                     'COTA.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                     'AND ICCF.for_codigo = I.for_codigo_atual                                                   '+
                     'WHERE COTA.finalizado = ''S'' ' + grupo + descricao + codigo + dta                          +
                     'GROUP BY P.PRO_CODIGO, PRO_DESCRICAO, I.COT_QTD, I.COT_VALOR,   ICCF.cot_obs,              '+
                     'I.COT_UNIDADE, COTA.COT_VENCIMENTO, FORN.at_nome, COTA.cot_codigo, ifv.cot_compra_efetuada '+
                     ' ORDER BY ' + campo);
  qryProduto.Open;
  qryProduto.FetchAll;


end;

procedure TfrmProdutosComprados.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  IF (qryProduto.FieldByName('cot_compra_efetuada').AsString = 'S' ) then
    DBGrid1.Canvas.Brush.Color := $009BCDFF;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Font.Style  := [fsbold];
      DBGrid1.Canvas.Brush.Color := clWhite;

      IF (qryProduto.FieldByName('cot_compra_efetuada').AsString = 'S' ) then
        DBGrid1.Canvas.Brush.Color := $009BCDFF;
    end;

  dbgrid1.Canvas.Font.Color:= clBlack;

  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
