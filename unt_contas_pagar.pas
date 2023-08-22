unit unt_contas_pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Menus, Mask, IBDatabase, DB,
  IBCustomDataSet, IBQuery, ToolEdit, CurrEdit, DBCtrls, ExtCtrls,
  Provider, DBClient;

type
  Tfrm_contas_pagar = class(TForm)
    PopupMenu1: TPopupMenu;
    Apagar1: TMenuItem;
    qry_mostra_dados: TIBQuery;
    qry_soma: TIBQuery;
    ds_mostra_dados: TDataSource;
    QRY_MAX_CODIGO: TIBQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    txt_descricao: TEdit;
    Button1: TButton;
    txt_valor: TCurrencyEdit;
    txt_data_pgto: TDateEdit;
    qry_contas_pagar: TIBQuery;
    IBTransLocal: TIBTransaction;
    GroupBox2: TGroupBox;
    txt_total: TCurrencyEdit;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    Label6: TLabel;
    txt_obs: TEdit;
    DarbaixadiretonoCadDespesas1: TMenuItem;
    Label7: TLabel;
    txt_num_parcela: TEdit;
    GroupBox4: TGroupBox;
    txt_data_i: TDateEdit;
    Label8: TLabel;
    txt_data_f: TDateEdit;
    Label9: TLabel;
    btnPesquisar: TButton;
    Label10: TLabel;
    txt_data_despesa: TDateEdit;
    txt_codigo: TEdit;
    Label12: TLabel;
    cboDespesa: TDBLookupComboBox;
    qryDespesa: TIBQuery;
    dsDespesa: TDataSource;
    qryDespesaTIP_CODIGO: TIntegerField;
    qryDespesaTIP_DESCRICAO: TIBStringField;
    qryDespesaDESPESA: TIBStringField;
    qry_mostra_dadosCODIGO: TIntegerField;
    qry_mostra_dadosDESCRICAO: TIBStringField;
    qry_mostra_dadosVALOR: TIBBCDField;
    qry_mostra_dadosDATA_PGTO: TDateTimeField;
    qry_mostra_dadosDESPESA_OUTROS: TIBStringField;
    qry_mostra_dadosPARCELA: TIBStringField;
    qry_mostra_dadosDATA_DESPESA: TDateTimeField;
    qry_mostra_dadosDESPESA: TIBStringField;
    qry_mostra_dadosTIP_CODIGO: TIntegerField;
    qry_mostra_dadosTIP_DESCRICAO: TIBStringField;
    Button2: TButton;
    qry_pesquisa: TIBQuery;
    DarBaixaParcialnaparcela1: TMenuItem;
    cboDespesa_pesquisa: TDBLookupComboBox;
    Label13: TLabel;
    txt_descricao_despesa: TEdit;
    Label14: TLabel;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    dsDespesa_pesquisa: TDataSource;
    qry_despesa_pesquisa: TIBQuery;
    qry_despesa_pesquisaTIP_CODIGO: TIntegerField;
    qry_despesa_pesquisaTIP_DESCRICAO: TIBStringField;
    qry_despesa_pesquisaDESPESA: TIBStringField;
    Label11: TLabel;
    cboDespesaSub: TDBLookupComboBox;
    dsDespesaSub: TDataSource;
    qryDespesaSub: TIBQuery;
    qryDespesaSubDESPESA_SUB: TIBStringField;
    qryDespesaSubTDS_CODIGO: TIntegerField;
    Label15: TLabel;
    cboDespesa_pesquisaSub: TDBLookupComboBox;
    dsDespesa_pesquisaSub: TDataSource;
    qryDespesa_pesquisaSub: TIBQuery;
    qryDespesa_pesquisaSubDESPESA_SUB: TIBStringField;
    qryDespesa_pesquisaSubTDS_CODIGO: TIntegerField;
    qry_mostra_dadosDESPESA_SUB: TIBStringField;
    qry_mostra_dadosTDS_CODIGO: TIntegerField;
    rdg_data: TRadioGroup;
    btnInserirParcelas: TButton;
    cdsMostraDados: TClientDataSet;
    dspMostraDados: TDataSetProvider;
    cdsMostraDadosCHECKED: TStringField;
    chb_selecionar: TCheckBox;
    Label16: TLabel;
    txt_total_parcelas: TCurrencyEdit;
    cdsMostraDadosCODIGO: TIntegerField;
    cdsMostraDadosDESCRICAO: TStringField;
    cdsMostraDadosVALOR: TBCDField;
    cdsMostraDadosDATA_PGTO: TDateTimeField;
    cdsMostraDadosDESPESA_OUTROS: TStringField;
    cdsMostraDadosPARCELA: TStringField;
    cdsMostraDadosDATA_DESPESA: TDateTimeField;
    cdsMostraDadosDESPESA: TStringField;
    cdsMostraDadosTIP_CODIGO: TIntegerField;
    cdsMostraDadosTIP_DESCRICAO: TStringField;
    cdsMostraDadosDESPESA_SUB: TStringField;
    cdsMostraDadosTDS_CODIGO: TIntegerField;
    qry_mostra_dadosCODIGO_CONTAS_PAGAR_PARC: TIntegerField;
    cdsMostraDadosCODIGO_CONTAS_PAGAR_PARC: TIntegerField;
    Label17: TLabel;
    Label18: TLabel;
    N1: TMenuItem;
    Darbaixanascontasreunidasemparcelas1: TMenuItem;
    rdg_opcao: TRadioGroup;
    Label19: TLabel;
    Label20: TLabel;
    btnAjuda: TButton;
    Label21: TLabel;
    Label22: TLabel;
    N2: TMenuItem;
    ItensCotaoCompra1: TMenuItem;
    qry_mostra_dadosCOT_CODIGO: TIntegerField;
    qry_mostra_dadosAT_CODIGO: TIntegerField;
    cdsMostraDadosCOT_CODIGO: TIntegerField;
    cdsMostraDadosAT_CODIGO: TIntegerField;
    DarBaixaemtodasascontasselecionadasdeumavez1: TMenuItem;
    Label23: TLabel;
    Label24: TLabel;
    txtTotalRegistros: TEdit;
    txtTotalRegistrosSelecionados: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_data_pgtoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbo_tipo_despesaKeyPress(Sender: TObject; var Key: Char);
    procedure txt_descricaoExit(Sender: TObject);
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_valorEnter(Sender: TObject);
    procedure txt_valorExit(Sender: TObject);
    procedure txt_data_pgtoEnter(Sender: TObject);
    procedure txt_data_pgtoExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DarbaixadiretonoCadDespesas1Click(Sender: TObject);
    procedure txt_num_parcelaEnter(Sender: TObject);
    procedure txt_num_parcelaExit(Sender: TObject);
    procedure txt_num_parcelaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure txt_data_despesaEnter(Sender: TObject);
    procedure txt_data_despesaExit(Sender: TObject);
    procedure txt_data_despesaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DarBaixaParcialnaparcela1Click(Sender: TObject);
    procedure cboDespesa_pesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsDespesaDataChange(Sender: TObject; Field: TField);
    procedure cboDespesaSubEnter(Sender: TObject);
    procedure cboDespesaSubExit(Sender: TObject);
    procedure cboDespesaSubKeyPress(Sender: TObject; var Key: Char);
    procedure cboDespesaEnter(Sender: TObject);
    procedure cboDespesaExit(Sender: TObject);
    procedure cboDespesaKeyPress(Sender: TObject; var Key: Char);
    procedure cboDespesa_pesquisaSubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsDespesa_pesquisaDataChange(Sender: TObject; Field: TField);
    procedure txt_descricao_despesaEnter(Sender: TObject);
    procedure txt_descricao_despesaExit(Sender: TObject);
    procedure txt_descricao_despesaKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure chb_selecionarClick(Sender: TObject);
    procedure btnInserirParcelasClick(Sender: TObject);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure Darbaixanascontasreunidasemparcelas1Click(Sender: TObject);
    procedure btnAjudaClick(Sender: TObject);
    procedure ItensCotaoCompra1Click(Sender: TObject);
    procedure DarBaixaemtodasascontasselecionadasdeumavez1Click(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_contas_pagar: Tfrm_contas_pagar;
  alterar : string;
  i_contTotalRegistrosSelecionados: integer;

implementation

uses unt_modulo, untConfirmarBaixaContasPagar, untRelContasPagar,
  untBaixaParcialParcela, untContasPagarParcelas, untAjudaContasPagar,
  untItensCotacaoContasPagar, untBaixaDeUmaVez;

{$R *.dfm}

procedure Tfrm_contas_pagar.Button1Click(Sender: TObject);
var
  total : real;
  cod_contas_pagar : integer;
begin

 //Limpa total selecionado p/ uma nova pesquisa
  txt_total_parcelas.Value := 0;

  if txt_descricao.Text = '' then
  begin
    showmessage('Coloque a descricao');
    txt_descricao.SetFocus;
    exit;
  end;

  if cboDespesa.Text = '' then
  begin
    showmessage('Coloque o tipo despesa');
    cboDespesa.SetFocus;
    exit;
  end;

  if cboDespesaSub.Text = '' then
  begin
    showmessage('Coloque o tipo despesa sub');
    cboDespesaSub.SetFocus;
    exit;
  end;

  if txt_valor.Text = '' then
  begin
    showmessage('Coloque o valor');
    txt_valor.SetFocus;
    exit;
  end;

  if rdg_opcao.ItemIndex = -1 then
  begin
    showmessage('Marque Venda ou Devolução ');
    exit;
  end;
    
  if alterar = 'N' THEN
  begin

    QRY_MAX_CODIGO.Close;
    QRY_MAX_CODIGO.SQL.Clear;
    QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM CONTAS_PAGAR');
    QRY_MAX_CODIGO.Open;
    cod_contas_pagar := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_contas_pagar.Close;
    qry_contas_pagar.SQL.Clear;
    qry_contas_pagar.SQL.Add('INSERT INTO CONTAS_PAGAR (CODIGO, DESCRICAO, DESPESA_OUTROS, VALOR, DATA_DESPESA, DATA_PGTO, PARCELA, TIP_CODIGO, TDS_CODIGO)  '+
                             'VALUES (:CODIGO, :DESCRICAO, :DESPESA_OUTROS, :VALOR, :DATA_DESPESA, :DATA_PGTO, :PARCELA, :TIP_CODIGO, :TDS_CODIGO)           ');
    qry_contas_pagar.ParamByName('CODIGO').AsInteger         := cod_contas_pagar;

  end;

  if alterar = 'S' THEN
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_contas_pagar.Close;
    qry_contas_pagar.SQL.Clear;
    qry_contas_pagar.SQL.Add('UPDATE CONTAS_PAGAR SET DESCRICAO=:DESCRICAO, DESPESA_OUTROS=:DESPESA_OUTROS,         '+
                             'VALOR=:VALOR, DATA_DESPESA=:DATA_DESPESA, DATA_PGTO=:DATA_PGTO, PARCELA=:PARCELA,     '+
                             'TIP_CODIGO=:TIP_CODIGO, TDS_CODIGO=:TDS_CODIGO  WHERE CODIGO=:CODIGO                  ');
    qry_contas_pagar.ParamByName('CODIGO').AsString       := txt_codigo.Text;

  end;

  qry_contas_pagar.ParamByName('DESCRICAO').AsString       := txt_descricao.Text + ' CARTAO ' + txt_data_despesa.Text;
  qry_contas_pagar.ParamByName('DESPESA_OUTROS').AsString  := txt_obs.Text;

  if rdg_opcao.ItemIndex = 0 then
    qry_contas_pagar.ParamByName('VALOR').AsFLOAT          := txt_valor.Value
  else
    qry_contas_pagar.ParamByName('VALOR').AsFLOAT          := txt_valor.Value * (-1);

  qry_contas_pagar.ParamByName('DATA_DESPESA').AsDateTime  := txt_data_despesa.Date;
  qry_contas_pagar.ParamByName('DATA_PGTO').AsDateTime     := txt_data_pgto.Date;
  qry_contas_pagar.ParamByName('PARCELA').AsString         := txt_num_parcela.Text;
  qry_contas_pagar.ParamByName('TIP_CODIGO').AsInteger     := cboDespesa.KeyValue;
  qry_contas_pagar.ParamByName('TDS_CODIGO').AsInteger     := cboDespesaSub.KeyValue;
  qry_contas_pagar.ExecSQL;
  IBTRANSLOCAL.Commit;

  qry_mostra_dados.Close;
  qry_mostra_dados.SQL.Clear;
  qry_mostra_dados.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa,                            '+
                           'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA, C.CODIGO_CONTAS_PAGAR_PARC, C.COT_CODIGO, C.AT_CODIGO,       '+
                           'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                                                      '+
                           'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO                                                                               '+
                           'FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                                                   '+
                           'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND C.TDS_CODIGO = TDS.TDS_CODIGO ORDER BY C.DATA_PGTO                                    ');
  qry_mostra_dados.Open;
  qry_mostra_dados.FetchAll;

  cdsMostraDados.Close;
  cdsMostraDados.FetchParams;
  cdsMostraDados.Open;

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CONTAS_PAGAR');
  qry_soma.Open;
  qry_soma.FetchAll;
  txt_total.Value := qry_soma.fieldbyname('TOTAL').AsFloat;

  cbodespesa.SetFocus;

  txt_descricao.Clear;
  txt_valor.Clear;
  txt_data_pgto.Clear;
  txt_data_despesa.Clear;
  cboDespesa.KeyValue := null;
  cboDespesaSub.KeyValue := null;
  txt_obs.Text:= 'PAGO C/ CARTAO';
  txt_num_parcela.Clear;
  txt_codigo.Clear;

  rdg_opcao.ItemIndex := -1;

  alterar := 'N';

end;

procedure Tfrm_contas_pagar.Apagar1Click(Sender: TObject);
begin

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir N. ' + cdsmostradados.FieldByName('CODIGO').AsString + ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_contas_pagar.Close;
    qry_contas_pagar.SQL.Clear;
    qry_contas_pagar.SQL.Add('DELETE FROM CONTAS_PAGAR WHERE CODIGO = '+ cdsmostradados.fieldbyname('CODIGO').AsString);
    qry_contas_pagar.ExecSQL;
    IBTRANSLOCAL.Commit;

    qry_mostra_dados.Close;
    qry_mostra_dados.SQL.Clear;
    qry_mostra_dados.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa,                           '+
                             'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA, C.CODIGO_CONTAS_PAGAR_PARC, C.COT_CODIGO, C.AT_CODIGO,      '+
                             'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                                                     '+
                             'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO, c.codigo_contas_pagar_parc                                                  '+
                             'FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                                                  '+
                             'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO                                                        '+
                             'ORDER BY C.DATA_PGTO                                                                                                       ');
    qry_mostra_dados.Open;
    qry_mostra_dados.FetchAll;

    cdsMostraDados.Close;
    cdsMostraDados.FetchParams;
    cdsMostraDados.Open;

    qry_soma.Close;
    qry_soma.SQL.Clear;
    qry_soma.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CONTAS_PAGAR');
    qry_soma.Open;
    qry_soma.FetchAll;
    txt_total.Value := qry_soma.fieldbyname('TOTAL').AsFloat;

    txt_descricao.SetFocus;

    txt_descricao.Clear;
    txt_valor.Clear;
    txt_data_despesa.Clear;
    txt_data_pgto.Clear;
    cboDespesa.KeyValue := null;
    txt_obs.Clear;

  end;//YES
    IDNO : Exit;
  end; //FIM CASE

end;

procedure Tfrm_contas_pagar.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure Tfrm_contas_pagar.txt_valorKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    txt_data_despesa.SetFocus;
end;

procedure Tfrm_contas_pagar.txt_data_pgtoKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    txt_num_parcela.SetFocus;
end;

procedure Tfrm_contas_pagar.FormShow(Sender: TObject);
begin
  qry_mostra_dados.Close;
  qry_mostra_dados.SQL.Clear;
  qry_mostra_dados.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa,                           '+
                           'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA, C.CODIGO_CONTAS_PAGAR_PARC, C.COT_CODIGO, C.AT_CODIGO,      '+
                           'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                                                     '+
                           'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO                                                                              '+
                           'FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                                                  '+
                           'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO                                                        '+
                           'ORDER BY C.DATA_PGTO                                                                                                       ');
  qry_mostra_dados.Open;
  qry_mostra_dados.FetchAll;

  cdsMostraDados.Close;
  cdsMostraDados.FetchParams;
  cdsMostraDados.Open;

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CONTAS_PAGAR');
  qry_soma.Open;
  qry_soma.FetchAll;
  txt_total.Value := qry_soma.fieldbyname('TOTAL').AsFloat;

  qryDespesa.Close;
  qryDespesa.SQL.Clear;
  qryDespesa.SQL.Add('SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'+#39+' - '+#39+'|| TIP_DESCRICAO AS DESPESA FROM TIPO_DESPESA');
  qryDespesa.Open;
  qryDespesa.FetchAll;

  qry_despesa_pesquisa.Close;
  qry_despesa_pesquisa.SQL.Clear;
  qry_despesa_pesquisa.SQL.Add('SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'+#39+' - '+#39+'|| TIP_DESCRICAO AS DESPESA FROM TIPO_DESPESA');
  qry_despesa_pesquisa.Open;
  qry_despesa_pesquisa.FetchAll;

  qrydespesa_pesquisaSub.Close;
  qrydespesa_pesquisaSub.SQL.Clear;
  qrydespesa_pesquisaSub.SQL.Add('SELECT TDS_CODIGO, TDS_DESCRICAO, TDS_CODIGO ||'+#39+' - '+#39+'|| TDS_DESCRICAO AS DESPESA_SUB '+
                                 'FROM TIPO_DESPESA_SUB                                                                           ');
  qrydespesa_pesquisaSub.Open;
  qrydespesa_pesquisaSub.FetchAll;

  rdg_data.ItemIndex := 0;

  rdg_opcao.ItemIndex := -1;

  i_contTotalRegistrosSelecionados:= 0;
  txtTotalRegistrosSelecionados.text:= '0';
  txtTotalRegistros.text:= '0';

  cboDespesa.SetFocus;

  alterar := 'N';

  txt_obs.Text := 'PAGO C/ CARTAO';

end;

procedure Tfrm_contas_pagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_contas_pagar := nil;
  action:= cafree;
end;

procedure Tfrm_contas_pagar.cbo_tipo_despesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.SetFocus;
end;

procedure Tfrm_contas_pagar.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure Tfrm_contas_pagar.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color :=  $00F5EEDE;
end;

procedure Tfrm_contas_pagar.txt_valorEnter(Sender: TObject);
begin
  txt_valor.Color :=  $00F5EEDE;
end;

procedure Tfrm_contas_pagar.txt_valorExit(Sender: TObject);
begin
  txt_Valor.Color := clwindow;
end;

procedure Tfrm_contas_pagar.txt_data_pgtoEnter(Sender: TObject);
begin
  txt_data_pgto.Color :=  $00F5EEDE;
end;

procedure Tfrm_contas_pagar.txt_data_pgtoExit(Sender: TObject);
begin
  txt_data_pgto.Color := clwindow;
end;

procedure Tfrm_contas_pagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const
CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,
      DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  CheckBoxRectangle : TRect;
  Bitmap: TBitmap;
begin

  if (cdsMostraDados.FieldByName('CODIGO_CONTAS_PAGAR_PARC').AsString <> '') and (cdsMostraDados.FieldByName('VALOR').AsFloat > 0 ) THEN
    DBGrid1.Canvas.Brush.Color := claqua
  else IF (cdsMostraDados.FieldByName('VALOR').AsFloat > 0 ) then
    DBGrid1.Canvas.Brush.Color := clwindow
  else IF (cdsMostraDados.FieldByName('VALOR').AsFloat < 0 ) then
    DBGrid1.Canvas.Brush.Color := $004080FF;

  if (cdsMostraDados.FieldByName('COT_CODIGO').AsString <> '' ) then
    DBGrid1.Canvas.Brush.Color := clInactiveCaption;

  if (gdSelected in state) then
  with (Sender as TDBGrid).Canvas do
  begin

    Font.Style  := [fsbold];
    DBGrid1.Canvas.Brush.Color := clWhite;

    if (cdsMostraDados.FieldByName('CODIGO_CONTAS_PAGAR_PARC').AsString <> '') and (cdsMostraDados.FieldByName('VALOR').AsFloat > 0 ) THEN
      DBGrid1.Canvas.Brush.Color := claqua
    else IF (cdsMostraDados.FieldByName('VALOR').AsFloat > 0 ) then
      DBGrid1.Canvas.Brush.Color := clwindow
    else IF (cdsMostraDados.FieldByName('VALOR').AsFloat < 0 ) then
      DBGrid1.Canvas.Brush.Color := $004080FF;

    if (cdsMostraDados.FieldByName('COT_CODIGO').AsString <> '' ) then
      DBGrid1.Canvas.Brush.Color := clInactiveCaption;

  end;

  if cdsMostraDados.FieldByName('CHECKED').AsString = 'T' then
  begin
    DBGrid1.Canvas.Brush.Color := $00FF8080;
  end;

  dbgrid1.Canvas.Font.Color:= clBlack;
  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Column.Field.FieldName = 'CHECKED') and (cdsMostraDados.RecordCount > 0)  then
  begin
    Self.DBGrid1.Canvas.FillRect(Rect);
    CheckBoxRectangle.Left := Rect.Left + 2;
    CheckBoxRectangle.Right := Rect.Right - 2;
    CheckBoxRectangle.Top := Rect.Top + 2;
    CheckBoxRectangle.Bottom := Rect.Bottom - 2;
    DrawFrameControl(Self.DBGrid1.Canvas.Handle,
    CheckBoxRectangle, DFC_BUTTON,
    CtrlState[Column.Field.AsBoolean]);
  end;

end;

procedure Tfrm_contas_pagar.DarbaixadiretonoCadDespesas1Click(
  Sender: TObject);
begin

  if cdsMostraDados.FieldByName('CODIGO_CONTAS_PAGAR_PARC').AsString <> '' THEN
  begin
    showmessage('Esta parcela nao pode dar baixa direto no Cad. Despesa');
    exit;
  end;

  if cdsMostraDados.FieldByName('VALOR').ASFLOAT < 0 THEN
  begin
    showmessage('Devolução nao pode ser baixada');
    exit;
  end;

  Application.CreateForm(TfrmConfirmarBaixaContasPagar, frmConfirmarBaixaContasPagar);
  frmConfirmarBaixaContasPagar.txt_codigo.Text := cdsMostraDados.fieldbyname('CODIGO').AsString;
  frmConfirmarBaixaContasPagar.txt_valor.Text  := formatfloat('###,##0.00', cdsMostraDados.fieldbyname('VALOR').AsFloat);
  frmConfirmarBaixaContasPagar.txt_data.Date := now;
  frmConfirmarBaixaContasPagar.show;
  
end;

procedure Tfrm_contas_pagar.txt_num_parcelaEnter(Sender: TObject);
begin
  txt_num_parcela.Color := $00F5EEDE;
end;

procedure Tfrm_contas_pagar.txt_num_parcelaExit(Sender: TObject);
begin
  txt_num_parcela.Color := clwindow;
end;

procedure Tfrm_contas_pagar.txt_num_parcelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    txt_descricao.SetFocus;
end;

procedure Tfrm_contas_pagar.btnPesquisarClick(Sender: TObject);
var
  dta, data1, data2, mensagem, despesa, despesa_outros, despesa_sub : string;
begin
  //Limpa total seelcionado p/ uma nova pesquisa
  txt_total_parcelas.Value := 0;
  i_contTotalRegistrosSelecionados:=0;
  txtTotalRegistrosSelecionados.text:= '0';

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if rdg_data.ItemIndex = 0 then
  begin
    if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
      dta := ' AND DATA_DESPESA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
    else
      dta := '';
  end
  else
  begin
    if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
      dta := ' AND DATA_PGTO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
    else
      dta := '';
  end;

  if cboDespesa_PESQUISA.Text <> '' then
    despesa := ' AND T.TIP_CODIGO = ' + IntToStr(cboDespesa_pesquisa.KeyValue)
  else
    despesa := ''; 

  if cboDespesa_PESQUISASUB.Text <> '' then
    despesa_sub := ' AND TDS.TDS_CODIGO = ' + IntToStr(cboDespesa_pesquisaSub.KeyValue)
  else
    despesa_sub := '';

  if (txt_descricao_despesa.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + txt_descricao_despesa.Text + '%' + #39 + ')'
  else if (txt_descricao_despesa.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_descricao_despesa.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  qry_mostra_dados.Close;
  qry_mostra_dados.SQL.Clear;
  qry_mostra_dados.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa,                           '+
                           'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA, C.CODIGO_CONTAS_PAGAR_PARC, C.COT_CODIGO, C.AT_CODIGO,      '+
                           'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                                                     '+
                           'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO                                                                              '+
                           'FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                                                  '+
                           'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO ' + dta + despesa + despesa_sub + despesa_outros        +
                           'ORDER BY C.DATA_PGTO                                                                                                       ');
  qry_mostra_dados.Open;
  qry_mostra_dados.FetchAll;

  cdsMostraDados.Close;
  cdsMostraDados.FetchParams;
  cdsMostraDados.Open;

  txtTotalRegistros.Text := inttostr(cdsMostraDados.RecordCount);

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS '+
      'WHERE T.TIP_CODIGO = C.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO ' + dta + despesa + despesa_sub + despesa_outros);
  qry_soma.Open;
  qry_soma.FetchAll;
  txt_total.Value := qry_soma.fieldbyname('TOTAL').AsFloat;

end;

procedure Tfrm_contas_pagar.txt_data_despesaEnter(Sender: TObject);
begin
  txt_data_despesa.Color :=$00F5EEDE;
end;

procedure Tfrm_contas_pagar.txt_data_despesaExit(Sender: TObject);
begin
  txt_data_despesa.Color := clwindow;
end;

procedure Tfrm_contas_pagar.txt_data_despesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data_pgto.SetFocus;
end;

procedure Tfrm_contas_pagar.DBGrid1DblClick(Sender: TObject);
begin

  txt_descricao.Text := cdsmostradados.fieldbyname('DESCRICAO').AsString;

  cboDespesa.KeyValue := cdsmostradados.fieldbyname('TIP_CODIGO').AsString;

  cboDespesaSub.KeyValue := cdsmostradados.fieldbyname('TDS_CODIGO').AsString;

  txt_num_parcela.Text := cdsmostradados.fieldbyname('PARCELA').AsString;
  txt_obs.Text := cdsmostradados.fieldbyname('DESPESA_OUTROS').AsString;

  txt_valor.Value := cdsmostradados.fieldbyname('VALOR').AsFloat;

  txt_data_despesa.Text := cdsmostradados.fieldbyname('DATA_DESPESA').AsString;
  txt_data_pgto.Text := cdsmostradados.fieldbyname('DATA_PGTO').AsString;
  txt_codigo.Text := cdsmostradados.fieldbyname('CODIGO').AsString;

  if txt_valor.Value > 0 then
    rdg_opcao.ItemIndex :=  0
  else
    rdg_opcao.ItemIndex :=  -1;

  alterar := 'S';

end;

procedure Tfrm_contas_pagar.Button2Click(Sender: TObject);
var
  data1, data2, dta, mensagem, despesa, despesa_outros : string;
begin

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if rdg_data.ItemIndex = 0 then
  begin
    if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
      dta := ' AND DATA_DESPESA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
    else
      dta := '';
  end
  else
  begin
    if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
      dta := ' AND DATA_PGTO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
    else
      dta := '';
  end;

  if cboDespesa_PESQUISA.Text <> '' then
    despesa := ' AND T.TIP_CODIGO = ' + IntToStr(cboDespesa_pesquisa.KeyValue)
  else
    despesa := '';

  if (txt_descricao_despesa.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + txt_descricao_despesa.Text + '%' + #39 + ')'
  else if (txt_descricao_despesa.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_descricao_despesa.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  frmRelContasPagar.qry_pesquisa.Close;
  frmRelContasPagar.qry_pesquisa.SQL.Clear;
  frmRelContasPagar.qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM C.DATA_PGTO) AS MES, EXTRACT(YEAR FROM C.DATA_PGTO) AS ANO,                   '+
                                         'C.CODIGO, C.DATA_PGTO, C.DESCRICAO, C.VALOR, C.DATA_DESPESA                                             '+
                                         'FROM CONTAS_PAGAR C, TIPO_DESPESA T WHERE C.TIP_CODIGO = T.TIP_CODIGO ' + dta + despesa + despesa_outros +
                                         'GROUP BY EXTRACT(MONTH FROM C.DATA_PGTO), EXTRACT(YEAR FROM C.DATA_PGTO),                               '+
                                         'C.CODIGO, C.DATA_PGTO, C.DESCRICAO, C.VALOR, C.DATA_DESPESA                                             '+
                                         'order by EXTRACT(YEAR FROM C.DATA_PGTO), EXTRACT(month FROM C.DATA_PGTO)                                ');
  frmRelContasPagar.qry_pesquisa.Open;
  frmRelContasPagar.qry_pesquisa.FetchAll;

  if frmRelContasPagar.qry_pesquisa.isempty then
  begin
    mensagem := 'Registro nao encontrado !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  frmRelContasPagar.lbl_data.caption := txt_data_i.Text + ' a ' + txt_data_f.Text;

  frmRelContasPagar.frRelatorio.Prepare;
  frmRelContasPagar.frRelatorio.PreviewModal;

end;

procedure Tfrm_contas_pagar.DarBaixaParcialnaparcela1Click(
  Sender: TObject);
begin

  if cdsMostraDados.FieldByName('CODIGO_CONTAS_PAGAR_PARC').AsString <> '' THEN
  begin
    showmessage('Esta parcela nao pode dar baixa parcial no Cad. Despesa');
    exit;
  end;

  if cdsMostraDados.FieldByName('VALOR').ASFLOAT < 0 THEN
  begin
    showmessage('Devolução nao pode ser baixada');
    exit;
  end;

  Application.CreateForm(TfrmBaixaParcialParcela, frmBaixaParcialParcela);
  frmBaixaParcialParcela.txt_codigo.Text := cdsMostraDados.fieldbyname('CODIGO').AsString;
  frmBaixaParcialParcela.txt_valor.Text  := formatfloat('###,##0.00', cdsMostraDados.fieldbyname('VALOR').AsFloat);
  frmBaixaParcialParcela.txt_data.Date := now;
  frmBaixaParcialParcela.show;

end;

procedure Tfrm_contas_pagar.cboDespesa_pesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
  begin
    cboDespesa_pesquisa.KeyValue := -1;
    qrydespesa_pesquisaSub.Close;
    qrydespesa_pesquisaSub.SQL.Clear;
    qrydespesa_pesquisaSub.SQL.Add('SELECT TDS_CODIGO, TDS_DESCRICAO, TDS_CODIGO ||'+#39+' - '+#39+'|| TDS_DESCRICAO AS DESPESA_SUB '+
                                   'FROM TIPO_DESPESA_SUB                                                                           ');
    qrydespesa_pesquisaSub.Open;
    qrydespesa_pesquisaSub.FetchAll;
  end;

end;

procedure Tfrm_contas_pagar.dsDespesaDataChange(Sender: TObject;
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

procedure Tfrm_contas_pagar.cboDespesaSubEnter(Sender: TObject);
begin
  cboDespesaSub.Color := $00F5EEDE;
end;

procedure Tfrm_contas_pagar.cboDespesaSubExit(Sender: TObject);
begin
  cboDespesaSub.Color := clwindow;
end;

procedure Tfrm_contas_pagar.cboDespesaSubKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_valor.SetFocus;
end;

procedure Tfrm_contas_pagar.cboDespesaEnter(Sender: TObject);
begin
  cboDespesa.Color := $00F5EEDE;
end;

procedure Tfrm_contas_pagar.cboDespesaExit(Sender: TObject);
begin
  cboDespesa.Color := clwindow;
end;

procedure Tfrm_contas_pagar.cboDespesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cbodespesasub.SetFocus;
end;

procedure Tfrm_contas_pagar.cboDespesa_pesquisaSubKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    cboDespesa_pesquisaSub.KeyValue := -1;
end;

procedure Tfrm_contas_pagar.dsDespesa_pesquisaDataChange(Sender: TObject;
  Field: TField);
begin
  qryDespesa_pesquisaSub.Close;
  qryDespesa_pesquisaSub.SQL.Clear;
  qryDespesa_pesquisaSub.SQL.Add('SELECT TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_SUB, TDS.tds_codigo    '+
                                 'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS                                    '+
                                 'WHERE I.TIP_CODIGO = TD.TIP_CODIGO AND I.TDS_CODIGO = TDS.TDS_CODIGO AND TD.TIP_CODIGO=:TIP_CODIGO '+
                                 'ORDER BY TD.TIP_DESCRICAO                                                                          ');
  qryDespesa_pesquisaSub.ParamByName('TIP_CODIGO').AsString := qry_despesa_pesquisa.FIELDBYNAME('TIP_CODIGO').AsString;
  qryDespesa_pesquisaSub.Open;
  qryDespesa_pesquisaSub.FetchAll;
end;

procedure Tfrm_contas_pagar.txt_descricao_despesaEnter(Sender: TObject);
begin
  txt_descricao_despesa.Color :=  $00F5EEDE;
end;

procedure Tfrm_contas_pagar.txt_descricao_despesaExit(Sender: TObject);
begin
  txt_descricao_despesa.Color := clwindow;
end;

procedure Tfrm_contas_pagar.txt_descricao_despesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnPesquisar.SetFocus;
end;

procedure Tfrm_contas_pagar.DBGrid1TitleClick(Column: TColumn);
var
  dta, data1, data2, mensagem, despesa, despesa_outros, despesa_sub, campo : string;
begin

  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

  if (campo = 'codigo') or (campo = 'descricao') or (campo = 'valor') or
    (campo = 'data_pgto') or (campo = 'despesa_outros') or (campo = 'parcela') or
    (campo = 'data_despesa') then
      campo := 'C.' + campo
  else if (campo = 'DESPESA') Then
    campo := 'T.tip_codigo '
  else if (campo = 'DESPESA_SUB') then
    campo := 'TDS.TDS_CODIGO '
  else
    campo := '' + campo ;

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    if rdg_data.ItemIndex = 0 then
      dta := ' AND DATA_DESPESA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
    ELSE
      dta := ' AND DATA_PGTO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if cboDespesa_PESQUISA.Text <> '' then
    despesa := ' AND T.TIP_CODIGO = ' + IntToStr(cboDespesa_pesquisa.KeyValue)
  else
    despesa := '';

 if cboDespesa_PESQUISASUB.Text <> '' then
  despesa_sub := ' AND TDS.TDS_CODIGO = ' + IntToStr(cboDespesa_pesquisaSub.KeyValue)
 else
  despesa_sub := '';

  if (txt_descricao_despesa.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + txt_descricao_despesa.Text + '%' + #39 + ')'
  else if (txt_descricao_despesa.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_descricao_despesa.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  qry_mostra_dados.Close;
  qry_mostra_dados.SQL.Clear;
  qry_mostra_dados.SQL.Add('SELECT C.codigo, C.descricao, C.valor, C.data_pgto, C.despesa_outros, C.parcela, C.data_despesa,                           '+
                           'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA, C.CODIGO_CONTAS_PAGAR_PARC, C.COT_CODIGO, C.AT_CODIGO,      '+
                           'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB,                                                     '+
                           'T.TIP_CODIGO, T.TIP_DESCRICAO, TDS.TDS_CODIGO                                                                              '+
                           'FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                                                  '+
                           'WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO ' + dta + despesa + despesa_sub + despesa_outros        +
                           'ORDER BY ' + campo                                                                                                          );
  qry_mostra_dados.Open;
  qry_mostra_dados.FetchAll;

  cdsMostraDados.Close;
  cdsMostraDados.FetchParams;
  cdsMostraDados.Open;

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                 '+
                   'WHERE T.TIP_CODIGO = C.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO ' + dta + despesa + despesa_sub + despesa_outros  );
  qry_soma.Open;
  qry_soma.FetchAll;
  txt_total.Value := qry_soma.fieldbyname('TOTAL').AsFloat;

end;

procedure Tfrm_contas_pagar.DBGrid1CellClick(Column: TColumn);
begin
if cdsMostraDados.IsEmpty then
    Exit;

  if Column.Field = cdsMostraDadosCHECKED then
  begin
    if (DBGrid1.SelectedField.DataType = ftString) and (Column.Field.FieldName = 'CHECKED')  then
    begin
      DBGrid1.SelectedField.Dataset.Edit;
      DBGrid1.SelectedField.AsBoolean := not Self.DBGrid1.SelectedField.AsBoolean;
      DBGrid1.SelectedField.Dataset.Post;

      if cdsMostraDados.FieldByName('CHECKED').AsString = 'T' then
      begin
        txt_total_parcelas.Value := txt_total_parcelas.Value + cdsMostraDados.fieldbyname('VALOR').AsFloat;
        i_contTotalRegistrosSelecionados := i_contTotalRegistrosSelecionados + 1; 
      end
      else
      begin
        txt_total_parcelas.Value := txt_total_parcelas.Value - cdsMostraDados.fieldbyname('VALOR').AsFloat;
        i_contTotalRegistrosSelecionados := i_contTotalRegistrosSelecionados - 1;
      end;

      txtTotalRegistrosSelecionados.text:= inttostr(i_contTotalRegistrosSelecionados);
    end; 
  end;
end;

procedure Tfrm_contas_pagar.chb_selecionarClick(Sender: TObject);
begin
  if cdsMostraDados.IsEmpty then
    exit;

  if chb_selecionar.Checked = True then
  begin   
    txt_total_parcelas.Value :=0;
    i_contTotalRegistrosSelecionados:=0;

    if cdsMostraDados.RecordCount > 0 then
    begin
      cdsMostraDados.First;
      while not cdsMostraDados.Eof do
      begin
        if DBGrid1.SelectedField.AsBoolean = True then
        begin
          DBGrid1.SelectedField.Dataset.Edit;
          DBGrid1.SelectedField.AsBoolean := DBGrid1.SelectedField.AsBoolean;
          DBGrid1.SelectedField.Dataset.Post;

          if cdsMostraDados.FieldByName('CHECKED').AsString = 'T' then
          begin
            txt_total_parcelas.Value := txt_total_parcelas.Value + cdsMostraDados.fieldbyname('VALOR').AsFloat;
            i_contTotalRegistrosSelecionados:= i_contTotalRegistrosSelecionados +1;
          end
          else
          begin
            txt_total_parcelas.Value := txt_total_parcelas.Value - cdsMostraDados.fieldbyname('VALOR').AsFloat;
            i_contTotalRegistrosSelecionados:= i_contTotalRegistrosSelecionados -1;
          end;

        end
        else
        begin
          DBGrid1.SelectedField.Dataset.Edit;
          DBGrid1.SelectedField.AsBoolean := not DBGrid1.SelectedField.AsBoolean;
          DBGrid1.SelectedField.Dataset.Post;

          if cdsMostraDados.FieldByName('CHECKED').AsString = 'T' then
          begin
            txt_total_parcelas.Value := txt_total_parcelas.Value + cdsMostraDados.fieldbyname('VALOR').AsFloat;
            i_contTotalRegistrosSelecionados:= i_contTotalRegistrosSelecionados +1;
          end
          else
          begin
            txt_total_parcelas.Value := txt_total_parcelas.Value - cdsMostraDados.fieldbyname('VALOR').AsFloat;
            i_contTotalRegistrosSelecionados:= i_contTotalRegistrosSelecionados -1;
          end;

        end;
      cdsMostraDados.Next;
      end; // WHILE
    end; // RECORDCOUNT > 0
  end //IF CHECKBOX = TRUE
  else
  begin
    if cdsMostraDados.RecordCount > 0 then
    begin
      cdsMostraDados.First;
      while not cdsMostraDados.Eof do
      begin
        if DBGrid1.SelectedField.AsBoolean = False then
        begin
          DBGrid1.SelectedField.Dataset.Edit;
          DBGrid1.SelectedField.AsBoolean := DBGrid1.SelectedField.AsBoolean;
          DBGrid1.SelectedField.Dataset.Post;  

        end
        else
        begin
          DBGrid1.SelectedField.Dataset.Edit;
          DBGrid1.SelectedField.AsBoolean := not DBGrid1.SelectedField.AsBoolean;
          DBGrid1.SelectedField.Dataset.Post;

          if cdsMostraDados.FieldByName('CHECKED').AsString = 'T' then
          begin
            txt_total_parcelas.Value := txt_total_parcelas.Value + cdsMostraDados.fieldbyname('VALOR').AsFloat;
            i_contTotalRegistrosSelecionados:= i_contTotalRegistrosSelecionados +1;
          end
          else
          begin
            txt_total_parcelas.Value := txt_total_parcelas.Value - cdsMostraDados.fieldbyname('VALOR').AsFloat;
            i_contTotalRegistrosSelecionados:= i_contTotalRegistrosSelecionados -1;
          end;  

        end;
      cdsMostraDados.Next;
      end; // WHILE
    end; // RECORDCOUNT > 0
  end; // BEGIN ELSE

  txtTotalRegistrosSelecionados.Text := inttostr(i_contTotalRegistrosSelecionados);

end;

procedure Tfrm_contas_pagar.btnInserirParcelasClick(Sender: TObject);
var
  valor_parcela, parcela, parcela_falta : real;
  codigo, num_parcela : integer;
begin
  cdsMostraDados.First;

  while not cdsMostraDados.Eof do
  begin
    if cdsmostradados.FieldByName('CHECKED').AsString = 'T' then
    begin
      if cdsmostradados.FieldByName('CODIGO_CONTAS_PAGAR_PARC').AsString <> '' then
      begin
        showmessage('Esta conta nao pode inserir nas parcelas');
        exit;
      end;
    end;
   cdsMostraDados.Next;
  end;

  cdsMostraDados.First;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM CONTAS_PAGAR_PARCELAS');
  QRY_MAX_CODIGO.Open;

  codigo := QRY_MAX_CODIGO.fieldbyname('CODIGO').AsInteger + 1;

  while not cdsmostradados.Eof do
  begin
    if cdsmostradados.FieldByName('CHECKED').AsString = 'T' then
    begin
      if not IBTRANSLOCAL.InTransaction then
        IBTRANSLOCAL.StartTransaction;
      qry_contas_pagar.Close;
      qry_contas_pagar.SQL.Clear;
      qry_contas_pagar.SQL.Add('INSERT INTO CONTAS_PAGAR_PARCELAS (CODIGO, DESCRICAO, DESPESA_OUTROS, VALOR, DATA_DESPESA, DATA_PGTO, PARCELA,  '+
                               'TIP_CODIGO, TDS_CODIGO, CODIGO_CONTAS_PAGAR, AT_CODIGO, COT_CODIGO)                                             '+
                               'VALUES (:CODIGO, :DESCRICAO, :DESPESA_OUTROS, :VALOR, :DATA_DESPESA, :DATA_PGTO, :PARCELA,                      '+
                               ':TIP_CODIGO, :TDS_CODIGO, :CODIGO_CONTAS_PAGAR, :AT_CODIGO, :COT_CODIGO)                                        '); 

      qry_contas_pagar.ParamByName('CODIGO').AsInteger         := codigo;
      qry_contas_pagar.ParamByName('DESCRICAO').AsString       := cdsmostradados.fieldbyname('DESCRICAO').AsString;
      qry_contas_pagar.ParamByName('DESPESA_OUTROS').AsString  := cdsmostradados.fieldbyname('DESPESA_OUTROS').AsString;
      qry_contas_pagar.ParamByName('VALOR').AsFLOAT            := cdsmostradados.fieldbyname('VALOR').AsFloat;
      qry_contas_pagar.ParamByName('DATA_DESPESA').AsDateTime  := cdsmostradados.fieldbyname('DATA_DESPESA').AsDateTime;
      qry_contas_pagar.ParamByName('DATA_PGTO').AsDateTime     := cdsmostradados.fieldbyname('DATA_PGTO').AsDateTime;
      qry_contas_pagar.ParamByName('PARCELA').AsString         := cdsmostradados.fieldbyname('PARCELA').AsString;
      qry_contas_pagar.ParamByName('TIP_CODIGO').AsInteger     := cdsmostradados.fieldbyname('TIP_CODIGO').AsInteger;
      qry_contas_pagar.ParamByName('TDS_CODIGO').AsInteger     := cdsmostradados.fieldbyname('TDS_CODIGO').AsInteger;
      qry_contas_pagar.ParamByName('CODIGO_CONTAS_PAGAR').AsInteger  := cdsmostradados.fieldbyname('CODIGO').AsInteger;
      qry_contas_pagar.ParamByName('AT_CODIGO').AsString       := cdsmostradados.fieldbyname('AT_CODIGO').AsString;
      qry_contas_pagar.ParamByName('COT_CODIGO').AsString      := cdsmostradados.fieldbyname('COT_CODIGO').AsString;

      qry_contas_pagar.ExecSQL;
      IBTRANSLOCAL.Commit;
    end;
    cdsmostradados.Next;

end;

  Application.CreateForm(TfrmContasPagarParcelas, frmContasPagarParcelas);
  frmContasPagarParcelas.txt_codigo.Text := inttostr(codigo);
  frmContasPagarParcelas.btnSair.Enabled := false;
  frmContasPagarParcelas.show;

end;

procedure Tfrm_contas_pagar.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure Tfrm_contas_pagar.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure Tfrm_contas_pagar.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    button1.SetFocus;
end;

procedure Tfrm_contas_pagar.Darbaixanascontasreunidasemparcelas1Click(
  Sender: TObject);
begin
  if cdsMostraDados.FieldByName('CODIGO_CONTAS_PAGAR_PARC').AsString = '' THEN
  begin
    showmessage('Operacao nao permitida');
    exit;
  end;

  if cdsMostraDados.FieldByName('VALOR').ASFLOAT < 0 THEN
  begin
     showmessage('Devolução nao pode ser baixada');
     exit;
  end;

  Application.CreateForm(TfrmContasPagarParcelas, frmContasPagarParcelas);
  frmContasPagarParcelas.txt_descricao.Text := cdsMostraDados.fieldbyname('DESCRICAO').AsString;
  frmContasPagarParcelas.txt_obs.Text  :=  cdsMostraDados.fieldbyname('DESPESA_OUTROS').AsString;

  frmContasPagarParcelas.gpbDados.Enabled := false;

  frmContasPagarParcelas.show;
end;

procedure Tfrm_contas_pagar.btnAjudaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAjudaContasPagar, frmAjudaContasPagar);
  frmAjudaContasPagar.show;
end;

procedure Tfrm_contas_pagar.ItensCotaoCompra1Click(Sender: TObject);
var
  linha : integer;
begin

  if cdsMostraDados.FieldByName('CODIGO_CONTAS_PAGAR_PARC').AsString <> '' THEN
  begin
    showmessage('Esta parcela nao pode ser inserido itens do cotacao de compra');
    exit;
  end;

  Application.CreateForm(TfrmItensCotacaoContasPagar, frmItensCotacaoContasPagar);   

  frmItensCotacaoContasPagar.Memo1.Text := ' Valor(R$) = ' + formatfloat('###,##0.00', cdsMostraDados.fieldbyname('VALOR').AsFloat) +
                    ' Data Emissao = ' + cdsMostraDados.fieldbyname('DATA_DESPESA').AsString;

  frmItensCotacaoContasPagar.txt_codigo.Text := cdsMostraDados.fieldbyname('CODIGO').AsString;
  linha := DBGrid1.DataSource.DataSet.RecNo;
  cdsMostraDados.First;
  while not cdsMostraDados.Eof do
  begin
    if cdsMostraDados.FieldByName('CHECKED').AsString = 'T' then
    begin
      frmItensCotacaoContasPagar.mmoCodigo.Lines.Add(cdsMostraDados.fieldbyname('CODIGO').AsString);
    end;
    cdsMostraDados.Next;
  end;
  DBGrid1.DataSource.DataSet.RecNo := linha;

  frmItensCotacaoContasPagar.show;  
end;

procedure Tfrm_contas_pagar.DarBaixaemtodasascontasselecionadasdeumavez1Click(
  Sender: TObject);
begin
  if cdsMostraDados.FieldByName('CODIGO_CONTAS_PAGAR_PARC').AsString <> '' THEN
  begin
    showmessage('Esta parcela nao pode dar baixa direto no Cad. Despesa');
    exit;
  end;

  if cdsMostraDados.FieldByName('VALOR').ASFLOAT < 0 THEN
  begin
    showmessage('Devolução nao pode ser baixada');
    exit;
  end;

  Application.CreateForm(TfrmBaixaDeUmaVez, frmBaixaDeUmaVez);

  cdsMostraDados.First;

  while not cdsMostraDados.Eof do
  begin
    if cdsMostraDados.FieldByName('CHECKED').AsString = 'T' then
    begin
      frmBaixaDeUmaVez.txt_Valor.Value := frmBaixaDeUmaVez.txt_Valor.Value +  cdsMostraDados.fieldbyname('VALOR').asfloat;
      frmBaixaDeUmaVez.mmoContas.Lines.Add(cdsMostraDados.fieldbyname('CODIGO').AsString + '    ' + cdsMostraDados.fieldbyname('DESCRICAO').AsString + '       ' + formatfloat('###,##0.00', cdsMostraDados.fieldbyname('VALOR').asfloat));
      frmBaixaDeUmaVez.mmoContas.Lines.Add('_________________________________________________________________________________________________________ ');
    end;
    cdsMostraDados.Next;
  end; 
  frmBaixaDeUmaVez.showmodal;
end;

end.
