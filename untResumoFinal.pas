unit untResumoFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids, DBClient;

type
  TfrmResumofinal = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txt_data_i: TDateEdit;
    txt_data_f: TDateEdit;
    Label2: TLabel;
    btnProcessar: TButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    txt_din_total: TCurrencyEdit;
    txt_dep_total: TCurrencyEdit;
    txt_total_despesa: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    txt_total_ant: TCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    txt_din_despesa: TCurrencyEdit;
    txt_dep_despesa: TCurrencyEdit;
    txt_despesa: TCurrencyEdit;
    Label10: TLabel;
    txt_din_trans: TCurrencyEdit;
    txt_dep_trans: TCurrencyEdit;
    txt_despesa_trans: TCurrencyEdit;
    Label11: TLabel;
    txt_din_fat: TCurrencyEdit;
    txt_dep_fat: TCurrencyEdit;
    txt_despesa_fat: TCurrencyEdit;
    txt_total_fat: TCurrencyEdit;
    Label13: TLabel;
    txt_din_total_final: TCurrencyEdit;
    txt_dep_total_final: TCurrencyEdit;
    txt_despesa_total_final: TCurrencyEdit;
    txt_total_final: TCurrencyEdit;
    Label14: TLabel;
    qryTotal: TIBQuery;
    TXT_DATA_SETEMBRO: TDateEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    txt_che_total: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    txt_che_trans: TCurrencyEdit;
    txt_che_fat: TCurrencyEdit;
    txt_che_total_final: TCurrencyEdit;
    Label18: TLabel;
    txt_rec_din: TCurrencyEdit;
    txt_rec_che: TCurrencyEdit;
    txt_rec_dep: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    Label19: TLabel;
    txt_pgto_din: TCurrencyEdit;
    txt_pgto_che: TCurrencyEdit;
    txt_pgto_dep: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    Label20: TLabel;
    txt_total_rec_ant: TCurrencyEdit;
    CurrencyEdit11: TCurrencyEdit;
    CurrencyEdit12: TCurrencyEdit;
    txt_emp_rec: TCurrencyEdit;
    CurrencyEdit15: TCurrencyEdit;
    txt_total_rec: TCurrencyEdit;
    Label21: TLabel;
    txt_total_pgto_ant: TCurrencyEdit;
    CurrencyEdit18: TCurrencyEdit;
    CurrencyEdit19: TCurrencyEdit;
    CurrencyEdit20: TCurrencyEdit;
    txt_emp_pgto: TCurrencyEdit;
    CurrencyEdit22: TCurrencyEdit;
    txt_total_pgto: TCurrencyEdit;
    DBGrid1: TDBGrid;
    cdsGrid: TClientDataSet;
    dsGrid: TDataSource;
    qryPesquisa: TIBQuery;
    qryPesqAux: TIBQuery;
    Label3: TLabel;
    txt_data_ant: TDateEdit;
    txt_Data_final: TDateEdit;
    Label12: TLabel;
    procedure btnProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResumofinal: TfrmResumofinal;
  cor_global : integer;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmResumofinal.btnProcessarClick(Sender: TObject);
var
  mensagem, data1, data2, dta :string;
  din, che, trans, dep, desp, total,  rec_din, rec_che, rec_dep, emp_rec, total_anterior : real;
  fat_total_anterior, fat_faturamento : real;
begin

  if (txt_data_i.Text ='  /  /    ') and (txt_data_f.Text = '  /  /    ') then
  begin
    mensagem := 'Informe uma Data !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  txt_data_final.Date := txt_data_f.Date;

  //inseri data anterior
  txt_data_ant.Date := txt_data_i.Date - 1;


/////////////////////////////////CDSGRID//////////////////////////////

  /////TITULOS DA GRID////////////
  cdsGrid.close;
  cdsGrid.FieldDefs.Clear;
  cdsGrid.FieldDefs.Add('FORMA PGTO', ftString, 18, false);
  cdsGrid.FieldDefs.Add('TOTAL ANTERIOR', ftString, 10, false);
  cdsGrid.FieldDefs.Add('DESPESAS', ftString, 10, false);
  cdsGrid.FieldDefs.Add('TRANSF. FINANC.', ftString, 10, false);
  cdsGrid.FieldDefs.Add('EMP. A RECEBER', ftString, 10, false);
  cdsGrid.FieldDefs.Add('EMP. A PAGAR', ftString, 10, false);
  cdsGrid.FieldDefs.Add('FATURAMENTO', ftString, 10, false);
  cdsGrid.FieldDefs.Add('TOTAL   ATUAL', ftString, 10, false);
  cdsGrid.CreateDataSet;
  /////TITULOS DA GRID////////////

  ////////////INICIO CAD. TIPO DE PAGAMENTO/////////////////
  qryPesquisa.close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT TP_CODIGO, TP_DESCRICAO FROM TIPO_PAGAMENTO           '+
     'ORDER BY TP_CODIGO                                          ');
  qryPesquisa.Open;
  qryPesquisa.First;

  fat_total_anterior := 0;
  fat_faturamento := 0;

  WHILE NOT qryPesquisa.Eof do
  begin
    cdsGrid.APPEND;
    cdsGrid.fieldbyname('FORMA PGTO').asString := qryPesquisa.fieldbyname('TP_DESCRICAO').asstring;
    cdsGrid.Post;

    /////////////////////////////TOTAL ANTERIOR///////////////////////
    total := 0;
    total_anterior := 0;

    //////////TRANSF. FINANCEIRA///////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_PARA=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
    qryPesqAux.Open;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_DE=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
    qryPesqAux.Open;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    //////////EMP. A RECEBER////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL    '+
    'FROM EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
    'FROM PAGTO_EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA < :DATA1 AND PG_DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A RECEBER/////////////////


    //////////EMP. A PAGAR////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL    '+
    'FROM EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
    'FROM PAGTO_EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA < :DATA1 AND PG_DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A PAGAR/////////////////


    //////////FATURAMENTO////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_RECEITAS WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

     //////////DESPESAS////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_DESPESA WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('total').AsFloat ;

    total_anterior := total;

    fat_total_anterior := fat_total_anterior + total;

    cdsGrid.Edit;
    cdsGrid.fieldbyname('TOTAL ANTERIOR').asString := FORMATFLOAT('###,##0.00', total);
    cdsGrid.Post;

    ///////////////////////////FIM TOTAL ANTERIOR//////////////////////////

    //////////DESPESAS////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_DESPESA WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    cdsGrid.Edit;
    cdsGrid.fieldbyname('DESPESAS').asString := FORMATFLOAT('###,##0.00', qryPesqAux.fieldbyname('TOTAL').asfloat *(-1));
    cdsGrid.Post;
    ////////FIM DESPESAS///////////////////

    //////////TRANSF. FINANCEIRA///////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_PARA=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;

    total := qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_DE=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    cdsGrid.Edit;
    cdsGrid.fieldbyname('TRANSF. FINANC.').asString := FORMATFLOAT('###,##0.00', total);
    cdsGrid.Post;
    ///////////FIM TRANSF. FINANC.///////////////////

    //////////EMP. A RECEBER////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL    '+
    'FROM EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := qryPesqAux.fieldbyname('TOTAL').asfloat * (-1);

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
    'FROM PAGTO_EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    cdsGrid.Edit;
    cdsGrid.fieldbyname('EMP. A RECEBER').asString := FORMATFLOAT('###,##0.00', total);
    cdsGrid.Post;
    ///////////FIM EMP. A RECEBER/////////////////


    //////////EMP. A PAGAR////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL    '+
    'FROM EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
    'FROM PAGTO_EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    cdsGrid.Edit;
    cdsGrid.fieldbyname('EMP. A PAGAR').asString := FORMATFLOAT('###,##0.00', total);
    cdsGrid.Post;
    ///////////FIM EMP. A PAGAR/////////////////

    //////////FATURAMENTO////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_RECEITAS WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    fat_faturamento := fat_faturamento + qryPesqAux.fieldbyname('TOTAL').asfloat;

    cdsGrid.Edit;
    cdsGrid.fieldbyname('FATURAMENTO').asString := FORMATFLOAT('###,##0.00', qryPesqAux.fieldbyname('TOTAL').asfloat);
    cdsGrid.Post;
    ///////////FIM FATURAMENTO/////////////////

    /////////////////////////////TOTAL ATUAL///////////////////////
    total := 0;

     //////////TRANSF. FINANCEIRA///////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_PARA=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_DE=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    //////////EMP. A RECEBER////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL    '+
    'FROM EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
    'FROM PAGTO_EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A RECEBER/////////////////


    //////////EMP. A PAGAR////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL    '+
    'FROM EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
    'FROM PAGTO_EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A PAGAR/////////////////

    //////////FATURAMENTO////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_RECEITAS WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

     //////////DESPESAS////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_DESPESA WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := qryPesquisa.fieldbyname('TP_CODIGO').asstring;
    qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('total').AsFloat ;

    total := total + total_anterior;

    cdsGrid.Edit;
    cdsGrid.fieldbyname('TOTAL   ATUAL').asString := FORMATFLOAT('###,##0.00', total);
    cdsGrid.Post;

    ///////////////////////////FIM TOTAL ATUAL//////////////////////////
    qryPesquisa.Next;
  end;

  ////////////FIM CAD. TIPO DE PAGAMENTO/////////////////

  cdsGrid.APPEND;
  cdsGrid.fieldbyname('FORMA PGTO').asString := 'X';
  cdsGrid.Post;

  cdsGrid.APPEND;
  cdsGrid.fieldbyname('FORMA PGTO').asString := 'EMP. A RECEBER';
  cdsGrid.Post;

  total := 0;

  ////////TOTAL ANTERIOR EMP. A RECEBER//////////
  qryPesqAux.close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL    '+
  'FROM EMPRESTIMOS_A_RECEBER WHERE DATA < :DATA1 AND DATA > :DATA2  ');
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
  qryPesqAux.Open;
  qryPesqAux.First;

  total := qryPesqAux.fieldbyname('TOTAL').asfloat;

  qryPesqAux.close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
  'FROM PAGTO_EMPRESTIMOS_A_RECEBER WHERE PG_DATA < :DATA1 AND PG_DATA > :DATA2  ');
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
  qryPesqAux.Open;
  qryPesqAux.First;

  total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

  total_anterior := total;

  fat_total_anterior := fat_total_anterior + total;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('TOTAL ANTERIOR').asString := FORMATFLOAT('###,##0.00', total);
  cdsGrid.Post;

  /////////FIM TOTAL ANTERIOR EMP. A RECEBER/////////////

  total := 0 ;
  //////// EMP. A RECEBER//////////
  qryPesqAux.close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL    '+
  'FROM EMPRESTIMOS_A_RECEBER WHERE DATA BETWEEN :DATA1 AND :DATA2  ');
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
  qryPesqAux.Open;
  qryPesqAux.First;

  total := qryPesqAux.fieldbyname('TOTAL').asfloat;

  qryPesqAux.close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
  'FROM PAGTO_EMPRESTIMOS_A_RECEBER WHERE PG_DATA BETWEEN :DATA1 AND :DATA2  ');
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
  qryPesqAux.Open;
  qryPesqAux.First;

  total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('EMP. A RECEBER').asString := FORMATFLOAT('###,##0.00',total );
  cdsGrid.Post;

  total := total + total_anterior;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('TOTAL   ATUAL').asString := FORMATFLOAT('###,##0.00',total );
  cdsGrid.Post;

  ///////// FIM EMP. A RECEBER/////////////

  cdsGrid.APPEND;
  cdsGrid.fieldbyname('FORMA PGTO').asString := 'EMP. A PAGAR';
  cdsGrid.Post;

  total := 0;
  total_anterior:= 0;

  ////////TOTAL ANTERIOR EMP. A PAGAR//////////
  qryPesqAux.close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL    '+
  'FROM EMPRESTIMOS_A_PAGAR WHERE DATA < :DATA1 AND DATA > :DATA2  ');
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
  qryPesqAux.Open;
  qryPesqAux.First;

  total := qryPesqAux.fieldbyname('TOTAL').asfloat;

  qryPesqAux.close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL    '+
  'FROM PAGTO_EMPRESTIMOS_A_PAGAR WHERE PG_DATA < :DATA1 AND PG_DATA > :DATA2  ');
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
  qryPesqAux.Open;
  qryPesqAux.First;

  total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('TOTAL ANTERIOR').asString := FORMATFLOAT('###,##0.00', total *(-1));
  cdsGrid.Post;

  total_anterior := total;

  fat_total_anterior := fat_total_anterior - total;

  /////////FIM TOTAL ANTERIOR EMP. A PAGAR/////////////

  //////// EMP. A PAGAR//////////

  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL FROM EMPRESTIMOS_A_PAGAR '+
           ' WHERE DATA BETWEEN :DATA1 AND :DATA2' );
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
  qryPesqAux.Open;

  total := qryPesqAux.fieldbyname('TOTAL').AsFloat;

  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL FROM PAGTO_EMPRESTIMOS_A_PAGAR '+
           ' WHERE PG_DATA BETWEEN :DATA1 AND :DATA2' );
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
  qryPesqAux.Open;

  total := qryPesqAux.FieldByName('TOTAL').AsFloat - total;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('EMP. A PAGAR').asString := FORMATFLOAT('###,##0.00', total);
  cdsGrid.Post;

  total := total - total_anterior;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('TOTAL   ATUAL').asString := FORMATFLOAT('###,##0.00', total);
  cdsGrid.Post;

  ///////// EMP. A PAGAR/////////////

  cdsGrid.APPEND;
  cdsGrid.fieldbyname('FORMA PGTO').asString := 'DESPESAS';
  cdsGrid.Post;

  //////////TOTAL ANTERIOR DESPESAS //////////////

  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CAD_DESPESA '+
            ' WHERE DATA < :DATA1 AND DATA > :DATA2');
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_setembro.Date;
  qryPesqAux.Open;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('TOTAL ANTERIOR').asString := FORMATFLOAT('###,##0.00', qryPesqAux.fieldbyname('TOTAL').AsFloat);
  cdsGrid.Post;

  total_anterior := qryPesqAux.fieldbyname('TOTAL').AsFloat;

  fat_total_anterior := fat_total_anterior + total_anterior;

  /////////FIM TOTAL ANTERIOR DESPESAS //////////////

  ////////DESPESAS///////////////
  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CAD_DESPESA '+
            ' WHERE DATA BETWEEN :DATA1 AND :DATA2');
  qryPesqAux.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
  qryPesqAux.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
  qryPesqAux.Open;

  total := total_anterior + qryPesqAux.fieldbyname('TOTAL').AsFloat;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('DESPESAS').asString := FORMATFLOAT('###,##0.00', qryPesqAux.fieldbyname('TOTAL').AsFloat);
  cdsGrid.Post;

  cdsGrid.Edit;
  cdsGrid.fieldbyname('TOTAL   ATUAL').asString := FORMATFLOAT('###,##0.00', total);
  cdsGrid.Post;
  ////////FIM DESPESAS///////////

  cdsGrid.APPEND;
  cdsGrid.fieldbyname('FORMA PGTO').asString := 'X';
  cdsGrid.Post;

  cdsGrid.APPEND;
  cdsGrid.fieldbyname('FORMA PGTO').asString := 'FATURAMENTO';
  cdsGrid.Post;

  cdsGrid.EDIT;
  cdsGrid.fieldbyname('TOTAL ANTERIOR').asString := formatfloat('###,##0.00', fat_total_anterior);
  cdsGrid.Post;

  cdsGrid.EDIT;
  cdsGrid.fieldbyname('FATURAMENTO').asString := formatfloat('###,##0.00', fat_faturamento);
  cdsGrid.Post;

  cdsGrid.EDIT;
  cdsGrid.fieldbyname('TOTAL   ATUAL').asString := formatfloat('###,##0.00', fat_faturamento + fat_total_anterior);
  cdsGrid.Post;

  /////COLOCA COR NA GRID/////////
  cor_global :=1;

  cdsgrid.First;
  cdsgrid.Last;
  /////FIM COLOCA COR NA GRID/////////

/////////////////////////////////////FIM CDSGRID//////////////////////////////////////////////

end;

procedure TfrmResumofinal.FormShow(Sender: TObject);
begin
  TXT_DATA_SETEMBRO.Text := '30/09/2009';

  txt_data_i.Date := date;
  txt_data_f.Date := date;

  cor_global := 0;
end;

procedure TfrmResumofinal.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if cor_global = 1 then
  begin
    if odd(cdsGrid.RecNo) then
      DBGrid1.Canvas.Brush.Color:= $00E1E1E1
    else
      DBGrid1.Canvas.Brush.Color:= clwindow;

    if cdsGrid.FieldByName('FORMA PGTO').AsString = 'X' then
      DBGrid1.Canvas.Brush.Color:= clblack;

    if cdsGrid.FieldByName('FORMA PGTO').AsString = 'FATURAMENTO' then
      DBGrid1.Canvas.Brush.Color:= claqua;

    TDbGrid(Sender).Canvas.font.Color:= clBlack;
    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
      begin
        FillRect(Rect);
        Font.Style := [fsbold]
      End;

    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
  end;

end;

end.
