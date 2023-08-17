


unit unt_modulo;

interface

uses
  SysUtils, Classes, DB, ADODB,
  IBDatabase, IBCustomDataSet, IBQuery;

type
  Tdm = class(TDataModule)
    tb_cad_despesa: TADOQuery;
    ds_cad_despesa_temp: TDataSource;
    tb_apaga: TADOQuery;
    tb_lembrete: TADOQuery;
    ds_lembrete: TDataSource;
    tb_cad_despesacodigo: TAutoIncField;
    tb_cad_despesadespesa: TWideStringField;
    tb_cad_despesavalor: TFloatField;
    tb_cad_despesadata: TDateTimeField;
    tb_cad_despesaforma_pgto: TWideStringField;
    tb_cad_despesasemana: TWideStringField;
    tb_lembretecodigo: TAutoIncField;
    tb_lembretedescricao: TWideStringField;
    tb_lembretevalor: TFloatField;
    tb_lembretedata: TDateTimeField;
    ds_obs: TDataSource;
    tb_obs: TADOQuery;
    tb_obscodigo: TAutoIncField;
    tb_obsobs: TWideStringField;
    tb_cad_despesadespesa_outros: TWideStringField;
    tb_cad_despesa_temp: TADOQuery;
    tb_cad_despesa_tempcodigo: TAutoIncField;
    tb_cad_despesa_tempdespesa: TWideStringField;
    tb_cad_despesa_tempdespesa_outros: TWideStringField;
    tb_cad_despesa_tempvalor: TFloatField;
    tb_cad_despesa_tempdata: TDateTimeField;
    tb_cad_despesa_tempforma_pgto: TWideStringField;
    tb_cad_despesa_tempsemana: TWideStringField;
    BD: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qryPesqAux: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
