unit untRelTransfFinanc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelTransfFinanc = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    qry_pesquisa: TIBQuery;
    ds_pesquisa: TDataSource;
    lbl_data: TRLLabel;
    qry_pesquisaMES: TSmallintField;
    qry_pesquisaANO: TSmallintField;
    qry_pesquisaDATA: TDateTimeField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaOBS: TIBStringField;
    qry_pesquisaDE: TIBStringField;
    qry_pesquisaPARA: TIBStringField;
    qryTipoPgto: TIBQuery;
    qryTotal: TIBQuery;
    dsTipoPgto: TDataSource;
    RLSubDetail2: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    lblMes_ano: TRLLabel;
    RLBand3: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand4: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel12: TRLLabel;
    bndTipoPgto: TRLSubDetail;
    RLBand5: TRLBand;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLBand7: TRLBand;
    txt_de: TRLDBText;
    txt_para: TRLDBText;
    txt_total: TRLDBText;
    RLDBText9: TRLDBText;
    qryTipoPgtoTP_CODIGO: TIntegerField;
    qryTipoPgtoDESCRICAO: TIBStringField;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTransfFinanc: TfrmRelTransfFinanc;

implementation

uses unt_modulo, untTransferenciaFinanceira;

{$R *.dfm}

procedure TfrmRelTransfFinanc.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if RLBand3.Color = clWhite then
    RLBand3.Color := $00F4F4F4
  else
    RLBand3.Color := clWhite;
end;

procedure TfrmRelTransfFinanc.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if qry_pesquisa.FIELDbyname('MES').AsString = '1' then
    lblMes_ano.Caption := 'Janeiro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '2' then
    lblMes_ano.Caption := 'Fevereiro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '3' then
    lblMes_ano.Caption := 'Março/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '4' then
    lblMes_ano.Caption := 'Abril/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '5' then
    lblMes_ano.Caption := 'Maio/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '6' then
    lblMes_ano.Caption := 'Junho/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '7' then
    lblMes_ano.Caption := 'Julho/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '8' then
    lblMes_ano.Caption := 'Agosto/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '9' then
    lblMes_ano.Caption := 'Setembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '10' then
    lblMes_ano.Caption := 'Outubro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '11' then
    lblMes_ano.Caption := 'Novembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '12' then
    lblMes_ano.Caption := 'Dezembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;
end;

procedure TfrmRelTransfFinanc.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  tp_codigo, data1, data2, dta : string;
  de, para : real;
begin
  if RLBand7.Color = cLWhite Then
    RLBand7.Color := $00EEEEEE
  else
    RLBand7.Color := cLWhite;

  data1 := Copy(frmTransferenciaFinanceira.txt_data_i.Text,4,3) + Copy(frmTransferenciaFinanceira.txt_data_i.Text,1,3) + Copy(frmTransferenciaFinanceira.txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(frmTransferenciaFinanceira.txt_data_f.Text,4,3) + Copy(frmTransferenciaFinanceira.txt_data_f.Text,1,3) + Copy(frmTransferenciaFinanceira.txt_data_f.Text,7,4) + ' 23:59:59';

  if (frmTransferenciaFinanceira.txt_data_i.Text <> '  /  /    ') and (frmTransferenciaFinanceira.txt_data_f.Text <> '  /  /    ') then
    dta := ' AND DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if frmTransferenciaFinanceira.cbo_de_pesq.text = '' then
    tp_codigo := ' AND TP_CODIGO_DE = '  + qryTipoPgto.fieldbyname('TP_CODIGO').asstring
  else
  begin
    if frmTransferenciaFinanceira.cbo_de_pesq.KeyValue = qryTipoPgto.fieldbyname('TP_CODIGO').asstring then
      tp_codigo := ' AND TP_CODIGO_DE = '  + inttostr(frmTransferenciaFinanceira.cbo_de_pesq.KeyValue);
  end;

  QRYTOTAL.close;
  QRYTOTAL.sql.clear;
  QRYTOTAL.sql.add('SELECT sum(VALOR) as total FROM TRANSFERENCIA_FINANCEIRA WHERE 1=1 ' + tp_codigo + dta );
  QRYTOTAL.open;

  txt_de.text := formatfloat('###,##0.00', QRYTOTAL.fieldbyname('TOTAL').asfloat * (-1));
  de :=  QRYTOTAL.fieldbyname('TOTAL').asfloat * (-1);

  if frmTransferenciaFinanceira.cbo_para_pesq.text = '' then
    tp_codigo := ' AND TP_CODIGO_PARA = '  + qryTipoPgto.fieldbyname('TP_CODIGO').asstring
  else
  begin
    if frmTransferenciaFinanceira.cbo_para_pesq.KeyValue = qryTipoPgto.fieldbyname('TP_CODIGO').asstring then
      tp_codigo := ' AND TP_CODIGO_PARA = '  + inttostr(frmTransferenciaFinanceira.cbo_para_pesq.KeyValue);
  end;

  QRYTOTAL.close;
  QRYTOTAL.sql.clear;
  QRYTOTAL.sql.add('SELECT sum(VALOR) as total FROM TRANSFERENCIA_FINANCEIRA WHERE 1=1 ' + tp_codigo + dta );
  QRYTOTAL.open;

  txt_para.text := formatfloat('###,##0.00', QRYTOTAL.fieldbyname('TOTAL').asfloat);
  para :=  QRYTOTAL.fieldbyname('TOTAL').asfloat;

  txt_total.text := formatfloat('###,##0.00', de + para);

end;

end.
