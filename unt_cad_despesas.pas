unit unt_cad_despesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, IBDatabase, DB, IBCustomDataSet, IBQuery,
  CurrEdit, DBCtrls, ToolEdit, Grids, DBGrids;

type
  Tfrm_cad_despesas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    txt_outra_despesa: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    qry_despesa: TIBQuery;
    IBTransLocal: TIBTransaction;
    txt_Valor: TCurrencyEdit;
    txt_data: TDateEdit;
    QRY_MAX_CODIGO: TIBQuery;
    cboDespesa: TDBLookupComboBox;
    qryDespesa: TIBQuery;
    dsDespesa: TDataSource;
    qryDespesaTIP_CODIGO: TIntegerField;
    qryDespesaDESPESA: TIBStringField;
    qryDespesaTIP_DESCRICAO: TIBStringField;
    qry_pesquisa: TIBQuery;
    cboDespesaSub: TDBLookupComboBox;
    Label5: TLabel;
    dsDespesaSub: TDataSource;
    qryDespesaSub: TIBQuery;
    qryDespesaSubDESPESA_SUB: TIBStringField;
    qryDespesaSubTDS_CODIGO: TIntegerField;
    qry_pesquisa_ano: TIBQuery;
    qry_pesquisa_mes: TIBQuery;
    Label6: TLabel;
    cboFormaPgto: TDBLookupComboBox;
    qryFormaPgto: TIBQuery;
    dsFormaPgto: TDataSource;
    qryFormaPgtoTP_CODIGO: TIntegerField;
    qryFormaPgtoTP_DESCRICAO: TIBStringField;
    qryFormaPgtoTP_DEFAULT: TIBStringField;
    qryFormaPgtoDESCRICAO: TIBStringField;
    txt_valor_saldo: TCurrencyEdit;
    GroupBox1: TGroupBox;
    txtFornecedor: TEdit;
    Button2: TButton;
    txt_cod_fornecedor: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    txtCotacao: TEdit;
    Label9: TLabel;
    DBGrid7: TDBGrid;
    Button3: TButton;
    qryCotacao: TIBQuery;
    dsCotacao: TDataSource;
    qryCotacaoPRO_CODIGO: TIntegerField;
    qryCotacaoPRO_DESCRICAO: TIBStringField;
    qryCotacaoCOT_UNIDADE: TIBStringField;
    qryCotacaoCOT_QTD: TFloatField;
    qryCotacaoCOT_VALOR: TIBBCDField;
    qryCotacaoVALOR_TOTAL: TFloatField;
    lbl4: TLabel;
    txt_total: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbo_despesaKeyPress(Sender: TObject; var Key: Char);
    procedure txt_outra_despesaKeyPress(Sender: TObject; var Key: Char);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbo_despesaEnter(Sender: TObject);
    procedure cbo_despesaExit(Sender: TObject);
    procedure txt_outra_despesaEnter(Sender: TObject);
    procedure txt_outra_despesaExit(Sender: TObject);
    procedure txt_ValorEnter(Sender: TObject);
    procedure txt_ValorExit(Sender: TObject);
    procedure txt_dataEnter(Sender: TObject);
    procedure txt_dataExit(Sender: TObject);
    procedure cboDespesaEnter(Sender: TObject);
    procedure cboDespesaExit(Sender: TObject);
    procedure cboDespesaKeyPress(Sender: TObject; var Key: Char);
    procedure dsDespesaDataChange(Sender: TObject; Field: TField);
    procedure cboDespesaSubKeyPress(Sender: TObject; var Key: Char);
    procedure cboDespesaSubEnter(Sender: TObject);
    procedure cboDespesaSubExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_despesas: Tfrm_cad_despesas;

implementation

uses unt_modulo, unt_funcoes, untPesqCotacaoCompraDesp;

{$R *.dfm}

procedure Tfrm_cad_despesas.FormShow(Sender: TObject);
begin

  txt_outra_despesa.Clear;
  txt_valor.Clear;
  txt_data.Clear;

  qryDespesa.Close;
  qryDespesa.SQL.Clear;
  qryDespesa.SQL.Add('SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'+#39+' - '+#39+'|| TIP_DESCRICAO AS DESPESA FROM TIPO_DESPESA');
  qryDespesa.Open;
  qryDespesa.FetchAll;

  qryFormaPgto.Close;
  qryFormaPgto.SQL.Clear;
  qryFormaPgto.SQL.Add('SELECT TP_CODIGO, TP_DESCRICAO, TP_DEFAULT, TP_CODIGO ||'' - ''|| TP_DESCRICAO AS DESCRICAO '+
                       ' FROM TIPO_PAGAMENTO ORDER BY TP_CODIGO                                                     ');
  qryFormaPgto.Open;
  qryFormaPgto.FetchAll;

  qryFormaPgto.First;

  while not qryFormaPgto.Eof do
  begin
    if qryFormaPgto.FieldByName('TP_DEFAULT').AsString = 'S' then
      cboFormaPgto.KeyValue := qryFormaPgto.fieldbyname('TP_CODIGO').AsInteger;

    qryFormaPgto.Next;

  end;

  cboDespesa.SetFocus;

end;

procedure Tfrm_cad_despesas.Button1Click(Sender: TObject);
var
  cod_despesa : integer;
  mes, ano, codmes, codano : string;
  valor : real;

begin

  if cboDespesa.Text = '' then
  begin
    showmessage('Coloque a despesa');
    cboDespesa.SetFocus;
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

  if cboFormaPgto.Text = '' then
  begin
    showmessage('Coloque a forma de pagamento');
    cboFormaPgto.SetFocus;
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


  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM CAD_DESPESA');
  QRY_MAX_CODIGO.Open;
  cod_despesa := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;


//VERIFICA SE COD_MES ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA//////////

  mes := (formatdatetime('mm',strtodatetime(txt_data.text)));
  ano := (formatdatetime('yyyy',strtodatetime(txt_data.text)));

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES  '+
                       'FROM CAD_RECEITAS WHERE EXTRACT(month FROM DATA) =:MES                           '+
                       'AND EXTRACT(YEAR FROM DATA) =:ANO                                                ');
  qry_pesquisa.ParamByName('MES').AsString := mes;
  qry_pesquisa.ParamByName('ANO').AsString := ano;
  qry_pesquisa.Open;

  if not qry_pesquisa.IsEmpty then
    codmes:= qry_pesquisa.fieldbyname('COD_MES').AsString
  else
    codmes:= '';

  if codmes <> '' then
  begin
    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES  '+
                         'FROM CAD_DESPESA WHERE COD_MES=:COD_MES                                          ');
    qry_pesquisa.ParamByName('COD_MES').AsString := codmes;
    qry_pesquisa.Open;
  end;


/////FIM VERIFICA SE COD_MES ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA/////////////

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_despesa.Close;
  qry_despesa.SQL.Clear;
  qry_despesa.SQL.Add('INSERT INTO CAD_DESPESA (CODIGO, DESPESA_OUTROS, VALOR, DATA, TIP_CODIGO, TDS_CODIGO, COD_MES, TP_CODIGO, COT_CODIGO, AT_CODIGO, CONTA_ATRASADA)  '+
                      'VALUES (:CODIGO, :DESPESA_OUTROS, :VALOR, :DATA, :TIP_CODIGO, :TDS_CODIGO, :COD_MES, :TP_CODIGO, :COT_CODIGO, :AT_CODIGO, :CONTA_ATRASADA)        ');
  qry_despesa.ParamByName('CODIGO').AsInteger         := cod_despesa;
  qry_despesa.ParamByName('DESPESA_OUTROS').AsString  := txt_outra_despesa.Text;
  qry_despesa.ParamByName('VALOR').AsFLOAT            := txt_valor.Value;
  qry_despesa.ParamByName('DATA').AsDateTime          := txt_data.Date;
  qry_despesa.ParamByName('TIP_CODIGO').AsInteger     := cboDespesa.KeyValue;
  qry_despesa.ParamByName('TDS_CODIGO').AsInteger     := cboDespesaSub.KeyValue;
  qry_despesa.ParamByName('TP_CODIGO').AsInteger      := cboFormaPgto.KeyValue;
  qry_despesa.ParamByName('CONTA_ATRASADA').AsString  := 'N';

  if txtcotacao.Text <> '' then
  begin
    qry_despesa.ParamByName('COT_CODIGO').AsString :=  txtCotacao.Text;
    qry_despesa.ParamByName('AT_CODIGO').AsString  :=  txt_Cod_Fornecedor.Text;
  end;


  if (qry_pesquisa.IsEmpty) and (codmes <> '') then  //SO PODE GRAVAR O COD_MES EM UM REGISTRO NO MES
    qry_despesa.ParamByName('COD_MES').AsString  := codmes;

  qry_despesa.ExecSQL;
  IBTRANSLOCAL.Commit;

  if txtcotacao.Text <> '' then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_despesa.Close;
    qry_despesa.SQL.Clear;
    qry_despesa.SQL.Add('UPDATE ITENS_COTACAO_FORNEC_VENC SET COT_COMPRA_EFETUADA=:COT_COMPRA_EFETUADA '+
                        ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO                      ');
    qry_despesa.ParamByName('COT_CODIGO').AsString :=  txtCotacao.Text;
    qry_despesa.ParamByName('FOR_CODIGO').AsString  :=  txt_Cod_Fornecedor.Text;
    qry_despesa.ParamByName('COT_COMPRA_EFETUADA').AsString  :=  'S';
    qry_despesa.ExecSQL;
    IBTRANSLOCAL.Commit;
  end;


///////////////////////////VERIFICA SE A DESPESA ESTA VINCULADA COM DESPESA SITIO/////////////////////////////////////////

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT TIP_CODIGO_SIT FROM JUNTAR_DESP_PESSOAL_SITIO    '+
                       'WHERE TIP_CODIGO=:TIP_CODIGO AND TDS_CODIGO=:TDS_CODIGO ');
  qry_pesquisa.ParamByName('TIP_CODIGO').AsString := cboDespesa.KeyValue;
  qry_pesquisa.ParamByName('TDS_CODIGO').AsString := cboDespesaSub.KeyValue;
  qry_pesquisa.Open;

  if not qry_pesquisa.IsEmpty then
  begin

    //VERIFICA SE COD_MES ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA//////////

    mes := (formatdatetime('mm',strtodatetime(txt_data.text)));
    ano := (formatdatetime('yyyy',strtodatetime(txt_data.text)));

    qry_pesquisa_mes.Close;
    qry_pesquisa_mes.SQL.Clear;
    qry_pesquisa_mes.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES  '+
                             'FROM ITENS_RECEITAS_SITIO WHERE EXTRACT(month FROM DATA) =:MES                   '+
                             'AND EXTRACT(YEAR FROM DATA) =:ANO                                                ');
    qry_pesquisa_mes.ParamByName('MES').AsString := mes;
    qry_pesquisa_mes.ParamByName('ANO').AsString := ano;
    qry_pesquisa_mes.Open;

    if not qry_pesquisa_mes.IsEmpty then
      codmes:= qry_pesquisa_mes.fieldbyname('COD_MES').AsString
    else
      codmes:= '';

    if codmes <> '' then
    begin
      qry_pesquisa_mes.Close;
      qry_pesquisa_mes.SQL.Clear;
      qry_pesquisa_mes.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES  '+
                               'FROM CAD_DESPESA_SITIO WHERE COD_MES=:COD_MES                                    ');
      qry_pesquisa_mes.ParamByName('COD_MES').AsString := codmes;
      qry_pesquisa_mes.Open;
    end;

   /////FIM VERIFICA SE COD_MES ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA/////////////


   //VERIFICA SE COD_ANO ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA//////////

    ano := (formatdatetime('yyyy',strtodatetime(txt_data.text)));

    qry_pesquisa_ano.Close;
    qry_pesquisa_ano.SQL.Clear;
    qry_pesquisa_ano.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO, COD_ANO  '+
                             'FROM ITENS_RECEITAS_SITIO WHERE                 '+
                             'EXTRACT(YEAR FROM DATA) =:ANO                   ');
    qry_pesquisa_ano.ParamByName('ANO').AsString := ano;
    qry_pesquisa_ano.Open;

    if not qry_pesquisa_ano.IsEmpty then
      codano:= qry_pesquisa_ano.fieldbyname('COD_ANO').AsString
    else
      codano:= '';

    if codano <> '' then
    begin
      qry_pesquisa_ano.Close;
      qry_pesquisa_ano.SQL.Clear;
      qry_pesquisa_ano.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO, COD_ANO  '+
                               'FROM CAD_DESPESA_SITIO WHERE COD_ANO=:COD_ANO   ');
      qry_pesquisa_ano.ParamByName('COD_ANO').AsString := codano;
      qry_pesquisa_ano.Open;
    end;

    /////FIM VERIFICA SE COD_ANO ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA/////////////

    QRY_MAX_CODIGO.Close;
    QRY_MAX_CODIGO.SQL.Clear;
    QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM CAD_DESPESA_SITIO');
    QRY_MAX_CODIGO.Open;
    cod_despesa := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_despesa.Close;
    qry_despesa.SQL.Clear;
    qry_despesa.SQL.Add('INSERT INTO CAD_DESPESA_SITIO (CODIGO, DESPESA_OUTROS, VALOR, DATA, TIP_CODIGO_SIT, COD_MES, COD_ANO)  '+
                        'VALUES (:CODIGO, :DESPESA_OUTROS, :VALOR, :DATA, :TIP_CODIGO_SIT, :COD_MES, :COD_ANO)                  ');
    qry_despesa.ParamByName('CODIGO').AsInteger         := cod_despesa;
    qry_despesa.ParamByName('DESPESA_OUTROS').AsString  := txt_outra_despesa.Text;
    qry_despesa.ParamByName('VALOR').AsFLOAT            := txt_valor.Value;
    qry_despesa.ParamByName('DATA').AsDateTime          := txt_data.Date;
    qry_despesa.ParamByName('TIP_CODIGO_SIT').AsInteger := qry_pesquisa.fieldbyname('TIP_CODIGO_SIT').AsInteger;

    if (qry_pesquisa_mes.IsEmpty) and (codmes <> '') then  //SO PODE GRAVAR O COD_MES EM UM REGISTRO NO MES
      qry_despesa.ParamByName('COD_MES').AsString  := codmes;

    if (qry_pesquisa_ano.IsEmpty) and (codano <> '') then  //SO PODE GRAVAR O COD_ANO EM UM REGISTRO NO ANO
      qry_despesa.ParamByName('COD_ANO').AsString  := codano;

    qry_despesa.ExecSQL;
    IBTRANSLOCAL.Commit;

  end; //fim do if not qry_pesquisa.isempty

///////////////////////FIM VERIFICA SE A DESPESA ESTA VINCULADA COM DESPESA SITIO/////////////////////////////////////


////////DEIXA A FORMA DE PGTO DEFAULT////////
  qryFormaPgto.First;

  while not qryFormaPgto.Eof do
  begin
    if qryFormaPgto.FieldByName('TP_DEFAULT').AsString = 'S' then
      cboFormaPgto.KeyValue := qryFormaPgto.fieldbyname('TP_CODIGO').AsInteger;

    qryFormaPgto.Next;

  end;

///////FIM DEIXA A FORMA DE PGTO DEFAULT////////


  cboDespesa.KeyValue := NULL;
  cboDespesaSub.KeyValue := NULL;
  txt_outra_despesa.Clear;
  txt_valor.Clear;
  txt_data.Clear;

  txtCotacao.Clear;
  txt_cod_fornecedor.Clear;
  txtfornecedor.Clear;

  qry_pesquisa.Close;
  qry_Pesquisa.SQL.Clear;

  qryCotacao.Close;
  qryCotacao.SQL.Clear;

  cboDespesa.SetFocus;

end;

procedure Tfrm_cad_despesas.cbo_despesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_outra_despesa.SetFocus;
end;

procedure Tfrm_cad_despesas.txt_outra_despesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure Tfrm_cad_despesas.txt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data.SetFocus;
end;

procedure Tfrm_cad_despesas.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    button1.SetFocus;
end;

procedure Tfrm_cad_despesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_cad_despesas := nil;
  action:= cafree;
end;

procedure Tfrm_cad_despesas.cbo_despesaEnter(Sender: TObject);
begin
  cboDespesa.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.cbo_despesaExit(Sender: TObject);
begin
  cboDespesa.Color := clwindow;
end;

procedure Tfrm_cad_despesas.txt_outra_despesaEnter(Sender: TObject);
begin
  txt_outra_despesa.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.txt_outra_despesaExit(Sender: TObject);
begin
  txt_outra_despesa.Color := clwindow;
end;

procedure Tfrm_cad_despesas.txt_ValorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.txt_ValorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure Tfrm_cad_despesas.txt_dataEnter(Sender: TObject);
begin
  txt_data.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.txt_dataExit(Sender: TObject);
begin
  txt_data.Color := clwindow;
end;

procedure Tfrm_cad_despesas.cboDespesaEnter(Sender: TObject);
begin
  cboDespesa.Color :=$00F5EEDE;
end;

procedure Tfrm_cad_despesas.cboDespesaExit(Sender: TObject);
begin
  cboDespesa.Color := clwindow;
end;

procedure Tfrm_cad_despesas.cboDespesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cboDespesaSub.SetFocus;
end;

procedure Tfrm_cad_despesas.dsDespesaDataChange(Sender: TObject;
  Field: TField);
begin
  qryDespesaSub.Close;
  qryDespesaSub.SQL.Clear;
  qryDespesaSub.SQL.Add('SELECT TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_SUB, TDS.tds_codigo    '+
                        'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS                                    '+
                        'WHERE I.TIP_CODIGO = TD.TIP_CODIGO AND I.TDS_CODIGO = TDS.TDS_CODIGO AND TD.TIP_CODIGO=:TIP_CODIGO '+
                        'ORDER BY TD.TIP_DESCRICAO                                                                          ');
  qryDespesaSub.ParamByName('TIP_CODIGO').AsString := qryDespesa.FIELDBYNAME('TIP_CODIGO').AsString;
  qryDespesaSub.Open;
  qryDespesaSub.FetchAll;
end;

procedure Tfrm_cad_despesas.cboDespesaSubKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_outra_despesa.SetFocus;
end;

procedure Tfrm_cad_despesas.cboDespesaSubEnter(Sender: TObject);
begin
  cboDespesaSub.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.cboDespesaSubExit(Sender: TObject);
begin
  cboDespesaSub.Color := clwindow;
end;

procedure Tfrm_cad_despesas.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqCotacaoCompraDesp, frmPesqCotacaoCompraDesp);
  frmPesqCotacaoCompraDesp.pesquisar := 'Cad_Despesa';
  frmPesqCotacaoCompraDesp.ShowModal;
end;

procedure Tfrm_cad_despesas.Button3Click(Sender: TObject);
begin
  qry_pesquisa.Close;
  qry_Pesquisa.SQL.Clear;

  txtCotacao.Clear;
  txt_cod_fornecedor.Clear;
  txtfornecedor.Clear;

end;

end.
