unit untPesqCotacaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids, DB,
  IBCustomDataSet, IBQuery, CurrEdit;

type
  TfrmPesqCotacaoCompra = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    txt_cod_fornec: TEdit;
    btn_pesq_fornec: TBitBtn;
    txt_fornecedor: TEdit;
    Label4: TLabel;
    Label2: TLabel;
    txt_cod_barra: TEdit;
    txt_cod_produto: TEdit;
    btn_pesq_prod: TBitBtn;
    txt_produto: TEdit;
    Label11: TLabel;
    Label6: TLabel;
    btnFiltrar: TBitBtn;
    DBGrid1: TDBGrid;
    txt_codigo: TEdit;
    qryCotacao: TIBQuery;
    dsCotacao: TDataSource;
    GroupBox2: TGroupBox;
    Label35: TLabel;
    dtaInicial: TDateEdit;
    dtaFinal: TDateEdit;
    Label1: TLabel;
    rdb_data: TRadioButton;
    rdb_vencimento: TRadioButton;
    qryCotacaoCOT_CODIGO: TIntegerField;
    qryCotacaoCOT_DATA: TDateTimeField;
    qryCotacaoCOT_VENCIMENTO: TDateTimeField;
    qryCotacaoCOT_OBS: TIBStringField;
    qryPesquisa: TIBQuery;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Label23: TLabel;
    txtObs: TEdit;
    Label3: TLabel;
    lbl3: TLabel;
    txt_total_cotacao: TCurrencyEdit;
    qryCotacaoVALOR_TOTAL: TIBBCDField;
    procedure txt_cod_barraEnter(Sender: TObject);
    procedure txt_cod_barraExit(Sender: TObject);
    procedure txt_cod_barraKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_fornecEnter(Sender: TObject);
    procedure txt_cod_fornecExit(Sender: TObject);
    procedure txt_cod_fornecKeyPress(Sender: TObject; var Key: Char);
    procedure btn_pesq_prodClick(Sender: TObject);
    procedure btn_pesq_fornecClick(Sender: TObject);
    procedure txt_cod_barraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_cod_fornecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtaInicialEnter(Sender: TObject);
    procedure dtaInicialExit(Sender: TObject);
    procedure dtaInicialKeyPress(Sender: TObject; var Key: Char);
    procedure dtaFinalEnter(Sender: TObject);
    procedure dtaFinalExit(Sender: TObject);
    procedure dtaFinalKeyPress(Sender: TObject; var Key: Char);
    procedure txt_codigoEnter(Sender: TObject);
    procedure txt_codigoExit(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure txt_codigoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Filtrare(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqCotacaoCompra: TfrmPesqCotacaoCompra;

implementation

uses untCotacaoCompra, unt_modulo, untProduto, untAgendaTelefone;

{$R *.dfm}

procedure TfrmPesqCotacaoCompra.txt_cod_barraEnter(Sender: TObject);
begin
  txt_cod_barra.Color := $00F5EEDE;
end;

procedure TfrmPesqCotacaoCompra.txt_cod_barraExit(Sender: TObject);
begin
  txt_cod_barra.Color := clinfobk;

  if txt_cod_barra.Text = '' then
  begin
    txt_produto.Clear;
    txt_cod_produto.Clear;
  end
  else
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRO_DESCRICAO, PRO_CODIGO FROM PRODUTO WHERE PRO_CODIGO = '+ #39 + txt_cod_barra.Text + #39);
    qryPesquisa.Open;

    if qryPesquisa.IsEmpty then
    begin
      mensagem:= 'Produto não encontrado!';
      Application.MessageBox(Pchar(mensagem), 'Atenção', MB_OK+MB_ICONWARNING + MB_TOPMOST);
      txt_cod_barra.Clear;
      txt_produto.Clear;
      exit;
    end;

    txt_produto.Text        := qryPesquisa.FieldByName('PRO_DESCRICAO').AsString;
    txt_cod_produto.Text    := qryPesquisa.FieldByName('PRO_CODIGO').AsString;
  end;

end;

procedure TfrmPesqCotacaoCompra.txt_cod_barraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnFiltrar.SetFocus;
end;

procedure TfrmPesqCotacaoCompra.txt_cod_fornecEnter(Sender: TObject);
begin
  txt_cod_fornec.Color := $00F5EEDE;
end;

procedure TfrmPesqCotacaoCompra.txt_cod_fornecExit(Sender: TObject);
begin
  txt_cod_fornec.Color := clinfobk;

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

end;

procedure TfrmPesqCotacaoCompra.txt_cod_fornecKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_cod_barra.SetFocus;
end;

procedure TfrmPesqCotacaoCompra.btn_pesq_prodClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmproduto, frmproduto);
  frmproduto.pesquisa := 'pesq_cotacao_compra_2';
  frmproduto.ShowModal;
end;

procedure TfrmPesqCotacaoCompra.btn_pesq_fornecClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAgendaTelefone, frmAgendaTelefone);
  frmAgendaTelefone.pesquisa := 'pesq_cotacao_compra_2';
  frmAgendaTelefone.ShowModal;
end;

procedure TfrmPesqCotacaoCompra.txt_cod_barraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    btn_Pesq_prod.Click;
end;

procedure TfrmPesqCotacaoCompra.txt_cod_fornecKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    btn_Pesq_Fornec.Click;
end;

procedure TfrmPesqCotacaoCompra.dtaInicialEnter(Sender: TObject);
begin
  dtaInicial.Color := $00F5EEDE;
end;

procedure TfrmPesqCotacaoCompra.dtaInicialExit(Sender: TObject);
begin
  dtaInicial.Color := clwindow;
end;

procedure TfrmPesqCotacaoCompra.dtaInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    dtaFinal.SetFocus;
end;

procedure TfrmPesqCotacaoCompra.dtaFinalEnter(Sender: TObject);
begin
  dtafinal.Color := $00F5EEDE;
end;

procedure TfrmPesqCotacaoCompra.dtaFinalExit(Sender: TObject);
begin
  dtaFinal.Color := clwindow;
end;

procedure TfrmPesqCotacaoCompra.dtaFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_cod_fornec.SetFocus;
end;

procedure TfrmPesqCotacaoCompra.txt_codigoEnter(Sender: TObject);
begin
  txt_codigo.Color := $00F5EEDE;
end;

procedure TfrmPesqCotacaoCompra.txt_codigoExit(Sender: TObject);
begin
  txt_codigo.Color := clinfobk;
end;

procedure TfrmPesqCotacaoCompra.btnFiltrarClick(Sender: TObject);
var
  codigo, dta, data1, data2, cod_fornecedor, cod_produto, obs : string;

begin

  if (txt_codigo.Text = '') and (txt_fornecedor.Text = '') and (txt_produto.Text = '') and
    (dtaInicial.Text = '  /  /    ') and (dtaFinal.Text = '  /  /    ') and (txtObs.Text = '') then
  begin
    mensagem:= 'Insira algum dado para pesquisa!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    txt_codigo.SetFocus;
    exit;
  end;


  if txt_codigo.Text <> '' then
   codigo := ' AND C.COT_CODIGO = ' + txt_codigo.Text
  else
   codigo := '';

  if txt_cod_fornec.Text <> '' then
   cod_fornecedor := ' AND I.FOR_CODIGO_ATUAL = ' + #39 + txt_cod_fornec.Text  + #39
  else
   cod_fornecedor := '';


  if txt_cod_barra.Text <> '' then
   cod_produto := ' AND I.PRO_CODIGO = ' + #39 + txt_cod_produto.Text  + #39
  else
   cod_produto := '';

  data1 := Copy(dtaInicial.Text,4,3) + Copy(dtaInicial.Text,1,3) + Copy(dtaInicial.Text,7,4);
  data2 := Copy(dtaFinal.Text,4,3) + Copy(dtaFinal.Text,1,3) + Copy(dtaFinal.Text,7,4);

  if (dtaInicial.Text <> '  /  /    ') and (dtaFinal.Text <> '  /  /    ') then
  begin
    if rdb_data.Checked = true then
      dta := ' AND C.COT_DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
    else if rdb_vencimento.Checked = true then
      dta := ' AND C.COT_VENCIMENTO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39;
  end
  else
  begin
    dta := '';
  end;

  if txtObs.Text <> '' then
   obs := ' AND UPPER(C.COT_OBS) LIKE UPPER('+ #39 + '%' + txtObs.Text + '%' + #39 + ')'
  else
   obs := '';


  qryCotacao.Close;
  qryCotacao.SQL.Clear;
  qryCotacao.SQL.Add('SELECT C.cot_codigo, C.cot_data, C.cot_vencimento, C.cot_obs,        '+
                     ' CAST(SUM(I.cot_valor * I.cot_qtd) as numeric(15,2)) AS VALOR_TOTAL  '+
                     'FROM itens_cotacao_compra I, COTACAO_COMPRA C                        '+
                     'WHERE I.cot_codigo = C.cot_codigo                                    '+
                     '' + codigo + cod_fornecedor + cod_produto + dta + obs                 +
                     'GROUP BY C.cot_codigo, C.cot_data, C.cot_vencimento, C.cot_obs       ');
  qryCotacao.Open;

  if qryCotacao.IsEmpty then
  begin
    mensagem:= 'Nenhum registro encontrado!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    txt_codigo.SetFocus;
    exit;
  end;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT  CAST(SUM(CAST(I.cot_valor AS NUMERIC(15,2)) * I.cot_qtd) as numeric(15,2)) AS VALOR_TOTAL '+
                      'FROM itens_cotacao_compra I, COTACAO_COMPRA C                                                     '+
                      'WHERE I.cot_codigo = C.cot_codigo                                                                 '+
                      '' + codigo + cod_fornecedor + cod_produto + dta + obs                                             );
  qryPesquisa.Open;

  txt_total_cotacao.Value:=  qryPesquisa.fieldbyname('VALOR_TOTAL').AsFloat;

  DBGrid1.SetFocus;

end;

procedure TfrmPesqCotacaoCompra.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if date > qryCotacao.FieldByName('COT_VENCIMENTO').AsDateTime then
    DBGrid1.Canvas.Brush.Color := $00ABD2FA;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clMenuHighlight;
      Font.Style  := [fsbold];
      Font.Color  := clWhite
    end
    else
      DBGrid1.Canvas.Font.Color:= clBlack;

  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmPesqCotacaoCompra.FormShow(Sender: TObject);
begin
 txt_codigo.SetFocus;
 rdb_data.Checked := true;
end;

procedure TfrmPesqCotacaoCompra.txt_codigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    dtaInicial.SetFocus;
end;

procedure TfrmPesqCotacaoCompra.DBGrid1DblClick(Sender: TObject);
var
  cod_cotacao : string;
begin

  frm_cotacao_compra.lbl_cod_cotacao.Caption := qryCotacao.fieldbyname('COT_CODIGO').AsString;
  frm_cotacao_compra.dta_cotacao.Text        := qryCotacao.fieldbyname('COT_DATA').AsString;
  frm_cotacao_compra.dta_vencimento.Text     := qryCotacao.fieldbyname('COT_VENCIMENTO').AsString;
  frm_cotacao_compra.txt_obs.Text            := qryCotacao.fieldbyname('COT_OBS').AsString;

  cod_cotacao := ' I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;

  frm_cotacao_compra.qryProduto.Close;
  frm_cotacao_compra.qryProduto.SQL.Clear;
  frm_cotacao_compra.qryProduto.SQL.Add('SELECT P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO, I.cot_qtd, I.cot_unidade,                 ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL,  ICCF.cot_obs,                     ');
  frm_cotacao_compra.qryProduto.SQL.Add('i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL,  FORN.at_nome,  I.ITENS_COT_CODIGO,  ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT                    ');
  frm_cotacao_compra.qryProduto.SQL.Add('FROM itens_cotacao_compra I INNER JOIN                                                       ');
  frm_cotacao_compra.qryProduto.SQL.Add('  PRODUTO P ON I.pro_codigo = P.pro_codigo                                                   ');
  frm_cotacao_compra.qryProduto.SQL.Add('LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                                ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                            ');
  frm_cotacao_compra.qryProduto.SQL.Add(' AND ICCF.for_codigo = I.for_codigo_atual                                                    ');
  frm_cotacao_compra.qryProduto.SQL.Add('LEFT JOIN agenda_telefone FORN ON                                                            ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.for_codigo_atual = FORN.at_codigo                                                          ');
  frm_cotacao_compra.qryProduto.SQL.Add('WHERE ' + cod_cotacao                                                                         );
  frm_cotacao_compra.qryProduto.SQL.Add('GROUP BY  I.ITENS_COT_CODIGO,                                                                ');
  frm_cotacao_compra.qryProduto.SQL.Add('P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                       ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL,  FORN.at_nome,          ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT,  ICCF.cot_obs     ');
  frm_cotacao_compra.qryProduto.Open;

  frm_cotacao_compra.cdsProduto.Close;
  frm_cotacao_compra.cdsProduto.FetchParams;
  frm_cotacao_compra.cdsProduto.Open;

  frm_cotacao_compra.btn_novo.Enabled := true;
  frm_cotacao_compra.btn_sair.Enabled := true;
  frm_cotacao_compra.btn_pesquisar.Enabled := true;
  frm_cotacao_compra.btn_alterar.Enabled := TRUE;
  frm_cotacao_compra.btn_excluir.Enabled := true;

  close;  

end;

procedure TfrmPesqCotacaoCompra.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    DBGrid1DblClick(Sender as TObject);
end;

procedure TfrmPesqCotacaoCompra.Filtrare(Sender: TObject;
  var Action: TCloseAction);
begin
 btnFiltrar.SetFocus;
 Action:= caFree;
end;

procedure TfrmPesqCotacaoCompra.DBGrid1TitleClick(Column: TColumn);
var
  campo : string;
  codigo, dta, data1, data2, cod_fornecedor, cod_produto, obs : string;
begin

  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

  if (txt_codigo.Text = '') and (txt_fornecedor.Text = '') and (txt_produto.Text = '') and
    (dtaInicial.Text = '  /  /    ') and (dtaFinal.Text = '  /  /    ') and (txtObs.Text = '') then
  begin
    mensagem:= 'Insira algum dado para pesquisa!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    txt_codigo.SetFocus;
    exit;
  end;

  if txt_codigo.Text <> '' then
    codigo := ' AND C.COT_CODIGO = ' + txt_codigo.Text
  else
    codigo := '';

  if txt_cod_fornec.Text <> '' then
    cod_fornecedor := ' AND I.FOR_CODIGO_ATUAL = ' + #39 + txt_cod_fornec.Text  + #39
  else
    cod_fornecedor := '';


  if txt_cod_barra.Text <> '' then
    cod_produto := ' AND I.PRO_CODIGO = ' + #39 + txt_cod_produto.Text  + #39
  else
    cod_produto := '';

  data1 := Copy(dtaInicial.Text,4,3) + Copy(dtaInicial.Text,1,3) + Copy(dtaInicial.Text,7,4);
  data2 := Copy(dtaFinal.Text,4,3) + Copy(dtaFinal.Text,1,3) + Copy(dtaFinal.Text,7,4);

  if (dtaInicial.Text <> '  /  /    ') and (dtaFinal.Text <> '  /  /    ') then
  begin
    if rdb_data.Checked = true then
      dta := ' AND C.COT_DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
    else if rdb_vencimento.Checked = true then
      dta := ' AND C.COT_VENCIMENTO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39;
  end
  else
  begin
    dta := '';
  end;

  if (campo = 'cot_codigo') or (campo = 'cot_data') or (campo = 'cot_vencimento') or (campo = 'cot_obs') then
   campo := 'C.' + campo
  else
   campo := '' + campo ;

  if txtObs.Text <> '' then
   obs := ' AND UPPER(C.COT_OBS) LIKE UPPER('+ #39 + '%' + txtObs.Text + '%' + #39 + ')'
  else
   obs := '';

  qryCotacao.Close;
  qryCotacao.SQL.Clear;
  qryCotacao.SQL.Add('SELECT C.cot_codigo, C.cot_data, C.cot_vencimento, C.cot_obs,                     '+
                     ' CAST(SUM(I.cot_valor * I.cot_qtd) as numeric(15,2)) AS VALOR_TOTAL               '+
                     'FROM itens_cotacao_compra I, COTACAO_COMPRA C                                     '+
                     'WHERE I.cot_codigo = C.cot_codigo                                                 '+
                     '' + codigo + cod_fornecedor + cod_produto + dta + obs                              +
                     'GROUP BY C.cot_codigo, C.cot_data, C.cot_vencimento, C.cot_obs order by ' + campo  );
  qryCotacao.Open;

end;

end.
