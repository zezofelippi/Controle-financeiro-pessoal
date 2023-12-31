unit untContasReceber_mae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolEdit, Mask, CurrEdit, Grids, DBGrids, ExtCtrls,
  IBDatabase, DB, IBCustomDataSet, IBQuery, Menus, DBCtrls;

type
  TfrmContasReceber_mae = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    txt_Valor: TCurrencyEdit;
    txt_data: TDateEdit;
    Label4: TLabel;
    Label1: TLabel;
    txt_obs: TEdit;
    btnGravar: TButton;
    GroupBox2: TGroupBox;
    txt_data_i: TDateEdit;
    Label2: TLabel;
    txt_data_f: TDateEdit;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    rdg_opcao: TRadioGroup;
    btnPesquisar: TButton;
    Label6: TLabel;
    txt_total_emprestado: TCurrencyEdit;
    Edit2: TEdit;
    Label23: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    qry_trans_local: TIBQuery;
    IBTRANSLOCAL: TIBTransaction;
    Label8: TLabel;
    txt_codigo: TEdit;
    QRY_MAX_CODIGO: TIBQuery;
    qryEmprestimo: TIBQuery;
    dsEmprestimo: TDataSource;
    qryTotal: TIBQuery;
    Label9: TLabel;
    txt_total_recebido: TCurrencyEdit;
    Label10: TLabel;
    txt_total_a_receber: TCurrencyEdit;
    PopupMenu1: TPopupMenu;
    Receber1: TMenuItem;
    Label11: TLabel;
    Label12: TLabel;
    TXT_OBS_pesq: TEdit;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    Label13: TLabel;
    cboFormaPgto: TDBLookupComboBox;
    dsFormaPgto: TDataSource;
    qryFormaPgto: TIBQuery;
    qryFormaPgtoTP_CODIGO: TIntegerField;
    qryFormaPgtoTP_DESCRICAO: TIBStringField;
    qryFormaPgtoTP_DEFAULT: TIBStringField;
    qryFormaPgtoDESCRICAO: TIBStringField;
    txt_valor_saldo: TCurrencyEdit;
    qryEmprestimoCODIGO: TIntegerField;
    qryEmprestimoVALOR_EMPRESTIMO: TIBBCDField;
    qryEmprestimoDATA: TDateTimeField;
    qryEmprestimoOBS: TIBStringField;
    qryEmprestimoVALOR_RECEBIDO: TIBBCDField;
    qryEmprestimoSALDO_A_RECEBER: TIBBCDField;
    qryEmprestimoTP_CODIGO: TIntegerField;
    qryEmprestimoDESCRICAO: TIBStringField;
    btn1: TButton;
    Button1: TButton;
    Label14: TLabel;
    cboFormaPgtoPesquisa: TDBLookupComboBox;
    procedure txt_dataEnter(Sender: TObject);
    procedure txt_dataExit(Sender: TObject);
    procedure txt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure txt_ValorEnter(Sender: TObject);
    procedure txt_ValorExit(Sender: TObject);
    procedure txt_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure txt_data_iEnter(Sender: TObject);
    procedure txt_data_iExit(Sender: TObject);
    procedure txt_data_iKeyPress(Sender: TObject; var Key: Char);
    procedure txt_data_fEnter(Sender: TObject);
    procedure txt_data_fExit(Sender: TObject);
    procedure txt_data_fKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Receber1Click(Sender: TObject);
    procedure TXT_OBS_pesqEnter(Sender: TObject);
    procedure TXT_OBS_pesqExit(Sender: TObject);
    procedure TXT_OBS_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure cboFormaPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasReceber_mae: TfrmContasReceber_mae;

implementation

uses unt_modulo, unt_funcoes,
  untReceberEmprestimo_mae;

{$R *.dfm}

procedure TfrmContasReceber_mae.txt_dataEnter(Sender: TObject);
begin
  txt_data.Color :=$00F5EEDE;
end;

procedure TfrmContasReceber_mae.txt_dataExit(Sender: TObject);
begin
  txt_data.Color := clwindow;
end;

procedure TfrmContasReceber_mae.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure TfrmContasReceber_mae.txt_ValorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure TfrmContasReceber_mae.txt_ValorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure TfrmContasReceber_mae.txt_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cboFormapgto.SetFocus;
end;

procedure TfrmContasReceber_mae.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color :=$00F5EEDE;
end;

procedure TfrmContasReceber_mae.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure TfrmContasReceber_mae.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmContasReceber_mae.btnGravarClick(Sender: TObject);
var
  cod_emprestimo : integer;
  valor : real;

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

  ////////VERIFICA SE SALDO E SUFICIENTE/////
  txt_valor_saldo.value := VerificaSaldo(cboFormaPgto.KeyValue, valor);

  if txt_valor_Saldo.Value < txt_valor.Value then
  begin
    showmessage('Saldo insuficiente');
    txt_Valor.SetFocus;
    exit;
  end;
  ////////FIM VERIFICA SE SALDO E SUFICIENTE/////

  if (txt_codigo.Text <> '') and (qryEmprestimo.FieldByName('VALOR_RECEBIDO').AsFLOAT > 0) then
  begin
    showmessage('Valor ja teve recebimento, insira ou emprestimo');
    txt_codigo.Clear;
    txt_obs.Clear;
    txt_valor.Clear;
    txt_data.Clear;
    txt_data.SetFocus;
    exit;
  end;

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;

  if txt_codigo.Text = '' then
  begin
    QRY_MAX_CODIGO.Close;
    QRY_MAX_CODIGO.SQL.Clear;
    QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM EMPRESTIMOS_A_RECEBER_MAE');
    QRY_MAX_CODIGO.Open;
    cod_emprestimo := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;


    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO EMPRESTIMOS_A_RECEBER_MAE (CODIGO, VALOR_EMPRESTIMO, VALOR_RECEBIDO, SALDO_A_RECEBER, DATA, OBS, TP_CODIGO)  '+
                            'VALUES (:CODIGO, :VALOR_EMPRESTIMO, :VALOR_RECEBIDO, :SALDO_A_RECEBER, :DATA, :OBS, :TP_CODIGO)                      ');
    qry_trans_local.ParamByName('CODIGO').AsInteger         := cod_emprestimo;
  end
  else
  begin
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE EMPRESTIMOS_A_RECEBER_MAE SET VALOR_EMPRESTIMO=:VALOR_EMPRESTIMO, VALOR_RECEBIDO=:VALOR_RECEBIDO, '+
                            'SALDO_A_RECEBER=:SALDO_A_RECEBER, DATA=:DATA, OBS=:OBS, TP_CODIGO=:TP_CODIGO WHERE CODIGO=:CODIGO    ');
    qry_trans_local.ParamByName('CODIGO').AsString  := txt_codigo.Text;
  end;

  qry_trans_local.ParamByName('OBS').AsString             := txt_obs.Text;
  qry_trans_local.ParamByName('VALOR_EMPRESTIMO').AsFLOAT := txt_valor.Value;
  qry_trans_local.ParamByName('VALOR_RECEBIDO').AsFLOAT   := 0;
  qry_trans_local.ParamByName('SALDO_A_RECEBER').AsFLOAT  := txt_valor.Value;
  qry_trans_local.ParamByName('DATA').AsDateTime          := txt_data.Date;
  qry_trans_local.ParamByName('TP_CODIGO').AsString       := inttostr(cboFormaPgto.KeyValue);

  qry_trans_local.ExecSQL;

  IBTRANSLOCAL.Commit;

  txt_codigo.Clear;
  txt_obs.Clear;
  txt_valor.Clear;
  txt_data.Clear;
  cboFormaPgto.KeyValue := -1;

end;

procedure TfrmContasReceber_mae.txt_data_iEnter(Sender: TObject);
begin
  txt_data_i.Color :=$00F5EEDE;
end;

procedure TfrmContasReceber_mae.txt_data_iExit(Sender: TObject);
begin
  txt_data_i.Color := clwindow;
end;

procedure TfrmContasReceber_mae.txt_data_iKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_Data_f.SetFocus;
end;

procedure TfrmContasReceber_mae.txt_data_fEnter(Sender: TObject);
begin
  txt_Data_f.Color :=$00F5EEDE;
end;

procedure TfrmContasReceber_mae.txt_data_fExit(Sender: TObject);
begin
  txt_data_f.Color := clwindow;
end;

procedure TfrmContasReceber_mae.txt_data_fKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs_pesq.SetFocus;
end;

procedure TfrmContasReceber_mae.btnPesquisarClick(Sender: TObject);
var
  dta, data1, data2, opcao, mensagem, obs, tipo_pagamento : string;
begin

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if rdg_opcao.ItemIndex = 0 then
    opcao := ' AND SALDO_A_RECEBER = 0'
  else if rdg_opcao.ItemIndex = 1 then
    opcao := ' AND SALDO_A_RECEBER > 0'
  else
    opcao := '';

  if (txt_obs_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
    obs  := ' AND UPPER(OBS) LIKE UPPER('+ #39 + txt_obs_pesq.Text + '%' + #39 + ')'
  else if (txt_obs_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
    obs  := ' AND UPPER(OBS) LIKE UPPER('+ #39 + '%' + txt_obs_pesq.Text + '%' + #39 + ')'
  else
    obs  := '';

  if cboFormaPgtoPesquisa.Text <> '' then
    tipo_pagamento := ' AND TP.TP_CODIGO = ' + inttostr(cboFormaPgtoPesquisa.KeyValue)
  else
    tipo_pagamento := '';

  qryEmprestimo.Close;
  qryEmprestimo.SQL.Clear;
  qryEmprestimo.SQL.Add('SELECT ER.*, TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO  '+
             'FROM EMPRESTIMOS_A_RECEBER_MAE ER                                                    '+
             'INNER JOIN tipo_pagamento TP ON ER.tp_codigo = TP.tp_codigo                      '+
             'WHERE 1=1 ' + dta + opcao + obs + tipo_pagamento                                  +
             'ORDER BY CODIGO                                                                  ');
  qryEmprestimo.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL_EMPRESTIMO,                      '+
                   ' SUM(VALOR_RECEBIDO) AS TOTAL_RECEBIDO,                                '+
                   ' SUM(SALDO_A_RECEBER) AS TOTAL_A_RECEBER FROM EMPRESTIMOS_A_RECEBER_MAE ER '+
                   ' INNER JOIN tipo_pagamento TP ON ER.tp_codigo = TP.tp_codigo           '+
                   ' WHERE CODIGO = CODIGO ' + dta + opcao + obs + tipo_pagamento           );
  qryTotal.Open;

  txt_total_emprestado.Value := qryTotal.fieldbyname('TOTAL_EMPRESTIMO').AsFloat;
  txt_total_recebido.Value := qryTotal.fieldbyname('TOTAL_RECEBIDO').AsFloat;
  txt_total_a_receber.Value := qryTotal.fieldbyname('TOTAL_A_RECEBER').AsFloat;

end;

procedure TfrmContasReceber_mae.FormShow(Sender: TObject);
begin
  txt_data.SetFocus;
  rdg_opcao.ItemIndex := 0;
  rdb_inicio.Checked := true;

  qryFormaPgto.Close;
  qryFormaPgto.SQL.Clear;
  qryFormaPgto.SQL.Add('SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'' - ''|| TP_DESCRICAO AS DESCRICAO '+
                       ' FROM TIPO_PAGAMENTO ORDER BY TP_CODIGO                                                     ');
  qryFormaPgto.Open;
  qryFormaPgto.FetchAll;

end;

procedure TfrmContasReceber_mae.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not qryEmprestimo.IsEmpty then
  begin
    if qryEmprestimo.FieldByName('SALDO_A_RECEBER').AsFloat = 0  then
      DBGrid1.Canvas.Brush.Color := claqua
    else if qryEmprestimo.FieldByName('SALDO_A_RECEBER').AsFloat > 0  then
      DBGrid1.Canvas.Brush.Color := clwindow;
  end;

  TDbGrid(Sender).Canvas.Font.Color:= $00400000;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Font.Style := [fsbold];
      Font.Color := clWhite;

      if not qryEmprestimo.IsEmpty then
      begin
        if qryEmprestimo.FieldByName('SALDO_A_RECEBER').AsFloat = 0  then
          DBGrid1.Canvas.Brush.Color := claqua
        else if qryEmprestimo.FieldByName('SALDO_A_RECEBER').AsFloat > 0  then
          DBGrid1.Canvas.Brush.Color := clwindow;
      end;
    end;

  DBGrid1.Canvas.Font.Color:= clBlack;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmContasReceber_mae.DBGrid1DblClick(Sender: TObject);
begin
  txt_codigo.Text :=  qryEmprestimo.fieldbyname('CODIGO').AsString;
  txt_Data.Text := qryEmprestimo.fieldbyname('DATA').AsString;
  txt_valor.Value := qryEmprestimo.fieldbyname('VALOR_EMPRESTIMO').AsFloat;
  TXT_OBS.Text := qryEmprestimo.fieldbyname('OBS').AsString;
  cboformapgto.KeyValue :=  qryEmprestimo.fieldbyname('TP_CODIGO').AsString;
end;

procedure TfrmContasReceber_mae.Receber1Click(Sender: TObject);
begin

  Application.CreateForm(TfrmReceberEmprestimo_mae, frmReceberEmprestimo_mae);

  frmReceberEmprestimo_mae.txt_codigo.Text :=  qryEmprestimo.fieldbyname('CODIGO').AsString;

  frmReceberEmprestimo_mae.qryRecebido.Close;
  frmReceberEmprestimo_mae.qryRecebido.SQL.Clear;
  frmReceberEmprestimo_mae.qryRecebido.SQL.Add('SELECT ER.*, TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE ER '+
                                               ' INNER JOIN TIPO_PAGAMENTO TP ON ER.TP_CODIGO = TP.TP_CODIGO                                             '+
                                               ' WHERE CODIGO=:CODIGO ORDER BY PG_CODIGO                                                                 ');
  frmReceberEmprestimo_mae.qryRecebido.ParamByName('CODIGO').AsString := frmReceberEmprestimo_mae.txt_codigo.Text;
  frmReceberEmprestimo_mae.qryRecebido.Open;

  frmReceberEmprestimo_mae.qryTotal.Close;
  frmReceberEmprestimo_mae.qryTotal.SQL.Clear;
  frmReceberEmprestimo_mae.qryTotal.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE WHERE CODIGO=:CODIGO');
  frmReceberEmprestimo_mae.qryTotal.ParamByName('CODIGO').AsString := frmReceberEmprestimo_mae.txt_codigo.Text;
  frmReceberEmprestimo_mae.qryTotal.Open;

  frmReceberEmprestimo_mae.txt_total_recebido.Value := frmReceberEmprestimo_mae.qryTotal.fieldbyname('TOTAL').AsFloat;

  frmReceberEmprestimo_mae.show;

end;

procedure TfrmContasReceber_mae.TXT_OBS_pesqEnter(Sender: TObject);
begin
  txt_obs_pesq.Color := $00F5EEDE;
end;

procedure TfrmContasReceber_mae.TXT_OBS_pesqExit(Sender: TObject);
begin
  txt_obs_pesq.Color := clwindow;
end;

procedure TfrmContasReceber_mae.TXT_OBS_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnPesquisar.SetFocus;
end;

procedure TfrmContasReceber_mae.cboFormaPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure TfrmContasReceber_mae.btn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmReceberEmprestimo_mae, frmReceberEmprestimo_mae);
  frmReceberEmprestimo_mae.show;
end;

procedure TfrmContasReceber_mae.DBGrid1TitleClick(Column: TColumn);
var
  dta, data1, data2, opcao, mensagem, obs, campo, tipo_pagamento : string;
begin

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if rdg_opcao.ItemIndex = 0 then
    opcao := ' AND SALDO_A_RECEBER = 0'
  else if rdg_opcao.ItemIndex = 1 then
    opcao := ' AND SALDO_A_RECEBER > 0'
  else
    opcao := '';

  if (txt_obs_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
    obs  := ' AND UPPER(OBS) LIKE UPPER('+ #39 + txt_obs_pesq.Text + '%' + #39 + ')'
  else if (txt_obs_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
    obs  := ' AND UPPER(OBS) LIKE UPPER('+ #39 + '%' + txt_obs_pesq.Text + '%' + #39 + ')'
  else
    obs  := '';

  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  if (campo = 'CODIGO') or (campo = 'DATA') or (campo = 'VALOR_EMPRESTIMO') or
     (campo = 'VALOR_RECEBIDO') or (campo = 'SALDO_A_RECEBER') or (campo = 'OBS') then
    campo := 'ER.' + campo
  else
    campo := 'DESCRICAO' ;

  if cboFormaPgtoPesquisa.Text <> '' then
    tipo_pagamento := ' AND TP.TP_CODIGO = ' + inttostr(cboFormaPgtoPesquisa.KeyValue)
  else
    tipo_pagamento := '';

  qryEmprestimo.Close;
  qryEmprestimo.SQL.Clear;
  qryEmprestimo.SQL.Add('SELECT ER.CODIGO, ER.DATA, ER.VALOR_EMPRESTIMO, ER.VALOR_RECEBIDO, ER.SALDO_A_RECEBER, ER.OBS, TP.TP_CODIGO, '+
                        ' TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO                                                     '+
                        'FROM EMPRESTIMOS_A_RECEBER_MAE ER                                                                            '+
                        'INNER JOIN tipo_pagamento TP ON ER.tp_codigo = TP.tp_codigo                                                  '+
                        'WHERE 1=1 ' + dta + opcao + obs + tipo_pagamento                                                              +
                        'ORDER BY ' + campo                                                                                            );
  qryEmprestimo.Open;

end;

procedure TfrmContasReceber_mae.Button1Click(Sender: TObject);
begin
  showmessage('Este total pode não estar preciso com o Resumo Geral.         '+
    ' O Total Recebido corretamente está na tela clicando no botão           '+
    ' Consultar Recebimentos. Valor preciso está no cálculo:                 '+
    ' Total Emprestado - Total Recebido (tela Receber Empréstimo)            '+
    '                     Pode acontecer de ser pago um emprestimo,          '+
    ' por exemplo, no ano de 2021 e que o emprestimo foi fetio               '+
    ' no ano 2020, e ele naoaparece na pesquisa de emprestimos a receber do  '+
    ' ano de 2021, por isso o total recebido pode nao bater no Resumo Geral  ');
end;

end.
