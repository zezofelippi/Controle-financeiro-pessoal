unit untConfiguracaoCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, DB, IBCustomDataSet, IBQuery,
  IBDatabase;

type
  TfrmConfiguracaoCotacao = class(TForm)
    Label1: TLabel;
    dta_cotacao: TDateEdit;
    btnGravarData: TButton;
    qryPesquisar: TIBQuery;
    qryTransLocal: TIBQuery;
    IBTransLocal: TIBTransaction;
    procedure FormShow(Sender: TObject);
    procedure btnGravarDataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracaoCotacao: TfrmConfiguracaoCotacao;

implementation

{$R *.dfm}

procedure TfrmConfiguracaoCotacao.FormShow(Sender: TObject);
begin
  qryPesquisar.Close;
  qryPesquisar.SQL.Clear;
  qryPesquisar.SQL.Add('SELECT DATA_PROD_BARATO FROM CONFIGURACAO_COTACAO');
  qryPesquisar.Open;

  dta_cotacao.Text := qryPesquisar.fieldbyname('DATA_PROD_BARATO').AsString;

end;

procedure TfrmConfiguracaoCotacao.btnGravarDataClick(Sender: TObject);
begin
  if (not IBTransLocal.InTransaction) then
     IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('UPDATE CONFIGURACAO_COTACAO SET     '+
                        ' DATA_PROD_BARATO=:DATA_PROD_BARATO ');
  qryTransLocal.ParamByName('DATA_PROD_BARATO').AsString := dta_cotacao.Text;
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;
end;

end.
