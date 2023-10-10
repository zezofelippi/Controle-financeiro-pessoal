unit untListDespRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, ExtCtrls;

type
  TfrmListDespRec = class(TForm)
    Label1: TLabel;
    txt_data_i: TDateEdit;
    txt_data_f: TDateEdit;
    Label2: TLabel;
    Button1: TButton;
    RDG_TIPO: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListDespRec: TfrmListDespRec;

implementation

uses untRelRecDesp;

{$R *.dfm}

procedure TfrmListDespRec.Button1Click(Sender: TObject);
var
  mensagem, data1, data2, dta, tipo : string;

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

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := 'WHERE D.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if rdg_tipo.ItemIndex = 0 then
    tipo := ' AND ( CC.TIPO_RECEITA = '+ #39 + 'DIN' + #39 + ' OR CC.TIPO_RECEITA = '+ #39 + 'CHE' + #39 + ')'
  ELSE if rdg_tipo.ItemIndex = 1 then
    tipo := ' AND CC.TIPO_RECEITA = '+ #39 + 'DEP' + #39
  ELSE
    tipo := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if RDG_TIPO.ItemIndex = 0 then
  begin
    frmRelRecDesp.lbl_data.Caption := 'Periodo de : ' + txt_Data_i.Text + ' a ' + txt_data_f.Text;

    frmRelRecDesp.qry_pesquisa.Close;
    frmRelRecDesp.qry_pesquisa.SQL.Clear;
    frmRelRecDesp.qry_pesquisa.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO, EXTRACT(MONTH FROM DATA) AS MES   '+
                                       'FROM CAD_DESPESA                                                         '+
                                       'WHERE  DATA BETWEEN :DATA1 AND :DATA2                                    '+
                                       'group by EXTRACT(YEAR FROM DATA), EXTRACT(MONTH FROM DATA)               '+
                                       'union                                                                    '+
                                       'SELECT EXTRACT(YEAR FROM DATA) AS ANO, EXTRACT(MONTH FROM DATA) AS MES   '+
                                       'FROM cad_receitas                                                        '+
                                       'WHERE  DATA BETWEEN :DATA1 AND :DATA2                                    '+
                                       'group by EXTRACT(YEAR FROM DATA), EXTRACT(MONTH FROM DATA) ORDER BY 1, 2 ');
    frmRelRecDesp.qry_pesquisa.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    frmRelRecDesp.qry_pesquisa.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    frmRelRecDesp.qry_pesquisa.Open;

    if frmRelRecDesp.qry_pesquisa.isempty then
    begin
      mensagem := 'Registro nao encontrado !';
      Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
      txt_data_i.SetFocus;
      exit;
    end;

    frmRelRecDesp.frRelatorio.Prepare;
    frmRelRecDesp.frRelatorio.PreviewModal;
  end
  else if RDG_TIPO.ItemIndex = 1 then
  begin
    frmRelRecDesp.lbl_data_ano.Caption := 'Periodo de : ' + txt_Data_i.Text + ' a ' + txt_data_f.Text;

    frmRelRecDesp.qry_pesquisa_ano.Close;
    frmRelRecDesp.qry_pesquisa_ano.SQL.Clear;
    frmRelRecDesp.qry_pesquisa_ano.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO           '+
                                           'FROM CAD_DESPESA                                '+
                                           'WHERE  DATA BETWEEN :DATA1 AND :DATA2           '+
                                           'group by EXTRACT(YEAR FROM DATA)                '+
                                           'union                                           '+
                                           'SELECT EXTRACT(YEAR FROM DATA) AS ANO           '+
                                           'FROM cad_receitas                               '+
                                           'WHERE  DATA BETWEEN :DATA1 AND :DATA2           '+
                                           'group by EXTRACT(YEAR FROM DATA) order by 1     ');
    frmRelRecDesp.qry_pesquisa_ano.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    frmRelRecDesp.qry_pesquisa_ano.ParamByName('DATA2').AsDateTime := txt_data_f.Date;

    frmRelRecDesp.qry_pesquisa_ano.Open;

    if frmRelRecDesp.qry_pesquisa_ano.isempty then
    begin
      mensagem := 'Registro nao encontrado !';
      Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
      txt_data_i.SetFocus;
      exit;
    end;

    frmRelRecDesp.frRelatorioAno.Prepare;
    frmRelRecDesp.frRelatorioAno.PreviewModal;

  end;

end;

procedure TfrmListDespRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmListDespRec := nil;
  action:= cafree;
end;

procedure TfrmListDespRec.FormShow(Sender: TObject);
begin
  rdg_tipo.ItemIndex := 0;
end;

end.
