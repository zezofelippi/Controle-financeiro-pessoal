
unit untCadFormaPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase, Grids, DBGrids;

type
  TfrmCadFormaPgto = class(TForm)
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
    qryTipoPgto: TIBQuery;
    qryTipoPgtoTP_CODIGO: TIntegerField;
    qryTipoPgtoTP_DESCRICAO: TIBStringField;
    che_default: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    qryTipoPgtoTP_DEFAULT: TIBStringField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFormaPgto: TfrmCadFormaPgto;
  mensagem : string;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmCadFormaPgto.limpa_campos(Sender: TObject);
begin
  txt_codigo.Clear;
  txt_descricao.Clear;
  che_default.Checked := false;
end;


procedure TfrmCadFormaPgto.txt_codigoEnter(Sender: TObject);
begin
  txt_codigo.Color := $00F5EEDE;
end;

procedure TfrmCadFormaPgto.txt_codigoExit(Sender: TObject);
begin
  txt_codigo.Color := clwindow;
end;

procedure TfrmCadFormaPgto.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color := $00F5EEDE;
end;

procedure TfrmCadFormaPgto.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure TfrmCadFormaPgto.FormShow(Sender: TObject);
begin
  btn_inserir.Enabled := true;
  btn_inserir.SetFocus;

  btn_Gravar.Enabled := false;
  btn_Cancelar.Enabled := false;
  btn_Alterar.Enabled := false;
  btn_Excluir.Enabled := false;
  btn_Sair.Enabled := true;

  qryTipoPgto.Close;
  qryTipoPgto.SQL.Clear;
  qryTipoPgto.SQL.Add('SELECT * FROM TIPO_PAGAMENTO');
  qryTipoPgto.Open;
  qryTipoPgto.FetchAll;

  limpa_campos(Sender as TObject);

  gpb_dados.Enabled := false;

end;

procedure TfrmCadFormaPgto.btn_inserirClick(Sender: TObject);
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

procedure TfrmCadFormaPgto.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btn_gravar.SetFocus;
end;

procedure TfrmCadFormaPgto.btn_gravarClick(Sender: TObject);
var
  cod_forma : integer;

begin

  if txt_descricao.Text = '' then
  begin
    mensagem:= 'Informe a descrição antes de gravar!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING);
    txt_descricao.SetFocus;
    exit;
  end;


  //////////VERIFICA SE DEFAULT ESTA MARCADO/////////

  IF che_default.Checked = true then
  begin
    if (not IBTransUnidade.InTransaction) then
      IBTransUnidade.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE TIPO_PAGAMENTO SET TP_DEFAULT=:P_DEFAULT '+
                            ' WHERE TP_DEFAULT =:TP_DEFAULT                  ');
    qry_trans_local.ParamByName('TP_DEFAULT').AsString := 'S';
    qry_trans_local.ParamByName('P_DEFAULT').AsString := 'N';
    qry_trans_local.ExecSQL;

    IBTransUnidade.Commit;
  end;

//////////FIM VERIFICA SE DEFAULT ESTA MARCADO/////////


  qry_verifica.Close;
  qry_verifica.SQL.Clear;
  qry_verifica.SQL.Add('SELECT MAX(TP_CODIGO) AS CODIGO FROM TIPO_PAGAMENTO');
  qry_verifica.Open;
  cod_forma := qry_verifica.FieldByName('CODIGO').AsInteger +1;

  if btn_inserir.Tag = 1 then
  begin
    if (not IBTransUnidade.InTransaction) then
      IBTransUnidade.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO TIPO_PAGAMENTO (TP_CODIGO, TP_DESCRICAO, TP_DEFAULT)'+
                            'VALUES (:P_CODIGO, :P_DESCRICAO, :P_DEFAULT )                   ');
    qry_trans_local.ParamByName('P_CODIGO').AsInteger    := cod_forma;
  end;

  if btn_alterar.Tag = 2 then
  begin
    if (not IBTransUnidade.InTransaction) then
      IBTransUnidade.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE TIPO_PAGAMENTO SET TP_DESCRICAO=:P_DESCRICAO, TP_DEFAULT=:P_DEFAULT '+
                            ' WHERE TP_CODIGO = ' + txt_codigo.Text                                     );
  end;

  qry_trans_local.ParamByName('P_DESCRICAO').AsString  := txt_descricao.Text;

  IF che_default.Checked = true then
     qry_trans_local.ParamByName('P_DEFAULT').AsString  :=  'S'
  ELSE
     qry_trans_local.ParamByName('P_DEFAULT').AsString  :=  'N';

  qry_trans_local.ExecSQL;
  IBTransUnidade.Commit;

  limpa_campos(Sender as TObject);

  qryTipoPgto.Close;
  qryTipoPgto.SQL.Clear;
  qryTipoPgto.SQL.Add('SELECT * FROM TIPO_PAGAMENTO');
  qryTipoPgto.Open;
  qryTipoPgto.FetchAll;

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

procedure TfrmCadFormaPgto.btn_alterarClick(Sender: TObject);
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

  qryTipoPgto.Close;
  qryTipoPgto.SQL.Clear;
  qryTipoPgto.SQL.Add('SELECT * FROM TIPO_PAGAMENTO');
  qryTipoPgto.Open;
  qryTipoPgto.FetchAll;

end;

procedure TfrmCadFormaPgto.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadFormaPgto.btn_cancelarClick(Sender: TObject);
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

procedure TfrmCadFormaPgto.btn_excluirClick(Sender: TObject);
begin
  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin
    if (not IBTransUnidade.InTransaction) then
      IBTransUnidade.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('delete from TIPO_PAGAMENTO where TP_codigo = ' + txt_codigo.Text);
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

    qryTipoPgto.Close;
    qryTipoPgto.SQL.Clear;
    qryTipoPgto.SQL.Add('SELECT * FROM TIPO_PAGAMENTO');
    qryTipoPgto.Open;
    qryTipoPgto.FetchAll;

    btn_inserir.Tag := 0;
    btn_alterar.Tag := 0;
  end;//YES
    IDNO:
    //exit;
  end;//FIM CASE
end;

procedure TfrmCadFormaPgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCadFormaPgto:= nil;
  action:= cafree;
end;

procedure TfrmCadFormaPgto.DBGrid1DblClick(Sender: TObject);
begin
  txt_codigo.Text := qryTipoPgto.fieldbyname('TP_CODIGO').AsString;
  txt_Descricao.Text := qryTipoPgto.fieldbyname('TP_DESCRICAO').AsString;

  btn_alterar.Enabled := true;
  btn_excluir.Enabled := true;

  if qryTipoPgto.fieldbyname('TP_DEFAULT').AsString = 'S' then
    che_default.Checked := true
  ELSE
    che_default.Checked := false;

end;

procedure TfrmCadFormaPgto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if qryTipoPgto.fieldbyname('TP_DEFAULT').AsString = 'S' then
    DBGrid1.Canvas.Brush.Color := clAqua;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Font.Style  := [fsbold];
      DBGrid1.Canvas.Brush.Color := clWhite;

      if qryTipoPgto.fieldbyname('TP_DEFAULT').AsString = 'S' then
        DBGrid1.Canvas.Brush.Color := clAqua;

    end;
  dbgrid1.Canvas.Font.Color:= clBlack;

  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);  

end;

end.

