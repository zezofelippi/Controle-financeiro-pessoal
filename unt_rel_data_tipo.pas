unit unt_rel_data_tipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB, Grids, DBGrids, ToolEdit, CurrEdit,
  IBCustomDataSet, IBQuery, DBCtrls, ExtCtrls, Menus;

type
  Tfrm_rel_data_tipo = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    txt_despesa_outros: TEdit;
    GroupBox2: TGroupBox;
    cbo_segunda: TComboBox;
    cbo_terca: TComboBox;
    cbo_quarta: TComboBox;
    cbo_quinta: TComboBox;
    cbo_sexta: TComboBox;
    cbo_sabado: TComboBox;
    cbo_domingo: TComboBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    txt_total: TCurrencyEdit;
    qry_pesquisa: TIBQuery;
    ds_pesquisa: TDataSource;
    qry_soma: TIBQuery;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cboDespesa: TDBLookupComboBox;
    qryDespesa: TIBQuery;
    dsDespesa: TDataSource;
    qry_pesquisaCODIGO: TIntegerField;
    qry_pesquisaDESPESA_OUTROS: TIBStringField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaDATA: TDateTimeField;
    qry_pesquisaSEMANA: TIBStringField;
    qry_pesquisaDESPESA: TIBStringField;
    btnRelatorio: TButton;
    Label15: TLabel;
    cboDespesaSub: TDBLookupComboBox;
    dsDespesaSub: TDataSource;
    qryDespesaSub: TIBQuery;
    qryDespesaSubDESPESA_SUB: TIBStringField;
    qryDespesaSubTDS_CODIGO: TIntegerField;
    qry_pesquisaDESPESA_SUB: TIBStringField;
    rdgContasAtraso: TRadioGroup;
    qry_pesquisaCOT_CODIGO: TIntegerField;
    qry_pesquisaAT_CODIGO: TIntegerField;
    Label17: TLabel;
    Label18: TLabel;
    PopupMenu1: TPopupMenu;
    Despesacomitensdacotaodecompra1: TMenuItem;
    gpb1: TGroupBox;
    lbl1: TLabel;
    txt_data_i: TDateEdit;
    txt_data_f: TDateEdit;
    lbl2: TLabel;
    gpb2: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    edtDatainicialCartao: TDateEdit;
    edtDataFinalCartao: TDateEdit;
    lbl5: TLabel;
    dtmfld_pesquisaDATA_CARTAO: TDateTimeField;
    Label23: TLabel;
    txtTotalRegistros: TEdit;
    Label1: TLabel;
    txtTotalCartao: TCurrencyEdit;
    qry_pesquisaCONTAS_PAGAR_ID: TIntegerField;
    procedure txt_data_iEnter(Sender: TObject);
    procedure txt_data_iExit(Sender: TObject);
    procedure txt_data_iKeyPress(Sender: TObject; var Key: Char);
    procedure txt_data_fEnter(Sender: TObject);
    procedure txt_data_fExit(Sender: TObject);
    procedure txt_data_fKeyPress(Sender: TObject; var Key: Char);
    procedure txt_despesa_outrosEnter(Sender: TObject);
    procedure txt_despesa_outrosExit(Sender: TObject);
    procedure txt_despesa_outrosKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cboDespesaEnter(Sender: TObject);
    procedure cboDespesaExit(Sender: TObject);
    procedure cboDespesaKeyPress(Sender: TObject; var Key: Char);
    procedure btnRelatorioClick(Sender: TObject);
    procedure cboDespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsDespesaDataChange(Sender: TObject; Field: TField);
    procedure cboDespesaSubEnter(Sender: TObject);
    procedure cboDespesaSubExit(Sender: TObject);
    procedure cboDespesaSubKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure cboDespesaSubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Despesacomitensdacotaodecompra1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_data_tipo: Tfrm_rel_data_tipo;

implementation

uses unt_modulo, untrel_data_tipo, untRelCadDespesa, untItensCotacaoCompra;

{$R *.dfm}

procedure Tfrm_rel_data_tipo.txt_data_iEnter(Sender: TObject);
begin
  txt_data_i.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.txt_data_iExit(Sender: TObject);
begin
  txt_data_i.Color := clwindow;
end;

procedure Tfrm_rel_data_tipo.txt_data_iKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data_f.SetFocus;
end;

procedure Tfrm_rel_data_tipo.txt_data_fEnter(Sender: TObject);
begin
  txt_data_f.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.txt_data_fExit(Sender: TObject);
begin
  txt_data_f.Color := clwindow;
end;

procedure Tfrm_rel_data_tipo.txt_data_fKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF key =#13 then
    cboDespesa.SetFocus;
end;

procedure Tfrm_rel_data_tipo.txt_despesa_outrosEnter(Sender: TObject);
begin
  txt_despesa_outros.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.txt_despesa_outrosExit(Sender: TObject);
begin
  txt_despesa_outros.Color := clwindow;
end;

procedure Tfrm_rel_data_tipo.txt_despesa_outrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    button1.SetFocus;
end;

procedure Tfrm_rel_data_tipo.FormShow(Sender: TObject);
begin
  txt_data_i.SetFocus;
  rdb_inicio.Checked := TRUE;

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

  rdgContasAtraso.ItemIndex := 2;

end;

procedure Tfrm_rel_data_tipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_rel_data_tipo := nil;
  action:= cafree;
end;

procedure Tfrm_rel_data_tipo.Button1Click(Sender: TObject);
var
  dta, dta_cartao, data1, data2, despesa, despesa_outros, mensagem, ordenar : string;
  segunda, terca, quarta, quinta, sexta, sabado, domingo, despesa_sub, ContasAtraso : string;

begin

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND CA.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  data1 := Copy(edtDatainicialCartao.Text,4,3) + Copy(edtDatainicialCartao.Text,1,3) + Copy(edtDatainicialCartao.Text,7,4) + ' 00:00:00';
  data2 := Copy(edtDataFinalCartao.Text,4,3) + Copy(edtDataFinalCartao.Text,1,3) + Copy(edtDataFinalCartao.Text,7,4) + ' 23:59:59';

  if (edtDatainicialCartao.Text <> '  /  /    ') and (edtDataFinalCartao.Text <> '  /  /    ') then
    dta_cartao := ' AND CA.DATA_CARTAO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta_cartao := '';

  if ((edtDatainicialCartao.Text <> '  /  /    ') and (edtDataFinalCartao.Text = '  /  /    ') or (edtDatainicialCartao.Text = '  /  /    ') and (edtDataFinalCartao.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas do cartão !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    edtDatainicialCartao.SetFocus;
    exit;
  end;

  if cboDespesa.Text <> '' then
    despesa := ' AND CA.TIP_CODIGO = ' + IntToStr(cboDespesa.KeyValue)
  else
    despesa := '';

  if cboDespesaSub.Text <> '' then
    despesa_sub := ' AND CA.TDS_CODIGO = ' + IntToStr(cboDespesaSub.KeyValue)
  else
    despesa_sub := '';

  if rdgContasAtraso.ItemIndex = 0 then
    ContasAtraso := ' AND CONTA_ATRASADA = ''S'' '
  else if rdgContasAtraso.ItemIndex = 1 then
    ContasAtraso := ' AND CONTA_ATRASADA =  ''N'' '
  else
    ContasAtraso := '';

  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')'
  else if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  if cbo_segunda.Text <> '' then
    segunda := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_segunda.Text + '%' + #39 +')'
  else
    segunda := '';

  if cbo_terca.Text <> '' then
    terca := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_terca.Text + '%' + #39 +')'
  else
    terca := '';

  if cbo_quarta.Text <> '' then
    quarta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quarta.Text + '%' + #39 +')'
  else
    quarta := '';

  if cbo_quinta.Text <> '' then
    quinta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quinta.Text + '%' + #39 +')'
  else
    quinta := '';

  if cbo_sexta.Text <> '' then
    sexta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sexta.Text + '%' + #39 +')'
  else
    sexta := '';

  if cbo_sabado.Text <> '' then
    sabado := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sabado.Text + '%' + #39 +')'
  else
    sabado := '';

  if cbo_domingo.Text <> '' then
    domingo := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_domingo.Text + '%' + #39 +')'
  else
    domingo := '';
  
  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT CA.codigo, CA.despesa_outros, CA.valor, CA.data, CA.semana,                                   '+
                       'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA,                                       '+
                       'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB, CA.COT_CODIGO, CA.AT_CODIGO,  '+
                       'CA.DATA_CARTAO, CA.CONTAS_PAGAR_ID                                                                   '+
                       'FROM CAD_DESPESA CA, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                            '+
                       'WHERE T.tip_codigo=CA.tip_codigo AND TDS.TDS_CODIGO = CA.TDS_CODIGO ' +  dta + dta_cartao + despesa   +
                       '' + despesa_sub + despesa_outros + ContasAtraso                                                       +
                       '' + segunda + terca + quarta + quinta + sexta + sabado + domingo                                      );
  qry_pesquisa.Open;
  qry_pesquisa.FetchAll;

  txtTotalRegistros.Text:= inttostr(qry_pesquisa.RecordCount);

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(CA.VALOR) AS TOTAL FROM CAD_DESPESA CA, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS  '+
                   'WHERE T.tip_codigo=CA.tip_codigo AND TDS.TDS_CODIGO = CA.TDS_CODIGO                      '+
                   '' + dta + dta_cartao + despesa + despesa_outros + despesa_sub + ContasAtraso              +
                   '' + segunda + terca + quarta + quinta + sexta + sabado + domingo                          );
  qry_soma.Open;
  qry_soma.FetchAll;

  txt_total.Text := formatfloat('###,##0.00', qry_soma.fieldbyname('TOTAL').AsFloat);

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(CA.VALOR) AS TOTAL FROM CAD_DESPESA CA, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS          '+
                   'WHERE T.tip_codigo=CA.tip_codigo AND TDS.TDS_CODIGO = CA.TDS_CODIGO AND DATA_CARTAO IS NOT NULL  '+
                   '' + dta + dta_cartao + despesa + despesa_outros + despesa_sub + ContasAtraso                      +
                   '' + segunda + terca + quarta + quinta + sexta + sabado + domingo                                  );
  qry_soma.Open;
  qry_soma.FetchAll;

  txtTotalCartao.Text := formatfloat('###,##0.00', qry_soma.fieldbyname('TOTAL').AsFloat);

end;

procedure Tfrm_rel_data_tipo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure Tfrm_rel_data_tipo.cboDespesaEnter(Sender: TObject);
begin
  cboDespesa.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.cboDespesaExit(Sender: TObject);
begin
  cboDespesa.Color := clwindow;

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

  end;

  if cboDespesa.Text = '' then
  begin

    qrydespesaSub.Close;
    qrydespesaSub.SQL.Clear;
    qrydespesaSub.SQL.Add('SELECT TDS_CODIGO, TDS_DESCRICAO, TDS_CODIGO ||'+#39+' - '+#39+'|| TDS_DESCRICAO AS DESPESA_SUB '+
                          'FROM TIPO_DESPESA_SUB ORDER BY TDS_CODIGO                                                       ');
    qrydespesaSub.Open;
    qrydespesaSub.FetchAll;

  end; 

end;

procedure Tfrm_rel_data_tipo.cboDespesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cboDespesaSub.SetFocus;
end;

procedure Tfrm_rel_data_tipo.btnRelatorioClick(Sender: TObject);
var
  dta, data1, data2, despesa, despesa_outros, mensagem, ordenar, despesa_sub, ContasAtraso : string;
  segunda, terca, quarta, quinta, sexta, sabado, domingo: string;

begin
  
  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND CA.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')'
  else if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  if cbo_segunda.Text <> '' then
    segunda := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_segunda.Text + '%' + #39 +')'
  else
    segunda := '';

  if cbo_terca.Text <> '' then
    terca := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_terca.Text + '%' + #39 +')'
  else
    terca := '';

  if cbo_quarta.Text <> '' then
    quarta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quarta.Text + '%' + #39 +')'
  else
    quarta := '';

  if cbo_quinta.Text <> '' then
    quinta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quinta.Text + '%' + #39 +')'
  else
    quinta := '';

  if cbo_sexta.Text <> '' then
    sexta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sexta.Text + '%' + #39 +')'
  else
    sexta := '';

  if cbo_sabado.Text <> '' then
    sabado := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sabado.Text + '%' + #39 +')'
  else
    sabado := '';

  if cbo_domingo.Text <> '' then
     domingo := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_domingo.Text + '%' + #39 +')'
  else
     domingo := '';


  if cboDespesa.Text <> '' then
    despesa := ' AND TD.TIP_CODIGO = ' + IntToStr(cboDespesa.KeyValue)
  else
    despesa := '';

  if cboDespesaSub.Text <> '' then
    despesa_sub := ' AND TDS.TDS_CODIGO = ' + IntToStr(cboDespesaSub.KeyValue)
  else
    despesa_sub := '';

  if rdgContasAtraso.ItemIndex = 0 then
    ContasAtraso := ' AND CONTA_ATRASADA = ''S'' '
  else if rdgContasAtraso.ItemIndex = 1 then
    ContasAtraso := ' AND CONTA_ATRASADA =  ''N'' '
  else
    ContasAtraso := '';

  ordenar := 'order by EXTRACT(YEAR FROM CA.DATA), EXTRACT(month FROM CA.DATA), TD.TIP_CODIGO, TDS.TDS_CODIGO ';

  frmRelCadDespesa.qry_pesquisa.Close;
  frmRelCadDespesa.qry_pesquisa.SQL.Clear;
  frmRelCadDespesa.qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM CA.DATA) AS MES, EXTRACT(YEAR FROM CA.DATA) AS ANO,                                    '+
                                        'TD.TIP_CODIGO ||'+#39+' - '+#39+'|| TD.TIP_DESCRICAO AS DESCR, CA.CODIGO,                                        '+
                                        'TDS.TDS_CODIGO ||'+#39+' - '+#39+'|| TDS.TDS_DESCRICAO AS DESPESA_SUB,                                           '+
                                        'CA.DATA, CA.VALOR, CA.SEMANA, CA.DESPESA_OUTROS, TD.TIP_CODIGO, TDS.TDS_CODIGO,                                  '+
                                        'td.tip_codigo ||'+#39+' - '+#39+'|| EXTRACT(month FROM CA.DATA) AS tip_MES,                                      '+
                                        'td.tip_codigo ||'+#39+' - '+#39+'|| tds.tds_codigo ||'+#39+' - '+#39+'|| EXTRACT(month FROM CA.DATA) AS SUB_mes  '+
                                        'FROM CAD_DESPESA CA, TIPO_DESPESA TD, TIPO_DESPESA_SUB TDS where TD.TIP_CODIGO = CA.TIP_CODIGO AND               '+
                                        'TDS.TDS_CODIGO = CA.TDS_CODIGO                                                                                   '+
                                        ''+  dta + despesa + despesa_sub + despesa_outros + ContasAtraso + segunda + terca + quarta                        +
                                        '' + quinta + sexta + sabado + domingo                                                                             +
                                        ' GROUP BY EXTRACT(MONTH FROM CA.DATA), EXTRACT(YEAR FROM CA.DATA), CA.DATA, CA.VALOR,                            '+
                                        ' CA.SEMANA, CA.DESPESA_OUTROS, TD.tip_descricao, TD.tip_codigo, CA.CODIGO, TDS.TDS_CODIGO, TDS.TDS_DESCRICAO     '+
                                        '' + ordenar                                                                                                       );
  frmRelCadDespesa.qry_pesquisa.Open;
  frmRelCadDespesa.qry_pesquisa.FetchAll;

  if frmRelCadDespesa.qry_pesquisa.isempty then
  begin
    mensagem := 'Registro nao encontrado !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  frmRelCadDespesa.lbl_data.caption := txt_data_i.Text + ' a ' + txt_data_f.Text;

  frmRelCadDespesa.frRelatorio.Prepare;
  frmRelCadDespesa.frRelatorio.PreviewModal;
   
end;

procedure Tfrm_rel_data_tipo.cboDespesaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure Tfrm_rel_data_tipo.dsDespesaDataChange(Sender: TObject;
  Field: TField);
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
  end;

 if cboDespesa.Text = '' then
 begin
   qrydespesaSub.Close;
   qrydespesaSub.SQL.Clear;
   qrydespesaSub.SQL.Add('SELECT TDS_CODIGO, TDS_DESCRICAO, TDS_CODIGO ||'+#39+' - '+#39+'|| TDS_DESCRICAO AS DESPESA_SUB '+
                         'FROM TIPO_DESPESA_SUB ORDER BY TDS_CODIGO                                                       ');
   qrydespesaSub.Open;
   qrydespesaSub.FetchAll;
 end;

end;

procedure Tfrm_rel_data_tipo.cboDespesaSubEnter(Sender: TObject);
begin
  cbodespesaSub.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.cboDespesaSubExit(Sender: TObject);
begin
  cboDespesaSub.Color := clwindow;
end;

procedure Tfrm_rel_data_tipo.cboDespesaSubKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_despesa_outros.SetFocus;
end;

procedure Tfrm_rel_data_tipo.DBGrid1TitleClick(Column: TColumn);
VAR
  campo : string;
  dta, dta_cartao, data1, data2, despesa, despesa_outros, mensagem, ordenar : string;
  segunda, terca, quarta, quinta, sexta, sabado, domingo, despesa_sub, ContasAtraso : string;

begin
  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

  if (campo = 'codigo') or (campo = 'despesa_outros') or (campo = 'valor') or
  (campo = 'data') or (campo = 'semana') or (campo = 'data_cartao') OR (campo = 'CONTAS_PAGAR_ID' ) then
    campo := 'CA.' + campo
  else if (campo = 'DESPESA') Then
    campo := 'T.tip_codigo '
  else if (campo = 'DESPESA_SUB') then
    campo := 'TDS.TDS_CODIGO '
  else
    campo := '' + campo ;

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND CA.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  data1 := Copy(edtDatainicialCartao.Text,4,3) + Copy(edtDatainicialCartao.Text,1,3) + Copy(edtDatainicialCartao.Text,7,4) + ' 00:00:00';
  data2 := Copy(edtDataFinalCartao.Text,4,3) + Copy(edtDataFinalCartao.Text,1,3) + Copy(edtDataFinalCartao.Text,7,4) + ' 23:59:59';

  if (edtDatainicialCartao.Text <> '  /  /    ') and (edtDataFinalCartao.Text <> '  /  /    ') then
    dta_cartao := ' AND CA.DATA_CARTAO BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta_cartao := '';

  if ((edtDatainicialCartao.Text <> '  /  /    ') and (edtDataFinalCartao.Text = '  /  /    ') or (edtDatainicialCartao.Text = '  /  /    ') and (edtDataFinalCartao.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas do cartão !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    edtDatainicialCartao.SetFocus;
    exit;
  end;

  if cboDespesa.Text <> '' then
    despesa := ' AND CA.TIP_CODIGO = ' + IntToStr(cboDespesa.KeyValue)
  else
    despesa := '';

  if cboDespesaSub.Text <> '' then
    despesa_sub := ' AND CA.TDS_CODIGO = ' + IntToStr(cboDespesaSub.KeyValue)
  else
    despesa_sub := '';

  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')'
  else if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  if rdgContasAtraso.ItemIndex = 0 then
    ContasAtraso := ' AND CONTA_ATRASADA = ''S'' '
  else if rdgContasAtraso.ItemIndex = 1 then
    ContasAtraso := ' AND CONTA_ATRASADA =  ''N'' '
  else
    ContasAtraso := '';

  if cbo_segunda.Text <> '' then
    segunda := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_segunda.Text + '%' + #39 +')'
  else
    segunda := '';

  if cbo_terca.Text <> '' then
    terca := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_terca.Text + '%' + #39 +')'
  else
    terca := '';

  if cbo_quarta.Text <> '' then
    quarta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quarta.Text + '%' + #39 +')'
  else
    quarta := '';

  if cbo_quinta.Text <> '' then
    quinta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quinta.Text + '%' + #39 +')'
  else
    quinta := '';

  if cbo_sexta.Text <> '' then
    sexta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sexta.Text + '%' + #39 +')'
  else
    sexta := '';

  if cbo_sabado.Text <> '' then
    sabado := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sabado.Text + '%' + #39 +')'
  else
    sabado := '';

  if cbo_domingo.Text <> '' then
    domingo := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_domingo.Text + '%' + #39 +')'
  else
    domingo := '';

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT CA.codigo, CA.despesa_outros, CA.valor, CA.data, CA.semana,                                 '+
                       'T.tip_codigo ||'+#39+' - '+#39+'|| T.tip_descricao AS DESPESA,                                     '+
                       'TDS.TDS_codigo ||'+#39+' - '+#39+'|| TDS.TDS_descricao AS DESPESA_SUB, CA.COT_CODIGO,              '+
                       'CA.AT_CODIGO, CA.DATA_CARTAO, CA.CONTAS_PAGAR_ID                                                   '+
                       'FROM CAD_DESPESA CA, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS                                          '+
                       'WHERE T.tip_codigo=CA.tip_codigo AND TDS.TDS_CODIGO = CA.TDS_CODIGO ' +  dta + dta_cartao + despesa +
                       '' + despesa_sub + despesa_outros + ContasAtraso                                                     +
                       '' + segunda + terca + quarta + quinta + sexta + sabado + domingo + ' order by ' + campo             );
  qry_pesquisa.Open;
  qry_pesquisa.FetchAll;

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(CA.VALOR) AS TOTAL FROM CAD_DESPESA CA, TIPO_DESPESA T, TIPO_DESPESA_SUB TDS   '+
                   'WHERE T.tip_codigo=CA.tip_codigo AND TDS.TDS_CODIGO = CA.TDS_CODIGO                       '+
                   '' + dta + dta_cartao + despesa + despesa_outros + despesa_sub + ContasAtraso               +
                   '' + segunda + terca + quarta + quinta + sexta + sabado + domingo                           );
  qry_soma.Open;
  qry_soma.FetchAll;

  txt_total.Text := formatfloat('###,##0.00', qry_soma.fieldbyname('TOTAL').AsFloat);

end;

procedure Tfrm_rel_data_tipo.cboDespesaSubKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    cboDespesaSub.KeyValue := -1;
end;

procedure Tfrm_rel_data_tipo.Despesacomitensdacotaodecompra1Click(
  Sender: TObject);
begin

  Application.CreateForm(TfrmItensCotacaoCompra, frmItensCotacaoCompra);
  frmItensCotacaoCompra.pesquisar := 'Cad_Despesa';
  frmItensCotacaoCompra.ShowModal;

end;

end.
