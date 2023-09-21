unit untRelCotacaoFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery, RLParser;

type
  TfrmRelCotacaoFornecedores = class(TForm)
    frFornecedores: TRLReport;
    RLBand1: TRLBand;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    dsFornecedores: TDataSource;
    qryFornecedores: TIBQuery;
    qryFornecedoresPRO_CODIGO: TIntegerField;
    qryFornecedoresPRO_DESCRICAO: TIBStringField;
    qryFornecedoresCOT_UNIDADE: TIBStringField;
    qryFornecedoresCOT_QTD: TFloatField;
    qryFornecedoresCOT_VALOR: TIBBCDField;
    qryFornecedoresFORNEC: TIBStringField;
    qryFornecedoresFOR_CODIGO_ATUAL: TIntegerField;
    RLLabel7: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel8: TRLLabel;
    RLBand6: TRLBand;
    RLLabel9: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel10: TRLLabel;
    txt_cotacao: TRLLabel;
    RLLabel11: TRLLabel;
    txt_data_cotacao: TRLLabel;
    RLLabel12: TRLLabel;
    txt_data_vencimento: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    txt_frete: TRLDBResult;
    txt_total: TRLDBResult;
    RLExpressionParser1: TRLExpressionParser;
    txt_geral_frete: TRLDBResult;
    txt_total_geral: TRLDBResult;
    RLLabel18: TRLLabel;
    RLDBText8: TRLDBText;
    qryFornecedoresCOT_PREVISAO_ENTREGA: TDateTimeField;
    qryFornecedoresCOT_VALOR_FRETE: TIBBCDField;
    qryPesquisa: TIBQuery;
    qryFornecedoresCOT_CODIGO: TIntegerField;
    qryPesqAux: TIBQuery;
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCotacaoFornecedores: TfrmRelCotacaoFornecedores;
  total_geral_frete_glo, total_geral_glo, total_glo : real;
  for_codigo_glo : string;

implementation

uses unt_modulo;



{$R *.dfm}

procedure TfrmRelCotacaoFornecedores.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin

 if RLBand4.Color = clWhite then
    RLBand4.Color := $00F4F4F4
 else
    RLBand4.Color := clWhite;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT FOR_CODIGO, COT_VALOR_FRETE FROM ITENS_COTACAO_FORNEC_VENC WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := qryFornecedores.FIELDbyname('COT_CODIGO').AsString;
  qryPesquisa.ParamByName('FOR_CODIGO').AsString := qryFornecedores.FIELDbyname('FOR_CODIGO_ATUAL').AsString;
  qryPesquisa.Open;

  /////////TOTAL DE CADA FORNECEDOR////////
  txt_frete.Text := formatfloat('###,##0.00', qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsFloat);
  total_glo := total_glo + (qryFornecedores.fieldbyname('COT_VALOR').AsFloat * qryFornecedores.fieldbyname('COT_QTD').AsFloat);
  txt_total.Text := formatfloat('###,##0.00', total_glo + qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsFloat);
  ////////FIM TOTAL DE CADA FORNECEDOR////////


  ////////TOTAL GERAL/////////////
  if for_codigo_glo = qryPesquisa.FieldByName('FOR_CODIGO').AsString then
  begin
   total_geral_frete_glo := total_geral_frete_glo + qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsFloat;
   for_codigo_glo := '';
  end;
 
  total_geral_glo := total_geral_glo + (qryFornecedores.fieldbyname('COT_VALOR').AsFloat * qryFornecedores.fieldbyname('COT_QTD').AsFloat);

  txt_geral_frete.Text := formatfloat('###,##0.00', total_geral_frete_glo);
  txt_total_geral.Text := formatfloat('###,##0.00', total_geral_glo + total_geral_frete_glo);
  ////////FIM TOTAL GERAL/////////////

end;

procedure TfrmRelCotacaoFornecedores.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
total_geral_glo := 0;
total_geral_frete_glo := 0;

end;

procedure TfrmRelCotacaoFornecedores.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
total_glo := 0;
end;

procedure TfrmRelCotacaoFornecedores.RLGroup1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
  qryPesqAux.ParamByName('COT_CODIGO').AsString := qryFornecedores.FIELDbyname('COT_CODIGO').AsString;
  qryPesqAux.ParamByName('FOR_CODIGO').AsString := qryFornecedores.FIELDbyname('FOR_CODIGO_ATUAL').AsString;
  qryPesqAux.Open;

  for_codigo_glo := qryPesqAux.fieldbyname('FOR_CODIGO').asstring;
end;

end.
