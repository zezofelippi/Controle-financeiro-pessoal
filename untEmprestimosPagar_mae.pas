unit untEmprestimosPagar_mae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolEdit, Mask, CurrEdit, Grids, DBGrids, ExtCtrls,
  IBDatabase, DB, IBCustomDataSet, IBQuery, Menus, DBCtrls;

type
  TfrmEmprestimosPagar_mae = class(TForm)
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
    txt_total_a_pagar: TCurrencyEdit;
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
    txt_total_pago: TCurrencyEdit;
    Label10: TLabel;
    txt_total_saldo_a_pagar: TCurrencyEdit;
    PopupMenu1: TPopupMenu;
    Receber1: TMenuItem;
    Label11: TLabel;
    TXT_OBS_pesq: TEdit;
    Label12: TLabel;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    cboFormaPgto: TDBLookupComboBox;
    Label13: TLabel;
    dsFormaPgto: TDataSource;
    qryFormaPgto: TIBQuery;
    qryFormaPgtoTP_CODIGO: TIntegerField;
    qryFormaPgtoTP_DESCRICAO: TIBStringField;
    qryFormaPgtoTP_DEFAULT: TIBStringField;
    qryFormaPgtoDESCRICAO: TIBStringField;
    qryEmprestimoCODIGO: TIntegerField;
    qryEmprestimoVALOR_A_PAGAR: TIBBCDField;
    qryEmprestimoDATA: TDateTimeField;
    qryEmprestimoOBS: TIBStringField;
    qryEmprestimoVALOR_PAGO: TIBBCDField;
    qryEmprestimoSALDO_A_PAGAR: TIBBCDField;
    qryEmprestimoTP_CODIGO: TIntegerField;
    qryEmprestimoDESCRICAO: TIBStringField;
    btn1: TButton;
    Label14: TLabel;
    cboFormaPgtoPesquisa: TDBLookupComboBox;
    Button1: TButton;
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
    procedure cboFormaPgtoEnter(Sender: TObject);
    procedure cboFormaPgtoExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmprestimosPagar_mae: TfrmEmprestimosPagar_mae;

implementation

uses unt_modulo, untPagarEmprestimo_mae;

{$R *.dfm}

procedure TfrmEmprestimosPagar_mae.txt_dataEnter(Sender: TObject);
begin
  txt_data.Color :=$00F5EEDE;
end;

procedure TfrmEmprestimosPagar_mae.txt_dataExit(Sender: TObject);
begin
  txt_data.Color := clwindow;
end;

procedure TfrmEmprestimosPagar_mae.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure TfrmEmprestimosPagar_mae.txt_ValorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure TfrmEmprestimosPagar_mae.txt_ValorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure TfrmEmprestimosPagar_mae.txt_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cboFormaPgto.SetFocus;
end;

procedure TfrmEmprestimosPagar_mae.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color :=$00F5EEDE;
end;

procedure TfrmEmprestimosPagar_mae.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure TfrmEmprestimosPagar_mae.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmEmprestimosPagar_mae.btnGravarClick(Sender: TObject);
var
  cod_emprestimo : integer;

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

  if (txt_codigo.Text <> '') and (qryEmprestimo.FieldByName('VALOR_PAGO').AsFLOAT > 0) then
  begin
    showmessage('Valor ja teve pagamento, insira outro emprestimo');
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
    QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM EMPRESTIMOS_A_PAGAR_MAE');
    QRY_MAX_CODIGO.Open;
    cod_emprestimo := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO EMPRESTIMOS_A_PAGAR_MAE (CODIGO, VALOR_A_PAGAR, VALOR_PAGO, SALDO_A_PAGAR, DATA, OBS, TP_CODIGO)  '+
                            'VALUES (:CODIGO, :VALOR_A_PAGAR, :VALOR_PAGO, :SALDO_A_PAGAR, :DATA, :OBS, :TP_CODIGO)                    ');
    qry_trans_local.ParamByName('CODIGO').AsInteger         := cod_emprestimo;
  end
  else
  begin
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE EMPRESTIMOS_A_PAGAR_MAE SET VALOR_A_PAGAR=:VALOR_A_PAGAR, VALOR_PAGO=:VALOR_PAGO,           '+
                            'SALDO_A_PAGAR=:SALDO_A_PAGAR, DATA=:DATA, OBS=:OBS, TP_CODIGO=:TP_CODIGO WHERE CODIGO=:CODIGO  ');
    qry_trans_local.ParamByName('CODIGO').AsString  := txt_codigo.Text;
  end;

  qry_trans_local.ParamByName('OBS').AsString             := txt_obs.Text;
  qry_trans_local.ParamByName('VALOR_A_PAGAR').AsFLOAT    := txt_valor.Value;
  qry_trans_local.ParamByName('VALOR_PAGO').AsFLOAT   := 0;
  qry_trans_local.ParamByName('SALDO_A_PAGAR').AsFLOAT  := txt_valor.Value;
  qry_trans_local.ParamByName('DATA').AsDateTime          := txt_data.Date;
  qry_trans_local.ParamByName('TP_CODIGO').AsString       := inttostr(cboFormaPgto.KeyValue);

  qry_trans_local.ExecSQL;

  IBTRANSLOCAL.Commit;

  txt_codigo.Clear;
  txt_obs.Clear;
  txt_valor.Clear;
  txt_data.Clear;
  cboFormapgto.keyvalue := -1;

end;

procedure TfrmEmprestimosPagar_mae.txt_data_iEnter(Sender: TObject);
begin
  txt_data_i.Color :=$00F5EEDE;
end;

procedure TfrmEmprestimosPagar_mae.txt_data_iExit(Sender: TObject);
begin
  txt_data_i.Color := clwindow;
end;

procedure TfrmEmprestimosPagar_mae.txt_data_iKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_Data_f.SetFocus;
end;

procedure TfrmEmprestimosPagar_mae.txt_data_fEnter(Sender: TObject);
begin
  txt_Data_f.Color :=$00F5EEDE;
end;

procedure TfrmEmprestimosPagar_mae.txt_data_fExit(Sender: TObject);
begin
  txt_data_f.Color := clwindow;
end;

procedure TfrmEmprestimosPagar_mae.txt_data_fKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs_pesq.SetFocus;
end;

procedure TfrmEmprestimosPagar_mae.btnPesquisarClick(Sender: TObject);
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
    opcao := ' AND SALDO_A_PAGAR = 0'
  else if rdg_opcao.ItemIndex = 1 then
    opcao := ' AND SALDO_A_PAGAR > 0'
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
  qryEmprestimo.SQL.Add('SELECT EP.*, TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO  '+
                        ' FROM EMPRESTIMOS_A_PAGAR_MAE EP                                          '+
                        ' INNER JOIN TIPO_PAGAMENTO_MAE TP ON EP.TP_CODIGO = TP.TP_CODIGO          '+
                        ' WHERE 1=1 ' + dta + opcao + obs + tipo_pagamento + ' ORDER BY CODIGO ');
  qryEmprestimo.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL_A_PAGAR,                             '+
                   ' SUM(VALOR_PAGO) AS TOTAL_PAGO,                                         '+
                   ' SUM(SALDO_A_PAGAR) AS TOTAL_SALDO_A_PAGAR FROM EMPRESTIMOS_A_PAGAR_MAE EP  '+
                   ' INNER JOIN TIPO_PAGAMENTO_MAE TP ON EP.TP_CODIGO = TP.TP_CODIGO            '+
                   ' WHERE CODIGO = CODIGO ' + dta + opcao + obs + tipo_pagamento           );

  qryTotal.Open;

  txt_total_a_pagar.Value := qryTotal.fieldbyname('TOTAL_A_PAGAR').AsFloat;
  txt_total_pago.Value := qryTotal.fieldbyname('TOTAL_PAGO').AsFloat;
  txt_total_saldo_a_pagar.Value := qryTotal.fieldbyname('TOTAL_SALDO_A_PAGAR').AsFloat;

end;

procedure TfrmEmprestimosPagar_mae.FormShow(Sender: TObject);
begin
  txt_data.SetFocus;
  rdg_opcao.ItemIndex := 0;
  rdb_inicio.Checked := true;

  qryFormaPgto.Close;
  qryFormaPgto.SQL.Clear;
  qryFormaPgto.SQL.Add('SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'' - ''|| TP_DESCRICAO AS DESCRICAO '+
                       ' FROM TIPO_PAGAMENTO_MAE ORDER BY TP_CODIGO                                                 ');
  qryFormaPgto.Open;
  qryFormaPgto.FetchAll;

end;

procedure TfrmEmprestimosPagar_mae.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not qryEmprestimo.IsEmpty then
  begin
    if qryEmprestimo.FieldByName('SALDO_A_PAGAR').AsFloat = 0  then
      DBGrid1.Canvas.Brush.Color := $00ABD2FA
    else if qryEmprestimo.FieldByName('SALDO_A_PAGAR').AsFloat > 0  then
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
        if qryEmprestimo.FieldByName('SALDO_A_PAGAR').AsFloat = 0  then
          DBGrid1.Canvas.Brush.Color := $00ABD2FA
        else if qryEmprestimo.FieldByName('SALDO_A_PAGAR').AsFloat > 0  then
          DBGrid1.Canvas.Brush.Color := clwindow;
      end;
    end;

  DBGrid1.Canvas.Font.Color:= clBlack;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmEmprestimosPagar_mae.DBGrid1DblClick(Sender: TObject);
begin

  txt_codigo.Text :=  qryEmprestimo.fieldbyname('CODIGO').AsString;
  txt_Data.Text := qryEmprestimo.fieldbyname('DATA').AsString;
  txt_valor.Value := qryEmprestimo.fieldbyname('VALOR_A_PAGAR').AsFloat;
  txt_obs.Text := qryEmprestimo.fieldbyname('OBS').AsString;
  cboformapgto.KeyValue := qryEmprestimo.fieldbyname('TP_CODIGO').AsString;

end;

procedure TfrmEmprestimosPagar_mae.Receber1Click(Sender: TObject);
begin

  Application.CreateForm(TfrmPagarEmprestimo_mae, frmPagarEmprestimo_mae);

  frmPagarEmprestimo_mae.txt_codigo.Text :=  qryEmprestimo.fieldbyname('CODIGO').AsString;

  frmPagarEmprestimo_mae.qryRecebido.Close;
  frmPagarEmprestimo_mae.qryRecebido.SQL.Clear;
  frmPagarEmprestimo_mae.qryRecebido.SQL.Add('SELECT EP.*, EP.TP_CODIGO ||'' - ''|| TP.TP_DESCRICAO AS DESCRICAO FROM PAGTO_EMPRESTIMOS_A_PAGAR_MAE EP '+
                                         ' INNER JOIN TIPO_PAGAMENTO_MAE TP ON EP.TP_CODIGO = TP.TP_CODIGO                                             '+
                                         ' WHERE CODIGO=:CODIGO ORDER BY PG_CODIGO                                                                     ');
  frmPagarEmprestimo_mae.qryRecebido.ParamByName('CODIGO').AsString := frmPagarEmprestimo_mae.txt_codigo.Text;
  frmPagarEmprestimo_mae.qryRecebido.Open;

  frmPagarEmprestimo_mae.qryTotal.Close;
  frmPagarEmprestimo_mae.qryTotal.SQL.Clear;
  frmPagarEmprestimo_mae.qryTotal.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL FROM PAGTO_EMPRESTIMOS_A_PAGAR_MAE WHERE CODIGO=:CODIGO');
  frmPagarEmprestimo_mae.qryTotal.ParamByName('CODIGO').AsString := frmPagarEmprestimo_mae.txt_codigo.Text;
  frmPagarEmprestimo_mae.qryTotal.Open;

  frmPagarEmprestimo_mae.txt_total_recebido.Value := frmPagarEmprestimo_mae.qryTotal.fieldbyname('TOTAL').AsFloat;

  frmPagarEmprestimo_mae.show;

end;

procedure TfrmEmprestimosPagar_mae.TXT_OBS_pesqEnter(Sender: TObject);
begin
  txt_obs_pesq.Color := $00F5EEDE;
end;

procedure TfrmEmprestimosPagar_mae.TXT_OBS_pesqExit(Sender: TObject);
begin
  txt_obs_pesq.Color := clwindow;
end;

procedure TfrmEmprestimosPagar_mae.TXT_OBS_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnPesquisar.SetFocus;
end;

procedure TfrmEmprestimosPagar_mae.cboFormaPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure TfrmEmprestimosPagar_mae.cboFormaPgtoEnter(Sender: TObject);
begin
  cboFormaPgto.color := $00F5EEDE;
end;

procedure TfrmEmprestimosPagar_mae.cboFormaPgtoExit(Sender: TObject);
begin
  cboFormapgto.color := clwindow;
end;

procedure TfrmEmprestimosPagar_mae.btn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPagarEmprestimo_mae, frmPagarEmprestimo_mae);
  frmPagarEmprestimo_mae.show;
end;

procedure TfrmEmprestimosPagar_mae.DBGrid1TitleClick(Column: TColumn);
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
     opcao := ' AND SALDO_A_PAGAR = 0'
  else if rdg_opcao.ItemIndex = 1 then
     opcao := ' AND SALDO_A_PAGAR > 0'
  else
     opcao := '';


  if (txt_obs_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
   obs  := ' AND UPPER(OBS) LIKE UPPER('+ #39 + txt_obs_pesq.Text + '%' + #39 + ')'
  else if (txt_obs_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
   obs  := ' AND UPPER(OBS) LIKE UPPER('+ #39 + '%' + txt_obs_pesq.Text + '%' + #39 + ')'
  else
   obs  := '';

  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  
  if (campo = 'CODIGO') or (campo = 'DATA') or (campo = 'VALOR_A_PAGAR') or
     (campo = 'VALOR_PAGO') or (campo = 'SALDO_A_PAGAR') or (campo = 'OBS') then
   campo := 'EP.' + campo
  else
   campo := 'DESCRICAO' ;

  if cboFormaPgtoPesquisa.Text <> '' then
     tipo_pagamento := ' AND TP.TP_CODIGO = ' + inttostr(cboFormaPgtoPesquisa.KeyValue)
  else
     tipo_pagamento := '';

  qryEmprestimo.Close;
  qryEmprestimo.SQL.Clear;
  qryEmprestimo.SQL.Add('SELECT EP.CODIGO, EP.DATA, EP.VALOR_A_PAGAR, EP.VALOR_PAGO, EP.SALDO_A_PAGAR, EP.OBS, '+
                        ' EP.TP_CODIGO, TP.tp_codigo || '' - '' || TP.tp_descricao AS DESCRICAO                '+
                        ' FROM EMPRESTIMOS_A_PAGAR_MAE EP                                                      '+
                        ' INNER JOIN TIPO_PAGAMENTO_MAE TP ON EP.TP_CODIGO = TP.TP_CODIGO                      '+
                        ' WHERE 1=1 ' + dta + opcao + obs + tipo_pagamento + ' ORDER BY ' + campo               );
  qryEmprestimo.Open;  

end;

procedure TfrmEmprestimosPagar_mae.Button1Click(Sender: TObject);
begin
showmessage('Este total pode não estar preciso com o Resumo Geral.                        '+
      'O Total Pago corretamente está na tela clicando no botão Consultar Pagamentos.     '+
      ' Valor preciso está no cálculo: Total a Pagar - Total Pago (tela Pagar Empréstimo) '+
      ' Pode acontecer de ser pago um emprestimo,                                         '+
      ' por exemplo, no ano de 2021 e que o emprestimo foi fetio                          '+
      ' no ano 2020, e ele naoaparece na pesquisa de emprestimos a pagar do               '+
      ' ano de 2021, por isso o total pago pode nao bater no Resumo Geral                 ');
end;

end.
