unit untTransferenciaFinanceira_mae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids,
  IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TfrmTransferenciaFinanceira_mae = class(TForm)
    GroupBox1: TGroupBox;
    txt_Data_i: TDateEdit;
    txt_data_f: TDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    btnPesquisar: TButton;
    qry_transLocal: TIBQuery;
    IBTransLocal: TIBTransaction;
    QRY_MAX_CODIGO: TIBQuery;
    qryPesquisa: TIBQuery;
    dsPesquisa: TDataSource;
    qryTotal: TIBQuery;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    cbo_de: TDBLookupComboBox;
    cbo_para: TDBLookupComboBox;
    txt_valor: TCurrencyEdit;
    btnGravar: TButton;
    txt_data: TDateEdit;
    txt_obs: TEdit;
    qryTipoReceita: TIBQuery;
    qryTipoReceitaTP_CODIGO: TIntegerField;
    qryTipoReceitaTP_DESCRICAO: TIBStringField;
    qryTipoReceitaTP_DEFAULT: TIBStringField;
    qryTipoReceitaDESCRICAO: TIBStringField;
    dsTipoReceita: TDataSource;
    GroupBox3: TGroupBox;
    btnRelatorio: TButton;
    txt_valor_saldo: TCurrencyEdit;
    cbo_de_pesq: TDBLookupComboBox;
    Label7: TLabel;
    Label9: TLabel;
    cbo_para_pesq: TDBLookupComboBox;
    qryPesquisaDATA: TDateTimeField;
    qryPesquisaVALOR: TIBBCDField;
    qryPesquisaOBS: TIBStringField;
    qryPesquisaDE: TIBStringField;
    qryPesquisaPARA: TIBStringField;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure cbo_deKeyPress(Sender: TObject; var Key: Char);
    procedure cbo_paraKeyPress(Sender: TObject; var Key: Char);
    procedure txt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure txt_Data_iKeyPress(Sender: TObject; var Key: Char);
    procedure cbo_deEnter(Sender: TObject);
    procedure cbo_deExit(Sender: TObject);
    procedure cbo_paraEnter(Sender: TObject);
    procedure cbo_paraExit(Sender: TObject);
    procedure txt_dataEnter(Sender: TObject);
    procedure txt_dataExit(Sender: TObject);
    procedure txt_valorEnter(Sender: TObject);
    procedure txt_valorExit(Sender: TObject);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_Data_iEnter(Sender: TObject);
    procedure txt_Data_iExit(Sender: TObject);
    procedure txt_data_fEnter(Sender: TObject);
    procedure txt_data_fExit(Sender: TObject);
    procedure txt_data_fKeyPress(Sender: TObject; var Key: Char);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure cbo_de_pesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbo_para_pesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransferenciaFinanceira_mae: TfrmTransferenciaFinanceira_mae;

implementation

uses unt_modulo, untRelTransfFinanc, untRelContasPagar, unt_funcoes;

{$R *.dfm}

procedure TfrmTransferenciaFinanceira_mae.FormShow(Sender: TObject);
begin
  qrytiporeceita.Close;
  qrytiporeceita.SQL.Clear;
  qrytiporeceita.SQL.Add('SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'' - ''|| TP_DESCRICAO AS DESCRICAO '+
                         ' FROM TIPO_PAGAMENTO_MAE ORDER BY TP_CODIGO                                                 ');
  qrytiporeceita.Open;
  qrytiporeceita.FetchAll;
end;

procedure TfrmTransferenciaFinanceira_mae.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmTransferenciaFinanceira_mae := nil;
  action:= cafree;
end;

procedure TfrmTransferenciaFinanceira_mae.btnGravarClick(Sender: TObject);
var
  cod : integer;
  valor : real;
begin

  if cbo_de.Text = '' then
  begin
    showmessage('Coloque o De:');
    cbo_de.SetFocus;
    exit;
  end;

  if cbo_para.Text = '' then
  begin
    showmessage('Coloque o Para:');
    cbo_para.SetFocus;
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

  if cbo_de.Text = cbo_para.Text then
  begin
    showmessage('De e Para sao iguais');
    cbo_de.SetFocus;
    exit;
  end;

  ////////VERIFICA SE SALDO E SUFICIENTE/////
  txt_valor_saldo.value := VerificaSaldoMae(cbo_de.KeyValue, valor);

  if txt_valor_Saldo.Value < txt_valor.Value then
  begin
    showmessage('Saldo insuficiente');
    txt_Valor.SetFocus;
    exit;
  end;
////////FIM VERIFICA SE SALDO E SUFICIENTE/////

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM TRANSFERENCIA_FINANCEIRA_MAE');
  QRY_MAX_CODIGO.Open;
  cod := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_transLocal.Close;
  qry_transLocal.SQL.Clear;
  qry_transLocal.SQL.Add('INSERT INTO TRANSFERENCIA_FINANCEIRA_MAE (CODIGO, TP_CODIGO_DE, TP_CODIGO_PARA, VALOR, DATA,OBS)  '+
                         'VALUES (:CODIGO, :TP_CODIGO_DE, :TP_CODIGO_PARA, :VALOR, :DATA, :OBS)                             ');
  qry_transLocal.ParamByName('CODIGO').AsInteger         := cod;
  qry_transLocal.ParamByName('TP_CODIGO_DE').AsString       := cbo_de.KeyValue;
  qry_transLocal.ParamByName('TP_CODIGO_PARA').asstring     := cbo_para.KeyValue;
  qry_transLocal.ParamByName('VALOR').AsFLOAT            := txt_valor.Value;
  qry_transLocal.ParamByName('DATA').AsDateTime          := txt_data.Date;
  qry_transLocal.ParamByName('OBS').asstring             := txt_obs.Text;
  qry_transLocal.ExecSQL;
  IBTRANSLOCAL.Commit;

  cbo_de.KeyValue := null;
  cbo_para.KeyValue := null;
  txt_valor.Clear;
  txt_data.Clear;
  txt_obs.Clear;

  cbo_de.SetFocus;

end;

procedure TfrmTransferenciaFinanceira_mae.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gdSelected in state) then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color := clMenuHighlight;
    Font.Style  := [fsbold];
    Font.Color  := clWhite
  end
  else
    dbgrid1.Canvas.Font.Color:= clBlack;

  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmTransferenciaFinanceira_mae.btnPesquisarClick(Sender: TObject);
var
  data1, data2, dta, de, para :string;
begin

  if ((cbo_de_pesq.text <> '') and (cbo_para_pesq.text = '')) or
    ((cbo_de_pesq.text = '') and (cbo_para_pesq.text <> '')) then
  begin
    showmessage('Marque De e Para');
    cbo_de_pesq.SetFocus;
    exit;
  end;

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND TF.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if cbo_de_pesq.text <> '' then
     de := ' AND TF.TP_CODIGO_DE = ' + inttostr(cbo_de_pesq.KeyValue)
  else
     de := '';

  if cbo_para_pesq.text <> '' then
     para := ' AND TF.TP_CODIGO_PARA = ' + inttostr(cbo_para_pesq.KeyValue)
  else
     para := '';

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT TF.data, TF.valor, TF.obs,                                          '+
                      'TF.tp_codigo_de ||'' - ''|| TP.tp_descricao as DE,                         '+
                      'TF.tp_codigo_para ||'' - ''|| TPP.tp_descricao as PARA                     '+
                      'FROM TIPO_PAGAMENTO_MAE TP                                                 '+
                      ' INNER JOIN transferencia_financeira_MAE TF ON TF.tp_codigo_de = TP.tp_codigo  '+
                      ' INNER JOIN TIPO_PAGAMENTO_MAE TPP ON TPP.tp_codigo = TF.tp_codigo_para        '+
                      ' WHERE 1=1' + dta + de + para + ' order by TF.DATA                         ');
  qryPesquisa.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT sum(TF.valor) as total                                              '+
                   'FROM TIPO_PAGAMENTO_MAE TP                                                 '+
                   ' INNER JOIN transferencia_financeira_MAE TF ON TF.tp_codigo_de = TP.tp_codigo  '+
                   ' INNER JOIN TIPO_PAGAMENTO_MAE TPP ON TPP.tp_codigo = TF.tp_codigo_para        '+
                   ' WHERE 1=1' + dta + de + para                                              );
  qryTotal.Open;

  txt_valor_saldo.value := qryTotal.fieldbyname('TOTAL').AsFloat;


end;

procedure TfrmTransferenciaFinanceira_mae.btnRelatorioClick(Sender: TObject);
var
  dta, data1, data2, mensagem, de, para : string;
begin

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if cbo_de_pesq.text <> '' then
     de := ' AND TF.TP_CODIGO_DE = ' + inttostr(cbo_de_pesq.KeyValue)
  else
     de := '';

  if cbo_para_pesq.text <> '' then
     para := ' AND TF.TP_CODIGO_PARA = ' + inttostr(cbo_para_pesq.KeyValue)
  else
     para := '';

  Application.CreateForm(TfrmRelTransfFinanc, frmRelTransfFinanc);
  frmRelTransfFinanc.qry_pesquisa.Close;
  frmRelTransfFinanc.qry_pesquisa.SQL.Clear;
  frmRelTransfFinanc.qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO,                '+
                                          ' TF.data, sum(TF.valor) as valor, TF.obs,                                              '+
                                          ' TF.tp_codigo_de ||'' - ''|| TP.tp_descricao as DE,                                    '+
                                          ' TF.tp_codigo_para ||'' - ''|| TPP.tp_descricao as PARA                                '+
                                          ' FROM TIPO_PAGAMENTO_mae TP                                                            '+
                                          ' INNER JOIN transferencia_financeira_mae TF ON TF.tp_codigo_de = TP.tp_codigo          '+
                                          ' INNER JOIN TIPO_PAGAMENTO_mae TPP ON TPP.tp_codigo = TF.tp_codigo_para                '+
                                          ' where 1=1 ' + dta + de + para                                                          +
                                          'GROUP BY EXTRACT(MONTH FROM DATA), EXTRACT(YEAR FROM DATA),                            '+
                                          'TF.data, TF.obs, TF.tp_codigo_de, TP.tp_descricao, TF.tp_codigo_para, TPP.tp_descricao '+
                                          'order by EXTRACT(YEAR FROM DATA), EXTRACT(month FROM DATA)                             ');
  frmRelTransfFinanc.qry_pesquisa.Open;
  frmRelTransfFinanc.qry_pesquisa.FetchAll;

  if frmRelTransfFinanc.qry_pesquisa.isempty then
  begin
    mensagem := 'Registro nao encontrado !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  frmRelTransfFinanc.qryTipoPgto.close;
  frmRelTransfFinanc.qryTipoPgto.sql.clear;
  frmRelTransfFinanc.qryTipoPgto.sql.add('SELECT TP_CODIGO, TP_CODIGO || ''-'' || TP_DESCRICAO AS DESCRICAO  '+
                                         'FROM TIPO_PAGAMENTO_mae                                            '+
                                         'ORDER BY TP_CODIGO                                                 ');
  frmRelTransfFinanc.qryTipoPgto.open;

  frmRelTransfFinanc.lbl_data.caption := txt_data_i.Text + ' a ' + txt_data_f.Text;

  if (cbo_de_pesq.Text <> '') and (cbo_para_pesq.Text <> '') then
    frmRelTransfFinanc.bndTipoPgto.visible := false
  else
    frmRelTransfFinanc.bndTipoPgto.visible := true;

  frmRelTransfFinanc.frRelatorio.Prepare;
  frmRelTransfFinanc.frRelatorio.PreviewModal;
end;

procedure TfrmTransferenciaFinanceira_mae.cbo_deKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cbo_para.SetFocus;
end;

procedure TfrmTransferenciaFinanceira_mae.cbo_paraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data.SetFocus;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_Data_iKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data_f.SetFocus;
end;

procedure TfrmTransferenciaFinanceira_mae.cbo_deEnter(Sender: TObject);
begin
  cbo_de.Color := $00F5EEDE;
end;

procedure TfrmTransferenciaFinanceira_mae.cbo_deExit(Sender: TObject);
begin
  cbo_de.Color := clwindow;
end;

procedure TfrmTransferenciaFinanceira_mae.cbo_paraEnter(Sender: TObject);
begin
  cbo_para.Color := $00F5EEDE;
end;

procedure TfrmTransferenciaFinanceira_mae.cbo_paraExit(Sender: TObject);
begin
  cbo_para.Color := clwindow;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_dataEnter(Sender: TObject);
begin
  txt_data.Color := $00F5EEDE;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_dataExit(Sender: TObject);
begin
  txt_data.Color := clwindow;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_valorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_valorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    txt_obs.SetFocus;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_Data_iEnter(Sender: TObject);
begin
  txt_data_i.Color :=$00F5EEDE;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_Data_iExit(Sender: TObject);
begin
  txt_data_f.Color := clwindow;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_data_fEnter(Sender: TObject);
begin
  txt_data_f.Color := $00F5EEDE;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_data_fExit(Sender: TObject);
begin
  txt_data_f.Color := clwindow;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_data_fKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnPesquisar.SetFocus;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure TfrmTransferenciaFinanceira_mae.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmTransferenciaFinanceira_mae.cbo_de_pesqKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    cbo_DE_PESQ.KeyValue := -1;
end;

procedure TfrmTransferenciaFinanceira_mae.cbo_para_pesqKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    cbo_para_PESQ.KeyValue := -1;
end;

end.
