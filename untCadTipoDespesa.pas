unit untCadTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery,
  IBDatabase;

type
  TfrmCadTipoDespesa = class(TForm)
    gpbDados: TGroupBox;
    Label1: TLabel;
    txt_codigo: TEdit;
    Label2: TLabel;
    txt_descricao: TEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    btnGravar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    qryTipoDespesa: TIBQuery;
    dsTipoDespesa: TDataSource;
    qryTipoDespesaTIP_CODIGO: TIntegerField;
    qryTipoDespesaTIP_DESCRICAO: TIBStringField;
    qry_trans_local: TIBQuery;
    IBTransLocal: TIBTransaction;
    QRY_MAX_CODIGO: TIBQuery;
    btnInserir: TButton;
    qryPesquisa: TIBQuery;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    gpbDadosSub: TGroupBox;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    btnInserirSub: TButton;
    btnGravarSub: TButton;
    btnAlterarSub: TButton;
    btnExcluirSub: TButton;
    Label5: TLabel;
    txt_codigosub: TEdit;
    Label6: TLabel;
    txt_descricaosub: TEdit;
    dsTipoDespesaSub: TDataSource;
    qryTipoDespesaSub: TIBQuery;
    qryTipoDespesaSubTDS_CODIGO: TIntegerField;
    qryTipoDespesaSubTDS_DESCRICAO: TIBStringField;
    DBGrid2: TDBGrid;
    txt_Despesa: TEdit;
    txt_despesa_sub: TEdit;
    DBGrid3: TDBGrid;
    Button1: TButton;
    qryDespesaSub: TIBQuery;
    dsDespesaSub: TDataSource;
    qryDespesaSubDESPESA: TIBStringField;
    qryDespesaSubDESPESA_SUB: TIBStringField;
    txt_cod_despesa: TEdit;
    txt_cod_despesa_sub: TEdit;
    Button2: TButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_descricaoExit(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirSubClick(Sender: TObject);
    procedure btnGravarSubClick(Sender: TObject);
    procedure btnAlterarSubClick(Sender: TObject);
    procedure btnExcluirSubClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txt_descricaosubEnter(Sender: TObject);
    procedure txt_descricaosubExit(Sender: TObject);
    procedure txt_descricaosubKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoDespesa: TfrmCadTipoDespesa;

implementation

uses unt_modulo, untRelTipoDespesa;

{$R *.dfm}

procedure TfrmCadTipoDespesa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCadTipoDespesa.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color := $00F5EEDE;
end;

procedure TfrmCadTipoDespesa.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure TfrmCadTipoDespesa.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmCadTipoDespesa.FormShow(Sender: TObject);
begin

  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnGravar.Enabled := false;

  gpbDados.Enabled := false;

  btnAlterarsub.Enabled := false;
  btnExcluirsub.Enabled := false;
  btnGravarsub.Enabled := false;

  gpbDadossub.Enabled := false;

  //MOSTRA OS DADOS NA GRID
  qryTipoDespesa.Close;
  qryTipoDespesa.SQL.Clear;
  qryTipoDespesa.SQL.Add('SELECT * FROM TIPO_DESPESA');
  qryTipoDespesa.Open;
  qryTipoDespesa.FetchAll;

  //MOSTRA OS DADOS NA GRID2
  qryTipoDespesasub.Close;
  qryTipoDespesasub.SQL.Clear;
  qryTipoDespesasub.SQL.Add('SELECT * FROM TIPO_DESPESA_SUB');
  qryTipoDespesasub.Open;
  qryTipoDespesasub.FetchAll;

  qryDespesaSub.Close;
  qryDespesaSub.SQL.Clear;
  qryDespesaSub.SQL.Add('SELECT TD.tip_codigo ||'+#39+' - '+#39+'  || TD.tip_descricao AS DESPESA,                    '+
                        'TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_SUB, TD.TIP_DESCRICAO   '+
                        'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS                              '+
                        'WHERE I.TIP_CODIGO = TD.TIP_CODIGO AND I.TDS_CODIGO = TDS.TDS_CODIGO                         '+
                        'ORDER BY TD.TIP_DESCRICAO                                                                    ');
  qryDespesaSub.Open;

end;

procedure TfrmCadTipoDespesa.btnGravarClick(Sender: TObject);
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

  if btnInserir.Tag = 1 then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO TIPO_DESPESA (TIP_CODIGO, TIP_DESCRICAO)  '+
                            'VALUES (:TIP_CODIGO, :TIP_DESCRICAO)                  ');
    qry_trans_local.ParamByName('TIP_CODIGO').AsString          := txt_Codigo.Text;
    qry_trans_local.ParamByName('TIP_DESCRICAO').AsString       := txt_descricao.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;
  end;

  if btnalterar.Tag = 2 then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE TIPO_DESPESA SET TIP_DESCRICAO=:TIP_DESCRICAO WHERE TIP_CODIGO=:TIP_CODIGO');
    qry_trans_local.ParamByName('TIP_CODIGO').AsString          := txt_codigo.Text;
    qry_trans_local.ParamByName('TIP_DESCRICAO').AsString       := txt_descricao.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;
  end;

  txt_codigo.Clear;
  txt_descricao.Clear;

  gpbDados.Enabled := false;

  btnGravar.Enabled := false;

  //MOSTRA OS DADOS NA GRID
  qryTipoDespesa.Close;
  qryTipoDespesa.SQL.Clear;
  qryTipoDespesa.SQL.Add('SELECT * FROM TIPO_DESPESA');
  qryTipoDespesa.Open;
  qryTipoDespesa.FetchAll;

  btninserir.Tag := 0;
  btnAlterar.Tag := 0;

  btnexcluir.Enabled := true;
  btnalterar.Enabled := true;
  btnInserir.Enabled := true;

end;

procedure TfrmCadTipoDespesa.DBGrid1DblClick(Sender: TObject);
begin
  txt_codigo.Text := qryTipoDespesa.fieldbyname('TIP_CODIGO').AsString;
  txt_cod_despesa.Text := qryTipoDespesa.fieldbyname('TIP_CODIGO').AsString;
  txt_descricao.Text := qryTipoDespesa.fieldbyname('TIP_DESCRICAO').AsString;

  txt_despesa.Text := qryTipoDespesa.fieldbyname('TIP_CODIGO').AsString +  ' - ' + qryTipoDespesa.fieldbyname('TIP_DESCRICAO').AsString;

  gpbDados.Enabled := false;

  btnAlterar.Enabled := true;
  btnExcluir.Enabled := true;
  btnGravar.Enabled := false;

end;

procedure TfrmCadTipoDespesa.btnInserirClick(Sender: TObject);
var
  cod_tipo : integer;
begin

  gpbDados.Enabled := true;

  btnInserir.Tag := 1;

  txt_codigo.Clear;
  txt_descricao.Clear;
  txt_DESCRICAO.SetFocus;

  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnGravar.Enabled := true;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(TIP_CODIGO) AS TIP_CODIGO FROM TIPO_DESPESA');
  QRY_MAX_CODIGO.Open;
  cod_tipo := QRY_MAX_CODIGO.FieldByName('TIP_CODIGO').AsInteger +1;

  txt_codigo.Text := inttostr(cod_tipo);

  btnexcluir.Enabled := false;
  btnalterar.Enabled := false;
  btnInserir.Enabled := false;

end;

procedure TfrmCadTipoDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCadTipoDespesa := nil;
  action:= cafree;
end;

procedure TfrmCadTipoDespesa.btnAlterarClick(Sender: TObject);
begin
  btnAlterar.Tag := 2;
  gpbDados.Enabled := true;

  btnGravar.Enabled := true;

  btnexcluir.Enabled := false;

  btnalterar.Enabled := false;
end;

procedure TfrmCadTipoDespesa.btnExcluirClick(Sender: TObject);
begin
  if txt_codigo.Text = '' then
  begin
    showmessage('Duplo clique no registro que deseja excluir');
    txt_codigo.SetFocus;
    exit;
  end;

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir N. ' + txt_codigo.Text + ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('DELETE FROM TIPO_DESPESA WHERE TIP_CODIGO =:TIP_CODIGO');
    qry_trans_local.ParamByName('TIP_CODIGO').AsString := txt_codigo.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

    txt_codigo.Clear;
    txt_descricao.Clear;

    gpbDados.Enabled := false;

    btnGravar.Enabled := false;

    //MOSTRA OS DADOS NA GRID
    qryTipoDespesa.Close;
    qryTipoDespesa.SQL.Clear;
    qryTipoDespesa.SQL.Add('SELECT * FROM TIPO_DESPESA');
    qryTipoDespesa.Open;
    qryTipoDespesa.FetchAll;

  END;
    IDNO : Exit;
  end; //FIM CASE

end;

procedure TfrmCadTipoDespesa.btnInserirSubClick(Sender: TObject);
var
  cod_tipo : integer;
begin
  gpbDadosSub.Enabled := true;

  btnInserirSub.Tag := 1;

  txt_codigoSub.Clear;
  txt_descricaoSub.Clear;
  txt_DESCRICAOSub.SetFocus;

  btnAlterarSub.Enabled := false;
  btnExcluirSub.Enabled := false;
  btnGravarSub.Enabled := true;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(TDS_CODIGO) AS TDS_CODIGO FROM TIPO_DESPESA_SUB');
  QRY_MAX_CODIGO.Open;
  cod_tipo := QRY_MAX_CODIGO.FieldByName('TDS_CODIGO').AsInteger +1;

  txt_codigosub.Text := inttostr(cod_tipo);

  btnexcluirSub.Enabled := false;
  btnalterarSub.Enabled := false;
  btnInserirSub.Enabled := false;

end;

procedure TfrmCadTipoDespesa.btnGravarSubClick(Sender: TObject);
var
  cod_tipo : integer;
begin

  if txt_codigoSub.Text = '' then
  begin
    showmessage('Coloque o codigo');
    txt_codigosub.SetFocus;
    exit;
  end;

  if txt_descricaosub.Text = '' then
  begin
    showmessage('Coloque a descricao');
    txt_descricaosub.SetFocus;
    exit;
  end;

  if btnInserirsub.Tag = 1 then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO TIPO_DESPESA_SUB (TDS_CODIGO, TDS_DESCRICAO)  '+
                            'VALUES (:TDS_CODIGO, :TDS_DESCRICAO)                      ');
    qry_trans_local.ParamByName('TDS_CODIGO').AsString          := txt_Codigosub.Text;
    qry_trans_local.ParamByName('TDS_DESCRICAO').AsString       := txt_descricaosub.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

  end;

  if btnalterarsub.Tag = 2 then
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE TIPO_DESPESA_SUB SET TDS_DESCRICAO=:TDS_DESCRICAO WHERE TDS_CODIGO=:TDS_CODIGO');
    qry_trans_local.ParamByName('TDS_CODIGO').AsString          := txt_codigosub.Text;
    qry_trans_local.ParamByName('TDS_DESCRICAO').AsString       := txt_descricaosub.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

  end;

  txt_codigosub.Clear;
  txt_descricaosub.Clear;

  gpbDadossub.Enabled := false;

  btnGravarsub.Enabled := false;

  //MOSTRA OS DADOS NA GRID
  qryTipoDespesaSub.Close;
  qryTipoDespesaSub.SQL.Clear;
  qryTipoDespesaSub.SQL.Add('SELECT * FROM TIPO_DESPESA_SUB');
  qryTipoDespesaSub.Open;
  qryTipoDespesaSub.FetchAll;

  btninserirsub.Tag := 0;
  btnAlterarsub.Tag := 0;

  btnexcluirsub.Enabled := true;
  btnalterarsub.Enabled := true;
  btnInserirsub.Enabled := true;

end;

procedure TfrmCadTipoDespesa.btnAlterarSubClick(Sender: TObject);
begin
  btnAlterarsub.Tag := 2;
  gpbDadossub.Enabled := true;

  btnGravarSub.Enabled := true;

  btnexcluirSub.Enabled := false;

  btnalterarSub.Enabled := false;
end;

procedure TfrmCadTipoDespesa.btnExcluirSubClick(Sender: TObject);
begin
  if txt_codigosub.Text = '' then
  begin
    showmessage('Duplo clique no registro que deseja excluir');
    txt_codigosub.SetFocus;
    exit;
  end;

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir N. ' + txt_codigosub.Text + ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('DELETE FROM TIPO_DESPESA_SUB WHERE TDS_CODIGO =:TDS_CODIGO');
    qry_trans_local.ParamByName('TDS_CODIGO').AsString := txt_codigosub.Text;
    qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

    txt_codigosub.Clear;
    txt_descricaosub.Clear;

    gpbDadossub.Enabled := false;

    btnGravarsub.Enabled := false;

    //MOSTRA OS DADOS NA GRID
    qryTipoDespesasub.Close;
    qryTipoDespesasub.SQL.Clear;
    qryTipoDespesasub.SQL.Add('SELECT * FROM TIPO_DESPESA_SUB');
    qryTipoDespesasub.Open;
    qryTipoDespesasub.FetchAll;

  END;
    IDNO : Exit;
  end; //FIM CASE

end;

procedure TfrmCadTipoDespesa.DBGrid2DblClick(Sender: TObject);
begin
  txt_codigosub.Text := qryTipoDespesaSub.fieldbyname('TDS_CODIGO').AsString;
  txt_cod_despesa_sub.Text := qryTipoDespesaSub.fieldbyname('TDS_CODIGO').AsString;
  txt_descricaosub.Text := qryTipoDespesaSub.fieldbyname('TDS_DESCRICAO').AsString;

  txt_despesa_sub.Text :=  qryTipoDespesaSub.fieldbyname('TDS_CODIGO').AsString + ' - ' + qryTipoDespesaSub.fieldbyname('TDS_DESCRICAO').AsString;

  gpbDadossub.Enabled := false;

  btnAlterarsub.Enabled := true;
  btnExcluirsub.Enabled := true;
  btnGravarsub.Enabled := false;

end;

procedure TfrmCadTipoDespesa.DBGrid2DrawColumnCell(Sender: TObject;
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
    dbgrid2.Canvas.Font.Color:= clBlack;

  dbgrid2.Canvas.FillRect(Rect);
  dbgrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCadTipoDespesa.txt_descricaosubEnter(Sender: TObject);
begin
  txt_descricaosub.Color := $00F5EEDE;
end;

procedure TfrmCadTipoDespesa.txt_descricaosubExit(Sender: TObject);
begin
  txt_descricaosub.Color := clwindow;
end;

procedure TfrmCadTipoDespesa.txt_descricaosubKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btngravarsub.SetFocus;
end;

procedure TfrmCadTipoDespesa.Button1Click(Sender: TObject);
begin

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_trans_local.Close;
  qry_trans_local.SQL.Clear;
  qry_trans_local.SQL.Add('INSERT INTO ITENS_DESPESA_SUB (TIP_CODIGO, TDS_CODIGO)  '+
                          'VALUES (:TIP_CODIGO, :TDS_CODIGO)                       ');
  qry_trans_local.ParamByName('TIP_CODIGO').AsString          := txt_Cod_despesa.Text;
  qry_trans_local.ParamByName('TDS_CODIGO').AsString          := txt_cod_despesa_sub.Text;
  qry_trans_local.ExecSQL;
  IBTRANSLOCAL.Commit;

  qryDespesaSub.Close;
  qryDespesaSub.SQL.Clear;
  qryDespesaSub.SQL.Add('SELECT TD.tip_codigo ||'+#39+' - '+#39+'  || TD.tip_descricao AS DESPESA,                    '+
                        'TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_SUB, TD.TIP_DESCRICAO   '+
                        'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS                              '+
                        'WHERE I.TIP_CODIGO = TD.TIP_CODIGO AND I.TDS_CODIGO = TDS.TDS_CODIGO                         '+
                        'ORDER BY TD.TIP_DESCRICAO                                                                    ');
  qryDespesaSub.Open;

  txt_despesa.Clear;
  txt_despesa_sub.Clear;
  txt_cod_despesa.Clear;
  txt_cod_despesa_sub.Clear;

end;

procedure TfrmCadTipoDespesa.DBGrid3DrawColumnCell(Sender: TObject;
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
      dbgrid3.Canvas.Font.Color:= clBlack;

  dbgrid3.Canvas.FillRect(Rect);
  dbgrid3.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCadTipoDespesa.Button2Click(Sender: TObject);
begin

  WITH frmRelTipoDespesa do
  begin
    qryTipoDespesa.Close;
    qryTipoDespesa.SQL.Clear;
    qryTipoDespesa.SQL.Add('SELECT TD.tip_codigo ||'+#39+' - '+#39+'  || TD.tip_descricao AS DESPESA,                                   '+
                           'TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_SUB, TD.TIP_DESCRICAO, TD.TIP_CODIGO   '+
                           'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS                                             '+
                           'WHERE I.TIP_CODIGO = TD.TIP_CODIGO AND I.TDS_CODIGO = TDS.TDS_CODIGO                                        '+
                           'ORDER BY TD.TIP_CODIGO                                                                                      ');
    qryTipoDespesa.Open;

    frRelatorio.PreviewModal;
  end;

end;

end.
