unit untRelTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelTipoDespesa = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText3: TRLDBText;
    qryTipoDespesa: TIBQuery;
    dsTipoDespesa: TDataSource;
    qryTipoDespesaDESPESA: TIBStringField;
    qryTipoDespesaDESPESA_SUB: TIBStringField;
    qryTipoDespesaTIP_CODIGO: TIntegerField;
    RLDBText1: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTipoDespesa: TfrmRelTipoDespesa;

implementation

uses unt_modulo;

{$R *.dfm}

end.
