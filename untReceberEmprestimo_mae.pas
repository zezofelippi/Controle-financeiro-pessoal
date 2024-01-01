unit untReceberEmprestimo_mae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CurrEdit, Mask, ToolEdit, Grids, DBGrids,
  DB, IBCustomDataSet, IBQuery, IBDatabase, DBCtrls;

type
  TfrmReceberEmprestimo_mae = class(TForm)
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
    edt_data_i: TDateEdit;
    edt_data_f: TDateEdit;
    lbl2: TLabel;
    edt_OBS_pesq: TEdit;
    lbl3: TLabel;
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
  frmReceberEmprestimo_mae: TfrmReceberEmprestimo_mae;

implementation

uses unt_modulo, untContasReceber_mae;

{$R *.dfm}

procedure TfrmReceberEmprestimo_mae.btnGravarClick(Sender: TObject);
var
  cod_recebimento : integer;
  data1, data2, dta, opcao : string;
  valor, saldoReceber : real;

begin
  if txt_codigo.Text = '' then
  begin
    showmessage('Coloque o codigo');
    txt_codigo.SetFocus;
    exit;
  end;

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
  saldoReceber := frmContasReceber_mae.qryEmprestimo.fieldbyname('SALDO_A_RECEBER').AsFloat;

  if valor > saldoReceber then
  begin
    showmessage('Valor e maior que saldo a receber');
    txt_valor.SetFocus;
    exit;
  end;

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(PG_CODIGO) AS CODIGO FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE');
  QRY_MAX_CODIGO.Open;
  cod_recebimento := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

  qry_trans_local.Close;
  qry_trans_local.SQL.Clear;
  qry_trans_local.SQL.Add('INSERT INTO PAGTO_EMPRESTIMOS_A_RECEBER_MAE (PG_CODIGO, CODIGO, PG_VALOR, PG_DATA, PG_OBS, TP_CODIGO)  '+
                          'VALUES (:PG_CODIGO, :CODIGO, :PG_VALOR, :PG_DATA, :PG_OBS, :TP_CODIGO)                             ');
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
  qryRecebido.SQL.Add('SELECT ER.*, TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE ER '+
                      ' INNER JOIN tipo_pagamento_mae TP ON ER.TP_CODIGO = TP.TP_CODIGO                                             '+
                      ' WHERE CODIGO=:CODIGO ORDER BY PG_CODIGO                                                                 ');
  qryRecebido.ParamByName('CODIGO').AsString := txt_codigo.Text;
  qryRecebido.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE WHERE CODIGO=:CODIGO');
  qryTotal.ParamByName('CODIGO').AsString := txt_codigo.Text;
  qryTotal.Open;

  txt_total_recebido.Value := qryTotal.fieldbyname('TOTAL').AsFloat;

   ///ACERTA TABELA EMPRESTIMOS_A_RECEBER////////
  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;

  qry_trans_local.Close;
  qry_trans_local.SQL.Clear;
  qry_trans_local.SQL.Add('UPDATE EMPRESTIMOS_A_RECEBER_MAE SET VALOR_RECEBIDO=:VALOR_RECEBIDO, SALDO_A_RECEBER=:SALDO_A_RECEBER '+
                          ' WHERE CODIGO=:CODIGO                                                                             ');
  qry_trans_local.ParamByName('CODIGO').AsString         := txt_codigo.Text;
  qry_trans_local.ParamByName('VALOR_RECEBIDO').AsFLOAT  := qryTotal.fieldbyname('TOTAL').AsFloat;
  qry_trans_local.ParamByName('SALDO_A_RECEBER').AsFLOAT := frmContasReceber_mae.qryEmprestimo.fieldbyname('VALOR_EMPRESTIMO').AsFloat - qryTotal.fieldbyname('TOTAL').AsFloat;

  qry_trans_local.ExecSQL;

  IBTRANSLOCAL.Commit;

  //////FIM ACERTA TABELA EMPRESTIMOS_A_RECEBER////////


  //ATUALIZA DADOS DO CONTAS A RECEBER////////

  data1 := Copy(frmContasReceber_mae.txt_data_i.Text,4,3) + Copy(frmContasReceber_mae.txt_data_i.Text,1,3) + Copy(frmContasReceber_mae.txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(frmContasReceber_mae.txt_data_f.Text,4,3) + Copy(frmContasReceber_mae.txt_data_f.Text,1,3) + Copy(frmContasReceber_mae.txt_data_f.Text,7,4) + ' 23:59:59';

  if (frmContasReceber_mae.txt_data_i.Text <> '  /  /    ') and (frmContasReceber_mae.txt_data_f.Text <> '  /  /    ') then
    dta := '  AND DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';


  if frmContasReceber_mae.rdg_opcao.ItemIndex = 0 then
     opcao := ' AND SALDO_A_RECEBER = 0'
  else if frmContasReceber_mae.rdg_opcao.ItemIndex = 1 then
     opcao := ' AND SALDO_A_RECEBER > 0'
  else
     opcao := '';

  frmContasReceber_mae.qryEmprestimo.Close;
  frmContasReceber_mae.qryEmprestimo.SQL.Clear;
  frmContasReceber_mae.qryEmprestimo.SQL.Add('SELECT ER.*, TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO '+
           'FROM EMPRESTIMOS_A_RECEBER_MAE ER                                                                  '+
           'INNER JOIN tipo_pagamento_mae TP ON ER.tp_codigo = TP.tp_codigo                                        '+
           'WHERE 1=1 ' + dta + opcao                                                                           +
           'ORDER BY CODIGO                                                                                    ');
  frmContasReceber_mae.qryEmprestimo.Open;

  frmContasReceber_mae.qryTotal.Close;
  frmContasReceber_mae.qryTotal.SQL.Clear;
  frmContasReceber_mae.qryTotal.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL_EMPRESTIMO,                   '+
                                    ' SUM(VALOR_RECEBIDO) AS TOTAL_RECEBIDO,                             '+
                                    ' SUM(SALDO_A_RECEBER) AS TOTAL_A_RECEBER FROM EMPRESTIMOS_A_RECEBER_MAE '+
                                    ' WHERE CODIGO = CODIGO ' + dta + opcao                              );
  frmContasReceber_mae.qryTotal.Open;

  frmContasReceber_mae.txt_total_emprestado.Value := frmContasReceber_mae.qryTotal.fieldbyname('TOTAL_EMPRESTIMO').AsFloat;
  frmContasReceber_mae.txt_total_recebido.Value := frmContasReceber_mae.qryTotal.fieldbyname('TOTAL_RECEBIDO').AsFloat;
  frmContasReceber_mae.txt_total_a_receber.Value := frmContasReceber_mae.qryTotal.fieldbyname('TOTAL_A_RECEBER').AsFloat;

  // FIM ATUALIZA DADOS DO CONTAS A RECEBER////////

  txt_codigo.Clear;
  txt_obs.Clear;
  txt_valor.Clear;
  txt_data.Clear;

end;

procedure TfrmReceberEmprestimo_mae.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmReceberEmprestimo_mae.txt_dataEnter(Sender: TObject);
begin
  TXT_dATA.Color := $00F5EEDE;
end;

procedure TfrmReceberEmprestimo_mae.txt_dataExit(Sender: TObject);
begin
  txt_data.Color := clwindow;
end;

procedure TfrmReceberEmprestimo_mae.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure TfrmReceberEmprestimo_mae.txt_ValorEnter(Sender: TObject);
begin
  txt_Valor.Color := $00F5EEDE;
end;

procedure TfrmReceberEmprestimo_mae.txt_ValorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure TfrmReceberEmprestimo_mae.txt_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cboFormapgto.SetFocus;
end;

procedure TfrmReceberEmprestimo_mae.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure TfrmReceberEmprestimo_mae.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure TfrmReceberEmprestimo_mae.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmReceberEmprestimo_mae.FormShow(Sender: TObject);
begin
  qryFormaPgto.Close;
  qryFormaPgto.SQL.Clear;
  qryFormaPgto.SQL.Add('SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'' - ''|| TP_DESCRICAO AS DESCRICAO '+
                       ' FROM tipo_pagamento_mae ORDER BY TP_CODIGO                                                     ');
  qryFormaPgto.Open;
  qryFormaPgto.FetchAll;
end;

procedure TfrmReceberEmprestimo_mae.cboFormaPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure TfrmReceberEmprestimo_mae.cboFormaPgtoEnter(Sender: TObject);
begin
  cboFormaPgto.color := $00F5EEDE;
end;

procedure TfrmReceberEmprestimo_mae.cboFormaPgtoExit(Sender: TObject);
begin
  cboFormaPgto.color := clwindow;
end;

procedure TfrmReceberEmprestimo_mae.btnPesquisarClick(Sender: TObject);
var
  data1, data2, obs, dta, tipo_pagamento: string;
begin

  data1 := Copy(edt_data_i.Text,4,3) + Copy(edt_data_i.Text,1,3) + Copy(edt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(edt_data_f.Text,4,3) + Copy(edt_data_f.Text,1,3) + Copy(edt_data_f.Text,7,4) + ' 23:59:59';

  if (edt_data_i.Text <> '  /  /    ') and (edt_data_f.Text <> '  /  /    ') then
    dta := ' AND ER.PG_DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if (edt_OBS_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
   obs  := ' AND UPPER(PG_OBS) LIKE UPPER('+ #39 + edt_OBS_pesq.Text + '%' + #39 + ')'
  else if (edt_OBS_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
   obs  := ' AND UPPER(PG_OBS) LIKE UPPER('+ #39 + '%' + edt_obs_pesq.Text + '%' + #39 + ')'
  else
   obs  := '';

  if cboFormaPgtoPesquisa.Text <> '' then
     tipo_pagamento := ' AND TP.TP_CODIGO = ' + inttostr(cboFormaPgtoPesquisa.KeyValue)
  else
     tipo_pagamento := '';

  qryRecebido.Close;
  qryRecebido.SQL.Clear;
  qryRecebido.SQL.Add('SELECT ER.PG_CODIGO, ER.PG_DATA, ER.PG_VALOR, ER.PG_OBS, ER.CODIGO, TP.TP_CODIGO, ER.CODIGO,  '+
                      ' TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO                                      '+
                      ' FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE ER                                                      '+
                      ' INNER JOIN tipo_pagamento_mae TP ON ER.TP_CODIGO = TP.TP_CODIGO                                  '+
                      ' WHERE 1=1 ' + dta + obs + tipo_pagamento                                                      +
                      ' ORDER BY PG_CODIGO');
  qryRecebido.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE ER '+
                   'INNER JOIN tipo_pagamento_mae TP ON ER.TP_CODIGO = TP.TP_CODIGO       '+
                   'WHERE 1=1 ' + dta + obs + tipo_pagamento                           );
  qryTotal.Open;

  txt_total_recebido.Value := frmReceberEmprestimo_mae.qryTotal.fieldbyname('TOTAL').AsFloat;
end;

procedure TfrmReceberEmprestimo_mae.DBGrid1TitleClick(Column: TColumn);
var
  data1, data2, obs, dta, campo, tipo_pagamento: string;
begin

  data1 := Copy(edt_data_i.Text,4,3) + Copy(edt_data_i.Text,1,3) + Copy(edt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(edt_data_f.Text,4,3) + Copy(edt_data_f.Text,1,3) + Copy(edt_data_f.Text,7,4) + ' 23:59:59';

  if (edt_data_i.Text <> '  /  /    ') and (edt_data_f.Text <> '  /  /    ') then
    dta := ' AND ER.PG_DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if (edt_OBS_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
   obs  := ' AND UPPER(PG_OBS) LIKE UPPER('+ #39 + edt_OBS_pesq.Text + '%' + #39 + ')'
  else if (edt_OBS_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
   obs  := ' AND UPPER(PG_OBS) LIKE UPPER('+ #39 + '%' + edt_obs_pesq.Text + '%' + #39 + ')'
  else
   obs  := '';

   campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  if (campo = 'PG_CODIGO') or (campo = 'PG_DATA') or (campo = 'PG_VALOR') or (campo = 'PG_OBS') or (campo = 'CODIGO') then
   campo := 'ER.' + campo
  else
   campo := 'DESCRICAO' ;

  if cboFormaPgtoPesquisa.Text <> '' then
     tipo_pagamento := ' AND TP.TP_CODIGO = ' + inttostr(cboFormaPgtoPesquisa.KeyValue)
  else
     tipo_pagamento := '';

   
  qryRecebido.Close;
  qryRecebido.SQL.Clear;
  qryRecebido.SQL.Add('SELECT ER.PG_CODIGO, ER.PG_DATA, ER.PG_VALOR, ER.PG_OBS, ER.CODIGO, TP.TP_CODIGO, '+
                      ' TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO                          '+
                      ' FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE ER                                          '+
                      ' INNER JOIN tipo_pagamento_mae TP ON ER.TP_CODIGO = TP.TP_CODIGO                  '+
                      ' WHERE 1=1 ' + dta + obs + tipo_pagamento                                          +
                      ' ORDER BY ' + campo                                                                );
  qryRecebido.Open;


end;

end.
