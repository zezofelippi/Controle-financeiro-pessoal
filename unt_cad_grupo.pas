
unit unt_cad_grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, IBCustomDataSet, IBQuery,
  IBDatabase;

type
  Tfrm_cad_grupo = class(TForm)
    gpb_dados: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Local: TLabel;
    Label17: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    txt_descricao: TEdit;
    txt_codigo: TEdit;
    che_item_desc: TCheckBox;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    CheckBox1: TCheckBox;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    qryListaGrupo: TIBQuery;
    dsListaGrupo: TDataSource;
    qryListaGrupoGRP_CODIGO: TIntegerField;
    qryListaGrupoGRP_DESCRICAO: TIBStringField;
    grdLista: TDBGrid;
    IBTransGrupo: TIBTransaction;
    qry_trans_local: TIBQuery;
    qry_verifica: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure limpa_campos(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_descricaoExit(Sender: TObject);
    procedure grdListaKeyPress(Sender: TObject; var Key: Char);
    procedure grdListaDblClick(Sender: TObject);
    procedure grdListaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_grupo: Tfrm_cad_grupo;

implementation

uses unt_modulo;

{$R *.dfm}

procedure Tfrm_cad_grupo.limpa_campos(Sender: TObject);
begin
  txt_codigo.Text := '';
  txt_descricao.Text := '';
end;


procedure Tfrm_cad_grupo.FormShow(Sender: TObject);
begin
  qryListaGrupo.SQL.Clear;
  qryListaGrupo.SQL.Add('SELECT * FROM GRUPO ORDER BY GRP_DESCRICAO');
  qryListaGrupo.Open;

  btnNovo.Enabled := true;
  btnNovo.SetFocus;

  btnGravar.Enabled := false;
  btnCancelar.Enabled := false;
  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnSair.Enabled := true;
end;

procedure Tfrm_cad_grupo.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cad_grupo.btnNovoClick(Sender: TObject);
begin
  btnGravar.Tag := 1;
  limpa_campos(Sender as TObject);
  gpb_dados.Enabled:= true;
  btnNovo.Enabled := false;
  btnGravar.Enabled := true;
  btnCancelar.Enabled := true;
  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnSair.Enabled := false;
  txt_descricao.SetFocus;
end;

procedure Tfrm_cad_grupo.btnGravarClick(Sender: TObject);
var
  mensagem : string;
begin

  if txt_descricao.Text = '' then
  begin
    mensagem:= 'O campo descrição deve ser preenchido!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING);
    txt_descricao.SetFocus;
    exit;
  end;

  //Verifica se Grupo já esta Cadastrado
  qry_verifica.Close;
  qry_verifica.SQL.Clear;
  qry_verifica.SQL.Add('SELECT * FROM GRUPO WHERE GRP_DESCRICAO = :P_DESCRICAO');
  qry_verifica.ParamByName('P_DESCRICAO').AsString := txt_descricao.Text;
  qry_verifica.Open;

  If qry_verifica.FieldByName('GRP_DESCRICAO').AsString = qry_verifica.ParamByName('P_DESCRICAO').AsString tHEN
  begin
    mensagem := 'Grupo já cadastrado!';
    Application.MessageBox(pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING);
    txt_descricao.SetFocus;
    exit;
  end;

  if btnGravar.Tag = 1 then
  begin
    if (not IBTransGrupo.InTransaction) then
      IBTransGrupo.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO GRUPO (GRP_DESCRICAO) VALUES (:P_DESCRICAO)');
    qry_trans_local.ParamByName('P_DESCRICAO').AsString:= txt_descricao.Text;
    qry_trans_local.ExecSQL;
    IBTransGrupo.Commit;
  end
  else
  begin
    if (not IBTransGrupo.InTransaction) then
      IBTransGrupo.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE GRUPO SET GRP_DESCRICAO=:P_DESCRICAO WHERE GRP_CODIGO=:P_CODIGO');
    qry_trans_local.ParamByName('P_DESCRICAO').AsString:= txt_descricao.Text;
    qry_trans_local.ParamByName('P_CODIGO').AsString:= txt_codigo.Text;
    qry_trans_local.ExecSQL;
    IBTransGrupo.Commit;
  end;

  qryListaGrupo.SQL.Clear;
  qryListaGrupo.SQL.Add('SELECT * FROM GRUPO ORDER BY GRP_DESCRICAO');
  qryListaGrupo.Open;

  gpb_dados.Enabled := false;

  btnGravar.Enabled := false;
  btnCancelar.Enabled := false;
  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnSair.Enabled := true;

  btnNovo.Enabled := true;
  btnNovo.SetFocus;

  limpa_campos(Sender as TObject);
end;

procedure Tfrm_cad_grupo.btnCancelarClick(Sender: TObject);
begin
  gpb_dados.Enabled := false;

  btnGravar.Enabled := false;
  btnCancelar.Enabled := false;
  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnSair.Enabled := true; 

  btnNovo.Enabled := true;
  btnNovo.SetFocus;

  limpa_campos(Sender as TObject);
end;

procedure Tfrm_cad_grupo.btnAlterarClick(Sender: TObject);
begin
  btnGravar.Tag:= 2;
  gpb_dados.Enabled := true;
  btnNovo.Enabled := false;
  btnGravar.Enabled := true;
  btnCancelar.Enabled := true;
  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnSair.Enabled := false;
  txt_descricao.SetFocus;
end;

procedure Tfrm_cad_grupo.btnExcluirClick(Sender: TObject);
begin
  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin
    if (not IBTransGrupo.InTransaction) then
      IBTransGrupo.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('DELETE FROM GRUPO WHERE GRP_CODIGO=:P_CODIGO');
    qry_trans_local.ParamByName('P_CODIGO').AsString:= txt_codigo.Text;
    qry_trans_local.ExecSQL;

    IBTransGrupo.Commit;

    qryListaGrupo.SQL.Clear;
    qryListaGrupo.SQL.Add('SELECT * FROM GRUPO ORDER BY GRP_DESCRICAO');
    qryListaGrupo.Open;

    gpb_dados.Enabled := false;

    btnGravar.Enabled := false;
    btnCancelar.Enabled := false;
    btnAlterar.Enabled := false;
    btnExcluir.Enabled := false;
    btnSair.Enabled := true;

    btnNovo.Enabled := true;
    btnNovo.SetFocus;

    limpa_campos(Sender as TObject);

  end;//YES
    IDNO:
    exit;
  end;

end;

procedure Tfrm_cad_grupo.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btnGravar.SetFocus;
end;

procedure Tfrm_cad_grupo.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color:= $00F5EEDE;
end;

procedure Tfrm_cad_grupo.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color:= clWindow;
end;

procedure Tfrm_cad_grupo.grdListaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    If not qryListaGrupo.IsEmpty Then
    Begin
      txt_codigo.Text        := qryListaGrupo.FieldByName('GRP_CODIGO').AsString;
      txt_descricao.Text     := qryListaGrupo.FieldByName('GRP_DESCRICAO').AsString;
      btnNovo.Enabled := true;
      btnAlterar.Enabled := true ;
      btnExcluir.Enabled := true;
    END;
  end;
end;

procedure Tfrm_cad_grupo.grdListaDblClick(Sender: TObject);
begin
  If not qryListaGrupo.IsEmpty Then
  Begin
    txt_codigo.Text        := qryListaGrupo.FieldByName('GRP_CODIGO').AsString;
    txt_descricao.Text     := qryListaGrupo.FieldByName('GRP_DESCRICAO').AsString;
    btnNovo.Enabled := true;
    btnAlterar.Enabled := true;
    btnExcluir.Enabled := true;
    btnExcluir.Enabled := true;
    btnGravar.Enabled := false;
    btnCancelar.Enabled := false;
    btnSair.Enabled := true;
  end;
end;

procedure Tfrm_cad_grupo.grdListaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if odd(qryListaGrupo.RecNo) then
    grdLista.Canvas.Brush.Color := $00EFEFEF
  else
    grdLista.Canvas.Brush.Color := $00F9F9F9;

  TDbGrid(Sender).Canvas.Font.Color:= $00400000;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clMenuHighlight;
      Font.Style  := [fsbold];
      Font.Color  := clWhite
    end
    else
      grdLista.Canvas.Font.Color:= clBlack;

  grdLista.Canvas.FillRect(Rect);
  grdLista.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_cad_grupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_cad_grupo:= nil;
  Action:= caFree;
end;

end.
