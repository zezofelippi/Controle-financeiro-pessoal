unit unt_funcoes;

interface

uses SysUtils;

function VerificaSaldo(tipo : string; valor : real): real;
function VerificaSaldoMae(tipo : string; valor : real): real;

implementation  

uses unt_modulo;

function VerificaSaldo(tipo : string; valor : real): real;
var
  total, total_anterior : real;
  data_setembro, data_i, data_f : TDateTime;
  data_setembro_str : string;
begin

  data_setembro_str := Copy('09/30/2009',4,3) + Copy('09/30/2009',1,3) + Copy('09/30/2009',7,4);

  data_setembro := strtodate(data_setembro_str);

  data_i := now;
  data_f := now;

  with dm do
  begin
    /////////////////////////////TOTAL ANTERIOR///////////////////////
    total := 0;
    total_anterior := 0;

     //////////TRANSF. FINANCEIRA///////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                                         '+
                       'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_PARA=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                                       '+
                       'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_DE=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    //////////EMP. A RECEBER////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL                                                      '+
                       'FROM EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL                                                                         '+
                       'FROM PAGTO_EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA < :DATA1 AND PG_DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A RECEBER/////////////////


    //////////EMP. A PAGAR////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL                                                      '+
                       'FROM EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL                                                                       '+
                       'FROM PAGTO_EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA < :DATA1 AND PG_DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A PAGAR/////////////////


    //////////FATURAMENTO////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_RECEITAS WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

     //////////DESPESAS////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_DESPESA WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('total').AsFloat ;

    total_anterior := total;

    ////fat_total_anterior := fat_total_anterior + total;


////////////////////////////////////FIM TOTAL ANTERIOR//////////////////////////



/////////////////////////////////TOTAL ATUAL///////////////////////
    total := 0;

     //////////TRANSF. FINANCEIRA///////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                                       '+
                       'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_PARA=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                                      '+
                       'FROM TRANSFERENCIA_FINANCEIRA WHERE TP_CODIGO_DE=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    //////////EMP. A RECEBER////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL                                                     '+
                       'FROM EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL                                                                     '+
                       'FROM PAGTO_EMPRESTIMOS_A_RECEBER WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A RECEBER/////////////////


    //////////EMP. A PAGAR////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL                                                     '+
                       'FROM EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL                                                                   '+
                       'FROM PAGTO_EMPRESTIMOS_A_PAGAR WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A PAGAR/////////////////


    //////////FATURAMENTO////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                      '+
                       'FROM CAD_RECEITAS WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

     //////////DESPESAS////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                     '+
                       'FROM CAD_DESPESA WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('total').AsFloat ;

    total := total + total_anterior;

    result:= (total);

///////////////////////////FIM TOTAL ATUAL//////////////////////////


  end;

end;

function VerificaSaldoMae(tipo : string; valor : real): real;
var
  total, total_anterior : real;
  data_setembro, data_i, data_f : TDateTime;
  data_setembro_str : string;
begin

  data_setembro_str := Copy('09/30/2009',4,3) + Copy('09/30/2009',1,3) + Copy('09/30/2009',7,4);

  data_setembro := strtodate(data_setembro_str);

  data_i := now;
  data_f := now;

  with dm do
  begin
    /////////////////////////////TOTAL ANTERIOR///////////////////////
    total := 0;
    total_anterior := 0;

     //////////TRANSF. FINANCEIRA///////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                                         '+
                       'FROM TRANSFERENCIA_FINANCEIRA_MAE WHERE TP_CODIGO_PARA=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                                       '+
                       'FROM TRANSFERENCIA_FINANCEIRA_MAE WHERE TP_CODIGO_DE=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    //////////EMP. A RECEBER////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL                                                      '+
                       'FROM EMPRESTIMOS_A_RECEBER_MAE WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL                                                                         '+
                       'FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA < :DATA1 AND PG_DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A RECEBER/////////////////


    //////////EMP. A PAGAR////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL                                                      '+
                       'FROM EMPRESTIMOS_A_PAGAR_MAE WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL                                                                       '+
                       'FROM PAGTO_EMPRESTIMOS_A_PAGAR_MAE WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA < :DATA1 AND PG_DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A PAGAR/////////////////


    //////////FATURAMENTO////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_RECEITAS_MAE WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

     //////////DESPESAS////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL    '+
    'FROM CAD_DESPESA_MAE WHERE TP_CODIGO=:TP_CODIGO AND DATA < :DATA1 AND DATA > :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_setembro;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('total').AsFloat ;

    total_anterior := total;

    ////fat_total_anterior := fat_total_anterior + total;


////////////////////////////////////FIM TOTAL ANTERIOR//////////////////////////



/////////////////////////////////TOTAL ATUAL///////////////////////
    total := 0;

     //////////TRANSF. FINANCEIRA///////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                                       '+
                       'FROM TRANSFERENCIA_FINANCEIRA_MAE WHERE TP_CODIGO_PARA=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                                      '+
                       'FROM TRANSFERENCIA_FINANCEIRA_MAE WHERE TP_CODIGO_DE=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    //////////EMP. A RECEBER////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_EMPRESTIMO) AS TOTAL                                                     '+
                       'FROM EMPRESTIMOS_A_RECEBER_MAE WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2  ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL                                                                     '+
                       'FROM PAGTO_EMPRESTIMOS_A_RECEBER_MAE WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A RECEBER/////////////////


    //////////EMP. A PAGAR////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR_A_PAGAR) AS TOTAL                                                     '+
                       'FROM EMPRESTIMOS_A_PAGAR_MAE WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(PG_VALOR) AS TOTAL                                                                   '+
                       'FROM PAGTO_EMPRESTIMOS_A_PAGAR_MAE WHERE TP_CODIGO=:TP_CODIGO AND PG_DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('TOTAL').asfloat;

    ///////////FIM EMP. A PAGAR/////////////////


    //////////FATURAMENTO////////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                      '+
                       'FROM CAD_RECEITAS_MAE WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total + qryPesqAux.fieldbyname('TOTAL').asfloat;

     //////////DESPESAS////////////////
    qryPesqAux.close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT SUM(VALOR) AS TOTAL                                                     '+
                       'FROM CAD_DESPESA_MAE WHERE TP_CODIGO=:TP_CODIGO AND DATA BETWEEN :DATA1 AND :DATA2 ');
    qryPesqAux.ParamByName('TP_CODIGO').AsString := tipo;
    qryPesqAux.ParamByName('DATA1').AsDateTime := data_i;
    qryPesqAux.ParamByName('DATA2').AsDateTime := data_f;
    qryPesqAux.Open;
    qryPesqAux.First;

    total := total - qryPesqAux.fieldbyname('total').AsFloat ;

    total := total + total_anterior;

    result:= (total);

///////////////////////////FIM TOTAL ATUAL//////////////////////////


  end;

end;

end.
