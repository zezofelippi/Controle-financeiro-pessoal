unit untJuntarPessoalSitio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  IBDatabase;

type
  TfrmJuntarPessoalSitio = class(TForm)
    Label1: TLabel;
    cboDespesa: TDBLookupComboBox;
    Label5: TLabel;
    cboDespesaSub: TDBLookupComboBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    dsDespesa: TDataSource;
    qryDespesa: TIBQuery;
    qryDespesaTIP_CODIGO: TIntegerField;
    qryDespesaDESPESA: TIBStringField;
    qryDespesaTIP_DESCRICAO: TIBStringField;
    dsDespesaSub: TDataSource;
    qryDespesaSub: TIBQuery;
    qryDespesaSubDESPESA_SUB: TIBStringField;
    qryDespesaSubTDS_CODIGO: TIntegerField;
    cboDespesaSitio: TDBLookupComboBox;
    Label3: TLabel;
    btnJuntar: TButton;
    qryDespesaSitio: TIBQuery;
    dsDespesaSitio: TDataSource;
    qryDespesaSitioTIP_CODIGO_SIT: TIntegerField;
    qryDespesaSitioTIP_DESCRICAO_SIT: TIBStringField;
    qryDespesaSitioDESPESA: TIBStringField;
    DBGrid1: TDBGrid;
    dsJuntar: TDataSource;
    qryJuntar: TIBQuery;
    qryJuntarDESPESA_PESSOAL: TIBStringField;
    qryJuntarDESPESA_SIT: TIBStringField;
    IBTransLocal: TIBTransaction;
    qry_trans_local: TIBQuery;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnJuntarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDespesaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJuntarPessoalSitio: TfrmJuntarPessoalSitio;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmJuntarPessoalSitio.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clMenuHighlight;
      Font.Style  := [fsbold];
      Font.Color  := clWhite
    end
    else
      dbgrid1.Canvas.Font.Color:= clBlack;

   dbgrid1.Canvas.FillRect(Rect);
   dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmJuntarPessoalSitio.btnJuntarClick(Sender: TObject);
begin

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_trans_local.Close;
  qry_trans_local.SQL.Clear;
  qry_trans_local.SQL.Add('INSERT INTO JUNTAR_DESP_PESSOAL_SITIO (TIP_CODIGO, TDS_CODIGO, TIP_CODIGO_SIT)  '+
                          'VALUES (:TIP_CODIGO, :TDS_CODIGO, :TIP_CODIGO_SIT)                              ');
  qry_trans_local.ParamByName('TIP_CODIGO').AsString          := cboDespesa.KeyValue;
  qry_trans_local.ParamByName('TDS_CODIGO').AsString          := cboDespesaSub.KeyValue;
  qry_trans_local.ParamByName('TIP_CODIGO_SIT').AsString      := cboDespesaSitio.KeyValue;
  qry_trans_local.ExecSQL;
  IBTRANSLOCAL.Commit;

  qryJuntar.Close;
  qryJuntar.SQL.Clear;
  qryJuntar.SQL.Add('SELECT TD.tip_codigo ||'+#39+' - '+#39+'  || TD.tip_descricao ||'+#39+' | '+#39+'  ||                                    '+
                    'TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_Pessoal,                                            '+
                    'TIDS.tip_codigo_sit || '+#39+' - '+#39+' || TIDS.tip_descricao_sit AS DESPESA_SIT                                        '+
                    'FROM JUNTAR_DESP_PESSOAL_SITIO JDPS, tipo_despesa TD, TIPO_DESPESA_SUB TDS, TIPO_DESPESA_SITIO TIDS                      '+
                    'WHERE JDPS.TIP_CODIGO = TD.TIP_CODIGO AND JDPS.TDS_CODIGO = TDS.TDS_CODIGO AND TIDS.TIP_CODIGO_SIT = JDPS.TIP_CODIGO_SIT '+
                    'ORDER BY TD.TIP_DESCRICAO                                                                                                ');
  qryJuntar.Open;

  cboDespesa.KeyValue := null;
  cboDespesaSub.KeyValue := null;
  cboDespesaSitio.KeyValue := null;

end;

procedure TfrmJuntarPessoalSitio.FormShow(Sender: TObject);
begin

  qryDespesa.Close;
  qryDespesa.SQL.Clear;
  qryDespesa.SQL.Add('SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'+#39+' - '+#39+'|| TIP_DESCRICAO AS DESPESA FROM TIPO_DESPESA');
  qryDespesa.Open;
  qryDespesa.FetchAll;

  qryDespesaSitio.Close;
  qryDespesaSitio.SQL.Clear;
  qryDespesaSitio.SQL.Add('SELECT TIP_CODIGO_SIT, TIP_DESCRICAO_SIT, TIP_CODIGO_SIT ||'+#39+' - '+#39+'|| TIP_DESCRICAO_SIT AS DESPESA '+
                          ' FROM TIPO_DESPESA_SITIO                                                                                    ');
  qryDespesaSitio.Open;
  qryDespesaSitio.FetchAll;

  qryJuntar.Close;
  qryJuntar.SQL.Clear;
  qryJuntar.SQL.Add('SELECT TD.tip_codigo ||'+#39+' - '+#39+'  || TD.tip_descricao ||'+#39+' | '+#39+'  ||                                     '+
                    'TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_Pessoal,                                             '+
                    'TIDS.tip_codigo_sit || '+#39+' - '+#39+' || TIDS.tip_descricao_sit AS DESPESA_SIT                                         '+
                    'FROM JUNTAR_DESP_PESSOAL_SITIO JDPS, tipo_despesa TD, TIPO_DESPESA_SUB TDS, TIPO_DESPESA_SITIO TIDS                       '+
                    'WHERE JDPS.TIP_CODIGO = TD.TIP_CODIGO AND JDPS.TDS_CODIGO = TDS.TDS_CODIGO AND TIDS.TIP_CODIGO_SIT = JDPS.TIP_CODIGO_SIT  '+
                    'ORDER BY TD.TIP_DESCRICAO                                                                                                 ');
  qryJuntar.Open;

  cboDespesa.SetFocus;

end;

procedure TfrmJuntarPessoalSitio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmJuntarPessoalSitio := nil;
  action:= cafree;
end;

procedure TfrmJuntarPessoalSitio.dsDespesaDataChange(Sender: TObject;
  Field: TField);
begin
  qryDespesaSub.Close;
  qryDespesaSub.SQL.Clear;
  qryDespesaSub.SQL.Add('SELECT TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_SUB, TDS.tds_codigo    '+
                        'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS                                    '+
                        'WHERE I.TIP_CODIGO = TD.TIP_CODIGO AND I.TDS_CODIGO = TDS.TDS_CODIGO AND TD.TIP_CODIGO=:TIP_CODIGO '+
                        'ORDER BY TD.TIP_DESCRICAO                                                                          ');
  qryDespesaSub.ParamByName('TIP_CODIGO').AsString := qryDespesa.FIELDBYNAME('TIP_CODIGO').AsString;
  qryDespesaSub.Open;
  qryDespesaSub.FetchAll;
end;

end.
