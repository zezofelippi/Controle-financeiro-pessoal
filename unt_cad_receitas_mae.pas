unit unt_cad_receitas_mae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, IBDatabase, DB, IBCustomDataSet, IBQuery,
  ToolEdit, CurrEdit, DBCtrls, Grids, DBGrids, ExtCtrls;

type
  Tfrm_cad_receitas_mae = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    txt_data_i: TDateEdit;
    txt_data_f: TDateEdit;
    Label1: TLabel;
    Label5: TLabel;
    btnPesquisar: TButton;
    cbo_receita_pesquisa: TDBLookupComboBox;
    Label7: TLabel;
    qryPesquisa: TIBQuery;
    dsPesquisa: TDataSource;
    qryTotal: TIBQuery;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    btnGravar: TButton;
    txt_Valor: TCurrencyEdit;
    txt_data: TDateEdit;
    txt_desc_receita: TDBLookupComboBox;
    txt_obs: TEdit;
    qry_receita: TIBQuery;
    IBTransLocal: TIBTransaction;
    QRY_MAX_CODIGO: TIBQuery;
    qry_tipo_receita: TIBQuery;
    qry_tipo_receitaCODIGO: TIntegerField;
    qry_tipo_receitaREC: TIBStringField;
    ds_receita: TDataSource;
    qry_pesquisa: TIBQuery;
    Label10: TLabel;
    cboFormaPgto: TDBLookupComboBox;
    dsFormaPgto: TDataSource;
    qryFormaPgto: TIBQuery;
    qryFormaPgtoTP_CODIGO: TIntegerField;
    qryFormaPgtoTP_DESCRICAO: TIBStringField;
    qryFormaPgtoTP_DEFAULT: TIBStringField;
    qryFormaPgtoDESCRICAO: TIBStringField;
    GroupBox3: TGroupBox;
    btnRelatorio: TButton;
    txt_total: TCurrencyEdit;
    Label6: TLabel;
    cboFormaPgtoPesq: TDBLookupComboBox;
    Label9: TLabel;
    qryPesquisaRECEITA: TIBStringField;
    qryPesquisaVALOR: TIBBCDField;
    qryPesquisaDATA: TDateTimeField;
    qryPesquisaDESCRICAO: TIBStringField;
    ibstrngfldPesquisaOBS: TIBStringField;
    Label23: TLabel;
    txtTotalRegistros: TEdit;
    Label11: TLabel;
    txtObsPesquisa: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure txt_desc_receitaKeyPress(Sender: TObject; var Key: Char);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txt_desc_receitaEnter(Sender: TObject);
    procedure txt_desc_receitaExit(Sender: TObject);
    procedure txt_ValorEnter(Sender: TObject);
    procedure txt_ValorExit(Sender: TObject);
    procedure txt_dataEnter(Sender: TObject);
    procedure txt_dataExit(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txt_data_iEnter(Sender: TObject);
    procedure txt_data_iExit(Sender: TObject);
    procedure txt_data_iKeyPress(Sender: TObject; var Key: Char);
    procedure txt_data_fEnter(Sender: TObject);
    procedure txt_data_fExit(Sender: TObject);
    procedure txt_data_fKeyPress(Sender: TObject; var Key: Char);
    procedure cbo_receita_pesquisaEnter(Sender: TObject);
    procedure cbo_receita_pesquisaExit(Sender: TObject);
    procedure cbo_receita_pesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnRelatorioClick(Sender: TObject);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure cboFormaPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboFormaPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure cboFormaPgtoEnter(Sender: TObject);
    procedure cboFormaPgtoExit(Sender: TObject);
    procedure cboFormaPgtoPesqEnter(Sender: TObject);
    procedure cboFormaPgtoPesqExit(Sender: TObject);
    procedure cboFormaPgtoPesqKeyPress(Sender: TObject; var Key: Char);
    procedure cboFormaPgtoPesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_receitas_mae: Tfrm_cad_receitas_mae;

implementation

uses unt_modulo, untRelCadReceita;

{$R *.dfm}

procedure Tfrm_cad_receitas_mae.FormShow(Sender: TObject);
begin

  qryFormaPgto.Close;
  qryFormaPgto.SQL.Clear;
  qryFormaPgto.SQL.Add('SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'' - ''|| TP_DESCRICAO AS DESCRICAO '+
                       ' FROM TIPO_PAGAMENTO_MAE ORDER BY TP_CODIGO                                                     ');
  qryFormaPgto.Open;
  qryFormaPgto.FetchAll;


  qry_tipo_receita.Close;
  qry_tipo_receita.SQL.Clear;
  qry_tipo_receita.SQL.Add('SELECT CODIGO, CODIGO ||'+#39+' - '+#39+'|| RECEITA AS REC '+
                           'FROM TIPO_RECEITA ORDER BY CODIGO                          ');
  qry_tipo_receita.Open;
  qry_tipo_receita.FetchAll;

  txt_desc_receita.SetFocus;

end;

procedure Tfrm_cad_receitas_mae.btnGravarClick(Sender: TObject);
var
  cod_receita, codmes : integer;
  mes, ano :string;
begin

  if (txt_desc_receita.Text = '') then
  begin
  showmessage('Coloque a descricao da receita');
  txt_desc_receita.SetFocus;
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

  if cboformaPgto.text = '' then
  begin
  showmessage('Coloque a forma pgto');
  cboformaPgto.SetFocus;
  exit;
  end;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(REC_CODIGO) AS CODIGO FROM CAD_RECEITAS_MAE');
  QRY_MAX_CODIGO.Open;
  cod_receita := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

  ////VERIFICA SE COD_MES JA FOI CADASTRADO////
  mes := (formatdatetime('mm',strtodatetime(txt_data.text)));
  ano := (formatdatetime('yyyy',strtodatetime(txt_data.text)));

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES  '+
                       'FROM CAD_RECEITAS_MAE WHERE EXTRACT(month FROM DATA) =:MES                       '+
                       'AND EXTRACT(YEAR FROM DATA) =:ANO                                                ');
  qry_pesquisa.ParamByName('MES').AsString := mes;
  qry_pesquisa.ParamByName('ANO').AsString := ano;
  qry_pesquisa.Open;

  if qry_pesquisa.IsEmpty then
  begin
    QRY_MAX_CODIGO.Close;
    QRY_MAX_CODIGO.SQL.Clear;
    QRY_MAX_CODIGO.SQL.Add('SELECT MAX(COD_MES) AS COD_MES FROM CAD_RECEITAS_MAE');
    QRY_MAX_CODIGO.Open;
    codmes := QRY_MAX_CODIGO.FieldByName('COD_MES').AsInteger +1;
  end
  else
  begin
    codmes := qry_pesquisa.fieldbyname('COD_MES').AsInteger;
  end;
  ///////FIM VERIFICA SE COD_MES JA FOI CADASTRADO////////

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_receita.Close;
  qry_receita.SQL.Clear;
  qry_receita.SQL.Add('INSERT INTO CAD_RECEITAS_MAE (REC_CODIGO, CODIGO, VALOR, DATA, COD_MES, OBS, TP_CODIGO)  '+
                      'VALUES (:REC_CODIGO, :CODIGO, :VALOR, :DATA, :COD_MES, :OBS, :TP_CODIGO)                 ');
  qry_receita.ParamByName('REC_CODIGO').AsInteger     := cod_receita;
  qry_receita.ParamByName('CODIGO').AsInteger         := txt_desc_receita.KeyValue;
  qry_receita.ParamByName('VALOR').AsFLOAT            := txt_valor.Value;
  qry_receita.ParamByName('DATA').AsDateTime          := txt_data.Date;
  qry_receita.ParamByName('COD_MES').AsInteger        := codmes;
  qry_receita.ParamByName('OBS').AsString             := txt_obs.text;
  qry_receita.ParamByName('TP_CODIGO').AsString       := inttostr(cboFormaPgto.KeyValue);
  qry_receita.ExecSQL;
  IBTRANSLOCAL.Commit;

  ////VERIFICA SE O COD_MES JA FOI CADASTRADO NO CAD. DESPESAS
  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT COD_MES FROM CAD_DESPESA_MAE WHERE COD_MES=:COD_MES');
  qry_pesquisa.ParamByName('COD_MES').AsString := inttostr(codmes);
  qry_pesquisa.Open;

  if qry_pesquisa.IsEmpty then
  begin
    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES, CODIGO  '+
                         'FROM CAD_DESPESA_MAE WHERE EXTRACT(month FROM DATA) =:MES                                '+
                         'AND EXTRACT(YEAR FROM DATA) =:ANO                                                        ');
    qry_pesquisa.ParamByName('MES').AsString := mes;
    qry_pesquisa.ParamByName('ANO').AsString := ano;
    qry_pesquisa.Open;
    qry_pesquisa.First;

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_receita.Close;
    qry_receita.SQL.Clear;
    qry_receita.SQL.Add('UPDATE CAD_DESPESA_MAE SET COD_MES=:COD_MES WHERE CODIGO=:CODIGO');
    qry_receita.ParamByName('CODIGO').AsString          := qry_pesquisa.fieldbyname('CODIGO').AsString;
    qry_receita.ParamByName('COD_MES').AsString         := inttostr(codmes);
    qry_receita.ExecSQL;
    IBTRANSLOCAL.Commit;
  end;
  /////FIM VERIFICA SE O COD_MES JA FOI CADASTRADO NO CAD. DESPESAS

  txt_desc_receita.KeyValue := null;
  txt_valor.Clear;
  txt_data.Clear;
  txt_obs.Clear;
  cboFormaPgto.KeyValue := -1;

  txt_desc_receita.SetFocus;

end;

procedure Tfrm_cad_receitas_mae.txt_desc_receitaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure Tfrm_cad_receitas_mae.txt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data.SetFocus;
end;

procedure Tfrm_cad_receitas_mae.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    cboFormaPgto.SetFocus;
end;

procedure Tfrm_cad_receitas_mae.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_cad_receitas_mae := nil;
  action:= cafree;
end;

procedure Tfrm_cad_receitas_mae.txt_desc_receitaEnter(Sender: TObject);
begin
  txt_desc_receita.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.txt_desc_receitaExit(Sender: TObject);
begin
  txt_desc_receita.Color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.txt_ValorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.txt_ValorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.txt_dataEnter(Sender: TObject);
begin
  txt_data.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.txt_dataExit(Sender: TObject);
begin
  txt_data.Color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.btnPesquisarClick(Sender: TObject);
var
  dta, data1, data2, receita, tipo_receita, mensagem, obsPesquisa : string;
begin
  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND C.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if cboFormaPgtoPesq.text <> '' then
    tipo_receita := ' AND C.TP_CODIGO = ' + inttostr(cboFormaPgtoPesq.KeyValue)
  else
    tipo_receita := '';

  if cbo_receita_pesquisa.Text <> '' then
    receita := ' AND C.CODIGO = ' + IntToStr(cbo_receita_pesquisa.KeyValue)
  else
    receita := '';

  if (txtObsPesquisa.Text <> '')  then
    obsPesquisa  := ' AND UPPER(C.OBS) LIKE UPPER('+ #39 + '%' + txtObsPesquisa.Text + '%' + #39 + ')'
  else
    obsPesquisa  := '';

  qryPesquisa.close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add(' SELECT T.RECEITA, C.VALOR, C.DATA, C.OBS, C.TP_CODIGO ||'' - ''|| TP.TP_DESCRICAO AS DESCRICAO  '+
                      ' FROM CAD_RECEITAS_MAE C                                                                         '+
                      ' INNER JOIN TIPO_RECEITA T ON C.CODIGO = T.CODIGO                                                '+
                      ' INNER JOIN TIPO_PAGAMENTO_MAE TP ON TP.TP_CODIGO = C.TP_CODIGO WHERE  1=1                       '+
                      '' + tipo_receita + dta + receita + obsPesquisa +' ORDER BY C.DATA                                ');
  qryPesquisa.Open;
  qryPesquisa.FetchAll;

  txtTotalRegistros.Text:= inttostr(qryPesquisa.RecordCount);

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(C.VALOR) AS TOTAL FROM CAD_RECEITAS_MAE C, TIPO_RECEITA T WHERE  C.CODIGO = T.CODIGO ' + tipo_receita + dta + receita + obsPesquisa);
  qryTotal.Open;

  txt_total.Value := qryTotal.fieldbyname('TOTAL').AsFloat;

end;

procedure Tfrm_cad_receitas_mae.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure Tfrm_cad_receitas_mae.txt_data_iEnter(Sender: TObject);
begin
  txt_Data_i.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.txt_data_iExit(Sender: TObject);
begin
  txt_Data_i.Color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.txt_data_iKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data_f.SetFocus;
end;

procedure Tfrm_cad_receitas_mae.txt_data_fEnter(Sender: TObject);
begin
  txt_data_f.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.txt_data_fExit(Sender: TObject);
begin
  txt_data_f.Color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.txt_data_fKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cboFormapgtopesq.SetFocus
end;

procedure Tfrm_cad_receitas_mae.cbo_receita_pesquisaEnter(Sender: TObject);
begin
  cbo_receita_pesquisa.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.cbo_receita_pesquisaExit(Sender: TObject);
begin
  cbo_receita_pesquisa.Color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.cbo_receita_pesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnPesquisar.SetFocus;
end;

procedure Tfrm_cad_receitas_mae.btnRelatorioClick(Sender: TObject);
var
  dta, data1, data2, mensagem, tipo_receita, receita : string;

begin

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND CR.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if cboFormaPgtoPesq.text <> '' then
     tipo_receita := ' AND CR.TP_CODIGO = ' + inttostr(cboFormaPgtoPesq.KeyValue)
  else
     tipo_receita := '';


  if cbo_receita_pesquisa.Text <> '' then
   receita := ' AND TR.CODIGO = ' + IntToStr(cbo_receita_pesquisa.KeyValue)
  else
   receita := '';

  frmRelCadReceita.qry_pesquisa.Close;
  frmRelCadReceita.qry_pesquisa.SQL.Clear;
  frmRelCadReceita.qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM CR.DATA) AS MES, EXTRACT(YEAR FROM CR.DATA) AS ANO,         '+
                                        'TR.CODIGO ||'' - ''|| TR.RECEITA AS DESCR,                                            '+
                                        'CR.DATA, CR.VALOR, CR.OBS, REC_CODIGO,                                                '+
                                        'CR.TP_CODIGO ||'' - ''|| TP.TP_DESCRICAO AS DESCRICAO                                 '+
                                        ' FROM CAD_RECEITAS_MAE CR                                                             '+
                                        ' INNER JOIN TIPO_RECEITA TR ON CR.CODIGO = TR.CODIGO                                  '+
                                        ' INNER JOIN TIPO_PAGAMENTO_MAE TP ON TP.TP_CODIGO = CR.TP_CODIGO                      '+
                                        ' WHERE  1=1 ' + dta + tipo_receita + receita                                           +
                                        ' GROUP BY EXTRACT(MONTH FROM CR.DATA), EXTRACT(YEAR FROM CR.DATA), CR.DATA,           '+
                                        ' CR.VALOR, TR.RECEITA, CR.OBS, REC_CODIGO, TR.CODIGO, CR.TP_CODIGO, TP.TP_DESCRICAO   '+
                                        ' order by EXTRACT(YEAR FROM CR.DATA), EXTRACT(month FROM CR.DATA)                     ');
  frmRelCadReceita.qry_pesquisa.Open;
  frmRelCadReceita.qry_pesquisa.FetchAll;

  frmRelCadReceita.qrytotal.Close;
  frmRelCadReceita.qrytotal.SQL.Clear;
  frmRelCadReceita.qrytotal.SQL.Add('SELECT  CR.tp_codigo, SUM(CR.valor) AS VALOR,                '+
                                    'CR.TP_CODIGO ||'' - ''|| TP.TP_DESCRICAO AS DESCRICAO        '+
                                    'FROM CAD_RECEITAS_MAE CR                                     '+
                                    'INNER JOIN TIPO_PAGAMENTO_MAE TP ON TP.TP_CODIGO = CR.TP_CODIGO  '+
                                    'INNER JOIN TIPO_RECEITA TR ON CR.CODIGO = TR.CODIGO          '+
                                    'WHERE  1=1 ' +  dta + tipo_receita + receita                  +
                                    'GROUP BY CR.tp_codigo, TP.TP_DESCRICAO                       '+
                                    'order by CR.tp_codigo                                        ');
  frmRelCadReceita.qrytotal.Open;
  frmRelCadReceita.qrytotal.FetchAll;

  if frmRelCadReceita.qry_pesquisa.isempty then
  begin
    mensagem := 'Registro nao encontrado !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  frmRelCadReceita.lbl_data.caption := txt_data_i.Text + ' a ' + txt_data_f.Text;

  frmRelCadReceita.frRelatorio.Prepare;
  frmRelCadReceita.frRelatorio.PreviewModal;

end;

procedure Tfrm_cad_receitas_mae.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure Tfrm_cad_receitas_mae.cboFormaPgtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    cboFormaPgto.KeyValue := -1;
end;

procedure Tfrm_cad_receitas_mae.cboFormaPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    btnGravar.SetFocus;
end;

procedure Tfrm_cad_receitas_mae.cboFormaPgtoEnter(Sender: TObject);
begin
  cboFormaPgto.color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.cboFormaPgtoExit(Sender: TObject);
begin
  cboformaPgto.color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.cboFormaPgtoPesqEnter(Sender: TObject);
begin
  cboFormapgtopesq.color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas_mae.cboFormaPgtoPesqExit(Sender: TObject);
begin
  cboFormapgtopesq.color := clwindow;
end;

procedure Tfrm_cad_receitas_mae.cboFormaPgtoPesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cbo_receita_pesquisa.setfocus;
end;

procedure Tfrm_cad_receitas_mae.cboFormaPgtoPesqKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    cboFormaPgtopesq.KeyValue := -1;
end;

end.
