unit untRelCotacaoFornecedorGrupoProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, RLReport;

type
  TfrmRelCotacaoFornecedorGrupoProd = class(TForm)
    frRelatorio: TRLReport;
    RLGroup4: TRLGroup;
    RLBand9: TRLBand;
    RLDBText6: TRLDBText;
    RLBand1: TRLBand;
    lblCotacao: TRLLabel;
    ds_pesquisar: TDataSource;
    qry_pesquisa: TIBQuery;
    qry_pesquisaGRP_DESCRICAO: TIBStringField;
    qry_pesquisaPRO_DESCRICAO: TIBStringField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaAT_NOME: TIBStringField;
    qry_pesquisaAT_CODIGO: TIntegerField;
    qry_pesquisaCOT_QTD: TFloatField;
    qry_pesquisaCOT_UNIDADE: TIBStringField;
    qry_pesquisaNOME_RESUMIDO: TIBStringField;
    RLBand11: TRLBand;
    RLDBText12: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCotacaoFornecedorGrupoProd: TfrmRelCotacaoFornecedorGrupoProd;

implementation

{$R *.dfm}

end.
