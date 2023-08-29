unit untConfirmarBaixaContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, DB, IBCustomDataSet,
  IBQuery, IBDatabase, DBCtrls, ExtCtrls;

type
  TfrmConfirmarBaixaContasPagar = class(TForm)
    Label1: TLabel;
    txt_codigo: TEdit;
    Label2: TLabel;
    txt_Valor: TCurrencyEdit;
    btnConfirmar: TButton;
    Label3: TLabel;
    txt_data: TDateEdit;
    qry_pesquisa: TIBQuery;
    qry_pesquisa_mes: TIBQuery;
    qry_pesquisa_ano: TIBQuery;
    cboFormaPgto: TDBLookupComboBox;
    Label6: TLabel;
    txt_valor_saldo: TCurrencyEdit;
    dsFormaPgto: TDataSource;
    qryFormaPgto: TIBQuery;
    qryFormaPgtoTP_CODIGO: TIntegerField;
    qryFormaPgtoTP_DESCRICAO: TIBStringField;
    qryFormaPgtoTP_DEFAULT: TIBStringField;
    qryFormaPgtoDESCRICAO: TIBStringField;
    rdgContaAtrasada: TRadioGroup;
    procedure btnConfirmarClick(Sender: TObject);
    procedure txt_codigoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirmarBaixaContasPagar: TfrmConfirmarBaixaContasPagar;

implementation

uses unt_contas_pagar, unt_modulo, unt_funcoes;

{$R *.dfm}

procedure TfrmConfirmarBaixaContasPagar.btnConfirmarClick(Sender: TObject);
var
  cod_despesa : integer;
  mes, ano, codmes, codano, cod_contas_pagar : string;
  valor : real;

begin

////////VERIFICA SE SALDO E SUFICIENTE/////

  txt_valor_saldo.value := VerificaSaldo(cboFormaPgto.KeyValue, valor);

  if txt_valor_Saldo.Value < txt_valor.Value then
  begin
    showmessage('Saldo insuficiente');
    txt_Valor.SetFocus;
    exit;
  end;

////////FIM VERIFICA SE SALDO E SUFICIENTE/////


  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja dar baixa no registro N. '+  frm_contas_pagar.cdsMostraDados.FieldByName('CODIGO').AsString + ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin

    // CADASTRA NAS DESPESAS
    frm_contas_pagar.QRY_MAX_CODIGO.Close;
    frm_contas_pagar.QRY_MAX_CODIGO.SQL.Clear;
    frm_contas_pagar.QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM CAD_DESPESA');
    frm_contas_pagar.QRY_MAX_CODIGO.Open;
    cod_despesa := frm_contas_pagar.QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

    //VERIFICA SE REGISTRO JA FOI ADICIONADO NO CADASTRO DE DESPESAS COMO PAGAMENTO PARCIAL
    cod_contas_pagar:='';

    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT CODIGO FROM CAD_DESPESA WHERE CONTAS_PAGAR_ID=:CONTAS_PAGAR_ID');
    qry_pesquisa.ParamByName('CONTAS_PAGAR_ID').AsString := frm_contas_pagar.cdsmostradados.fieldbyname('CODIGO').AsString;
    qry_pesquisa.Open;
    qry_pesquisa.FetchAll;

    if not qry_pesquisa.IsEmpty then
      cod_contas_pagar:= frm_contas_pagar.cdsmostradados.fieldbyname('CODIGO').AsString;

    //FIM VERIFICA SE REGISTRO JA FOI ADICIONADO NO CADASTRO DE DESPESAS COMO PAGAMENTO PARCIAL

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

    if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
      frm_contas_pagar.IBTRANSLOCAL.StartTransaction;
    frm_contas_pagar.qry_contas_pagar.Close;
    frm_contas_pagar.qry_contas_pagar.SQL.Clear;
    frm_contas_pagar.qry_contas_pagar.SQL.Add('INSERT INTO CAD_DESPESA (CODIGO, DESPESA_OUTROS, VALOR, DATA, DATA_CARTAO, TIP_CODIGO, COD_MES, '+
                                              'TDS_CODIGO, TP_CODIGO, CONTA_ATRASADA, COT_CODIGO, AT_CODIGO, CONTAS_PAGAR_ID)                  '+
                                              'VALUES (:CODIGO, :DESPESA_OUTROS, :VALOR, :DATA, :DATA_CARTAO, :TIP_CODIGO, :COD_MES,           '+
                                              ':TDS_CODIGO, :TP_CODIGO, :CONTA_ATRASADA, :COT_CODIGO, :AT_CODIGO, :CONTAS_PAGAR_ID)            ');
    frm_contas_pagar.qry_contas_pagar.ParamByName('CODIGO').AsInteger         := cod_despesa;
    frm_contas_pagar.qry_contas_pagar.ParamByName('TIP_CODIGO').AsString      := frm_contas_pagar.cdsmostradados.fieldbyname('TIP_CODIGO').AsString;
    frm_contas_pagar.qry_contas_pagar.ParamByName('DESPESA_OUTROS').AsString  := frm_contas_pagar.cdsmostradados.fieldbyname('DESCRICAO').AsString;
    frm_contas_pagar.qry_contas_pagar.ParamByName('VALOR').AsFLOAT            := txt_valor.Value;
    frm_contas_pagar.qry_contas_pagar.ParamByName('DATA').AsDateTime          := txt_data.Date;
    frm_contas_pagar.qry_contas_pagar.ParamByName('DATA_CARTAO').AsDateTime   := frm_contas_pagar.cdsmostradados.fieldbyname('DATA_DESPESA').AsDateTime;
    frm_contas_pagar.qry_contas_pagar.ParamByName('TDS_CODIGO').AsString      := frm_contas_pagar.cdsmostradados.fieldbyname('TDS_CODIGO').AsString;
    frm_contas_pagar.qry_contas_pagar.ParamByName('TP_CODIGO').AsString       := cboFormaPgto.KeyValue;

    if cod_contas_pagar <> '' then
      frm_contas_pagar.qry_contas_pagar.ParamByName('CONTAS_PAGAR_ID').AsString     := cod_contas_pagar;

    if (qry_pesquisa.IsEmpty) and (codmes <> '') then  //SO PODE GRAVAR O COD_MES EM UM REGISTRO NO MES
      frm_contas_pagar.qry_contas_pagar.ParamByName('COD_MES').AsString := codmes;

    if rdgContaAtrasada.ItemIndex = 0 then
      frm_contas_pagar.qry_contas_pagar.ParamByName('CONTA_ATRASADA').AsString   := 'S'
    else
      frm_contas_pagar.qry_contas_pagar.ParamByName('CONTA_ATRASADA').AsString   := 'N';

    frm_contas_pagar.qry_contas_pagar.ParamByName('COT_CODIGO').AsString      := frm_contas_pagar.cdsmostradados.fieldbyname('COT_CODIGO').AsString;
    frm_contas_pagar.qry_contas_pagar.ParamByName('AT_CODIGO').AsString       := frm_contas_pagar.cdsmostradados.fieldbyname('AT_CODIGO').AsString;

    frm_contas_pagar.qry_contas_pagar.ExecSQL;
    frm_contas_pagar.IBTRANSLOCAL.Commit;

    ///////////////////////////VERIFICA SE A DESPESA ESTA VINCULADA COM DESPESA SITIO/////////////////////////////////////////

    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT TIP_CODIGO_SIT FROM JUNTAR_DESP_PESSOAL_SITIO '+
       ' WHERE TIP_CODIGO=:TIP_CODIGO AND TDS_CODIGO=:TDS_CODIGO ');
    qry_pesquisa.ParamByName('TIP_CODIGO').AsString := frm_contas_pagar.cdsmostradados.fieldbyname('TIP_CODIGO').AsString;
    qry_pesquisa.ParamByName('TDS_CODIGO').AsString := frm_contas_pagar.cdsmostradados.fieldbyname('TDS_CODIGO').AsString;
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

      frm_contas_pagar.QRY_MAX_CODIGO.Close;
      frm_contas_pagar.QRY_MAX_CODIGO.SQL.Clear;
      frm_contas_pagar.QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM CAD_DESPESA_SITIO');
      frm_contas_pagar.QRY_MAX_CODIGO.Open;
      cod_despesa := frm_contas_pagar.QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

      if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
        frm_contas_pagar.IBTRANSLOCAL.StartTransaction;
      frm_contas_pagar.qry_contas_pagar.Close;
      frm_contas_pagar.qry_contas_pagar.SQL.Clear;
      frm_contas_pagar.qry_contas_pagar.SQL.Add('INSERT INTO CAD_DESPESA_SITIO (CODIGO, DESPESA_OUTROS, VALOR, DATA, TIP_CODIGO_SIT, COD_MES,  '+
                                                'COD_ANO, CONTA_ATRASADA, CONTAS_PAGAR_ID)                                                     '+
                                                'VALUES (:CODIGO, :DESPESA_OUTROS, :VALOR, :DATA, :TIP_CODIGO_SIT, :COD_MES, :COD_ANO,         '+
                                                ':CONTA_ATRASADA, :CONTAS_PAGAR_ID)                                                            ');
      frm_contas_pagar.qry_contas_pagar.ParamByName('CODIGO').AsInteger         := cod_despesa;
      frm_contas_pagar.qry_contas_pagar.ParamByName('DESPESA_OUTROS').AsString  := frm_contas_pagar.cdsmostradados.fieldbyname('DESCRICAO').AsString;
      frm_contas_pagar.qry_contas_pagar.ParamByName('VALOR').AsFLOAT            := txt_valor.Value;
      frm_contas_pagar.qry_contas_pagar.ParamByName('DATA').AsDateTime          := txt_data.Date;
      frm_contas_pagar.qry_contas_pagar.ParamByName('TIP_CODIGO_SIT').AsInteger := qry_pesquisa.fieldbyname('TIP_CODIGO_SIT').AsInteger;

      if cod_contas_pagar <> '' then
        frm_contas_pagar.qry_contas_pagar.ParamByName('CONTAS_PAGAR_ID').AsString     := cod_contas_pagar;

      if (qry_pesquisa_mes.IsEmpty) and (codmes <> '') then  //SO PODE GRAVAR O COD_MES EM UM REGISTRO NO MES
        frm_contas_pagar.qry_contas_pagar.ParamByName('COD_MES').AsString  := codmes;

      if (qry_pesquisa_ano.IsEmpty) and (codano <> '') then  //SO PODE GRAVAR O COD_ANO EM UM REGISTRO NO ANO
        frm_contas_pagar.qry_contas_pagar.ParamByName('COD_ANO').AsString  := codano;

      if rdgContaAtrasada.ItemIndex = 0 then
        frm_contas_pagar.qry_contas_pagar.ParamByName('CONTA_ATRASADA').AsString   := 'S'
      else
        frm_contas_pagar.qry_contas_pagar.ParamByName('CONTA_ATRASADA').AsString   := 'N';

      frm_contas_pagar.qry_contas_pagar.ExecSQL;
      frm_contas_pagar.IBTRANSLOCAL.Commit;

    end; //fim do if not qry_pesquisa.isempty

    ///////////////////////FIM VERIFICA SE A DESPESA ESTA VINCULADA COM DESPESA SITIO/////////////////////////////////////

    //DELETE DO CONTAS A PAGAR
    if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
      frm_contas_pagar.IBTRANSLOCAL.StartTransaction;
    frm_contas_pagar.qry_contas_pagar.Close;
    frm_contas_pagar.qry_contas_pagar.SQL.Clear;
    frm_contas_pagar.qry_contas_pagar.SQL.Add('DELETE FROM CONTAS_PAGAR WHERE CODIGO = '+  frm_contas_pagar.cdsmostradados.fieldbyname('CODIGO').AsString);
    frm_contas_pagar.qry_contas_pagar.ExecSQL;
    frm_contas_pagar.IBTRANSLOCAL.Commit;

    frm_contas_pagar.btnPesquisar.Click;

    frm_contas_pagar.cboDespesa.SetFocus;

    frm_contas_pagar.txt_descricao.Clear;
    frm_contas_pagar.txt_valor.Clear;
    frm_contas_pagar.txt_data_despesa.Clear;
    frm_contas_pagar.txt_data_pgto.Clear;
    frm_contas_pagar.cboDespesa.KeyValue := null;
    frm_contas_pagar.txt_obs.Clear;

  end;//YES
    IDNO : Exit;
  end; //FIM CASE
    close;
end;

procedure TfrmConfirmarBaixaContasPagar.txt_codigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure TfrmConfirmarBaixaContasPagar.txt_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_Data.SetFocus;
end;

procedure TfrmConfirmarBaixaContasPagar.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnConfirmar.SetFocus;
end;

procedure TfrmConfirmarBaixaContasPagar.FormShow(Sender: TObject);
begin

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

  rdgContaAtrasada.ItemIndex := 1;
  
end;

end.
