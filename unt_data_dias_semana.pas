unit unt_data_dias_semana;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, IBDatabase;



type
  Tfrm_data_dias_semana = class(TForm)
    Button1: TButton;
    IBTransLocal: TIBTransaction;
    qry_despesa: TIBQuery;
    qryIncluiSemana: TIBQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;





var
  frm_data_dias_semana: Tfrm_data_dias_semana;

implementation

uses unt_modulo;

function DiaSemana(Data: TDateTime): String;
const
  Dias : Array[1..7] of String[07] = ('DOMINGO', 'SEGUNDA', 'TERCA','QUARTA','QUINTA', 'SEXTA','SABADO');
begin
  Result := Dias[DayOfWeek(Data)];
end;

{$R *.dfm}

procedure Tfrm_data_dias_semana.Button1Click(Sender: TObject);
var
  data : TdateTime;
  semana :string;
begin

  qry_despesa.Close;
  qry_despesa.SQL.Clear;
  qry_despesa.SQL.Add('SELECT CODIGO, DATA, SEMANA FROM CAD_DESPESA ');
  qry_despesa.Open;
  qry_despesa.First;

  while not qry_despesa.Eof do
  begin
    data := qry_despesa.fieldbyname('DATA').AsDateTime;
    semana := DiaSemana(data);

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qryIncluiSemana.Close;
    qryIncluiSemana.SQL.Clear;
    qryIncluiSemana.SQL.Add('UPDATE CAD_DESPESA SET SEMANA = :SEMANA WHERE CODIGO=:CODIGO');
    qryIncluiSemana.ParamByName('CODIGO').AsString := qry_despesa.fieldbyname('CODIGO').AsString;
    qryIncluiSemana.ParamByName('SEMANA').AsString := semana;
    qryIncluiSemana.ExecSQL;
    IBTRANSLOCAL.Commit;

    qry_despesa.Next;

  end;

  showmessage('acabou');

end;

end.
