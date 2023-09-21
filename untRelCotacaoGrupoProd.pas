unit untRelCotacaoGrupoProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelCotacaoGrupoProd = class(TForm)
    frRelatorio: TRLReport;
    ds_pesquisar: TDataSource;
    qry_pesquisa: TIBQuery;
    qry_pesquisaGRP_DESCRICAO: TIBStringField;
    qry_pesquisaPRO_DESCRICAO: TIBStringField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaAT_NOME: TIBStringField;
    qry_pesquisaAT_CODIGO: TIntegerField;
    RLGroup4: TRLGroup;
    RLBand9: TRLBand;
    RLDBText6: TRLDBText;
    RLBand11: TRLBand;
    RLDBText12: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    qry_pesquisaCOT_QTD: TFloatField;
    RLDBText4: TRLDBText;
    qry_pesquisaCOT_UNIDADE: TIBStringField;
    RLBand1: TRLBand;
    lblCotacao: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCotacaoGrupoProd: TfrmRelCotacaoGrupoProd;

implementation

{$R *.dfm}

end.
