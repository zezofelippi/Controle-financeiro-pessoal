unit untRelUnidosContasPagarContasPagasTotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids, DB,
  IBCustomDataSet, IBQuery, Menus;

type
  TfrmRelUnidosContasPagarContasPagasTotal = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    gpb1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    txt_data_i: TDateEdit;
    txt_data_f: TDateEdit;
    Label3: TLabel;
    cboDespesa: TDBLookupComboBox;
    Label5: TLabel;
    txt_despesa_outros: TEdit;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    cboDespesaSub: TDBLookupComboBox;
    Label15: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    txt_total: TCurrencyEdit;
    txtTotalRegistros: TEdit;
    Label23: TLabel;
    ds_pesquisa: TDataSource;
    qry_pesquisa: TIBQuery;
    qry_pesquisaDATAPGTO: TDateTimeField;
    qry_pesquisaCODIGO: TIntegerField;
    qry_pesquisaDESCRICAO: TIBStringField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaDESPESA: TIBStringField;
    qry_pesquisaDESPESA_SUB: TIBStringField;
    qry_pesquisaCOT_CODIGO: TIntegerField;
    qry_pesquisaAT_CODIGO: TIntegerField;
    dsDespesa: TDataSource;
    qryDespesa: TIBQuery;
    dsDespesaSub: TDataSource;
    qryDespesaSub: TIBQuery;
    qryDespesaSubDESPESA_SUB: TIBStringField;
    qryDespesaSubTDS_CODIGO: TIntegerField;
    qry_soma: TIBQuery;
    PopupMenu1: TPopupMenu;
    ItensCotao1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure cboDespesaExit(Sender: TObject);
    procedure cboDespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboDespesaSubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ItensCotao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelUnidosContasPagarContasPagasTotal: TfrmRelUnidosContasPagarContasPagasTotal;

implementation

uses unt_modulo, untItensCotacaoCompra;

{$R *.dfm}

procedure TfrmRelUnidosContasPagarContasPagasTotal.Button1Click(
  Sender: TObject);
var
  dta,  data1, data2, despesa, despesa_outros, mensagem, ordenar : string;
  despesa_sub : string;
  total_valor: real;

begin

  if (txt_data_i.Text ='  /  /    ') and (txt_data_f.Text = '  /  /    ') then
  begin
    mensagem := 'Informe uma Data !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT C.data_despesa AS DATAPGTO,  ');
  qry_pesquisa.SQL.Add('C.codigo, C.descricao as descricao, C.valor,         ');
  qry_pesquisa.SQL.Add('T.tip_codigo ||'' - ''|| T.tip_descricao AS DESPESA, ');
  qry_pesquisa.SQL.Add('TDS.TDS_codigo ||'' - ''|| TDS.TDS_descricao AS DESPESA_SUB, C.COT_CODIGO, C.AT_CODIGO ');
  qry_pesquisa.SQL.Add('FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                              ');
  qry_pesquisa.SQL.Add('WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO and                ');
  qry_pesquisa.SQL.Add('data_despesa between :data1 and :data2                                                 ');
  if cboDespesa.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');

   if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
   if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

  qry_pesquisa.SQL.Add('union                                                                                  ');
  
  //Despesas filho
  qry_pesquisa.SQL.Add('SELECT DATA_CARTAO AS DATAPGTO,                                                        ');
  qry_pesquisa.SQL.Add('C.codigo, C.despesa_outros as descricao, C.valor,                                      ');
  qry_pesquisa.SQL.Add('T.tip_codigo ||'' - ''|| T.tip_descricao AS DESPESA,                                   ');
  qry_pesquisa.SQL.Add('TDS.TDS_codigo ||'' - ''|| TDS.TDS_descricao AS DESPESA_SUB, C.COT_CODIGO,             ');
  qry_pesquisa.SQL.Add('C.AT_CODIGO                                                                            ');
  qry_pesquisa.SQL.Add('FROM CAD_DESPESA C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                               ');
  qry_pesquisa.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_pesquisa.SQL.Add('and data_cartao is not null and data_cartao between :data1 and :data2                  ');
  if cboDespesa.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

  qry_pesquisa.SQL.Add('union                                                                                  ');

  qry_pesquisa.SQL.Add('SELECT DATA AS DATAPGTO,                                                               ');
  qry_pesquisa.SQL.Add('C.codigo, C.despesa_outros as descricao, C.valor,                                      ');
  qry_pesquisa.SQL.Add('T.tip_codigo ||'' - ''|| T.tip_descricao AS DESPESA,                                   ');
  qry_pesquisa.SQL.Add('TDS.TDS_codigo ||'' - ''|| TDS.TDS_descricao AS DESPESA_SUB, C.COT_CODIGO,             ');
  qry_pesquisa.SQL.Add('C.AT_CODIGO                                                                            ');
  qry_pesquisa.SQL.Add('FROM CAD_DESPESA C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                               ');
  qry_pesquisa.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_pesquisa.SQL.Add('and data_cartao is null and data between :data1 and :data2                             ');
  if cboDespesa.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

     qry_pesquisa.parambyname('data1').AsString:= txt_data_i.Text;
     qry_pesquisa.parambyname('data2').AsString:= txt_data_f.Text;
      if cboDespesa.Text <> '' then
        qry_pesquisa.ParamByName('tip_codigo').AsString:= cboDespesa.KeyValue;
      if cboDespesaSub.Text <> '' then
        qry_pesquisa.ParamByName('tds_codigo').AsString:= cboDespesaSub.KeyValue;
   //FIM Despesas filho

  qry_pesquisa.SQL.Add('union                                                                                  ');

   //Despesas mãe
  qry_pesquisa.SQL.Add('SELECT DATA_CARTAO AS DATAPGTO,                                                        ');
  qry_pesquisa.SQL.Add('C.codigo, C.despesa_outros as descricao, C.valor,                                      ');
  qry_pesquisa.SQL.Add('T.tip_codigo ||'' - ''|| T.tip_descricao AS DESPESA,                                   ');
  qry_pesquisa.SQL.Add('TDS.TDS_codigo ||'' - ''|| TDS.TDS_descricao AS DESPESA_SUB, C.COT_CODIGO,             ');
  qry_pesquisa.SQL.Add('C.AT_CODIGO                                                                            ');
  qry_pesquisa.SQL.Add('FROM CAD_DESPESA_MAE C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                           ');
  qry_pesquisa.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_pesquisa.SQL.Add('and data_cartao is not null and data_cartao between :data1 and :data2                  ');
  if cboDespesa.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

  qry_pesquisa.SQL.Add('union                                                                                  ');

  qry_pesquisa.SQL.Add('SELECT DATA AS DATAPGTO,                                                               ');
  qry_pesquisa.SQL.Add('C.codigo, C.despesa_outros as descricao, C.valor,                                      ');
  qry_pesquisa.SQL.Add('T.tip_codigo ||'' - ''|| T.tip_descricao AS DESPESA,                                   ');
  qry_pesquisa.SQL.Add('TDS.TDS_codigo ||'' - ''|| TDS.TDS_descricao AS DESPESA_SUB, C.COT_CODIGO,             ');
  qry_pesquisa.SQL.Add('C.AT_CODIGO                                                                            ');
  qry_pesquisa.SQL.Add('FROM CAD_DESPESA_MAE C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                           ');
  qry_pesquisa.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_pesquisa.SQL.Add('and data_cartao is null and data between :data1 and :data2                             ');
  if cboDespesa.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

     qry_pesquisa.parambyname('data1').AsString:= txt_data_i.Text;
     qry_pesquisa.parambyname('data2').AsString:= txt_data_f.Text;
      if cboDespesa.Text <> '' then
        qry_pesquisa.ParamByName('tip_codigo').AsString:= cboDespesa.KeyValue;
      if cboDespesaSub.Text <> '' then
        qry_pesquisa.ParamByName('tds_codigo').AsString:= cboDespesaSub.KeyValue;
   //FIM Despesas mãe


  qry_pesquisa.Open;
  qry_pesquisa.FetchAll;

  txtTotalRegistros.Text:= inttostr(qry_pesquisa.RecordCount);

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(C.VALOR) AS TOTAL                    ');

  qry_soma.SQL.Add('FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                              ');
  qry_soma.SQL.Add('WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO and                ');
  qry_soma.SQL.Add('data_despesa between :data1 and :data2                                                 ');
  if cboDespesa.Text <> '' then
    qry_soma.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_soma.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');

   if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
   if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

   qry_soma.SQL.Add('union');

  //despesas filho
  qry_soma.SQL.Add('SELECT SUM(C.VALOR) AS TOTAL              ');
  qry_soma.SQL.Add('FROM CAD_DESPESA C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                               ');
  qry_soma.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_soma.SQL.Add('and data_cartao is not null and data_cartao between :data1 and :data2                  ');
  if cboDespesa.Text <> '' then
    qry_soma.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_soma.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

     qry_soma.SQL.Add('union');

  qry_soma.SQL.Add('SELECT SUM(C.VALOR) AS TOTAL         ');
  qry_soma.SQL.Add('FROM CAD_DESPESA C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                               ');
  qry_soma.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_soma.SQL.Add('and data_cartao is null and data between :data1 and :data2                             ');
  if cboDespesa.Text <> '' then
    qry_soma.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_soma.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

  qry_soma.parambyname('data1').AsString:= txt_data_i.Text;
  qry_soma.parambyname('data2').AsString:= txt_data_f.Text;
  if cboDespesa.Text <> '' then
     qry_soma.ParamByName('tip_codigo').AsString:= cboDespesa.KeyValue;
  if cboDespesaSub.Text <> '' then
    qry_soma.ParamByName('tds_codigo').AsString:= cboDespesaSub.KeyValue;
  //FIM despesas filho

  qry_soma.SQL.Add('union');

   //despesas mãe
  qry_soma.SQL.Add('SELECT SUM(C.VALOR) AS TOTAL              ');
  qry_soma.SQL.Add('FROM CAD_DESPESA_MAE C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                           ');
  qry_soma.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_soma.SQL.Add('and data_cartao is not null and data_cartao between :data1 and :data2                  ');
  if cboDespesa.Text <> '' then
    qry_soma.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_soma.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

     qry_soma.SQL.Add('union');

  qry_soma.SQL.Add('SELECT SUM(C.VALOR) AS TOTAL         ');
  qry_soma.SQL.Add('FROM CAD_DESPESA_MAE C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                           ');
  qry_soma.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_soma.SQL.Add('and data_cartao is null and data between :data1 and :data2                             ');
  if cboDespesa.Text <> '' then
    qry_soma.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_soma.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_soma.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

  qry_soma.parambyname('data1').AsString:= txt_data_i.Text;
  qry_soma.parambyname('data2').AsString:= txt_data_f.Text;
  if cboDespesa.Text <> '' then
     qry_soma.ParamByName('tip_codigo').AsString:= cboDespesa.KeyValue;
  if cboDespesaSub.Text <> '' then
    qry_soma.ParamByName('tds_codigo').AsString:= cboDespesaSub.KeyValue;
  //FIM despesas mãe

  qry_soma.Open;
  qry_soma.FetchAll;

  qry_soma.First;
  total_valor:= 0;
  while not qry_soma.Eof do
  begin
    total_valor:= total_valor + qry_soma.fieldbyname('TOTAL').AsFloat;
    qry_soma.Next;
  end;

  txt_total.Text := formatfloat('###,##0.00', total_valor);

end;

procedure TfrmRelUnidosContasPagarContasPagasTotal.FormShow(Sender: TObject);
begin
  txt_data_i.SetFocus;

  qryDespesa.Close;
  qryDespesa.SQL.Clear;
  qryDespesa.SQL.Add('SELECT TIP_CODIGO, TIP_DESCRICAO, TIP_CODIGO ||'+#39+' - '+#39+'|| TIP_DESCRICAO AS DESPESA FROM TIPO_DESPESA ORDER BY TIP_CODIGO');
  qryDespesa.Open;
  qryDespesa.FetchAll;

  qrydespesaSub.Close;
  qrydespesaSub.SQL.Clear;
  qrydespesaSub.SQL.Add('SELECT TDS_CODIGO, TDS_DESCRICAO, TDS_CODIGO ||'+#39+' - '+#39+'|| TDS_DESCRICAO AS DESPESA_SUB '+
                        'FROM TIPO_DESPESA_SUB ORDER BY TDS_CODIGO                                                       ');
  qrydespesaSub.Open;
  qrydespesaSub.FetchAll;

end;

procedure TfrmRelUnidosContasPagarContasPagasTotal.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  IF (qry_pesquisa.FieldByName('COT_CODIGO').AsString <> '' ) then
    DBGrid1.Canvas.Brush.Color := clInactiveCaption;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Font.Style  := [fsbold];
      DBGrid1.Canvas.Brush.Color := clWhite;

      IF (qry_pesquisa.FieldByName('COT_CODIGO').AsString <> '' ) then
        DBGrid1.Canvas.Brush.Color := clInactiveCaption;
    end;

  dbgrid1.Canvas.Font.Color:= clBlack;

  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmRelUnidosContasPagarContasPagasTotal.DBGrid1TitleClick(
  Column: TColumn);
var
  dta,  data1, data2, despesa, despesa_outros, mensagem, ordenar : string;
  despesa_sub, campo : string;
  total_valor: real;

begin

  if (txt_data_i.Text ='  /  /    ') and (txt_data_f.Text = '  /  /    ') then
  begin
    mensagem := 'Informe uma Data !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

  if (campo = 'DATAPGTO') then
    campo := '1'
  else if (campo = 'CODIGO') then
    campo := '2'
  else if (campo = 'DESCRICAO') then
    campo := '3'
  else if (campo = 'VALOR') then
    campo := '4'
  else if (campo = 'DESPESA') Then
    campo := '5'
  else if (campo = 'DESPESA_SUB') then
    campo := '6';

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT C.data_despesa AS DATAPGTO,  ');
  qry_pesquisa.SQL.Add('C.codigo, C.descricao as descricao, C.valor,         ');
  qry_pesquisa.SQL.Add('T.tip_codigo ||'' - ''|| T.tip_descricao AS DESPESA, ');
  qry_pesquisa.SQL.Add('TDS.TDS_codigo ||'' - ''|| TDS.TDS_descricao AS DESPESA_SUB, C.COT_CODIGO, C.AT_CODIGO ');
  qry_pesquisa.SQL.Add('FROM CONTAS_PAGAR C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                              ');
  qry_pesquisa.SQL.Add('WHERE C.TIP_CODIGO = T.TIP_CODIGO AND TDS.TDS_CODIGO = C.TDS_CODIGO and                ');
  qry_pesquisa.SQL.Add('data_despesa between :data1 and :data2                                                 ');
  if cboDespesa.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');

   if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
   if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

  qry_pesquisa.SQL.Add('union                                                                                  ');

  qry_pesquisa.SQL.Add('SELECT DATA_CARTAO AS DATAPGTO,                                                        ');
  qry_pesquisa.SQL.Add('C.codigo, C.despesa_outros as descricao, C.valor,                                      ');
  qry_pesquisa.SQL.Add('T.tip_codigo ||'' - ''|| T.tip_descricao AS DESPESA,                                   ');
  qry_pesquisa.SQL.Add('TDS.TDS_codigo ||'' - ''|| TDS.TDS_descricao AS DESPESA_SUB, C.COT_CODIGO,             ');
  qry_pesquisa.SQL.Add('C.AT_CODIGO                                                                            ');
  qry_pesquisa.SQL.Add('FROM CAD_DESPESA C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                               ');
  qry_pesquisa.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_pesquisa.SQL.Add('and data_cartao is not null and data_cartao between :data1 and :data2                  ');
  if cboDespesa.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

  qry_pesquisa.SQL.Add('union                                                                                  ');

  qry_pesquisa.SQL.Add('SELECT DATA AS DATAPGTO,                                                               ');
  qry_pesquisa.SQL.Add('C.codigo, C.despesa_outros as descricao, C.valor,                                      ');
  qry_pesquisa.SQL.Add('T.tip_codigo ||'' - ''|| T.tip_descricao AS DESPESA,                                   ');
  qry_pesquisa.SQL.Add('TDS.TDS_codigo ||'' - ''|| TDS.TDS_descricao AS DESPESA_SUB, C.COT_CODIGO,             ');
  qry_pesquisa.SQL.Add('C.AT_CODIGO                                                                            ');
  qry_pesquisa.SQL.Add('FROM CAD_DESPESA C, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                               ');
  qry_pesquisa.SQL.Add('WHERE T.tip_codigo=C.tip_codigo AND TDS.TDS_CODIGO = C.TDS_CODIGO                      ');
  qry_pesquisa.SQL.Add('and data_cartao is null and data between :data1 and :data2                             ');
  if cboDespesa.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tip_codigo=:tip_codigo                                                         ');
  if cboDespesaSub.Text <> '' then
    qry_pesquisa.SQL.Add('and c.tds_codigo=:tds_codigo                                                         ');
  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')' );
  if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
     qry_pesquisa.SQL.Add(' AND UPPER(C.despesa_outros) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')' );

  qry_pesquisa.SQL.Add(' order by ' + campo);
  
     qry_pesquisa.parambyname('data1').AsString:= txt_data_i.Text;
     qry_pesquisa.parambyname('data2').AsString:= txt_data_f.Text;
      if cboDespesa.Text <> '' then
        qry_pesquisa.ParamByName('tip_codigo').AsString:= cboDespesa.KeyValue;
      if cboDespesaSub.Text <> '' then
        qry_pesquisa.ParamByName('tds_codigo').AsString:= cboDespesaSub.KeyValue;

  qry_pesquisa.Open;
  qry_pesquisa.FetchAll; 
  
end;

procedure TfrmRelUnidosContasPagarContasPagasTotal.cboDespesaExit(
  Sender: TObject);
begin
 if cboDespesa.Text <> '' then
 begin
   qryDespesaSub.Close;
   qryDespesaSub.SQL.Clear;
   qryDespesaSub.SQL.Add('SELECT TDS.tds_codigo || '+#39+' - '+#39+'  || TDS.tds_descricao AS DESPESA_SUB, TDS.tds_codigo    '+
                         'FROM ITENS_DESPESA_SUB I, tipo_despesa TD, TIPO_DESPESA_SUB TDS                                    '+
                         'WHERE I.TIP_CODIGO = TD.TIP_CODIGO AND I.TDS_CODIGO = TDS.TDS_CODIGO AND TD.TIP_CODIGO=:TIP_CODIGO '+
                         'ORDER BY TDS.TDS_CODIGO                                                                            ');
   qryDespesaSub.ParamByName('TIP_CODIGO').AsString := qryDespesa.FIELDBYNAME('TIP_CODIGO').AsString;
   qryDespesaSub.Open;
   qryDespesaSub.FetchAll;
 end
 else
 begin
   qrydespesaSub.Close;
   qrydespesaSub.SQL.Clear;
   qrydespesaSub.SQL.Add('SELECT TDS_CODIGO, TDS_DESCRICAO, TDS_CODIGO ||'+#39+' - '+#39+'|| TDS_DESCRICAO AS DESPESA_SUB '+
                         'FROM TIPO_DESPESA_SUB ORDER BY TDS_CODIGO                                                       ');
   qrydespesaSub.Open;
   qrydespesaSub.FetchAll;
 end;

end;

procedure TfrmRelUnidosContasPagarContasPagasTotal.cboDespesaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
  begin
    cboDespesa.KeyValue := -1;

    qrydespesaSub.Close;
    qrydespesaSub.SQL.Clear;
    qrydespesaSub.SQL.Add('SELECT TDS_CODIGO, TDS_DESCRICAO, TDS_CODIGO ||'+#39+' - '+#39+'|| TDS_DESCRICAO AS DESPESA_SUB '+
                          'FROM TIPO_DESPESA_SUB ORDER BY TDS_CODIGO                                                       ');
    qrydespesaSub.Open;
    qrydespesaSub.FetchAll;
  end;

end;

procedure TfrmRelUnidosContasPagarContasPagasTotal.cboDespesaSubKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    cboDespesaSub.KeyValue := -1;
end;

procedure TfrmRelUnidosContasPagarContasPagasTotal.ItensCotao1Click(
  Sender: TObject);
begin
  Application.CreateForm(TfrmItensCotacaoCompra, frmItensCotacaoCompra);
  frmItensCotacaoCompra.pesquisar := 'Cad_Despesa Contas_Pagar';
  frmItensCotacaoCompra.ShowModal;
end;

end.
