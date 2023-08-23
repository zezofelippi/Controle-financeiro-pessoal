unit untRelContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelContasPagar = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    lblMes_ano: TRLLabel;
    qry_pesquisa: TIBQuery;
    ds_pesquisa: TDataSource;
    RLBand3: TRLBand;
    qry_pesquisaCODIGO: TIntegerField;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    qry_pesquisaDATA_PGTO: TDateTimeField;
    qry_pesquisaDESCRICAO: TIBStringField;
    qry_pesquisaVALOR: TIBBCDField;
    RLDBText3: TRLDBText;
    RLLabel5: TRLLabel;
    RLDBText4: TRLDBText;
    qry_pesquisaMES: TSmallintField;
    qry_pesquisaANO: TSmallintField;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLBand6: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel2: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    qry_pesquisaDATA_DESPESA: TDateTimeField;
    lbl_data: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelContasPagar: TfrmRelContasPagar;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmRelContasPagar.RLBand2BeforePrint(Sender: TObject;
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

procedure TfrmRelContasPagar.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if RLBand3.Color = clWhite then
    RLBand3.Color := $00F4F4F4
  else
    RLBand3.Color := clWhite;
end;

end.
