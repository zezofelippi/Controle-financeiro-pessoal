unit untRelCadReceita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelCadReceita = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    qry_pesquisa: TIBQuery;
    ds_pesquisa: TDataSource;
    lbl_data: TRLLabel;
    qryTotal: TIBQuery;
    qry_pesquisaMES: TSmallintField;
    qry_pesquisaANO: TSmallintField;
    qry_pesquisaDESCR: TIBStringField;
    qry_pesquisaDATA: TDateTimeField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaREC_CODIGO: TIntegerField;
    qry_pesquisaDESCRICAO: TIBStringField;
    dsTotal: TDataSource;
    qryTotalTP_CODIGO: TIntegerField;
    qryTotalVALOR: TIBBCDField;
    qryTotalDESCRICAO: TIBStringField;
    RLSubDetail1: TRLSubDetail;
    RLBand7: TRLBand;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand8: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
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
    RLBand5: TRLBand;
    RLLabel2: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLBand4: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel11: TRLLabel;
    RLBand9: TRLBand;
    RLDBResult3: TRLDBResult;
    RLLabel4: TRLLabel;
    ibstrngfld_pesquisaOBS: TIBStringField;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadReceita: TfrmRelCadReceita;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmRelCadReceita.RLBand2BeforePrint(Sender: TObject;
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

end.
