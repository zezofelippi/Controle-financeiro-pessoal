unit untCadTipoReceita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, IBDatabase, DB, IBCustomDataSet,
  IBQuery, ExtCtrls;

type
  TfrmCadTipoReceita = class(TForm)
    gpbDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txt_codigo: TEdit;
    txt_descricao: TEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    btnGravar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnInserir: TButton;
    dsTipoReceita: TDataSource;
    qryTipoReceita: TIBQuery;
    QRY_MAX_CODIGO: TIBQuery;
    qryPesquisa: TIBQuery;
    qry_trans_local: TIBQuery;
    IBTransLocal: TIBTransaction;
    qryTipoReceitaCODIGO: TIntegerField;
    qryTipoReceitaRECEITA: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_descricaoExit(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoReceita: TfrmCadTipoReceita;

implementation

{$R *.dfm}

procedure TfrmCadTipoReceita.FormShow(Sender: TObject);
begin
  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnGravar.Enabled := false;

  gpbDados.Enabled := false;

  //MOSTRA OS DADOS NA GRID
  qryTipoReceita.Close;
  qryTipoReceita.SQL.Clear;
  qryTipoReceita.SQL.Add('SELECT * FROM TIPO_RECEITA');
  qryTipoReceita.Open;
  qryTipoReceita.FetchAll;


end;

procedure TfrmCadTipoReceita.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCadTipoReceita := nil;
  action:= cafree;
end;

procedure TfrmCadTipoReceita.btnInserirClick(Sender: TObject);
var
  cod_tipo : integer;

begin
  gpbDados.Enabled := true;

  btninserir.Tag := 1;

  txt_codigo.Clear;
  txt_descricao.Clear;
  txt_DESCRICAO.SetFocus;

  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnGravar.Enabled := true;
  btnInserir.Enabled := false;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM TIPO_RECEITA');
  QRY_MAX_CODIGO.Open;
  cod_tipo := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

  txt_codigo.Text := inttostr(cod_tipo);

end;

procedure TfrmCadTipoReceita.btnGravarClick(Sender: TObject);
var
  cod_tipo : integer;

begin
  if txt_codigo.Text = '' then
  begin
  showmessage('Coloque o codigo');
  txt_codigo.SetFocus;
  exit;
  end;

  if txt_descricao.Text = '' then
  begin
  showmessage('Coloque a descricao');
  txt_descricao.SetFocus;
  exit;
  end;

  IF btninserir.Tag = 1 then
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO TIPO_RECEITA (CODIGO, RECEITA)  '+
                        'VALUES (:CODIGO, :RECEITA)');
    qry_trans_local.ParamByName('CODIGO').AsString          := txt_Codigo.Text;
    qry_trans_local.ParamByName('RECEITA').AsString       := txt_descricao.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

  end;

  if btnalterar.Tag = 2 then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE TIPO_RECEITA SET RECEITA=:RECEITA WHERE CODIGO=:CODIGO');
    qry_trans_local.ParamByName('CODIGO').AsString          := txt_Codigo.Text;
    qry_trans_local.ParamByName('RECEITA').AsString         := txt_descricao.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;
  end;

  btninserir.Tag := 0;
  btnalterar.Tag := 0;

  txt_codigo.Clear;
  txt_descricao.Clear;

  gpbDados.Enabled := false;

  btnGravar.Enabled := false;

  btnexcluir.Enabled := true;
  btnInserir.Enabled := true;

  //MOSTRA OS DADOS NA GRID
  qryTipoReceita.Close;
  qryTipoReceita.SQL.Clear;
  qryTipoReceita.SQL.Add('SELECT * FROM TIPO_RECEITA');
  qryTipoReceita.Open;
  qryTipoReceita.FetchAll;

end;

procedure TfrmCadTipoReceita.btnAlterarClick(Sender: TObject);
begin

  btnAlterar.Tag := 2;

  gpbDados.Enabled := true;

  btnGravar.Enabled := true;

  btnexcluir.Enabled := false;

end;

procedure TfrmCadTipoReceita.btnExcluirClick(Sender: TObject);
begin
  if txt_codigo.Text = '' then
  begin
    showmessage('Duplo clique no registro que deseja excluir');
    btnExcluir.SetFocus;
    exit;
  end;

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir N. ' + txt_codigo.Text + ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('DELETE FROM TIPO_RECEITA WHERE CODIGO =:CODIGO');
    qry_trans_local.ParamByName('CODIGO').AsString := txt_codigo.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

    txt_codigo.Clear;
    txt_descricao.Clear;

    gpbDados.Enabled := false;

    btnGravar.Enabled := false;

    //MOSTRA OS DADOS NA GRID
    qryTipoReceita.Close;
    qryTipoReceita.SQL.Clear;
    qryTipoReceita.SQL.Add('SELECT * FROM TIPO_RECEITA');
    qryTipoReceita.Open;
    qryTipoReceita.FetchAll;

  END;
    IDNO : Exit;
  end; //FIM CASE

end;

procedure TfrmCadTipoReceita.DBGrid1DblClick(Sender: TObject);
begin
  txt_codigo.Text := qryTipoReceita.fieldbyname('CODIGO').AsString;
  txt_descricao.Text := qryTipoReceita.fieldbyname('RECEITA').AsString;

  gpbDados.Enabled := false;

  btnAlterar.Enabled := true;
  btnExcluir.Enabled := true;
  btnGravar.Enabled := false;

end;

procedure TfrmCadTipoReceita.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCadTipoReceita.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color := $00F5EEDE;
end;

procedure TfrmCadTipoReceita.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure TfrmCadTipoReceita.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

end.
