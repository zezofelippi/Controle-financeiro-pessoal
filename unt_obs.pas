unit unt_obs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, IBDatabase, DB, IBCustomDataSet,
  IBQuery;

type
  Tfrm_obs = class(TForm)
    Label1: TLabel;
    btn_gravar: TButton;
    DBGrid1: TDBGrid;
    txt_obs: TEdit;
    qry_lembretes: TIBQuery;
    IBTRANSLOCAL: TIBTransaction;
    qry_mostra_dados: TIBQuery;
    ds_mostra_dados: TDataSource;
    qry_mostra_dadosCODIGO: TIntegerField;
    qry_mostra_dadosDESCRICAO: TIBStringField;
    QRY_MAX_CODIGO: TIBQuery;
    procedure btn_gravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_obs: Tfrm_obs;

implementation

uses unt_modulo;

{$R *.dfm}

procedure Tfrm_obs.btn_gravarClick(Sender: TObject);
var
  cod_lembrete : integer;
begin

  if txt_obs.Text = '' then
  begin
    showmessage('Coloque a obs');
    txt_obs.SetFocus;
    exit;
  end;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM LEMBRETES');
  QRY_MAX_CODIGO.Open;
  cod_lembrete := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_lembretes.Close;
  qry_lembretes.SQL.Clear;
  qry_lembretes.SQL.Add('INSERT INTO LEMBRETES (CODIGO, DESCRICAO)  '+
                        'VALUES (:CODIGO, :DESCRICAO)               ');
  qry_lembretes.ParamByName('CODIGO').AsInteger         := cod_lembrete;
  qry_lembretes.ParamByName('DESCRICAO').AsString       := txt_obs.Text;
  qry_lembretes.ExecSQL;
  IBTRANSLOCAL.Commit;

  qry_mostra_dados.Close;
  qry_mostra_dados.SQL.Clear;
  qry_mostra_dados.SQL.Add('SELECT * FROM LEMBRETES ORDER BY CODIGO');
  qry_mostra_dados.Open;
  qry_mostra_dados.FetchAll;

  txt_obs.Clear;

end;

procedure Tfrm_obs.FormShow(Sender: TObject);
begin
  qry_mostra_dados.Close;
  qry_mostra_dados.SQL.Clear;
  qry_mostra_dados.SQL.Add('SELECT * FROM LEMBRETES ORDER BY CODIGO');
  qry_mostra_dados.Open;
  qry_mostra_dados.FetchAll;

  txt_obs.Clear;
  txt_obs.SetFocus;

end;

procedure Tfrm_obs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_obs := nil;
  action:= cafree;
end;

procedure Tfrm_obs.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure Tfrm_obs.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure Tfrm_obs.DBGrid1DrawColumnCell(Sender: TObject;
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

end.
