unit untProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, IBCustomDataSet,
  IBQuery, IBDatabase, Menus;

type
  TfrmProduto = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txt_cod_produto: TEdit;
    txt_descricao: TEdit;
    txt_unidade: TDBLookupComboBox;
    btnGravar: TBitBtn;
    Label4: TLabel;
    txt_grupo: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    txt_cod_produto_pesq: TEdit;
    txt_descricao_pesq: TEdit;
    Label7: TLabel;
    txt_grupo_pesq: TDBLookupComboBox;
    qryUnidade: TIBQuery;
    dsUnidade: TDataSource;
    qryUnidadeUN_CODIGO: TIntegerField;
    qryUnidadeUN_DESCRICAO: TIBStringField;
    dsGrupo: TDataSource;
    qryGrupo: TIBQuery;
    qryGrupoGRP_CODIGO: TIntegerField;
    qryGrupoGRP_DESCRICAO: TIBStringField;
    qry_trans_local: TIBQuery;
    IBTransLocal: TIBTransaction;
    qryProduto: TIBQuery;
    dsProduto: TDataSource;
    qryProdutoPRO_CODIGO: TIntegerField;
    qryProdutoPRO_DESCRICAO: TIBStringField;
    qryProdutoUN_DESCRICAO: TIBStringField;
    qryProdutoGRP_DESCRICAO: TIBStringField;
    PopupMenu1: TPopupMenu;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    qryGrupoPesq: TIBQuery;
    dsGrupoPesq: TDataSource;
    qryGrupoPesqGRP_CODIGO: TIntegerField;
    qryGrupoPesqGRP_DESCRICAO: TIBStringField;
    qryProdutoUN_CODIGO: TIntegerField;
    btnPesquisar: TButton;
    qryProdutoGRP_CODIGO: TIntegerField;
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_descricaoExit(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_unidadeEnter(Sender: TObject);
    procedure txt_unidadeExit(Sender: TObject);
    procedure txt_unidadeKeyPress(Sender: TObject; var Key: Char);
    procedure txt_grupoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_grupoEnter(Sender: TObject);
    procedure txt_grupoExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure limpa_campos(Sender : TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure txt_descricao_pesqEnter(Sender: TObject);
    procedure txt_descricao_pesqExit(Sender: TObject);
    procedure txt_descricao_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure txt_grupo_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure rdb_inicioClick(Sender: TObject);
    procedure rdb_posicaoClick(Sender: TObject);
    procedure txt_grupo_pesqEnter(Sender: TObject);
    procedure txt_grupo_pesqExit(Sender: TObject);
    procedure txt_cod_produto_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_produto_pesqEnter(Sender: TObject);
    procedure txt_cod_produto_pesqExit(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure txt_descricao_pesqChange(Sender: TObject);
    procedure txt_cod_produto_pesqChange(Sender: TObject);
    procedure txt_grupo_pesqKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_grupo_pesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pesquisa : string;
  end;

var
  frmProduto: TfrmProduto;
  alterar, mensagem : string;


implementation

uses unt_modulo, untCotacaoCompra, untPesqCotacaoCompra;

{$R *.dfm}

procedure TfrmProduto.limpa_campos(Sender: TObject);
begin
  txt_Cod_produto.Clear;
  txt_descricao.Clear;
  txt_unidade.KeyValue := null;
  txt_grupo.KeyValue := null;
end;

procedure TfrmProduto.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color := $00F5EEDE;
end;

procedure TfrmProduto.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure TfrmProduto.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_unidade.SetFocus;
end;

procedure TfrmProduto.txt_unidadeEnter(Sender: TObject);
begin
  txt_unidade.Color := $00F5EEDE;
end;

procedure TfrmProduto.txt_unidadeExit(Sender: TObject);
begin
  txt_unidade.Color := clwindow;
end;

procedure TfrmProduto.txt_unidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    txt_grupo.SetFocus;
end;

procedure TfrmProduto.txt_grupoKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmProduto.txt_grupoEnter(Sender: TObject);
begin
  txt_grupo.Color :=$00F5EEDE;
end;

procedure TfrmProduto.txt_grupoExit(Sender: TObject);
begin
  txt_grupo.Color := clwindow;
end;

procedure TfrmProduto.btnGravarClick(Sender: TObject);
var
  cod_produto_local: string;
begin

  if txt_descricao.Text = '' then
  begin
    mensagem:= 'Informe a descrição antes de gravar!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING);
    txt_descricao.SetFocus;
    exit;
  end;

  if txt_unidade.Text = '' then
  begin
    mensagem:= 'Informe a unidade antes de gravar!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING);
    txt_unidade.SetFocus;
    exit;
  end;

  if txt_grupo.Text = '' then
  begin
    mensagem:= 'Informe o grupo antes de gravar!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING);
    txt_grupo.SetFocus;
    exit;
  end;

  if alterar <> 'S' then
  begin
    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO PRODUTO (PRO_DESCRICAO, UN_CODIGO, GRP_CODIGO)'+
                            'VALUES (:PRO_DESCRICAO, :UN_CODIGO, :GRP_CODIGO)          ');
  end;

  if alterar = 'S' then
  begin
    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE PRODUTO SET PRO_DESCRICAO=:PRO_DESCRICAO, '+
                            ' UN_CODIGO=:UN_CODIGO, GRP_CODIGO=:GRP_CODIGO    '+
                            'WHERE PRO_CODIGO = ' + txt_cod_produto.Text       );
  end;

  qry_trans_local.ParamByName('PRO_DESCRICAO').AsString  := txt_descricao.Text;
  qry_trans_local.ParamByName('UN_CODIGO').AsString  := txt_unidade.keyvalue;
  qry_trans_local.ParamByName('GRP_CODIGO').AsString  := txt_grupo.keyvalue;

  qry_trans_local.ExecSQL;
  IBTransLocal.Commit;

  limpa_campos(Sender as TObject);

  alterar := 'N';

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT P.pro_codigo, P.pro_descricao, UN.un_descricao, G.grp_descricao, G.GRP_CODIGO, UN.UN_CODIGO  '+
                     'FROM  PRODUTO P, UNIDADE UN, GRUPO G                                                                '+
                     'WHERE P.un_codigo = UN.un_codigo AND                                                                '+
                     'P.grp_codigo = G.grp_codigo ORDER BY P.PRO_CODIGO                                                   ');
  qryProduto.Open;

  if (pesquisa = 'pesq_cotacao_excel') then
  begin
    qryProduto.last;
    cod_produto_local  := ' PRO_CODIGO = ' + qryProduto.fieldbyname('pro_codigo').asstring;

    frm_cotacao_compra.qryProdutoExcel.Close;
    frm_cotacao_compra.qryProdutoExcel.SQL.Clear;
    frm_cotacao_compra.qryProdutoExcel.SQL.Add('SELECT P.pro_codigo, P.pro_descricao, u.UN_DESCRICAO               '+
                                               'FROM PRODUTO P INNER JOIN UNIDADE U ON P.UN_CODIGO = U.UN_CODIGO   '+
                                               'WHERE ' + cod_produto_local                                        );
    frm_cotacao_compra.qryProdutoExcel.Open;

    frmProduto.pesquisa := '';
    close;
    exit;
  end;

  txt_descricao.SetFocus;

end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  qryUnidade.Close;
  qryUnidade.Open;
  qryUnidade.FetchAll;

  qryGrupo.Close;
  qryGrupo.Open;
  qryGrupo.FetchAll;

  qryGrupoPesq.Close;
  qryGrupoPesq.Open;
  qryGrupoPesq.FetchAll;

  alterar := 'N';

  rdb_posicao.Checked := true;

  if (pesquisa = 'pesq_cotacao_compra') or (pesquisa = 'pesq_cotacao_compra_2') then
    txt_descricao_pesq.SetFocus
  else
    txt_descricao.SetFocus;

end;

procedure TfrmProduto.Alterar1Click(Sender: TObject);
begin

  txt_cod_produto.Text := qryProduto.fieldbyname('PRO_CODIGO').AsString;
  txt_descricao.Text := qryProduto.fieldbyname('PRO_DESCRICAO').AsString;
  txt_unidade.KeyValue := qryProduto.fieldbyname('UN_CODIGO').AsString;
  txt_grupo.KeyValue := qryProduto.fieldbyname('GRP_CODIGO').AsString;

  alterar := 'S';

end;

procedure TfrmProduto.Excluir1Click(Sender: TObject);
begin

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('DELETE FROM PRODUTO WHERE PRO_CODIGO = '+ qryProduto.fieldbyname('PRO_CODIGO').AsString );
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

    qryProduto.Close;
    qryProduto.SQL.Clear;
    qryProduto.SQL.Add('SELECT P.pro_codigo, P.pro_descricao, UN.un_descricao, G.grp_descricao, G.GRP_CODIGO, UN.UN_CODIGO  '+
                       'FROM  PRODUTO P, UNIDADE UN, GRUPO G                                                                '+
                       'WHERE P.un_codigo = UN.un_codigo AND                                                                '+
                       'P.grp_codigo = G.grp_codigo ORDER BY P.PRO_DESCRICAO                                                ');
    qryProduto.Open;

    txt_descricao.SetFocus;

    limpa_campos(Sender as TObject);

    alterar := 'N';

  end;//YES
    IDNO : Exit;
  end; //FIM CASE
 
end;

procedure TfrmProduto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmProduto.DBGrid1DblClick(Sender: TObject);
begin
  if pesquisa = 'pesq_cotacao_compra' then
  begin
    frm_cotacao_compra.txt_cod_barra.Text := qryProduto.fieldbyname('PRO_CODIGO').AsString;
    frm_cotacao_compra.txt_cod_produto.Text := qryProduto.fieldbyname('PRO_CODIGO').AsString;
    frm_cotacao_compra.txt_produto.Text := qryProduto.fieldbyname('PRO_DESCRICAO').AsString;
    frm_cotacao_compra.cbo_unidade.Keyvalue := qryProduto.fieldbyname('UN_CODIGO').AsString;
    frm_cotacao_compra.edtquantidade.SetFocus;

    close;
  end;

  if pesquisa = 'pesq_cotacao_compra_2' then
  begin
    frmPesqCotacaoCompra.txt_cod_barra.Text := qryProduto.fieldbyname('PRO_CODIGO').AsString;
    frmPesqCotacaoCompra.txt_cod_produto.Text := qryProduto.fieldbyname('PRO_CODIGO').AsString;
    frmPesqCotacaoCompra.txt_produto.Text := qryProduto.fieldbyname('PRO_DESCRICAO').AsString;

    close;
  end;

end;

procedure TfrmProduto.txt_descricao_pesqEnter(Sender: TObject);
begin
  txt_descricao_pesq.Color := $00F5EEDE;
end;

procedure TfrmProduto.txt_descricao_pesqExit(Sender: TObject);
begin
  txt_descricao_pesq.Color := clwindow;
end;

procedure TfrmProduto.txt_descricao_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    if not (qryproduto.IsEmpty) and (txt_descricao_pesq.Text <> '') then
      dbgrid1.SetFocus
    else
      txt_cod_produto_pesq.SetFocus;
  end;

end;

procedure TfrmProduto.txt_grupo_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key =#13 then
  begin
    if not (qryproduto.IsEmpty) and (txt_grupo_pesq.Text <> '') then
      dbgrid1.SetFocus
    else
      txt_descricao_pesq.SetFocus;
  end;

end;

procedure TfrmProduto.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    DBGrid1DblClick(Sender as TObject);
end;

procedure TfrmProduto.rdb_inicioClick(Sender: TObject);
begin
  txt_descricao_pesq.SetFocus;
end;

procedure TfrmProduto.rdb_posicaoClick(Sender: TObject);
begin
  txt_descricao_pesq.SetFocus;
end;

procedure TfrmProduto.txt_grupo_pesqEnter(Sender: TObject);
begin
  txt_grupo_pesq.Color := $00F5EEDE;
end;

procedure TfrmProduto.txt_grupo_pesqExit(Sender: TObject);
begin
  txt_grupo_pesq.Color := clwindow;
end;

procedure TfrmProduto.txt_cod_produto_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    if not (qryproduto.IsEmpty) and (txt_cod_produto_pesq.Text <> '') then
      dbgrid1.SetFocus
    else
      txt_grupo_pesq.SetFocus;
  end;
end;

procedure TfrmProduto.txt_cod_produto_pesqEnter(Sender: TObject);
begin
  txt_cod_produto_pesq.Color := $00F5EEDE;
end;

procedure TfrmProduto.txt_cod_produto_pesqExit(Sender: TObject);
begin
  txt_cod_produto_pesq.Color := clwindow;
end;

procedure TfrmProduto.btnPesquisarClick(Sender: TObject);
var
  codigo, descricao, grupo : string;
begin

  if txt_cod_produto_pesq.Text <> '' then
    codigo  := ' AND PRO_CODIGO = ' + txt_cod_produto_pesq.Text
  else
    codigo  := '';

  if (txt_descricao_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
    descricao  := ' AND UPPER(P.PRO_DESCRICAO) LIKE UPPER('+ #39 + txt_descricao_pesq.Text + '%' + #39 + ')'
  else if (txt_descricao_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
    descricao  := ' AND UPPER(P.PRO_DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_descricao_pesq.Text + '%' + #39 + ')'
  else
    descricao  := '';

  if (txt_grupo_pesq.Text <> '') then
     grupo  := ' AND p.grp_codigo =' +  inttostr(txt_grupo_pesq.KeyValue)
  else
     grupo  := '';

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT P.pro_codigo, P.pro_descricao, UN.un_descricao, G.grp_descricao, G.GRP_CODIGO, UN.UN_CODIGO '+
                     'FROM  PRODUTO P, UNIDADE UN, GRUPO G                                                               '+
                     'WHERE P.un_codigo = UN.un_codigo AND                                                               '+
                     'P.grp_codigo = G.grp_codigo  ' + grupo + descricao + codigo + ' ORDER BY P.PRO_DESCRICAO           ');
  qryProduto.Open;

end;

procedure TfrmProduto.txt_descricao_pesqChange(Sender: TObject);
begin
  btnPesquisar.Click;
end;

procedure TfrmProduto.txt_cod_produto_pesqChange(Sender: TObject);
begin
  btnPesquisar.Click;
end;

procedure TfrmProduto.txt_grupo_pesqKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  btnPesquisar.Click;
end;

procedure TfrmProduto.txt_grupo_pesqClick(Sender: TObject);
begin
  btnPesquisar.Click;
end;

end.
