unit untRelRecDesp_mae;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, RLReport, RLParser, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmRelRecDesp_mae = class(TForm)
    RLExpressionParser1: TRLExpressionParser;
    ds_pesquisa: TDataSource;
    qry_pesquisa: TIBQuery;
    frRelatorioAno: TRLReport;
    RLBand5: TRLBand;
    RLLabel6: TRLLabel;
    lbl_data_ano: TRLLabel;
    RLBand8: TRLBand;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLBand7: TRLBand;
    lblAno: TRLDBText;
    txt_receita: TRLDBText;
    txt_despesa: TRLDBText;
    txt_saldo_ano: TRLDBText;
    RLBand6: TRLBand;
    txt_receita_glo: TRLDBResult;
    txt_despesa_glo: TRLDBResult;
    txt_saldo_ano_glo: TRLDBResult;
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel5: TRLLabel;
    lbl_data: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    txt_receita_mes_glo: TRLDBResult;
    txt_despesa_mes_glo: TRLDBResult;
    txt_saldo_mes_glo: TRLDBResult;
    RLLabel8: TRLLabel;
    RLBand3: TRLBand;
    lblMes_ano: TRLDBText;
    txt_receita_mes: TRLDBText;
    txt_despesa_mes: TRLDBText;
    txt_saldo_mes: TRLDBText;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand9: TRLBand;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand10: TRLBand;
    RLLabel13: TRLLabel;
    txt_receita_mes_glo_geral: TRLDBResult;
    txt_despesa_mes_glo_geral: TRLDBResult;
    txt_saldo_mes_glo_geral: TRLDBResult;
    dsPesquisaAno: TDataSource;
    qry_pesquisa_ano: TIBQuery;
    qry_pesquisaANO: TSmallintField;
    qry_pesquisaMES: TSmallintField;
    qry_pesquisa_anoANO: TSmallintField;
    qry_pesquisa_rec_desp: TIBQuery;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand10BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRecDesp_mae: TfrmRelRecDesp_mae;
  receita_glo, despesa_glo, receita_glo_geral, despesa_glo_geral : real;

implementation

uses unt_modulo, untListDespRec;

{$R *.dfm}

procedure TfrmRelRecDesp_mae.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  despesa, receita : real;
  despesa_str, receita_str : string;

begin

  if RLBand3.Color = clWhite then
    RLBand3.Color := $00F4F4F4
  else
    RLBand3.Color := clWhite;

  if qry_pesquisa.FIELDbyname('MES').AsString = '1' then
    lblMes_ano.Text := 'Janeiro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '2' then
    lblMes_ano.Text := 'Fevereiro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '3' then
    lblMes_ano.Text := 'Março/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '4' then
    lblMes_ano.Text := 'Abril/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '5' then
    lblMes_ano.Text := 'Maio/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '6' then
    lblMes_ano.Text := 'Junho/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '7' then
    lblMes_ano.Text := 'Julho/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '8' then
    lblMes_ano.Text := 'Agosto/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '9' then
    lblMes_ano.Text := 'Setembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '10' then
    lblMes_ano.Text := 'Outubro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '11' then
    lblMes_ano.Text := 'Novembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '12' then
    lblMes_ano.Text := 'Dezembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  qry_pesquisa_rec_desp.Close;
  qry_pesquisa_rec_desp.SQL.Clear;
  qry_pesquisa_rec_desp.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CAD_DESPESA_MAE                      '+
                                'WHERE EXTRACT(YEAR FROM DATA)=:ANO AND EXTRACT(MONTH FROM DATA)=:MES ');
  qry_pesquisa_rec_desp.ParamByName('ANO').AsString := frmRelRecDesp_mae.qry_pesquisa.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.ParamByName('MES').AsString := frmRelRecDesp_mae.qry_pesquisa.fieldbyname('MES').AsString;
  qry_pesquisa_rec_desp.Open;

  txt_despesa_mes.Text := formatfloat('###,##0.00', qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat);
  despesa :=  qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  despesa_glo := despesa_glo + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_despesa_mes_glo.Text := formatfloat('###,##0.00', despesa_glo);

  despesa_glo_geral := despesa_glo_geral + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_despesa_mes_glo_geral.Text := formatfloat('###,##0.00', despesa_glo_geral);

  qry_pesquisa_rec_desp.Close;
  qry_pesquisa_rec_desp.SQL.Clear;
  qry_pesquisa_rec_desp.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM cad_receitas_mae                     '+
                                'WHERE EXTRACT(YEAR FROM DATA)=:ANO AND EXTRACT(MONTH FROM DATA)=:MES ');
  qry_pesquisa_rec_desp.ParamByName('ANO').AsString := frmRelRecDesp_mae.qry_pesquisa.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.ParamByName('MES').AsString := frmRelRecDesp_mae.qry_pesquisa.fieldbyname('MES').AsString;
  qry_pesquisa_rec_desp.Open;

  txt_receita_mes.Text := formatfloat('###,##0.00', qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat);
  receita :=  qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  receita_glo := receita_glo + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_receita_mes_glo.Text := formatfloat('###,##0.00', receita_glo);

  receita_glo_geral := receita_glo_geral + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_receita_mes_glo_geral.Text := formatfloat('###,##0.00', receita_glo_geral);

  txt_saldo_mes.Text := formatfloat('###,##0.00',receita - despesa);
  txt_saldo_mes_glo.Text := formatfloat('###,##0.00',receita_glo - despesa_glo);
  txt_saldo_mes_glo_geral.Text := formatfloat('###,##0.00',receita_glo_geral - despesa_glo_geral);

  if (receita - despesa) < 0 then
    txt_saldo_mes.Font.Color := clred
  else
    txt_saldo_mes.Font.Color := clblack;

  if (receita_glo - despesa_glo) < 0 then
    txt_saldo_mes_glo.Font.Color := clred
  else
    txt_saldo_mes_glo.Font.Color := clblack;

  if (receita_glo_geral - despesa_glo_geral) < 0 then
    txt_saldo_mes_glo_geral.Font.Color := clred
  else
    txt_saldo_mes_glo_geral.Font.Color := clblack;

end;

procedure TfrmRelRecDesp_mae.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  receita_glo := 0;
  despesa_glo := 0;

end;

procedure TfrmRelRecDesp_mae.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  despesa, receita : real;
  despesa_str, receita_str : string;

begin
  if RLBand7.Color = clWhite then
    RLBand7.Color := $00F4F4F4
  else
    RLBand7.Color := clWhite;

  lblAno.Text := qry_pesquisa_ano.FIELDbyname('ANO').AsString;

  qry_pesquisa_rec_desp.Close;
  qry_pesquisa_rec_desp.SQL.Clear;
  qry_pesquisa_rec_desp.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CAD_DESPESA_MAE '+
                                'WHERE EXTRACT(YEAR FROM DATA)=:DATA         ');
  qry_pesquisa_rec_desp.ParamByName('DATA').AsString := frmRelRecDesp_mae.qry_pesquisa_ano.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.Open;

  txt_despesa.Text := formatfloat('###,##0.00', qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat);
  despesa :=  qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  despesa_glo := despesa_glo + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_despesa_glo.Text := formatfloat('###,##0.00', despesa_glo);

  qry_pesquisa_rec_desp.Close;
  qry_pesquisa_rec_desp.SQL.Clear;
  qry_pesquisa_rec_desp.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM cad_receitas_mae '+
                                'WHERE EXTRACT(YEAR FROM DATA)=:DATA          ');
  qry_pesquisa_rec_desp.ParamByName('DATA').AsString := frmRelRecDesp_mae.qry_pesquisa_ano.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.ParamByName('DATA').AsString := frmRelRecDesp_mae.qry_pesquisa_ano.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.Open;

  txt_receita.Text := formatfloat('###,##0.00', qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat);
  receita :=  qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  receita_glo := receita_glo + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_receita_glo.Text := formatfloat('###,##0.00', receita_glo);

  txt_saldo_ano.Text := formatfloat('###,##0.00',receita - despesa);
  txt_saldo_ano_glo.Text := formatfloat('###,##0.00',receita_glo - despesa_glo);

  if (receita - despesa) < 0 then
    txt_saldo_ano.Font.Color := clred
  else
    txt_saldo_ano.Font.Color := clblack;

  if (receita_glo - despesa_glo) < 0 then
    txt_saldo_ano_glo.Font.Color := clred
  else
    txt_saldo_ano_glo.Font.Color := clblack;

end;

procedure TfrmRelRecDesp_mae.RLBand10BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  receita_glo_geral := 0;
  despesa_glo_geral := 0;
end;

procedure TfrmRelRecDesp_mae.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  receita_glo := 0;
  despesa_glo := 0;
end;

end.
