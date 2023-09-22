unit untAgendaTelefone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, DB, IBCustomDataSet, IBDatabase,
  IBQuery, ExtCtrls, Buttons, Menus;

type
  TfrmAgendaTelefone = class(TForm)
    DBGrid1: TDBGrid;
    gpbDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txt_codigo: TEdit;
    txt_descricao: TEdit;
    txt_telefone: TMaskEdit;
    Label10: TLabel;
    txt_celular: TMaskEdit;
    Label12: TLabel;
    txt_endereco: TEdit;
    Label3: TLabel;
    dsAgenda: TDataSource;
    qryAgenda: TIBQuery;
    QRY_MAX_CODIGO: TIBQuery;
    qryPesquisa: TIBQuery;
    qry_trans_local: TIBQuery;
    IBTransLocal: TIBTransaction;
    qryAgendaAT_CODIGO: TIntegerField;
    qryAgendaAT_NOME: TIBStringField;
    qryAgendaAT_ENDERECO: TIBStringField;
    qryAgendaAT_TELEFONE: TIBStringField;
    qryAgendaAT_CELULAR: TIBStringField;
    gpb_pesquisa: TGroupBox;
    Label6: TLabel;
    txt_codigo_pesq: TEdit;
    Label7: TLabel;
    txt_nome_pesq: TEdit;
    rdg_opcao_pesq: TRadioGroup;
    btnPesquisa: TBitBtn;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    rdg_opcao: TRadioGroup;
    Label5: TLabel;
    txt_bairro: TEdit;
    Label8: TLabel;
    txt_cidade: TEdit;
    Label9: TLabel;
    txt_uf: TEdit;
    PopupMenu1: TPopupMenu;
    AlterarDados1: TMenuItem;
    Edit2: TEdit;
    Label23: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Edit3: TEdit;
    Label13: TLabel;
    Edit4: TEdit;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    btnInserir: TButton;
    btnGravar: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    Label4: TLabel;
    qryAgendaAT_TIPO: TIBStringField;
    qryAgendaAT_BAIRRO: TIBStringField;
    qryAgendaAT_CIDADE: TIBStringField;
    qryAgendaAT_UF: TIBStringField;
    Label15: TLabel;
    txt_email: TEdit;
    qryAgendaAT_EMAIL: TIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_descricaoExit(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_enderecoEnter(Sender: TObject);
    procedure txt_enderecoExit(Sender: TObject);
    procedure txt_enderecoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_telefoneEnter(Sender: TObject);
    procedure txt_telefoneExit(Sender: TObject);
    procedure txt_telefoneKeyPress(Sender: TObject; var Key: Char);
    procedure txt_celularEnter(Sender: TObject);
    procedure txt_celularExit(Sender: TObject);
    procedure txt_celularKeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPesquisaClick(Sender: TObject);
    procedure txt_bairroKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure txt_ufKeyPress(Sender: TObject; var Key: Char);
    procedure txt_bairroEnter(Sender: TObject);
    procedure txt_bairroExit(Sender: TObject);
    procedure txt_cidadeEnter(Sender: TObject);
    procedure txt_cidadeExit(Sender: TObject);
    procedure txt_ufEnter(Sender: TObject);
    procedure txt_ufExit(Sender: TObject);
    procedure AlterarDados1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure txt_nome_pesqEnter(Sender: TObject);
    procedure txt_nome_pesqExit(Sender: TObject);
    procedure txt_nome_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure txt_codigo_pesqEnter(Sender: TObject);
    procedure txt_codigo_pesqExit(Sender: TObject);
    procedure rdb_posicaoClick(Sender: TObject);
    procedure rdb_inicioClick(Sender: TObject);
    procedure txt_nome_pesqChange(Sender: TObject);
    procedure txt_codigo_pesqChange(Sender: TObject);
    procedure rdg_opcao_pesqClick(Sender: TObject);
    procedure txt_codigo_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure txt_emailEnter(Sender: TObject);
    procedure txt_emailExit(Sender: TObject);
    procedure txt_emailKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    pesquisa : string;
  end;

var
  frmAgendaTelefone: TfrmAgendaTelefone;

implementation

uses untInserirFornecedorCotacao, untPesqCotacaoCompra,
  untPesqCotacaoCompraDesp;

{$R *.dfm}

procedure TfrmAgendaTelefone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmAgendaTelefone := nil;
  action:= cafree;
end;

procedure TfrmAgendaTelefone.FormShow(Sender: TObject);
begin
  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnGravar.Enabled := false;

  gpbDados.Enabled := false;

  //MOSTRA OS DADOS NA GRID
  qryAgenda.Close;
  qryAgenda.SQL.Clear;
  qryAgenda.SQL.Add('SELECT * FROM AGENDA_TELEFONE ORDER BY AT_NOME');
  qryAgenda.Open;
  qryAgenda.FetchAll;

  if (pesquisa = 'pesq_cotacao_compra') or (pesquisa = 'pesq_cotacao_compra_2') then
    txt_nome_pesq.SetFocus ;

  rdb_inicio.Checked := true;

end;

procedure TfrmAgendaTelefone.txt_descricaoEnter(Sender: TObject);
begin
  TXT_DESCRICAO.Color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure TfrmAgendaTelefone.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_endereco.SetFocus;
end;

procedure TfrmAgendaTelefone.txt_enderecoEnter(Sender: TObject);
begin
  txt_endereco.Color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_enderecoExit(Sender: TObject);
begin
  txt_endereco.Color := clwindow;
end;

procedure TfrmAgendaTelefone.txt_enderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_bairro.SetFocus;
end;

procedure TfrmAgendaTelefone.txt_telefoneEnter(Sender: TObject);
begin
  txt_telefone.Color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_telefoneExit(Sender: TObject);
begin
  txt_telefone.Color := clwindow;
end;

procedure TfrmAgendaTelefone.txt_telefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_celular.SetFocus;
end;

procedure TfrmAgendaTelefone.txt_celularEnter(Sender: TObject);
begin
  txt_celular.Color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_celularExit(Sender: TObject);
begin
  txt_celular.Color := clwindow;
end;

procedure TfrmAgendaTelefone.txt_celularKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_email.SetFocus;
end;

procedure TfrmAgendaTelefone.btnInserirClick(Sender: TObject);
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
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(AT_CODIGO) AS CODIGO FROM AGENDA_TELEFONE');
  QRY_MAX_CODIGO.Open;
  cod_tipo := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

  txt_codigo.Text := inttostr(cod_tipo);

end;

procedure TfrmAgendaTelefone.btnGravarClick(Sender: TObject);
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

  if rdg_opcao.ItemIndex = -1 then
  begin
    showmessage('Coloque o tipo');
    txt_descricao.SetFocus;
    exit;
  end;

  IF btninserir.Tag = 1 then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO AGENDA_TELEFONE (AT_CODIGO, AT_NOME, AT_ENDERECO,                                                                '+
                            ' AT_TELEFONE, AT_CELULAR, AT_BAIRRO, AT_CIDADE, AT_UF, AT_TIPO, AT_EMAIL)                                                    '+
                            ' VALUES (:AT_CODIGO, :AT_NOME, :AT_ENDERECO, :AT_TELEFONE, :AT_CELULAR, :AT_BAIRRO, :AT_CIDADE, :AT_UF, :AT_TIPO, :AT_EMAIL) ');
  end;

  if btnalterar.Tag = 2 then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE AGENDA_TELEFONE SET AT_CODIGO =:AT_CODIGO, AT_NOME=:AT_NOME, AT_ENDERECO=:AT_ENDERECO,                        '+
                            ' AT_TELEFONE=:AT_TELEFONE, AT_CELULAR =:AT_CELULAR, AT_BAIRRO =:AT_BAIRRO, AT_CIDADE =:AT_CIDADE,                    '+
                            ' AT_UF=:AT_UF, AT_TIPO =:AT_TIPO, AT_EMAIL=:AT_EMAIL                                                                 '+
                            ' WHERE AT_CODIGO=:AT_CODIGO                                                                                          ');
  end;

  qry_trans_local.ParamByName('AT_CODIGO').AsString        := txt_Codigo.Text;
  qry_trans_local.ParamByName('AT_NOME').AsString       := txt_descricao.Text;
  qry_trans_local.ParamByName('AT_ENDERECO').AsString   := txt_endereco.Text;
  qry_trans_local.ParamByName('AT_TELEFONE').AsString   := txt_telefone.Text;
  qry_trans_local.ParamByName('AT_CELULAR').AsString    := txt_celular.Text;
  qry_trans_local.ParamByName('AT_BAIRRO').AsString    := txt_bairro.Text;
  qry_trans_local.ParamByName('AT_CIDADE').AsString    := txt_cidade.Text;
  qry_trans_local.ParamByName('AT_UF').AsString    := txt_uf.Text;
  qry_trans_local.ParamByName('AT_EMAIL').AsString    := txt_email.Text;

  if rdg_opcao.ItemIndex = 0 then
     qry_trans_local.ParamByName('AT_TIPO').AsString    := 'C'
  else if rdg_opcao.ItemIndex = 1 then
     qry_trans_local.ParamByName('AT_TIPO').AsString    := 'F'
  else if rdg_opcao.ItemIndex = 2 then
     qry_trans_local.ParamByName('AT_TIPO').AsString    := '2'
  else if rdg_opcao.ItemIndex = 3 then
     qry_trans_local.ParamByName('AT_TIPO').AsString    := 'N';

  qry_trans_local.ExecSQL;
  IBTRANSLOCAL.Commit;

  btninserir.Tag := 0;
  btnalterar.Tag := 0;

  txt_codigo.Clear;
  txt_descricao.Clear;
  txt_endereco.Clear;
  txt_telefone.Clear;
  txt_celular.Clear;
  txt_bairro.Clear;
  txt_cidade.Clear;
  txt_uf.Clear;
  txt_email.Clear;
  rdg_opcao.ItemIndex := -1;

  gpbDados.Enabled := false;

  btnGravar.Enabled := false;
  btnexcluir.Enabled := true;
  btnInserir.Enabled := true;

  //MOSTRA OS DADOS NA GRID
  qryAgenda.Close;
  qryAgenda.SQL.Clear;
  qryAgenda.SQL.Add('SELECT * FROM AGENDA_TELEFONE ORDER BY AT_NOME');
  qryAgenda.Open;
  qryAgenda.FetchAll;

end;

procedure TfrmAgendaTelefone.btnAlterarClick(Sender: TObject);
begin
  btnAlterar.Tag := 2;

  gpbDados.Enabled := true;

  btnGravar.Enabled := true;

  btnexcluir.Enabled := false;

end;

procedure TfrmAgendaTelefone.btnExcluirClick(Sender: TObject);
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
    qry_trans_local.SQL.Add('DELETE FROM AGENDA_TELEFONE WHERE AT_CODIGO =:AT_CODIGO');
    qry_trans_local.ParamByName('AT_CODIGO').AsString := txt_codigo.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

    txt_codigo.Clear;
    txt_descricao.Clear;
    txt_endereco.Clear;
    txt_telefone.Clear;
    txt_celular.Clear;
    txt_email.Clear;

    gpbDados.Enabled := false;

    btnGravar.Enabled := false;

    //MOSTRA OS DADOS NA GRID
    qryAgenda.Close;
    qryAgenda.SQL.Clear;
    qryAgenda.SQL.Add('SELECT * FROM AGENDA_TELEFONE ORDER BY AT_NOME');
    qryAgenda.Open;
    qryAgenda.FetchAll;

  END;
   IDNO : Exit;
  end; //FIM CASE
end;

procedure TfrmAgendaTelefone.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if qryAgenda.FieldByName('AT_TIPO').ASSTRING = 'C'  then
    DBGrid1.Canvas.Brush.Color := clLime
  else if qryAgenda.FieldByName('AT_TIPO').ASSTRING = 'F'  then
    DBGrid1.Canvas.Brush.Color := $008080FF
  else if qryAgenda.FieldByName('AT_TIPO').ASSTRING = '2'  then
    DBGrid1.Canvas.Brush.Color := clYellow
  else if qryAgenda.FieldByName('AT_TIPO').ASSTRING = 'N'  then
    DBGrid1.Canvas.Brush.Color := clWindow;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Font.Style  := [fsbold];
      DBGrid1.Canvas.Brush.Color := clWhite;

      if qryAgenda.FieldByName('AT_TIPO').ASSTRING = 'C'  then
        DBGrid1.Canvas.Brush.Color := clLime
      else if qryAgenda.FieldByName('AT_TIPO').ASSTRING = 'F'  then
        DBGrid1.Canvas.Brush.Color := $008080FF
      else if qryAgenda.FieldByName('AT_TIPO').ASSTRING = '2'  then
        DBGrid1.Canvas.Brush.Color := clYellow
      else if qryAgenda.FieldByName('AT_TIPO').ASSTRING = 'N'  then
        DBGrid1.Canvas.Brush.Color := clWindow;
    end;

  dbgrid1.Canvas.Font.Color:= clblack;
  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  
end;

procedure TfrmAgendaTelefone.btnPesquisaClick(Sender: TObject);
var
  nome_pesq, cod_pesq, opcao : string;
begin

  if txt_codigo_pesq.Text <> '' then
    cod_pesq := ' AND T.TIP_CODIGO = ' + txt_codigo_pesq.Text
  else
    cod_pesq := '';

  if (txt_nome_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
    nome_pesq  := ' AND UPPER(AT_NOME) LIKE UPPER('+ #39 + txt_nome_pesq.Text + '%' + #39 + ')'
  else if (txt_nome_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
    nome_pesq  := ' AND UPPER(AT_NOME) LIKE UPPER('+ #39 + '%' + txt_nome_pesq.Text + '%' + #39 + ')'
  else
    nome_pesq  := '';


  if rdg_opcao_pesq.ItemIndex = 0 then
    opcao := ' AND AT_TIPO = '+ #39 + 'C' + #39
  else if rdg_opcao_pesq.ItemIndex = 1 then
    opcao := ' AND AT_TIPO = '+ #39 + 'F' + #39
  else if rdg_opcao_pesq.ItemIndex = 2 then
    opcao := ' AND AT_TIPO = '+ #39 + '2' + #39
  else if rdg_opcao_pesq.ItemIndex = 3 then
    opcao := ' AND AT_TIPO = '+ #39 + 'N' + #39
  else
    opcao := '';

  qryAgenda.Close;
  qryAgenda.sql.clear;
  qryAgenda.SQL.Add('SELECT * FROM AGENDA_TELEFONE               '+
                    ' WHERE 1=1 ' + nome_pesq + cod_pesq + opcao +
                    ' ORDER BY AT_NOME                           ');
  qryAgenda.Open;

end;

procedure TfrmAgendaTelefone.txt_bairroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_cidade.setfocus;
end;

procedure TfrmAgendaTelefone.txt_cidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_uf.setfocus;
end;

procedure TfrmAgendaTelefone.txt_ufKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_telefone.setfocus;
end;

procedure TfrmAgendaTelefone.txt_bairroEnter(Sender: TObject);
begin
  txt_bairro.color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_bairroExit(Sender: TObject);
begin
  txt_bairro.color := clwindow;
end;

procedure TfrmAgendaTelefone.txt_cidadeEnter(Sender: TObject);
begin
  txt_cidade.color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_cidadeExit(Sender: TObject);
begin
  txt_cidade.color:= clwindow;
end;

procedure TfrmAgendaTelefone.txt_ufEnter(Sender: TObject);
begin
  txt_uf.Color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_ufExit(Sender: TObject);
begin
  txt_uf.Color := clwindow;
end;

procedure TfrmAgendaTelefone.AlterarDados1Click(Sender: TObject);
begin
  txt_codigo.Text := qryAgenda.fieldbyname('AT_CODIGO').AsString;
  txt_descricao.Text := qryAgenda.fieldbyname('AT_NOME').AsString;
  txt_endereco.Text := qryAgenda.fieldbyname('AT_ENDERECO').AsString;
  txt_bairro.Text :=  qryAgenda.fieldbyname('AT_BAIRRO').AsString;
  txt_cidade.Text :=  qryAgenda.fieldbyname('AT_CIDADE').AsString;
  txt_uf.Text :=      qryAgenda.fieldbyname('AT_UF').AsString;
  txt_telefone.Text := qryAgenda.fieldbyname('AT_TELEFONE').AsString;
  txt_celular.Text := qryAgenda.fieldbyname('AT_CELULAR').AsString;
  txt_email.Text  :=  qryAgenda.fieldbyname('AT_email').AsString;

  IF qryAgenda.fieldbyname('AT_TIPO').AsString = 'C' then
    rdg_opcao.ItemIndex := 0
  else IF qryAgenda.fieldbyname('AT_TIPO').AsString = 'F' then
    rdg_opcao.ItemIndex := 1
  else IF qryAgenda.fieldbyname('AT_TIPO').AsString = '2' then
    rdg_opcao.ItemIndex := 2
  else
    rdg_opcao.ItemIndex := 3;

  gpbDados.Enabled := false;

  btnAlterar.Enabled := true;
  btnExcluir.Enabled := true;
  btnGravar.Enabled := false;
end;

procedure TfrmAgendaTelefone.DBGrid1DblClick(Sender: TObject);
begin
  if pesquisa = 'pesq_cotacao_compra' then
  begin
    frmInserirFornecedorCotacao.txt_cod_fornec.Text := qryAgenda.fieldbyname('at_codigo').AsString;
    frmInserirFornecedorCotacao.txt_fornecedor.Text := qryAgenda.fieldbyname('at_nome').AsString;
    frmInserirFornecedorCotacao.txt_valor.SetFocus;
    close;
  end;

  if pesquisa = 'pesq_cotacao_compra_2' then
  begin
    frmPesqCotacaoCompra.txt_cod_fornec.Text := qryAgenda.fieldbyname('at_codigo').AsString;
    frmPesqCotacaoCompra.txt_fornecedor.Text := qryAgenda.fieldbyname('at_nome').AsString;
    close;
  end;

  if pesquisa = 'pesq_cotacao_compra_desp' then
  begin
    frmPesqCotacaoCompraDesp.txt_cod_fornec.Text := qryAgenda.fieldbyname('at_codigo').AsString;
    frmPesqCotacaoCompraDesp.txt_fornecedor.Text := qryAgenda.fieldbyname('at_nome').AsString;
    close;
  end;

end;

procedure TfrmAgendaTelefone.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    DBGrid1DblClick(Sender as TObject);

end;

procedure TfrmAgendaTelefone.txt_nome_pesqEnter(Sender: TObject);
begin
  txt_nome_pesq.Color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_nome_pesqExit(Sender: TObject);
begin
  txt_nome_pesq.Color := clwindow;
end;

procedure TfrmAgendaTelefone.txt_nome_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    if not qryagenda.IsEmpty then
      dbgrid1.SetFocus
    else
      txt_codigo_pesq.SetFocus;
  end;
end;

procedure TfrmAgendaTelefone.txt_codigo_pesqEnter(Sender: TObject);
begin
  txt_codigo_pesq.Color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_codigo_pesqExit(Sender: TObject);
begin
  txt_codigo_pesq.Color := clwindow;
end;

procedure TfrmAgendaTelefone.rdb_posicaoClick(Sender: TObject);
begin
  txt_nome_pesq.SetFocus;
end;

procedure TfrmAgendaTelefone.rdb_inicioClick(Sender: TObject);
begin
  txt_nome_pesq.SetFocus;
end;

procedure TfrmAgendaTelefone.txt_nome_pesqChange(Sender: TObject);
begin
  btnPesquisa.Click;
end;

procedure TfrmAgendaTelefone.txt_codigo_pesqChange(Sender: TObject);
begin
  btnPesquisa.Click;
end;

procedure TfrmAgendaTelefone.rdg_opcao_pesqClick(Sender: TObject);
begin
  btnPesquisa.Click;
end;

procedure TfrmAgendaTelefone.txt_codigo_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    if not qryagenda.IsEmpty then
      dbgrid1.SetFocus
    else
      txt_nome_pesq.SetFocus;
  end;
end;

procedure TfrmAgendaTelefone.txt_emailEnter(Sender: TObject);
begin
  txt_email.Color := $00F5EEDE;
end;

procedure TfrmAgendaTelefone.txt_emailExit(Sender: TObject);
begin
  txt_email.Color := clwindow;
end;

procedure TfrmAgendaTelefone.txt_emailKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

end.
