unit untContasPagarParcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, ToolEdit, CurrEdit, Menus, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmContasPagarParcelas = class(TForm)
    DBGrid1: TDBGrid;
    qryContasPagarParcela: TIBQuery;
    dsContasPagarParcela: TDataSource;
    qryContasPagarParcelaCODIGO: TIntegerField;
    qryContasPagarParcelaDESCRICAO: TIBStringField;
    qryContasPagarParcelaVALOR: TIBBCDField;
    qryContasPagarParcelaDATA_PGTO: TDateTimeField;
    qryContasPagarParcelaDESPESA_OUTROS: TIBStringField;
    qryContasPagarParcelaPARCELA: TIBStringField;
    qryContasPagarParcelaDATA_DESPESA: TDateTimeField;
    qryContasPagarParcelaDESPESA: TIBStringField;
    qryContasPagarParcelaDESPESA_SUB: TIBStringField;
    qryContasPagarParcelaTIP_CODIGO: TIntegerField;
    qryContasPagarParcelaTIP_DESCRICAO: TIBStringField;
    qryContasPagarParcelaTDS_CODIGO: TIntegerField;
    qryContasPagarParcelaCODIGO_CONTAS_PAGAR: TIntegerField;
    gpbDados: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    txt_total: TCurrencyEdit;
    txt_num_parcela: TRxCalcEdit;
    txt_valor_parcela: TCurrencyEdit;
    btnConfirmar: TButton;
    txt_descricao: TEdit;
    txt_obs: TEdit;
    txt_codigo: TEdit;
    btnCancelar: TButton;
    PopupMenu1: TPopupMenu;
    Apagar1: TMenuItem;
    DarbaixadiretonoCadDespesas1: TMenuItem;
    DarBaixaParcialnaparcela1: TMenuItem;
    gpbSair: TGroupBox;
    btnSair: TButton;
    btnAtualizarGrid: TButton;
    qryContasPagarParcelaCOT_CODIGO: TIntegerField;
    qryContasPagarParcelaAT_CODIGO: TIntegerField;
    Label21: TLabel;
    Label22: TLabel;
    N1: TMenuItem;
    Despesacomitensdacotaodecompra1: TMenuItem;
    procedure txt_num_parcelaKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txt_num_parcelaEnter(Sender: TObject);
    procedure txt_num_parcelaExit(Sender: TObject);
    procedure txt_valor_parcelaEnter(Sender: TObject);
    procedure txt_valor_parcelaExit(Sender: TObject);
    procedure txt_valor_parcelaKeyPress(Sender: TObject; var Key: Char);
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_descricaoExit(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
    procedure DarbaixadiretonoCadDespesas1Click(Sender: TObject);
    procedure DarBaixaParcialnaparcela1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSairClick(Sender: TObject);
    procedure btnAtualizarGridClick(Sender: TObject);
    procedure Despesacomitensdacotaodecompra1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasPagarParcelas: TfrmContasPagarParcelas;

implementation

uses unt_modulo, unt_contas_pagar, untConfirmarBaixaContasPagar2,
  untBaixaParcialParcela2, untItensCotacaoCompra;

{$R *.dfm}

procedure TfrmContasPagarParcelas.txt_num_parcelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    txt_valor_parcela.Value := txt_total.Value / txt_num_parcela.Value;
    txt_valor_parcela.SetFocus;
  end;

end;

procedure TfrmContasPagarParcelas.btnConfirmarClick(Sender: TObject);
var
  num_parcela, CODIGO : integer;
begin

  if txt_num_parcela.Value <= 0 THEN
  begin
    showmessage('Coloque a qtde de parcelas');
    txt_num_parcela.setfocus;
    exit;
  end;

  if txt_valor_parcela.Value <= 0 THEN
  begin
    showmessage('Coloque o valor da parcela');
    txt_valor_parcela.setfocus;
    exit;
  end;

  if txt_descricao.Text = '' THEN
  begin
    showmessage('Coloque a descrição das parcelas');
    txt_descricao.setfocus;
    exit;
  end;

  if txt_obs.Text = '' THEN
  begin
    showmessage('Coloque a obs nas parcelas');
    txt_obs.setfocus;
    exit;
  end;

  num_parcela := 1;

  while num_parcela <= txt_num_parcela.Value do
  begin
    frm_contas_pagar.QRY_MAX_CODIGO.Close;
    frm_contas_pagar.QRY_MAX_CODIGO.SQL.Clear;
    frm_contas_pagar.QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM CONTAS_PAGAR');
    frm_contas_pagar.QRY_MAX_CODIGO.Open;
    codigo := frm_contas_pagar.QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

    if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
        frm_contas_pagar.IBTRANSLOCAL.StartTransaction;
      frm_contas_pagar.qry_contas_pagar.Close;
      frm_contas_pagar.qry_contas_pagar.SQL.Clear;
      frm_contas_pagar.qry_contas_pagar.SQL.Add('INSERT INTO CONTAS_PAGAR (CODIGO, DESCRICAO, DESPESA_OUTROS, VALOR,                  '+
                                                'DATA_DESPESA, DATA_PGTO, PARCELA, CODIGO_CONTAS_PAGAR_PARC, TIP_CODIGO, TDS_CODIGO)  '+
                                                'VALUES (:CODIGO, :DESCRICAO, :DESPESA_OUTROS, :VALOR, :DATA_DESPESA,                 '+
                                                ':DATA_PGTO, :PARCELA, :CODIGO_CONTAS_PAGAR_PARC, :TIP_CODIGO, :TDS_CODIGO)           ');
      frm_contas_pagar.qry_contas_pagar.ParamByName('CODIGO').AsInteger         := codigo;
      frm_contas_pagar.qry_contas_pagar.ParamByName('DESCRICAO').AsString       := txt_descricao.Text;
      frm_contas_pagar.qry_contas_pagar.ParamByName('DESPESA_OUTROS').AsString  := txt_obs.Text;
      frm_contas_pagar.qry_contas_pagar.ParamByName('VALOR').AsFLOAT            := txt_valor_parcela.Value;
      frm_contas_pagar.qry_contas_pagar.ParamByName('DATA_DESPESA').AsDateTime  := qryContasPagarParcela.fieldbyname('DATA_DESPESA').AsDateTime;
      frm_contas_pagar.qry_contas_pagar.ParamByName('DATA_PGTO').AsDateTime     := qryContasPagarParcela.fieldbyname('DATA_PGTO').AsDateTime;
      frm_contas_pagar.qry_contas_pagar.ParamByName('PARCELA').AsInteger        := num_parcela;
      frm_contas_pagar.qry_contas_pagar.ParamByName('TIP_CODIGO').AsInteger     := qryContasPagarParcela.fieldbyname('TIP_CODIGO').AsInteger;
      frm_contas_pagar.qry_contas_pagar.ParamByName('TDS_CODIGO').AsInteger     := qryContasPagarParcela.fieldbyname('TDS_CODIGO').AsInteger;
      frm_contas_pagar.qry_contas_pagar.ParamByName('CODIGO_CONTAS_PAGAR_PARC').asstring    := txt_codigo.Text;
      frm_contas_pagar.qry_contas_pagar.ExecSQL;
      frm_contas_pagar.IBTRANSLOCAL.Commit;

      num_parcela := num_parcela + 1;
  end;

  qryContasPagarParcela.First;

  WHILE not qryContasPagarParcela.Eof do
  begin
    if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
      frm_contas_pagar.IBTRANSLOCAL.StartTransaction;

    frm_contas_pagar.qry_contas_pagar.Close;
    frm_contas_pagar.qry_contas_pagar.SQL.Clear;
    frm_contas_pagar.qry_contas_pagar.SQL.Add('DELETE FROM CONTAS_PAGAR WHERE CODIGO=:CODIGO');
    frm_contas_pagar.qry_contas_pagar.ParamByName('CODIGO').AsString := qryContasPagarParcela.fieldbyname('CODIGO_CONTAS_PAGAR').AsString;
    frm_contas_pagar.qry_contas_pagar.ExecSQL;

    frm_contas_pagar.IBTRANSLOCAL.Commit;

    qryContasPagarParcela.Next;
  end;

  frm_contas_pagar.qry_mostra_dados.Close;
  frm_contas_pagar.qry_mostra_dados.SQL.Clear;
  frm_contas_pagar.qry_mostra_dados.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa, '+
                                            'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA, C.COT_CODIGO, C.AT_CODIGO,        '+
                                            'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                           '+
                                            'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO, c.codigo_contas_pagar_parc                        '+
                                            'FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                        '+
                                            'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO                              '+
                                            'ORDER BY C.DATA_PGTO                                                                             ');
  frm_contas_pagar.qry_mostra_dados.Open;
  frm_contas_pagar.qry_mostra_dados.FetchAll;

  frm_contas_pagar.cdsMostraDados.Close;
  frm_contas_pagar.cdsMostraDados.FetchParams;
  frm_contas_pagar.cdsMostraDados.Open;

  CLOSE;
  
end;

procedure TfrmContasPagarParcelas.FormShow(Sender: TObject);
begin
  qryContasPagarParcela.Close;
  qryContasPagarParcela.SQL.Clear;
  qryContasPagarParcela.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa, C.COT_CODIGO, C.AT_CODIGO, '+
                                'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA,                                                              '+
                                'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                                                      '+
                                'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO, C.CODIGO_CONTAS_PAGAR                                                        '+
                                'FROM CONTAS_PAGAR_PARCELAS C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                                          '+
                                'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO AND CODIGO=:CODIGO                                      '+
                                'ORDER BY C.DATA_PGTO');

  if gpbDados.Enabled = true then
    qryContasPagarParcela.ParamByName('CODIGO').AsString := TXT_CODIGO.Text;
  if gpbDados.Enabled = false then
    qryContasPagarParcela.ParamByName('CODIGO').AsString := frm_contas_pagar.cdsMostraDados.fieldbyname('CODIGO_CONTAS_PAGAR_PARC').AsString;

  qryContasPagarParcela.Open;
  qryContasPagarParcela.FetchAll;

  FRM_CONTAS_PAGAR.qry_soma.Close;
  FRM_CONTAS_PAGAR.qry_soma.SQL.Clear;
  FRM_CONTAS_PAGAR.qry_soma.SQL.Add('select sum(valor) as valor from contas_pagar_parcelas where codigo=:codigo');
  if gpbDados.Enabled = true then
   FRM_CONTAS_PAGAR.qry_soma.ParamByName('CODIGO').AsString := TXT_CODIGO.Text;
  if gpbDados.Enabled = false then
   FRM_CONTAS_PAGAR.qry_soma.ParamByName('CODIGO').AsString := frm_contas_pagar.cdsMostraDados.fieldbyname('CODIGO_CONTAS_PAGAR_PARC').AsString;

  FRM_CONTAS_PAGAR.qry_soma.Open;

  txt_total.Value := FRM_CONTAS_PAGAR.qry_soma.fieldbyname('VALOR').AsFloat;

end;

procedure TfrmContasPagarParcelas.txt_num_parcelaEnter(Sender: TObject);
begin
  txt_num_parcela.Color := $00F5EEDE;
end;

procedure TfrmContasPagarParcelas.txt_num_parcelaExit(Sender: TObject);
begin
  txt_num_parcela.Color := clwindow;
end;

procedure TfrmContasPagarParcelas.txt_valor_parcelaEnter(Sender: TObject);
begin
  txt_valor_parcela.Color := $00F5EEDE;
end;

procedure TfrmContasPagarParcelas.txt_valor_parcelaExit(Sender: TObject);
begin
  txt_valor_parcela.Color := clwindow;
end;

procedure TfrmContasPagarParcelas.txt_valor_parcelaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key =#13 then
    txt_descricao.SetFocus;
end;

procedure TfrmContasPagarParcelas.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color := $00F5EEDE;
end;

procedure TfrmContasPagarParcelas.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure TfrmContasPagarParcelas.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure TfrmContasPagarParcelas.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure TfrmContasPagarParcelas.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure TfrmContasPagarParcelas.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnconfirmar.SetFocus;
end;

procedure TfrmContasPagarParcelas.btnCancelarClick(Sender: TObject);
begin

  if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
    frm_contas_pagar.IBTRANSLOCAL.StartTransaction;

  frm_contas_pagar.qry_contas_pagar.Close;
  frm_contas_pagar.qry_contas_pagar.SQL.Clear;
  frm_contas_pagar.qry_contas_pagar.SQL.Add('DELETE FROM CONTAS_PAGAR_PARCELAS WHERE CODIGO=:CODIGO');
  frm_contas_pagar.qry_contas_pagar.ParamByName('CODIGO').AsString := TXT_CODIGO.Text;
  frm_contas_pagar.qry_contas_pagar.ExecSQL;

  frm_contas_pagar.IBTRANSLOCAL.Commit;

  close;
  
end;

procedure TfrmContasPagarParcelas.Apagar1Click(Sender: TObject);
begin

  if gpbdados.Enabled = TRUE THEN
  begin
    showmessage('Operacao nao permitida');
    exit;
  end;

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir N. ' + qryContasPagarParcela.FieldByName('CODIGO_CONTAS_PAGAR').AsString + ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin

    if not frm_contas_pagar.IBTRANSLOCAL.InTransaction then
      frm_contas_pagar.IBTRANSLOCAL.StartTransaction;
    frm_contas_pagar.qry_contas_pagar.Close;
    frm_contas_pagar.qry_contas_pagar.SQL.Clear;
    frm_contas_pagar.qry_contas_pagar.SQL.Add('DELETE FROM CONTAS_PAGAR_PARCELAS WHERE CODIGO_CONTAS_PAGAR = '+ qryContasPagarParcela.FieldByName('CODIGO_CONTAS_PAGAR').AsString);
    frm_contas_pagar.qry_contas_pagar.ExecSQL;
    frm_contas_pagar.IBTRANSLOCAL.Commit;

    qryContasPagarParcela.Close;
    qryContasPagarParcela.SQL.Clear;
    qryContasPagarParcela.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa, C.COT_CODIGO, C.AT_CODIGO, '+
                                  'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA,                                                              '+
                                  'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                                                      '+
                                  'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO, C.CODIGO_CONTAS_PAGAR                                                        '+
                                  'FROM CONTAS_PAGAR_PARCELAS C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                                          '+
                                  'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO                                                         '+
                                  'ORDER BY C.DATA_PGTO');
    qryContasPagarParcela.Open;
    qryContasPagarParcela.FetchAll;

    FRM_CONTAS_PAGAR.qry_soma.Close;
    FRM_CONTAS_PAGAR.qry_soma.SQL.Clear;
    FRM_CONTAS_PAGAR.qry_soma.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CONTAS_PAGAR_PARCELAS');
    FRM_CONTAS_PAGAR.qry_soma.Open;
    FRM_CONTAS_PAGAR.qry_soma.FetchAll;
    txt_total.Value := FRM_CONTAS_PAGAR.qry_soma.fieldbyname('TOTAL').AsFloat;

 end;//YES
  IDNO : Exit;
 end; //FIM CASE

end;

procedure TfrmContasPagarParcelas.DarbaixadiretonoCadDespesas1Click(
  Sender: TObject);
begin
  if gpbdados.Enabled = TRUE THEN
  begin
    showmessage('Operacao nao permitida');
    exit;
  end;

  Application.CreateForm(TfrmConfirmarBaixaContasPagar2, frmConfirmarBaixaContasPagar2);
  frmConfirmarBaixaContasPagar2.txt_codigo.Text := qryContasPagarParcela.fieldbyname('CODIGO_CONTAS_PAGAR').AsString;
  frmConfirmarBaixaContasPagar2.txt_valor.Text  := formatfloat('###,##0.00', qryContasPagarParcela.fieldbyname('VALOR').AsFloat);
  frmConfirmarBaixaContasPagar2.txt_data.Date := now;
  frmConfirmarBaixaContasPagar2.show;

end;

procedure TfrmContasPagarParcelas.DarBaixaParcialnaparcela1Click(
  Sender: TObject);
begin
  if gpbdados.Enabled = TRUE THEN
  begin
    showmessage('Operacao nao permitida');
    exit;
  end;

  Application.CreateForm(TfrmBaixaParcialParcela2, frmBaixaParcialParcela2);
  frmBaixaParcialParcela2.txt_codigo.Text := qryContasPagarParcela.fieldbyname('CODIGO_CONTAS_PAGAR').AsString;
  frmBaixaParcialParcela2.txt_valor.Text  := formatfloat('###,##0.00', qryContasPagarParcela.fieldbyname('VALOR').AsFloat);
  frmBaixaParcialParcela2.txt_data.Date := now;
  frmBaixaParcialParcela2.show;

end;

procedure TfrmContasPagarParcelas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  IF (qryContasPagarParcela.FieldByName('COT_CODIGO').AsString <> '' ) then
    DBGrid1.Canvas.Brush.Color := clInactiveCaption;

  if (gdSelected in state) then
  with (Sender as TDBGrid).Canvas do
  begin

    Font.Style  := [fsbold];
    DBGrid1.Canvas.Brush.Color := clWhite;

    IF (qryContasPagarParcela.FieldByName('COT_CODIGO').AsString <> '' ) then
      DBGrid1.Canvas.Brush.Color := clInactiveCaption;

  end;

  dbgrid1.Canvas.Font.Color:= clBlack;

  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmContasPagarParcelas.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmContasPagarParcelas.btnAtualizarGridClick(Sender: TObject);
begin
  qryContasPagarParcela.Close;
  qryContasPagarParcela.SQL.Clear;
  qryContasPagarParcela.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa, C.COT_CODIGO, AT_CODIGO, '+
                                'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA,                                                            '+
                                'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                                                    '+
                                'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO, C.CODIGO_CONTAS_PAGAR                                                      '+
                                'FROM CONTAS_PAGAR_PARCELAS C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                                        '+
                                'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO AND CODIGO=:CODIGO                                    '+
                                'ORDER BY C.DATA_PGTO');

  if gpbDados.Enabled = true then
   qryContasPagarParcela.ParamByName('CODIGO').AsString := TXT_CODIGO.Text;
  if gpbDados.Enabled = false then
   qryContasPagarParcela.ParamByName('CODIGO').AsString := frm_contas_pagar.cdsMostraDados.fieldbyname('CODIGO_CONTAS_PAGAR_PARC').AsString;

  qryContasPagarParcela.Open;
  qryContasPagarParcela.FetchAll;

  FRM_CONTAS_PAGAR.qry_soma.Close;
  FRM_CONTAS_PAGAR.qry_soma.SQL.Clear;
  FRM_CONTAS_PAGAR.qry_soma.SQL.Add('select sum(valor) as valor from contas_pagar_parcelas where codigo=:codigo');
  if gpbDados.Enabled = true then
    FRM_CONTAS_PAGAR.qry_soma.ParamByName('CODIGO').AsString := TXT_CODIGO.Text;
  if gpbDados.Enabled = false then
    FRM_CONTAS_PAGAR.qry_soma.ParamByName('CODIGO').AsString := frm_contas_pagar.cdsMostraDados.fieldbyname('CODIGO_CONTAS_PAGAR_PARC').AsString;


  FRM_CONTAS_PAGAR.qry_soma.Open;

  txt_total.Value := FRM_CONTAS_PAGAR.qry_soma.fieldbyname('VALOR').AsFloat;
end;

procedure TfrmContasPagarParcelas.Despesacomitensdacotaodecompra1Click(
  Sender: TObject);
begin
  Application.CreateForm(TfrmItensCotacaoCompra, frmItensCotacaoCompra);
  frmItensCotacaoCompra.pesquisar := 'Contas_Pagar';
  frmItensCotacaoCompra.ShowModal;
end;

end.
