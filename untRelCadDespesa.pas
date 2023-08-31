unit untRelCadDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelCadDespesa = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    lblMes_ano: TRLLabel;
    RLBand5: TRLBand;
    RLLabel2: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLBand6: TRLBand;
    RLLabel4: TRLLabel;
    RLDBResult2: TRLDBResult;
    qry_pesquisa: TIBQuery;
    ds_pesquisar: TDataSource;
    qry_pesquisaMES: TSmallintField;
    qry_pesquisaANO: TSmallintField;
    qry_pesquisaDESCR: TIBStringField;
    qry_pesquisaDATA: TDateTimeField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaSEMANA: TIBStringField;
    qry_pesquisaDESPESA_OUTROS: TIBStringField;
    qry_pesquisaCODIGO: TIntegerField;
    lbl_data: TRLLabel;
    qry_pesquisaDESPESA_SUB: TIBStringField;
    qry_pesquisaTIP_CODIGO: TIntegerField;
    qry_pesquisaTDS_CODIGO: TIntegerField;
    RLGroup4: TRLGroup;
    RLBand9: TRLBand;
    RLDBText6: TRLDBText;
    RLBand7: TRLBand;
    RLGroup5: TRLGroup;
    RLBand10: TRLBand;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLBand11: TRLBand;
    RLDBText12: TRLDBText;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel8: TRLLabel;
    qry_pesquisaTIP_MES: TIBStringField;
    qry_pesquisaSUB_MES: TIBStringField;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLLabel6: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    procedure RLBand10BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadDespesa: TfrmRelCadDespesa;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmRelCadDespesa.RLBand10BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
 if RLBand10.Color = clWhite then
   RLBand10.Color := $00F4F4F4
 else
   RLBand10.Color := clWhite;
end;

procedure TfrmRelCadDespesa.RLBand2BeforePrint(Sender: TObject;
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
