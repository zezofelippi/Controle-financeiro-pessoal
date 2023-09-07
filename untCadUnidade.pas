
unit untCadUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase, Grids, DBGrids;

type
  TfrmCadUnidade = class(TForm)
    gpb_dados: TGroupBox;
    Label1: TLabel;
    txt_codigo: TEdit;
    Label2: TLabel;
    txt_descricao: TEdit;
    gpb_botoes: TGroupBox;
    btn_inserir: TBitBtn;
    btn_gravar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_sair: TBitBtn;
    IBTransUnidade: TIBTransaction;
    qry_trans_local: TIBQuery;
    qry_verifica: TIBQuery;
    DBGrid1: TDBGrid;
    dsUnidade: TDataSource;
    qryUnidade: TIBQuery;
    qryUnidadeUN_CODIGO: TIntegerField;
    qryUnidadeUN_DESCRICAO: TIBStringField;
    Label3: TLabel;
    txt_obs: TEdit;
    qryUnidadeUN_OBS: TIBStringField;
    procedure txt_codigoEnter(Sender: TObject);
    procedure txt_codigoExit(Sender: TObject);
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_descricaoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure limpa_campos(Sender : TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidade: TfrmCadUnidade;
  mensagem : string;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmCadUnidade.limpa_campos(Sender: TObject);
begin
  txt_codigo.Clear;
  txt_descricao.Clear;
  txt_obs.clear;
end;


procedure TfrmCadUnidade.txt_codigoEnter(Sender: TObject);
begin
  txt_codigo.Color := $00F5EEDE;
end;

procedure TfrmCadUnidade.txt_codigoExit(Sender: TObject);
begin
  txt_codigo.Color := clwindow;
end;

procedure TfrmCadUnidade.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color := $00F5EEDE;
end;

procedure TfrmCadUnidade.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure TfrmCadUnidade.FormShow(Sender: TObject);
begin
  btn_inserir.Enabled := true;
  btn_inserir.SetFocus;

  btn_Gravar.Enabled := false;
  btn_Cancelar.Enabled := false;
  btn_Alterar.Enabled := false;
  btn_Excluir.Enabled := false;
  btn_Sair.Enabled := true;

  qryUnidade.Close;
  qryUnidade.SQL.Clear;
  qryUnidade.SQL.Add('SELECT * FROM UNIDADE');
  qryUnidade.Open;
  qryUnidade.FetchAll;

  limpa_campos(Sender as TObject);

  gpb_dados.Enabled := false;

end;

procedure TfrmCadUnidade.btn_inserirClick(Sender: TObject);
begin

  btn_inserir.Tag := 1;

  btn_inserir.Enabled := false;
  btn_gravar.Enabled := true;
  btn_cancelar.Enabled := true;
  btn_alterar.Enabled := false;
  btn_excluir.Enabled := false;
  btn_sair.Enabled := false;

  limpa_campos(Sender as TObject);

  gpb_dados.Enabled := true;

  txt_descricao.SetFocus;

end;

procedure TfrmCadUnidade.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure TfrmCadUnidade.btn_gravarClick(Sender: TObject);
begin

  if txt_descricao.Text = '' then
  begin
    mensagem:= 'Informe a descrição antes de gravar!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING);
    txt_descricao.SetFocus;
    exit;
  end;

  //Testa Unidade ja existe
  qry_verifica.Close;
  qry_verifica.SQL.Clear;
  qry_verifica.SQL.Add('SELECT * FROM UNIDADE WHERE UN_DESCRICAO = :P_DESCRICAO');
  qry_verifica.ParamByName('P_DESCRICAO').AsString := txt_descricao.Text;
  qry_verifica.Open;
  iF qry_verifica.FieldByName('UN_DESCRICAO').AsString = qry_verifica.ParamByName('P_DESCRICAO').AsString Then
  begin
    mensagem:= 'Unidade já Cadastrada!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING);
    txt_descricao.SetFocus;
    exit;
  end;

  if btn_inserir.Tag = 1 then
  begin
    if (not IBTransUnidade.InTransaction) then
      IBTransUnidade.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO UNIDADE (UN_DESCRICAO, UN_OBS)'+
                            'VALUES (:P_DESCRICAO, :P_OBS)             ');
  end;

  if btn_alterar.Tag = 2 then
  begin
    if (not IBTransUnidade.InTransaction) then
      IBTransUnidade.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE UNIDADE SET UN_DESCRICAO=:P_DESCRICAO, UN_OBS=:P_OBS '+
                            ' WHERE UN_CODIGO = ' + txt_codigo.Text                      );
  end;

  qry_trans_local.ParamByName('P_DESCRICAO').AsString  := txt_descricao.Text;
  qry_trans_local.ParamByName('P_OBS').AsString        := txt_obs.text;

  qry_trans_local.ExecSQL;
  IBTransUnidade.Commit;

  limpa_campos(Sender as TObject);

  qryUnidade.Close;
  qryUnidade.SQL.Clear;
  qryUnidade.SQL.Add('SELECT * FROM UNIDADE');
  qryUnidade.Open;
  qryUnidade.FetchAll;

  btn_inserir.Tag := 0;
  btn_alterar.Tag := 0;

  gpb_dados.Enabled := false;

  btn_Gravar.Enabled := false;
  btn_Cancelar.Enabled := false;
  btn_Alterar.Enabled := false;
  btn_Excluir.Enabled := false;
  btn_Sair.Enabled := true;

  btn_inserir.Enabled := true;
  btn_inserir.SetFocus;

end;

procedure TfrmCadUnidade.btn_alterarClick(Sender: TObject);
begin
  btn_inserir.Enabled := false;
  btn_gravar.Enabled := true;
  btn_cancelar.Enabled := true;
  btn_alterar.Enabled := false;
  btn_excluir.Enabled := false;
  btn_sair.Enabled := false;

  gpb_dados.Enabled := true;

  txt_descricao.SetFocus;

  btn_alterar.Tag := 2;

  qryUnidade.Close;
  qryUnidade.SQL.Clear;
  qryUnidade.SQL.Add('SELECT * FROM UNIDADE');
  qryUnidade.Open;
  qryUnidade.FetchAll;

end;

procedure TfrmCadUnidade.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadUnidade.btn_cancelarClick(Sender: TObject);
begin
  limpa_campos(Sender as TObject);

  btn_inserir.Tag := 0;
  btn_alterar.Tag := 0;

  gpb_dados.Enabled := false;

  btn_Gravar.Enabled := false;
  btn_Cancelar.Enabled := false;
  btn_Alterar.Enabled := false;
  btn_Excluir.Enabled := false;
  btn_Sair.Enabled := true;

  btn_inserir.Enabled := true;
  btn_inserir.SetFocus;

end;

procedure TfrmCadUnidade.btn_excluirClick(Sender: TObject);
begin
  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin
    if (not IBTransUnidade.InTransaction) then
      IBTransUnidade.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('delete from unidade where un_codigo = ' + txt_codigo.Text);
    qry_trans_local.ExecSQL;

    IBTransUnidade.Commit;

    limpa_campos(Sender as TObject);

    btn_Gravar.Enabled := false;
    btn_Cancelar.Enabled := false;
    btn_Alterar.Enabled := false;
    btn_Excluir.Enabled := false;
    btn_Sair.Enabled := true;

    btn_inserir.Enabled := true;
    btn_inserir.SetFocus;

    qryUnidade.Close;
    qryUnidade.SQL.Clear;
    qryUnidade.SQL.Add('SELECT * FROM UNIDADE');
    qryUnidade.Open;
    qryUnidade.FetchAll;

    btn_inserir.Tag := 0;
    btn_alterar.Tag := 0;
  end;//YES
    IDNO:
    exit;
  end;//FIM CASE
end;

procedure TfrmCadUnidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCadUnidade:= nil;
  action:= cafree;
end;

procedure TfrmCadUnidade.DBGrid1DblClick(Sender: TObject);
begin
  txt_codigo.Text := qryUnidade.fieldbyname('UN_CODIGO').AsString;
  txt_Descricao.Text := qryUnidade.fieldbyname('UN_DESCRICAO').AsString;
  txt_obs.text :=  qryUnidade.fieldbyname('UN_OBS').AsString;

  btn_alterar.Enabled := true;
  btn_excluir.Enabled := true;

end;

procedure TfrmCadUnidade.DBGrid1DrawColumnCell(Sender: TObject;
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
  Else
    DBGrid1.Canvas.Font.Color:= clBlack;

    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCadUnidade.txt_obsKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    btn_gravar.SetFocus;
end;

end.

