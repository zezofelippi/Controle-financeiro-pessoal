unit untPagarEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CurrEdit, Mask, ToolEdit, Grids, DBGrids,
  DB, IBCustomDataSet, IBQuery, IBDatabase, DBCtrls;

type
  TfrmPagarEmprestimo = class(TForm)
    GroupBox1: TGroupBox;
    txt_codigo: TEdit;
    Label8: TLabel;
    txt_data: TDateEdit;
    Label4: TLabel;
    txt_Valor: TCurrencyEdit;
    Label3: TLabel;
    txt_obs: TEdit;
    Label1: TLabel;
    btnGravar: TButton;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    txt_total_recebido: TCurrencyEdit;
    qry_trans_local: TIBQuery;
    IBTRANSLOCAL: TIBTransaction;
    qryRecebido: TIBQuery;
    dsRecebido: TDataSource;
    qryTotal: TIBQuery;
    QRY_MAX_CODIGO: TIBQuery;
    Label13: TLabel;
    cboFormaPgto: TDBLookupComboBox;
    dsFormaPgto: TDataSource;
    qryFormaPgto: TIBQuery;
    qryFormaPgtoTP_CODIGO: TIntegerField;
    qryFormaPgtoTP_DESCRICAO: TIBStringField;
    qryFormaPgtoTP_DEFAULT: TIBStringField;
    qryFormaPgtoDESCRICAO: TIBStringField;
    qryRecebidoPG_CODIGO: TIntegerField;
    qryRecebidoCODIGO: TIntegerField;
    qryRecebidoPG_VALOR: TIBBCDField;
    qryRecebidoPG_DATA: TDateTimeField;
    qryRecebidoPG_OBS: TIBStringField;
    qryRecebidoTP_CODIGO: TIntegerField;
    qryRecebidoDESCRICAO: TIBStringField;
    gpb1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt_data_i: TDateEdit;
    edt_data_f: TDateEdit;
    edt_OBS_pesq: TEdit;
    btnPesquisar: TButton;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    Label14: TLabel;
    cboFormaPgtoPesquisa: TDBLookupComboBox;
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txt_dataEnter(Sender: TObject);
    procedure txt_dataExit(Sender: TObject);
    procedure txt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure txt_ValorEnter(Sender: TObject);
    procedure txt_ValorExit(Sender: TObject);
    procedure txt_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cboFormaPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure cboFormaPgtoEnter(Sender: TObject);
    procedure cboFormaPgtoExit(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPagarEmprestimo: TfrmPagarEmprestimo;

implementation

uses unt_modulo, untEmprestimosPagar;

{$R *.dfm}

procedure TfrmPagarEmprestimo.btnGravarClick(Sender: TObject);
var
  cod_recebimento : integer;
  data1, data2, dta, opcao : string;
  valor, saldoPagar: real;

begin
  if txt_valor.Text = '' then
  begin
    showmessage('Coloque o valor');
    txt_valor.SetFocus;
    exit;
  end;

  if txt_data.Text = '  /  /    ' then
  begin
    showmessage('Coloque a data');
    txt_data.SetFocus;
    exit;
  end;

  if txt_obs.Text = '' then
  begin
    showmessage('Coloque uma obs');
    txt_obs.SetFocus;
    exit;
  end;

  valor := txt_valor.Value;
  saldoPagar := frmEmprestimosPagar.qryEmprestimo.fieldbyname('SALDO_A_PAGAR').AsFloat;

  if valor > saldoPagar then
  begin
    showmessage('Valor e maior que saldo a receber');
    txt_valor.SetFocus;
    exit;
  end;

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(PG_CODIGO) AS CODIGO FROM PAGTO_EMPRESTIMOS_A_PAGAR');
  QRY_MAX_CODIGO.Open;
  cod_recebimento := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;


  qry_trans_local.Close;
  qry_trans_local.SQL.Clear;
  qry_trans_local.SQL.Add('INSERT INTO PAGTO_EMPRESTIMOS_A_PAGAR (PG_CODIGO, CODIGO, PG_VALOR, PG_DATA, PG_OBS, TP_CODIGO)  '+
                          'VALUES (:PG_CODIGO, :CODIGO, :PG_VALOR, :PG_DATA, :PG_OBS, :TP_CODIGO)                           ');
  qry_trans_local.ParamByName('PG_CODIGO').AsInteger := cod_recebimento;
  qry_trans_local.ParamByName('CODIGO').AsString     := txt_codigo.Text;
  qry_trans_local.ParamByName('PG_VALOR').AsFLOAT    := txt_valor.Value;
  qry_trans_local.ParamByName('PG_DATA').AsDateTime  := txt_data.Date;
  qry_trans_local.ParamByName('PG_OBS').AsString     := txt_obs.text;
  qry_trans_local.ParamByName('TP_CODIGO').AsString  := inttostr(cboFormaPgto.KeyValue);

  qry_trans_local.ExecSQL;

  IBTRANSLOCAL.Commit;

  qryRecebido.Close;
  qryRecebido.SQL.Clear;
  qryRecebido.SQL.Add('SELECT EP.*, EP.TP_CODIGO ||'' - ''|| TP.TP_DESCRICAO AS DESCRICAO FROM PAGTO_EMPRESTIMOS_A_PAGAR EP '+
                      ' INNER JOIN TIPO_PAGAMENTO TP ON EP.TP_CODIGO = TP.TP_CODIGO                                         '+
                      ' WHERE CODIGO=:CODIGO ORDER BY PG_CODIGO                                                             ');
  qryRecebido.ParamByName('CODIGO').AsString := txt_codigo.Text;
  qryRecebido.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL FROM PAGTO_EMPRESTIMOS_A_PAGAR WHERE CODIGO=:CODIGO');
  qryTotal.ParamByName('CODIGO').AsString := txt_codigo.Text;
  qryTotal.Open;

  txt_total_recebido.Value := qryTotal.fieldbyname('TOTAL').AsFloat;

   ///ACERTA TABELA EMPRESTIMOS_A_RECEBER////////
  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;

  qry_trans_local.Close;
  qry_trans_local.SQL.Clear;
  qry_trans_local.SQL.Add('UPDATE EMPRESTIMOS_A_PAGAR SET VALOR_PAGO=:VALOR_PAGO, SALDO_A_PAGAR=:SALDO_A_PAGAR '+
                          ' WHERE CODIGO=:CODIGO                                                               ');
  qry_trans_local.ParamByName('CODIGO').AsString     := txt_codigo.Text;
  qry_trans_local.ParamByName('VALOR_PAGO').AsFLOAT  := qryTotal.fieldbyname('TOTAL').AsFloat;
  qry_trans_local.ParamByName('SALDO_A_PAGAR').AsFLOAT := frmEmprestimosPagar.qryEmprestimo.fieldbyname('VALOR_A_PAGAR').AsFloat - qryTotal.fieldbyname('TOTAL').AsFloat;

  qry_trans_local.ExecSQL;

  IBTRANSLOCAL.Commit;

  //////FIM ACERTA TABELA EMPRESTIMOS_A_RECEBER////////


  //ATUALIZA DADOS DO CONTAS A RECEBER////////
  data1 := Copy(frmEmprestimosPagar.txt_data_i.Text,4,3) + Copy(frmEmprestimosPagar.txt_data_i.Text,1,3) + Copy(frmEmprestimosPagar.txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(frmEmprestimosPagar.txt_data_f.Text,4,3) + Copy(frmEmprestimosPagar.txt_data_f.Text,1,3) + Copy(frmEmprestimosPagar.txt_data_f.Text,7,4) + ' 23:59:59';

   if (frmEmprestimosPagar.txt_data_i.Text <> '  /  /    ') and (frmEmprestimosPagar.txt_data_f.Text <> '  /  /    ') then
     dta := ' AND DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
   else
     dta := '';

   if frmEmprestimosPagar.rdg_opcao.ItemIndex = 0 then
      opcao := ' AND SALDO_A_PAGAR = 0'
   else if frmEmprestimosPagar.rdg_opcao.ItemIndex = 1 then
      opcao := ' AND SALDO_A_PAGAR > 0'
   else
      opcao := '';

  frmEmprestimosPagar.qryEmprestimo.Close;
  frmEmprestimosPagar.qryEmprestimo.SQL.Clear;
  frmEmprestimosPagar.qryEmprestimo.SQL.Add('SELECT EP.*, TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO  FROM EMPRESTIMOS_A_PAGAR EP  '+
                                            ' INNER JOIN TIPO_PAGAMENTO TP ON EP.TP_CODIGO = TP.TP_CODIGO                                       '+
                                            ' WHERE CODIGO = CODIGO ' + dta + opcao + ' ORDER BY CODIGO                                         ');
  frmEmprestimosPagar.qryEmprestimo.Open;

  frmEmprestimosPagar.qryTotal.Close;
  frmEmprestimosPagar.qryTotal.SQL.Clear;
  frmEmprestimosPagar.qryTotal.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL_A_PAGAR,                         '+
                                       ' SUM(VALOR_PAGO) AS TOTAL_PAGO,                                     '+
                                       ' SUM(SALDO_A_PAGAR) AS TOTAL_SALDO_A_PAGAR FROM EMPRESTIMOS_A_PAGAR '+
                                       ' WHERE CODIGO = CODIGO ' + dta + opcao                               );

  frmEmprestimosPagar.qryTotal.Open;

  frmEmprestimosPagar.txt_total_a_pagar.Value := frmEmprestimosPagar.qryTotal.fieldbyname('TOTAL_A_PAGAR').AsFloat;
  frmEmprestimosPagar.txt_total_pago.Value := frmEmprestimosPagar.qryTotal.fieldbyname('TOTAL_PAGO').AsFloat;
  frmEmprestimosPagar.txt_total_saldo_a_pagar.Value := frmEmprestimosPagar.qryTotal.fieldbyname('TOTAL_SALDO_A_PAGAR').AsFloat;
  // FIM ATUALIZA DADOS DO CONTAS A RECEBER////////

  txt_codigo.Clear;
  txt_obs.Clear;
  txt_valor.Clear;
  txt_data.Clear;
  cboFormaPgto.keyvalue := -1;

end;

procedure TfrmPagarEmprestimo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.Font.Color:= $00400000;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clMenuHighlight;
      Font.Style := [fsbold];
      Font.Color := clWhite
    end
    else
      DBGrid1.Canvas.Font.Color:= clBlack;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPagarEmprestimo.txt_dataEnter(Sender: TObject);
begin
  TXT_dATA.Color := $00F5EEDE;
end;

procedure TfrmPagarEmprestimo.txt_dataExit(Sender: TObject);
begin
  txt_data.Color := clwindow;
end;

procedure TfrmPagarEmprestimo.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure TfrmPagarEmprestimo.txt_ValorEnter(Sender: TObject);
begin
  txt_Valor.Color := $00F5EEDE;
end;

procedure TfrmPagarEmprestimo.txt_ValorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure TfrmPagarEmprestimo.txt_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cboformaPgto.SetFocus;
end;

procedure TfrmPagarEmprestimo.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure TfrmPagarEmprestimo.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure TfrmPagarEmprestimo.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmPagarEmprestimo.FormShow(Sender: TObject);
begin

  qryFormaPgto.Close;
  qryFormaPgto.SQL.Clear;
  qryFormaPgto.SQL.Add('SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'' - ''|| TP_DESCRICAO AS DESCRICAO '+
                       ' FROM TIPO_PAGAMENTO ORDER BY TP_CODIGO                                                     ');
  qryFormaPgto.Open;
  qryFormaPgto.FetchAll;

end;

procedure TfrmPagarEmprestimo.cboFormaPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure TfrmPagarEmprestimo.cboFormaPgtoEnter(Sender: TObject);
begin
  cboFormapgto.color := $00F5EEDE;
end;

procedure TfrmPagarEmprestimo.cboFormaPgtoExit(Sender: TObject);
begin
  cboformapgto.color := clwindow;
end;

procedure TfrmPagarEmprestimo.btnPesquisarClick(Sender: TObject);
var
  data1, data2, obs, dta, tipo_pagamento: string;
begin

  data1 := Copy(edt_data_i.Text,4,3) + Copy(edt_data_i.Text,1,3) + Copy(edt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(edt_data_f.Text,4,3) + Copy(edt_data_f.Text,1,3) + Copy(edt_data_f.Text,7,4) + ' 23:59:59';

  if (edt_data_i.Text <> '  /  /    ') and (edt_data_f.Text <> '  /  /    ') then
    dta := ' AND PG_DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if (edt_obs_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
   obs  := ' AND UPPER(PG_OBS) LIKE UPPER('+ #39 + edt_obs_pesq.Text + '%' + #39 + ')'
  else if (edt_obs_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
   obs  := ' AND UPPER(PG_OBS) LIKE UPPER('+ #39 + '%' + edt_obs_pesq.Text + '%' + #39 + ')'
  else
   obs  := '';

  if cboFormaPgtoPesquisa.Text <> '' then
     tipo_pagamento := ' AND TP.TP_CODIGO = ' + inttostr(cboFormaPgtoPesquisa.KeyValue)
  else
     tipo_pagamento := '';

  qryRecebido.Close;
  qryRecebido.SQL.Clear;
  qryRecebido.SQL.Add('SELECT EP.*, EP.TP_CODIGO ||'' - ''|| TP.TP_DESCRICAO AS DESCRICAO FROM PAGTO_EMPRESTIMOS_A_PAGAR EP '+
                      ' INNER JOIN TIPO_PAGAMENTO TP ON EP.TP_CODIGO = TP.TP_CODIGO                                         '+
                      ' WHERE 1=1 ' + dta + obs + tipo_pagamento                                                             +
                      ' ORDER BY PG_CODIGO                                                                                  ');
  qryRecebido.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL FROM PAGTO_EMPRESTIMOS_A_PAGAR EP INNER JOIN TIPO_PAGAMENTO TP ON EP.TP_CODIGO = TP.TP_CODIGO ');
  qryTotal.SQL.Add('WHERE 1=1 ' + dta + obs + tipo_pagamento + '');
  qryTotal.Open;

  txt_total_recebido.Value := qryTotal.fieldbyname('TOTAL').AsFloat;
end;

procedure TfrmPagarEmprestimo.DBGrid1TitleClick(Column: TColumn);
var
  data1, data2, obs, dta, campo, tipo_pagamento: string;
begin

  data1 := Copy(edt_data_i.Text,4,3) + Copy(edt_data_i.Text,1,3) + Copy(edt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(edt_data_f.Text,4,3) + Copy(edt_data_f.Text,1,3) + Copy(edt_data_f.Text,7,4) + ' 23:59:59';

  if (edt_data_i.Text <> '  /  /    ') and (edt_data_f.Text <> '  /  /    ') then
    dta := ' AND PG_DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if (edt_obs_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
   obs  := ' AND UPPER(PG_OBS) LIKE UPPER('+ #39 + edt_obs_pesq.Text + '%' + #39 + ')'
  else if (edt_obs_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
   obs  := ' AND UPPER(PG_OBS) LIKE UPPER('+ #39 + '%' + edt_obs_pesq.Text + '%' + #39 + ')'
  else
   obs  := '';

   campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  
  if (campo = 'PG_CODIGO') or (campo = 'PG_DATA') or (campo = 'PG_VALOR') or
     (campo = 'PG_OBS') or (campo = 'CODIGO') then
   campo := 'EP.' + campo
  else
   campo := 'DESCRICAO' ;

  if cboFormaPgtoPesquisa.Text <> '' then
     tipo_pagamento := ' AND TP.TP_CODIGO = ' + inttostr(cboFormaPgtoPesquisa.KeyValue)
  else
     tipo_pagamento := '';

  qryRecebido.Close;
  qryRecebido.SQL.Clear;
  qryRecebido.SQL.Add('SELECT EP.PG_CODIGO, EP.PG_DATA, EP.PG_VALOR, EP.PG_OBS, EP.TP_CODIGO, EP.CODIGO,        '+
                      ' EP.TP_CODIGO ||'' - ''|| TP.TP_DESCRICAO AS DESCRICAO FROM PAGTO_EMPRESTIMOS_A_PAGAR EP '+
                      ' INNER JOIN TIPO_PAGAMENTO TP ON EP.TP_CODIGO = TP.TP_CODIGO                             '+
                      ' WHERE 1=1 ' + dta + obs + tipo_pagamento                                                 +
                      ' ORDER BY ' + campo                                                                       );
  qryRecebido.Open;

end;

end.
