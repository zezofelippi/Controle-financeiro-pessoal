unit untCotacaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Grids,
  DB, DBClient, Provider, IBCustomDataSet, IBQuery, ComCtrls,
  ExtCtrls, IBDatabase, DBGrids, DBCtrls, ComObj, Menus, StrUtils ;

type
  Tfrm_cotacao_compra = class(TForm)
    qryTransLocal: TIBQuery;
    IBTransLocal: TIBTransaction;
    qryPesquisa: TIBQuery;
    qryProduto: TIBQuery;
    dsProduto: TDataSource;
    qryUnidade: TIBQuery;
    qryUnidadeUN_CODIGO: TIntegerField;
    qryUnidadeUN_DESCRICAO: TIBStringField;
    dsUnidade: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gpb_dados: TGroupBox;
    Label6: TLabel;
    lbl_cod_cotacao: TLabel;
    Label35: TLabel;
    Label1: TLabel;
    dta_cotacao: TDateEdit;
    dta_vencimento: TDateEdit;
    gpbProduto: TGroupBox;
    Label2: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txt_cod_barra: TEdit;
    btn_pesq_prod: TBitBtn;
    txt_produto: TEdit;
    txt_cod_produto: TEdit;
    cbo_unidade: TDBLookupComboBox;
    edtQuantidade: TRxCalcEdit;
    btnInserir: TBitBtn;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    gpb_botoes: TGroupBox;
    btn_novo: TBitBtn;
    btn_finalizar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_pesquisar: TBitBtn;
    btn_sair: TBitBtn;
    btn_alterar: TBitBtn;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    gpbFornecedor: TGroupBox;
    lbl_excel: TLabel;
    btnExcel: TBitBtn;
    pgb_excel: TProgressBar;
    dsFornecedorLancados: TDataSource;
    qryFornecedorLancados: TIBQuery;
    dsProdutoLancados: TDataSource;
    qryProdutoLancados: TIBQuery;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    FloatField1: TFloatField;
    IBBCDField1: TIBBCDField;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    dsUltCompra: TDataSource;
    qryUltCompra: TIBQuery;
    qryUltCompraCMP_DATA: TDateTimeField;
    qryUltCompraFOR_CODIGO: TIntegerField;
    qryUltCompraFOR_NOME: TIBStringField;
    qryUltCompraITE_VALOR_UNIT: TIBBCDField;
    qryUltCompraITE_QTD: TFloatField;
    Label9: TLabel;
    qryProdutoLancadosPRO_CODIGO: TIntegerField;
    DBGrid2: TDBGrid;
    dsFornecedor: TDataSource;
    qryFornecedor: TIBQuery;
    cdsFornecedor: TClientDataSet;
    dspFornecedor: TDataSetProvider;
    cdsFornecedorCOT_VALOR: TBCDField;
    cdsFornecedorPRO_CODIGO: TIntegerField;
    qryFornecedorCOT_VALOR: TIBBCDField;
    qryFornecedorPRO_CODIGO: TIntegerField;
    cdsFornecedorCHEQUED: TStringField;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    btnImprimir: TBitBtn;
    DBGrid7: TDBGrid;
    dsFornecedorVencedor: TDataSource;
    qryFornecedorVencedor: TIBQuery;
    dsProdutoFornecVenc: TDataSource;
    qryProdutoFornecVenc: TIBQuery;
    qryProdutoFornecVencPRO_CODIGO: TIntegerField;
    qryProdutoFornecVencPRO_DESCRICAO: TIBStringField;
    qryProdutoFornecVencCOT_UNIDADE: TIBStringField;
    qryProdutoFornecVencCOT_QTD: TFloatField;
    qryProdutoFornecVencCOT_VALOR: TIBBCDField;
    lbl_excel_2: TLabel;
    pgb_excel_2: TProgressBar;
    btnExcel2: TBitBtn;
    Label10: TLabel;
    Label12: TLabel;
    txt_flag: TEdit;
    qryUltCompraITE_UNIDADE: TIBStringField;
    imgPagar: TImage;
    dspProduto: TDataSetProvider;
    imgNulo: TImage;
    Label13: TLabel;
    btnGerarPedidoCompra: TBitBtn;
    qryFornecedorVencedorCOT_PREVISAO_ENTREGA: TDateTimeField;
    qryFornecedorVencedorCOT_VALOR_FRETE: TIBBCDField;
    qryPesqAux: TIBQuery;
    pnl1: TPanel;
    dbgrd1: TDBGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    fltfldProdutoFornecVencVALOR_TOTAL: TFloatField;
    txt_total_itens: TCurrencyEdit;
    lbl3: TLabel;
    txt_frete: TCurrencyEdit;
    lbl4: TLabel;
    txt_total_geral: TCurrencyEdit;
    lbl5: TLabel;
    txt_obs: TMemo;
    Label3: TLabel;
    qry_empresa: TIBQuery;
    qry_empresaFANTASIA: TIBStringField;
    qry_empresaRAZAO: TIBStringField;
    qry_empresaCNPJ: TIBStringField;
    qry_empresaENDERECO: TIBStringField;
    qry_empresaCIDADE: TIBStringField;
    qry_empresaFONE: TIBStringField;
    cdsProduto: TClientDataSet;
    qryFornecedorAT_CODIGO: TIntegerField;
    qryFornecedorAT_NOME: TIBStringField;
    cdsFornecedorAT_CODIGO: TIntegerField;
    cdsFornecedorAT_NOME: TStringField;
    qryFornecedorLancadosAT_CODIGO: TIntegerField;
    qryFornecedorLancadosAT_NOME: TIBStringField;
    qryFornecedorVencedorFOR_CODIGO: TIntegerField;
    qryFornecedorVencedorAT_NOME: TIBStringField;
    qryFornecedorCOT_OBS: TIBStringField;
    cdsFornecedorCOT_OBS: TStringField;
    qryFornecedorLancadosAT_TELEFONE: TIBStringField;
    qryFornecedorLancadosAT_CELULAR: TIBStringField;
    qryFornecedorVencedorAT_TELEFONE: TIBStringField;
    qryFornecedorVencedorAT_CELULAR: TIBStringField;
    qryProdutoLancadosCOT_OBS: TIBStringField;
    Label5: TLabel;
    txt_total_cotacao: TCurrencyEdit;
    qryFornecedorVencedorCOT_COMPRA_EFETUADA: TIBStringField;
    btnImprimirGrupo: TButton;
    btnConfirmarPreco: TButton;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    qryProdutoPRO_CODIGO: TIntegerField;
    qryProdutoPRO_DESCRICAO: TIBStringField;
    qryProdutoUN_CODIGO: TIntegerField;
    qryProdutoCOT_QTD: TFloatField;
    qryProdutoCOT_UNIDADE: TIBStringField;
    qryProdutoCOT_VALOR: TIBBCDField;
    qryProdutoVALOR_TOTAL: TFloatField;
    qryProdutoCOT_EMPATE: TIBStringField;
    qryProdutoITE_ORDEM_INSERCAO: TIntegerField;
    qryProdutoFOR_INSERIDO: TIBStringField;
    qryProdutoCOT_CONFIRMAR_PRECO: TIBStringField;
    cdsProdutoFOR_INSERIDO: TStringField;
    cdsProdutoITE_ORDEM_INSERCAO: TIntegerField;
    cdsProdutoPRO_CODIGO: TIntegerField;
    cdsProdutoPRO_DESCRICAO: TStringField;
    cdsProdutoUN_CODIGO: TIntegerField;
    cdsProdutoCOT_QTD: TFloatField;
    cdsProdutoCOT_UNIDADE: TStringField;
    cdsProdutoCOT_VALOR: TBCDField;
    cdsProdutoVALOR_TOTAL: TFloatField;
    cdsProdutoCOT_EMPATE: TStringField;
    cdsProdutoCOT_CONFIRMAR_PRECO: TStringField;
    qryProdutoFOR_CODIGO_ANT: TIntegerField;
    qryProdutoCOT_VALOR_ANT: TIBBCDField;
    cdsProdutoFOR_CODIGO_ANT: TIntegerField;
    cdsProdutoCOT_VALOR_ANT: TBCDField;
    qryProdutoFOR_CODIGO_ATUAL: TIntegerField;
    cdsProdutoFOR_CODIGO_ATUAL: TIntegerField;
    qryProdutoAT_NOME: TIBStringField;
    cdsProdutoAT_NOME: TStringField;
    qryProdutoCOT_OBS: TIBStringField;
    cdsProdutoCOT_OBS: TStringField;
    cheInserirPreco: TCheckBox;
    cboFornecedor: TDBLookupComboBox;
    qryFornecedorCombo: TIBQuery;
    dtsFornecedorCombo: TDataSource;
    qryFornecedorComboAT_CODIGO: TIntegerField;
    qryFornecedorComboAT_NOME: TIBStringField;
    lbl_valor: TLabel;
    txt_Valor: TCurrencyEdit;
    Button1: TButton;
    qryProdutoITENS_COT_CODIGO: TIntegerField;
    cdsProdutoITENS_COT_CODIGO: TIntegerField;
    btnPesquisarFornecedor: TButton;
    ExcluirSegundaAba: TPopupMenu;
    ExcluirItemda2Aba1: TMenuItem;
    qryProdutoLancadosAT_CODIGO: TIntegerField;
    TabSheet3: TTabSheet;
    OpenDialog1: TOpenDialog;
    qryCarregarExcel: TIBQuery;
    dsCarregarExcel: TDataSource;
    qryCarregarExcelPRODUTO_DESCRICAO: TIBStringField;
    qryCarregarExcelVALOR_UNIT: TIBBCDField;
    qryCarregarExcelQTDE: TIBBCDField;
    qryCarregarExcelVALOR_TOTAL: TIBBCDField;
    qryCarregarExcelCOD_PRODUTO_EXCEL: TIBStringField;
    dsProdutoExcel: TDataSource;
    qryProdutoExcel: TIBQuery;
    qryProdutoExcelPRO_CODIGO: TIntegerField;
    qryProdutoExcelPRO_DESCRICAO: TIBStringField;
    qryTransLocalCompra: TIBQuery;
    qryProdutoExcelUN_DESCRICAO: TIBStringField;
    qryTransLocalCompraFornec: TIBQuery;
    qryTransLocalFornecMeu: TIBQuery;
    qryCarregarExcelID: TIntegerField;
    gpbCarregarExcel: TGroupBox;
    Label14: TLabel;
    txt_descricao_pesq: TEdit;
    Label15: TLabel;
    txt_cod_produto_pesq: TEdit;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    Button6: TButton;
    dbgProdutoExcel: TDBGrid;
    edtProdutoSelecionado: TEdit;
    cboFornecedorExcel: TDBLookupComboBox;
    edtCaminhoExcel: TEdit;
    DBGrid5: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    edtProdutoSelecionadoExcel: TEdit;
    popCarregarExcel: TPopupMenu;
    InserirItemIndividualmente1: TMenuItem;
    Label16: TLabel;
    edtTotalExcel: TCurrencyEdit;
    Prximomaisbarato1: TMenuItem;
    qryCarregarExcelDESCONTO: TIBBCDField;
    procedure atualiza_grid;
    procedure rdg_organizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure limpacampos(Sender:TObject);
    procedure btn_finalizarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dta_cotacaoEnter(Sender: TObject);
    procedure dta_cotacaoExit(Sender: TObject);
    procedure dta_cotacaoKeyPress(Sender: TObject; var Key: Char);
    procedure dta_vencimentoEnter(Sender: TObject);
    procedure dta_vencimentoExit(Sender: TObject);
    procedure dta_vencimentoKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_fornecKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_barraEnter(Sender: TObject);
    procedure txt_cod_barraExit(Sender: TObject);
    procedure txt_cod_barraKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_barraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_pesq_prodClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbo_unidadeEnter(Sender: TObject);
    procedure cbo_unidadeExit(Sender: TObject);
    procedure cbo_unidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dsProdutoDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsFornecedorLancadosDataChange(Sender: TObject; Field: TField);
    procedure btnExcelClick(Sender: TObject);
    procedure GridToExcel(aGrid:TDBGrid);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure dsFornecedorVencedorDataChange(Sender: TObject;
      Field: TField);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcel2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnGerarPedidoCompraClick(Sender: TObject);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure btnImprimirGrupoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnConfirmarPrecoClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure inserirPrecoMaisBarato;
    procedure inserirPrecoMaisBaratoProximaOpcao;
    procedure cboFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboFornecedorCloseUp(Sender: TObject);
    procedure cheInserirPrecoClick(Sender: TObject);
    procedure txt_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_ValorEnter(Sender: TObject);
    procedure txt_ValorExit(Sender: TObject);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure btnPesquisarFornecedorClick(Sender: TObject);
    procedure cboFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure ExcluirItemda2Aba1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure txt_descricao_pesqChange(Sender: TObject);
    procedure txt_descricao_pesqKeyPress(Sender: TObject; var Key: Char);
    procedure txt_cod_produto_pesqChange(Sender: TObject);
    procedure dbgProdutoExcelDblClick(Sender: TObject);
    procedure dbgProdutoExcelDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure rdb_posicaoClick(Sender: TObject);
    procedure rdb_inicioClick(Sender: TObject);
    procedure dbgProdutoExcelKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure DBGrid5KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure InserirItemIndividualmente1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Prximomaisbarato1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    campo: string;
    cod_cotacao_public: string;
  end;

var
  frm_cotacao_compra: Tfrm_cotacao_compra;
  mensagem, flag_excel : string;
  linha_global: integer;
  fornec_global, cod_fornecedor_global :string;
  valor_global : real;
  data_compra_global : String;
  fornecedor_global : string;

  ///array dinamico
  fornecedor_vetor_global: array of string;
  i_vetor_din: integer;
  codigo_produto_global, cod_produto_proximo_barato_global: string;

  //Variáveis referentes a 4ºaba (excel)
  pro_codigo_meu, pro_codigo_fornecedor, pro_unidade_meu, id_carregar_excel_cotacao_global: string;
  valor_unit_fornec, valor_total_fornec, qtde_fornec, desconto_global : real;

implementation

uses  untPesqCotacaoCompra,
  untInserirFornecedorCotacao, 
  untInserirValorProduto, untRelCotacaoFornecedores,
  untGerarPedidoCompra_cotacao, unt_modulo, untProduto,
  untRelCotacaoGrupoProd, untRelCotacaoFornecedorGrupoProd;

{$R *.dfm}

procedure Tfrm_cotacao_compra.GridToExcel(aGrid:TDBGrid);
var
  linha,i : Integer;
  Excel   : Variant;
  pCds    : TDataSet;
begin
  try
    Excel := CreateoleObject('Excel.Application');
  except on E:Exception do
    Application.MessageBox(pChar('Erro:'+e.Message),pChar('Erro'),MB_OK+MB_ICONERROR);
  end;
  Excel.WorkBooks.add(1);

  linha  := 0;
  i:= 2;

  pCds := aGrid.DataSource.DataSet;

  if(pCds.Active)then
  begin
    pCds.DisableControls;
    try
      inc(linha);

      Excel.cells[linha,i].font.bold   := True;
      if flag_excel = 'VENCEDORES' then
        Excel.cells[linha,i] := qryfornecedorVencedor.FieldByName('AT_NOME').AsString;

      if flag_excel = 'LANCADOS' then
        Excel.cells[linha,i] := qryfornecedorLancados.FieldByName('AT_NOME').AsString;

      linha := 2;

      for i:=0 to aGrid.Columns.Count-1 do
      begin
        Excel.cells[linha,i+1].Interior.Color := $00ffcf9c;
        Excel.cells[linha,i+1].font.bold     := True;
        Excel.cells[linha,i+1] := aGrid.Columns[i].Title.Caption;
      end;

      // Barra de Progresso
      pgb_excel.Max := pCds.RecordCount;
      lbl_excel.Visible := true;
      pgb_excel.Visible := true;
      pgb_excel.Position := 0;

      pgb_excel_2.Max := pCds.RecordCount;
      lbl_excel_2.Visible := true;
      pgb_excel_2.Visible := true;
      pgb_excel_2.Position := 0;

      pCds.First;
      while not pCds.Eof do
      begin
        inc(linha);
        for i:=0 to aGrid.Columns.Count-1 do
        begin
          if(aGrid.Columns[i].Field is TMemoField)then
          begin
            Excel.cells[linha,i+1] := aGrid.Columns[i].Field.AsString;
          end
          else if((aGrid.Columns[i].Field is TFloatField)or(aGrid.Columns[i].Field is TIBBCDField))then
          begin
            if i = 3 then
              Excel.cells[linha,i+1].NumberFormat := '#.##0,000_);(#.##0,000)';
            if i = 4 then
              Excel.cells[linha,i+1].NumberFormat := '#.##0,00_);(#.##0,00)';
            if i = 5 then
              Excel.cells[linha,i+1].NumberFormat := '#.##0,00_);(#.##0,00)';

             Excel.cells[linha,i+1] := aGrid.Columns[i].Field.Value;
          end
          else
          begin
            Excel.cells[linha,i+1] := aGrid.Columns[i].Field.Text;
          end;
        end;
        pCds.Next;

        pgb_excel.Position := pgb_excel.Position + 1;
        pgb_excel_2.Position := pgb_excel.Position + 1;

      end;
    finally
      pCds.EnableControls;
    end;

  end;

  Excel.Visible := True;
  Excel.columns.Autofit;

  // Barra de progresso
  lbl_excel.Visible := false;
  pgb_excel.Visible := false;

  lbl_excel_2.Visible := false;
  pgb_excel_2.Visible := false;

end;

procedure Tfrm_cotacao_compra.limpacampos(Sender:TObject);
begin

  lbl_cod_cotacao.Caption := '';
  dta_cotacao.Clear;
  dta_vencimento.Clear;
  txt_obs.Clear;
  txt_cod_barra.Clear;
  txt_cod_produto.Clear;
  txt_produto.Clear;
  cboFornecedor.KeyValue := -1;

  qryProduto.Close;
  qryProduto.SQL.Clear;

  qryFornecedor.Close;
  qryFornecedor.SQL.Clear;

  qryProdutoLancados.Close;
  qryProdutoLancados.SQL.Clear;

  qryFornecedorLancados.Close;
  qryFornecedorLancados.SQL.Clear;

  qryProdutoFornecVenc.Close;
  qryProdutoFornecVenc.SQL.Clear;

  qryFornecedorVencedor.Close;
  qryFornecedorVencedor.SQL.Clear;

  qryUltCompra.Close;
  qryUltCompra.SQL.Clear;

  cdsFornecedor.Close;
  cdsProduto.Close;

  txt_total_itens.Clear;
  txt_frete.Clear;
  txt_total_geral.Clear;
  txt_total_cotacao.clear;

end;

procedure Tfrm_cotacao_compra.atualiza_grid;
var
  ordenar : string;
begin

end;

procedure Tfrm_cotacao_compra.rdg_organizarClick(Sender: TObject);
begin
  atualiza_grid;
end;

procedure Tfrm_cotacao_compra.FormShow(Sender: TObject);
begin
  //Mostra os dados no combo unidade
  qryUnidade.Close;
  qryUnidade.SQL.clear;
  qryUnidade.SQL.Add('SELECT * FROM UNIDADE ORDER BY UN_DESCRICAO');
  qryUnidade.Open;
  qryUnidade.FetchAll;

  btn_novo.Enabled := true;
  btn_novo.SetFocus;

  btn_finalizar.Enabled := false;
  btn_excluir.Enabled := false;
  btn_alterar.Enabled := false;
  btn_pesquisar.Enabled := true;
  btn_sair.Enabled := true;

  gpb_dados.Enabled := false;
  gpbProduto.Enabled := false;
  gpbCarregarExcel.enabled := false;
  DBGrid2.Enabled := false;
  cheInserirPreco.Checked := True;

  PageControl1.ActivePage:= PageControl1.Pages[0];
  PageControl1.ActivePage:= PageControl1.Pages[1];
  PageControl1.ActivePage:= PageControl1.Pages[0];

  linha_global :=0;
  fornecedor_global:='';

  qryFornecedorCombo.Close;
  qryFornecedorCombo.SQL.Clear;
  qryFornecedorCombo.SQL.Add('SELECT AT_CODIGO, AT_NOME  '+
    'FROM AGENDA_TELEFONE WHERE AT_COTACAO =''S''         '+
    'ORDER BY AT_NOME ');
  qryFornecedorCombo.Open;
  qryFornecedorCombo.FetchAll;

  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('SELECT * FROM CARREGAR_EXCEL_COTACAO ORDER BY PRODUTO_DESCRICAO');
  qryCarregarExcel.Open;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM carregar_excel_cotacao');
  qryPesquisa.Open;
  edtTotalExcel.Value := qryPesquisa.fieldbyname('TOTAL').AsFloat;

  i_vetor_din:=0;
end;

procedure Tfrm_cotacao_compra.btn_novoClick(Sender: TObject);
var
  codigo : integer;
begin
  limpacampos(Sender as TObject);

  SetLength(fornecedor_vetor_global,0);
  i_vetor_din:=0;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT MAX(COT_CODIGO) AS CODIGO FROM COTACAO_COMPRA');
  qryPesquisa.Open;

  codigo := qryPesquisa.fieldbyname('CODIGO').AsInteger + 1;

  lbl_cod_cotacao.Caption := inttostr(codigo);

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('INSERT INTO COTACAO_COMPRA '+
                        '(COT_CODIGO,  FINALIZADO)  '+
                        'VALUES                     '+
                        '(:COT_CODIGO, :FINALIZADO) ');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
  qryTransLocal.ParamByName('FINALIZADO').AsString := 'N';
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  btn_novo.Enabled := false;
  btn_finalizar.Enabled := false;
  btn_excluir.Enabled := true;
  btn_alterar.Enabled := false;
  btn_pesquisar.Enabled := false;
  btn_sair.Enabled := false;

  gpb_dados.Enabled := true;
  gpbProduto.Enabled := true;
  gpbCarregarExcel.enabled := true;
  DBGrid2.Enabled := true;

  PageControl1.ActivePage:= PageControl1.Pages[0];

  dta_cotacao.SetFocus;
end;

procedure Tfrm_cotacao_compra.btn_finalizarClick(Sender: TObject);
begin

  if (dta_cotacao.Text = '  /  /    ')  then
  begin
    mensagem:= 'Informe a data!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    dta_cotacao.SetFocus;
    exit;
  end;

  if (dta_vencimento.Text = '  /  /    ')  then
  begin
    mensagem:= 'Informe o vencimento!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    dta_vencimento.SetFocus;
    exit;
  end;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('UPDATE COTACAO_COMPRA SET                            '+
                        ' FINALIZADO=:FINALIZADO WHERE COT_CODIGO=:COT_CODIGO ');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryTransLocal.ParamByName('FINALIZADO').AsString := 'S';

  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  SetLength(fornecedor_vetor_global,0);
  i_vetor_din:=0;

  btn_novo.Enabled := true;
  btn_novo.SetFocus;
  btn_finalizar.Enabled := false;
  btn_excluir.Enabled := false;
  btn_alterar.Enabled := false;
  btn_pesquisar.Enabled := true;
  btn_sair.Enabled := true;

  limpacampos(Sender as TObject);

  gpb_dados.Enabled := false;
  gpbProduto.Enabled := false;
  DBGrid2.Enabled := false;  

end;

procedure Tfrm_cotacao_compra.btn_excluirClick(Sender: TObject);
begin
  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) of
    IDNO:
  begin
    exit;
  end;
  end;


  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_FORNEC_VENC WHERE COT_CODIGO = '+ lbl_cod_cotacao.Caption);
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA_FORNEC WHERE COT_CODIGO = '+ lbl_cod_cotacao.Caption);
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA WHERE COT_CODIGO = '+ lbl_cod_cotacao.Caption);
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('DELETE FROM COTACAO_COMPRA WHERE COT_CODIGO = '+ lbl_cod_cotacao.Caption);
  qryTransLocal.ExecSQL;
  IBTransLocal.Commit;

  btn_novo.Enabled := true;
  btn_novo.SetFocus;

  btn_finalizar.Enabled := false;
  btn_excluir.Enabled := false;
  btn_alterar.Enabled := false;
  btn_pesquisar.Enabled := true;
  btn_sair.Enabled := true;

  limpacampos(Sender as TObject);

  gpb_dados.Enabled := false;
  gpbProduto.Enabled := false;
  gpbCarregarExcel.enabled:= false;
  btn_Finalizar.Enabled := false;
  DBGrid2.Enabled := false;

  SetLength(fornecedor_vetor_global,0);
  i_vetor_din:=0;

end;

procedure Tfrm_cotacao_compra.btn_alterarClick(Sender: TObject);
begin
  btn_novo.Enabled := false;
  btn_finalizar.Enabled := true;
  btn_excluir.Enabled := False;
  btn_alterar.Enabled := false;
  btn_pesquisar.Enabled := false;
  btn_sair.Enabled := True;

  PageControl1.ActivePage:= PageControl1.Pages[0];

  gpb_dados.Enabled := true;
  gpbProduto.Enabled := true;
  gpbCarregarExcel.enabled := true;
  DBGrid2.Enabled := true;

  dta_cotacao.SetFocus;
end;

procedure Tfrm_cotacao_compra.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cotacao_compra.dta_cotacaoEnter(Sender: TObject);
begin
  dta_cotacao.Color := $00F5EEDE;
end;

procedure Tfrm_cotacao_compra.dta_cotacaoExit(Sender: TObject);
begin
  dta_cotacao.Color := clwindow;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('UPDATE COTACAO_COMPRA SET COT_DATA=:COT_DATA WHERE COT_CODIGO=:COT_CODIGO');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  if dta_cotacao.Text <> '  /  /    ' then
    qryTransLocal.ParamByName('COT_DATA').AsString   := dta_cotacao.Text
  else
    qryTransLocal.ParamByName('COT_DATA').AsString   := '';

  qryTransLocal.ExecSQL;

  IBTransLocal.Commit; 

end;

procedure Tfrm_cotacao_compra.dta_cotacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    dta_vencimento.SetFocus;
end;

procedure Tfrm_cotacao_compra.dta_vencimentoEnter(Sender: TObject);
begin
dta_vencimento.Color := $00F5EEDE;
end;

procedure Tfrm_cotacao_compra.dta_vencimentoExit(Sender: TObject);
begin
  dta_vencimento.Color := clwindow;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('UPDATE COTACAO_COMPRA SET COT_VENCIMENTO=:COT_VENCIMENTO WHERE COT_CODIGO=:COT_CODIGO');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  if dta_vencimento.Text = '  /  /    ' then
    qryTransLocal.ParamByName('COT_VENCIMENTO').AsString   := ''
  else
    qryTransLocal.ParamByName('COT_VENCIMENTO').AsString   := dta_vencimento.Text;

  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

end;

procedure Tfrm_cotacao_compra.dta_vencimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
     txt_obs.SetFocus;
end;

procedure Tfrm_cotacao_compra.txt_cod_fornecKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
     txt_cod_barra.SetFocus;
end;

procedure Tfrm_cotacao_compra.txt_cod_barraEnter(Sender: TObject);
begin
  txt_cod_barra.Clear;
  txt_cod_produto.Clear;
  txt_produto.Clear;
  cbo_unidade.KeyValue := NULL;
  edtQuantidade.Clear;
  txt_Valor.Clear;
  txt_flag.Clear;

  txt_cod_barra.Color := $00F5EEDE;
end;

procedure Tfrm_cotacao_compra.txt_cod_barraExit(Sender: TObject);
begin
  txt_cod_barra.Color := clinfobk;

  if txt_cod_barra.Text = '' then
  begin
    txt_produto.Clear;
    txt_cod_produto.Clear;
    cbo_unidade.KeyValue := null;
    edtQuantidade.Clear;
  end
  else
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRO_DESCRICAO, PRO_CODIGO, UN_CODIGO FROM PRODUTO WHERE PRO_CODIGO = '+ #39 + txt_cod_barra.Text + #39);
    qryPesquisa.Open;

    if qryPesquisa.IsEmpty then
    begin
      mensagem:= 'Produto não encontrado!';
      Application.MessageBox(Pchar(mensagem), 'Atenção', MB_OK+MB_ICONWARNING + MB_TOPMOST);
      txt_cod_barra.Clear;
      txt_produto.Clear;
      cbo_unidade.KeyValue := null;
      edtQuantidade.Clear;
      exit;
    end;

    txt_produto.Text        := qryPesquisa.FieldByName('PRO_DESCRICAO').AsString;
    txt_cod_produto.Text    := qryPesquisa.FieldByName('PRO_CODIGO').AsString;
    cbo_unidade.KeyValue    := qryPesquisa.FieldByName('UN_CODIGO').AsString;
  end;

end;

procedure Tfrm_cotacao_compra.txt_cod_barraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    cbo_unidade.SetFocus;
end;

procedure Tfrm_cotacao_compra.txt_cod_barraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
  begin
    txt_cod_barra.Clear;
    txt_cod_produto.Clear;
    txt_produto.Clear;
    cbo_unidade.KeyValue := NULL;
    edtQuantidade.Clear;
    txt_Valor.Clear;
    txt_flag.Clear;

    btn_Pesq_Prod.Click;
  end;
end;

procedure Tfrm_cotacao_compra.btn_pesq_prodClick(Sender: TObject);
begin
  txt_cod_barra.Clear;
  txt_cod_produto.Clear;
  txt_produto.Clear;
  cbo_unidade.KeyValue := NULL;
  edtQuantidade.Clear;
  txt_Valor.Clear;
  txt_flag.Clear;

  Application.CreateForm(TfrmProduto, frmProduto);
  frmProduto.pesquisa := 'pesq_cotacao_compra';
  frmProduto.ShowModal;

end;

procedure Tfrm_cotacao_compra.btn_pesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqCotacaoCompra, frmPesqCotacaoCompra);
  frmPesqCotacaoCompra.ShowModal;
end;

procedure Tfrm_cotacao_compra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if (cdsProduto.IsEmpty) and (lbl_cod_cotacao.Caption <> '') then
  begin
    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;
    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('DELETE FROM COTACAO_COMPRA WHERE COT_CODIGO = '+ lbl_cod_cotacao.Caption);
    qryTransLocal.ExecSQL;
    IBTransLocal.Commit;
  end;

frm_cotacao_compra := nil;
action:= cafree;
end;

procedure Tfrm_cotacao_compra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  linha, linha_prod, i, i_total : integer;
  data_compra, obs, cod_cotacao, at_codigo: string;
  cot_vencimento : TDate;

begin

  if (key = vk_f5) and (btn_Finalizar.Enabled = True) then
    btnConfirmarPreco.Click;

  if (key = vk_f3) and not (cdsProduto.IsEmpty) and (gpb_dados.Enabled = true) and (PageControl1.ActivePage = PageControl1.Pages[0]) then
  begin

    Application.CreateForm(TfrmInserirFornecedorCotacao, frmInserirFornecedorCotacao);

    //INSERIR O ULTIMO FORNECEDOR

    frmInserirFornecedorCotacao.qryPesquisa.Close;
    frmInserirFornecedorCotacao.qryPesquisa.SQL.Clear;
    frmInserirFornecedorCotacao.qryPesquisa.SQL.Add('SELECT MAX(COTA.COT_VENCIMENTO) AS COT_VENCIMENTO  '+
                                                    'FROM cotacao_compra COTA                           '+
                                                    '     INNER JOIN itens_cotacao_compra I ON          '+
                                                    '     COTA.cot_codigo = I.cot_codigo                '+
                                                    'WHERE I.pro_codigo=:PRO_CODIGO AND COTA.COT_CODIGO <>:COT_CODIGO  ');
    frmInserirFornecedorCotacao.qryPesquisa.ParamByName('PRO_CODIGO').AsString :=
      cdsProduto.fieldbyname('PRO_CODIGO').AsString;
    frmInserirFornecedorCotacao.qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    frmInserirFornecedorCotacao.qryPesquisa.Open;
    frmInserirFornecedorCotacao.qryPesquisa.FetchAll;

    cot_vencimento := frmInserirFornecedorCotacao.qryPesquisa.fieldbyname('COT_VENCIMENTO').AsDateTime;

    frmInserirFornecedorCotacao.qryPesquisa.Close;
    frmInserirFornecedorCotacao.qryPesquisa.SQL.Clear;
    frmInserirFornecedorCotacao.qryPesquisa.SQL.Add('SELECT AG.AT_CODIGO ||''-''|| AG.AT_NOME AS FORNEC,                       '+
                                                    'I.COT_VALOR, COTA.cot_codigo, ICCF.cot_obs                                '+
                                                    'FROM cotacao_compra COTA                                                  '+
                                                    '     INNER JOIN itens_cotacao_compra I ON                                 '+
                                                    '     COTA.cot_codigo = I.cot_codigo                                       '+
                                                    '     INNER JOIN itens_cotacao_compra_fornec ICCF ON                       '+
                                                    '     COTA.cot_codigo = ICCF.cot_codigo AND ICCF.pro_codigo = I.pro_codigo '+
                                                    '     AND I.for_codigo_atual = ICCF.for_codigo                             '+
                                                    '     INNER JOIN agenda_telefone AG ON                                     '+
                                                    '     I.for_codigo_atual = AG.at_codigo                                    '+
                                                    'WHERE I.pro_codigo=:PRO_CODIGO                                            '+
                                                    '  AND COTA.cot_vencimento BETWEEN :DATA1 AND :DATA2                       ');
    frmInserirFornecedorCotacao.qryPesquisa.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString;
    frmInserirFornecedorCotacao.qryPesquisa.ParamByName('DATA1').AsDateTime := cot_vencimento;
    frmInserirFornecedorCotacao.qryPesquisa.ParamByName('DATA2').AsDateTime := cot_vencimento;
    frmInserirFornecedorCotacao.qryPesquisa.Open;
    frmInserirFornecedorCotacao.qryPesquisa.FetchAll;

    frmInserirFornecedorCotacao.txt_ultimo_fornecedor.Text :=
      frmInserirFornecedorCotacao.qryPesquisa.fieldbyname('FORNEC').asstring;
    frmInserirFornecedorCotacao.txt_ult_valor.Value :=
      frmInserirFornecedorCotacao.qryPesquisa.fieldbyname('COT_VALOR').AsFloat;
    frmInserirFornecedorCotacao.txtObsUlt.Text :=
      frmInserirFornecedorCotacao.qryPesquisa.fieldbyname('cot_obs').asstring;
    frmInserirFornecedorCotacao.txtDataUltCompra.Date := cot_vencimento;


    //FIM INSERIR ULTIMO FORNECEDOR


    //COLOCAR O FORNECEDOR MAIS BARATO
    txt_cod_produto.Text:=''; //limpar edit porque está vindo do cdsProduto
    inserirPrecoMaisBarato;

    frmInserirFornecedorCotacao.txtFornecedorBarato.Text := fornec_global;
    frmInserirFornecedorCotacao.txtValorBarato.Text := formatfloat('###,##0.00', valor_global);
    frmInserirFornecedorCotacao.txtDataBarato.Text := data_compra_global;
    //frmInserirFornecedorCotacao.txt_obs_barato.Text := obs;

    //FIM COLOCAR O FORNECEDOR MAIS BARATO


    frmInserirFornecedorCotacao.showmodal;

    //qryProduto.RecNo := linha;

  end;

  if (key = vk_f4) and not (qryProdutoLancados.IsEmpty) and (gpb_dados.Enabled = true) and (PageControl1.ActivePage = PageControl1.Pages[1]) then
  begin
    linha := qryFornecedorLancados.RecNo;
    linha_prod := qryProdutoLancados.RecNo;

    Application.CreateForm(TfrmInserirValorProduto, frmInserirValorProduto);

    frmInserirValorProduto.txt_cod_fornec.Text := qryFornecedorLancados.fieldbyname('AT_CODIGO').AsString;
    frmInserirValorProduto.txt_fornecedor.Text := qryFornecedorLancados.fieldbyname('AT_NOME').AsString;

    frmInserirValorProduto.txt_cod_produto.Text := qryProdutoLancados.fieldbyname('PRO_CODIGO').AsString;
    frmInserirValorProduto.txt_cod_barra.Text   := qryProdutoLancados.fieldbyname('PRO_CODIGO').AsString;
    frmInserirValorProduto.txt_produto.Text     := qryProdutoLancados.fieldbyname('PRO_DESCRICAO').AsString;
    frmInserirValorProduto.txt_unidade.Text     := qryProdutoLancados.fieldbyname('COT_UNIDADE').AsString;
    frmInserirValorProduto.txt_Quantidade.Text  := qryProdutoLancados.fieldbyname('COT_QTD').AsString;
    frmInserirValorProduto.txt_valor.Value      := qryProdutoLancados.fieldbyname('COT_VALOR').AsFloat;
    frmInserirValorProduto.txt_obs.Text         := qryProdutoLancados.fieldbyname('COT_OBS').AsString;

    frmInserirValorProduto.ShowModal;

    qryFornecedorLancados.RecNo := linha;
    qryProdutoLancados.RecNo := linha_prod;
  end;

  if (key = vk_f6) and not (qryFornecedorVencedor.IsEmpty) and (gpb_dados.Enabled = true) and (PageControl1.ActivePage = PageControl1.Pages[2]) then
    btnGerarPedidoCompra.click;

end;

procedure Tfrm_cotacao_compra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#27 then
  begin
    if cdsProduto.IsEmpty then
    begin
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('DELETE FROM COTACAO_COMPRA WHERE COT_CODIGO = '+ lbl_cod_cotacao.Caption);
      qryTransLocal.ExecSQL;

      IBTransLocal.Commit;
    end;
    close;
  end;
end;

procedure Tfrm_cotacao_compra.btnInserirClick(Sender: TObject);
var
  cod_cotacao, forCodigoUltimo, dataCompraUlt, fornecedorComboConvertido : string;
  prodPrecoUlt :real;  
begin
  if txt_produto.Text = '' then
  begin
    mensagem:= 'Informe o produto!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    txt_cod_barra.SetFocus;
    exit;
  end;

  if edtQuantidade.Value = 0 then
  begin
    mensagem:= 'Informe a quantidade!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    edtQuantidade.SetFocus;
    exit;
  end;

  /////VERIFICA SE PRODUTO JA FOI INSERIDO////////

  if txt_flag.Text = '' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM ITENS_COTACAO_COMPRA                                           '+
                        ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO_ATUAL IS NULL ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryPesquisa.Open;

    if not qryPesquisa.IsEmpty then
    begin
      mensagem:= 'Este produto já está cadastrado com fornecedor vazio!';
      Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
      txt_cod_barra.SetFocus;
      exit;
    end;
    if cboFornecedor.Text <> '' then
    begin
       qryPesquisa.Close;
       qryPesquisa.SQL.Clear;
       qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM ITENS_COTACAO_COMPRA                                                     '+
                           ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
       qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
       qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
       qryPesquisa.ParamByName('FOR_CODIGO_ATUAL').AsString := cboFornecedor.KeyValue;
       qryPesquisa.Open;

       if not qryPesquisa.IsEmpty then
       begin
         mensagem:= 'Este produto com este fornecedor já existe na 1º aba (produto)!';
         Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
         txt_cod_barra.SetFocus;
         exit;
       end;

       qryPesquisa.Close;
       qryPesquisa.SQL.Clear;
       qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM ITENS_COTACAO_COMPRA_FORNEC                                  '+
                           ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
       qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
       qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
       qryPesquisa.ParamByName('FOR_CODIGO').AsString := cboFornecedor.KeyValue;
       qryPesquisa.Open;

       if not qryPesquisa.IsEmpty then
       begin
         mensagem:= 'Este produto com este fornecedor já existe na 2º aba (Forencedores Lançados), se quiser adicionar este produto na 1ºaba com o fornecedor selecionado no combobox, exclua o fornecedor da segunda aba!';
         Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
         txt_cod_barra.SetFocus;
         exit;
       end;

    end
    else
    begin
       qryPesquisa.Close;
       qryPesquisa.SQL.Clear;
       qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM ITENS_COTACAO_COMPRA_FORNEC       '+
                           ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO ');
       qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
       qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
       qryPesquisa.Open;

       if not qryPesquisa.IsEmpty then
       begin
         mensagem:= 'Este produto sem fornecedor selecionado não pode ser inserido porque ele já está na 2ºaba c/ outros fornecedores, exclua o da segunda 2ºaba primeiro';
         Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
         txt_cod_barra.SetFocus;
         exit;
       end;
    end;

    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRO_PRECO_ULT, FOR_CODIGO_ULT, DATA_COMPRA_ULT  '+
                        'FROM PRODUTO                                           '+
                        'WHERE PRO_CODIGO=:PRO_CODIGO                           ');
    qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryPesquisa.Open;

    forCodigoUltimo := qryPesquisa.fieldbyname('FOR_CODIGO_ULT').AsString;
    dataCompraUlt   := qryPesquisa.fieldbyname('DATA_COMPRA_ULT').AsString;
    prodPrecoUlt    := qryPesquisa.fieldbyname('PRO_PRECO_ULT').AsFloat;

  end;

  /////FIM VERIFICA SE PRODUTO JA FOI INSERIDO////////

  if txt_flag.Text = '' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT ITE_ORDEM_INSERCAO FROM ITENS_COTACAO_COMPRA         '+
                        'WHERE COT_CODIGO=:COT_CODIGO ORDER BY ITE_ORDEM_INSERCAO    ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.Last;

    if (not IBTransLocal.InTransaction) then
       IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA                                                                        '+
                          '(COT_CODIGO, FOR_CODIGO_ANT, COT_VALOR_ANT, COT_DATA_COMPRA_ULT,                                        '+
                          ' PRO_CODIGO, COT_UNIDADE, COT_QTD, ITE_ORDEM_INSERCAO, FOR_CODIGO_ATUAL, COT_VALOR, FOR_INSERIDO )      '+
                          'VALUES                                                                                                  '+
                          '(:COT_CODIGO, :FOR_CODIGO_ANT, :COT_VALOR_ANT, :COT_DATA_COMPRA_ULT,                                    '+
                          ':PRO_CODIGO, :COT_UNIDADE, :COT_QTD, :ITE_ORDEM_INSERCAO, :FOR_CODIGO_ATUAL, :COT_VALOR, :FOR_INSERIDO) ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryTransLocal.ParamByName('COT_UNIDADE').AsString := cbo_unidade.Text;
    qryTransLocal.ParamByName('COT_QTD').AsFloat := edtQuantidade.Value;
    qryTransLocal.ParamByName('COT_VALOR_ANT').AsFloat := prodPrecoUlt;
    qryTransLocal.ParamByName('FOR_CODIGO_ANT').AsString := forCodigoUltimo;
    qryTransLocal.ParamByName('COT_DATA_COMPRA_ULT').AsString := dataCompraUlt;
    qryTransLocal.ParamByName('ITE_ORDEM_INSERCAO').AsInteger :=
    qryPesquisa.fieldbyname('ITE_ORDEM_INSERCAO').AsInteger +1;
    if cboFornecedor.Text <> '' then
    begin
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsInteger := cboFornecedor.KeyValue;
      qryTransLocal.ParamByName('FOR_INSERIDO').AsString := 'S';
    end;
    if txt_Valor.Visible = True then
      qryTransLocal.ParamByName('COT_VALOR').AsFloat := txt_Valor.Value;
    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;

    if cboFornecedor.Text <> '' then
    begin
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA_FORNEC   '+
         ' (COT_CODIGO, PRO_CODIGO, FOR_CODIGO, COT_VALOR, COT_OBS) '+
         ' VALUES                                              '+
         ' (:COT_CODIGO, :PRO_CODIGO, :FOR_CODIGO, :COT_VALOR, :COT_OBS) ');

      qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
      qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
      qryTransLocal.ParamByName('FOR_CODIGO').AsInteger:= cboFornecedor.KeyValue;
      if txt_Valor.Visible = True then
      begin
        qryTransLocal.ParamByName('COT_VALOR').AsFloat := txt_Valor.Value;
        txt_Valor.Value := 0;
      end;

      qryTransLocal.ExecSQL;

      IBTransLocal.Commit;
    end;

  end
  else
  begin

    //VERIFICA SE PRODUTO POSSUI 2 OU MAIS FORNECEDORES, SE POSSUIR, O FORNECEDOR
    //NAO PODERÁ SER TROCADO NO COMBOBOX, E SIM NO CHECKBOX DO DBGRID
    if cboFornecedor.Text <> '' then
    begin
      fornecedorComboConvertido := FloatToStr(cboFornecedor.KeyValue);

      if fornecedorComboConvertido <> cdsProduto.FieldByName('FOR_CODIGO_ATUAL').AsString then
      begin
        qryPesquisa.Close;
        qryPesquisa.SQL.Clear;
        qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM ITENS_COTACAO_COMPRA_FORNEC    '+
                   'WHERE PRO_CODIGO=:PRO_CODIGO AND COT_CODIGO=:COT_CODIGO');
        qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
        qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
        qryPesquisa.Open;
        qryPesquisa.FetchAll;

        if qryPesquisa.RecordCount > 1 then
        begin
               mensagem:= 'Produto possui mais de 1 fornecedor, não pode ser alterado por aqui, só pode ser alterado pelo checkbox da DBGRID acima';
               Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
               cboFornecedor.SetFocus;
               exit;
        end;
      end;

    end;

    ///FIM

    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET COT_UNIDADE=:COT_UNIDADE, COT_QTD=:COT_QTD, ');
    qryTransLocal.SQL.Add(' COT_VALOR=:COT_VALOR ');
    if cboFornecedor.Text <> '' then
      qryTransLocal.SQL.Add(' ,FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL, FOR_INSERIDO=:FOR_INSERIDO ');

    qryTransLocal.SQL.Add(' WHERE ITENS_COT_CODIGO=:ITENS_COT_CODIGO ');
    qryTransLocal.ParamByName('ITENS_COT_CODIGO').AsString := cdsProduto.fieldbyname('ITENS_COT_CODIGO').AsString;
    qryTransLocal.ParamByName('COT_UNIDADE').AsString := cbo_unidade.Text;
    qryTransLocal.ParamByName('COT_QTD').AsFloat := edtQuantidade.Value;
    qryTransLocal.ParamByName('COT_VALOR').AsFloat :=  txt_Valor.Value;
    if cboFornecedor.Text <> '' then
    begin
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cboFornecedor.KeyValue;
      qryTransLocal.ParamByName('FOR_INSERIDO').AsString := 'S';
    end;

    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;

    if cdsProduto.fieldbyname('FOR_CODIGO_ATUAL').AsString <> '' then
    begin
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA_FORNEC SET                                              '+
                            ' COT_VALOR=:COT_VALOR, FOR_CODIGO=:FOR_CODIGO_ALTERADO                              '+
                            ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
      qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
      qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
      if cboFornecedor.Text <> '' then
      begin
        qryTransLocal.ParamByName('FOR_CODIGO_ALTERADO').AsString := cboFornecedor.KeyValue;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := cdsProduto.fieldbyname('FOR_CODIGO_ATUAL').AsString;
      end;
      qryTransLocal.ParamByName('COT_VALOR').AsFloat :=  txt_Valor.Value;

      qryTransLocal.ExecSQL;

      IBTransLocal.Commit;
    end
    else
    begin
      if cboFornecedor.Text <> '' then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA_FORNEC   ');
        qryTransLocal.SQL.Add(' (COT_CODIGO, PRO_CODIGO, FOR_CODIGO, COT_VALOR) ');
        qryTransLocal.SQL.Add(' VALUES                                         ');
        qryTransLocal.SQL.Add(' (:COT_CODIGO, :PRO_CODIGO, :FOR_CODIGO, :COT_VALOR) ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
        qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
        qryTransLocal.ParamByName('FOR_CODIGO').AsInteger:= cboFornecedor.KeyValue;
        if txt_Valor.Visible = True then
        begin
          qryTransLocal.ParamByName('COT_VALOR').AsFloat := txt_Valor.Value;
          txt_Valor.Value := 0;
        end;

        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;

      end;
    end;

  end;

  cod_cotacao := ' I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;

   // INSERE O PRECO MAIS BAIXO
  if txt_flag.Text = '' then
  begin
    inserirPrecoMaisBarato;

    if cod_fornecedor_global <> '' then
    begin
      if cheInserirPreco.Checked then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA_FORNEC                         '+
                              ' (COT_CODIGO, PRO_CODIGO, FOR_CODIGO, COT_VALOR, COT_OBS)       '+
                              ' VALUES                                                         '+
                              ' (:COT_CODIGO, :PRO_CODIGO, :FOR_CODIGO, :COT_VALOR, :COT_OBS)  ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
        qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := cod_fornecedor_global;
        qryTransLocal.ParamByName('COT_VALOR').AsFloat   := valor_global;

        qryTransLocal.ExecSQL;

        qryPesqAux.Close;
        qryPesqAux.SQL.Clear;
        qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC         '+
                           ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
        qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
        qryPesqAux.ParamByName('FOR_CODIGO').AsString := cod_fornecedor_global;
        qryPesqAux.Open;

        if qryPesqAux.IsEmpty then
        begin
          qryTransLocal.Close;
          qryTransLocal.SQL.Clear;
          qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                                 '+
                                ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE )     '+
                                ' VALUES                                                               '+
                                ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA, :COT_VALOR_FRETE ) ');
          qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
          qryTransLocal.ParamByName('FOR_CODIGO').AsString := cod_fornecedor_global;

          qryTransLocal.ExecSQL;
        end;

        IBTransLocal.Commit;

        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET COT_VALOR=:COT_VALOR, COT_DATA_COMPRA_ULT=:COT_DATA_COMPRA_ULT, '+
                ' FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL, COT_EMPATE=:COT_EMPATE, COT_OBS=:COT_OBS, FOR_INSERIDO=:FOR_INSERIDO '+
                ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
        qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cod_fornecedor_global;
        qryTransLocal.ParamByName('COT_VALOR').AsFloat   := valor_global;
        qryTransLocal.ParamByName('FOR_INSERIDO').AsString := 'S';
        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;

      end;
    end;
       // FIM INSERI O PRECO MAIS BAIXO
  end;

  IF campo = '' then
    campo := 'i.ite_ordem_insercao';


  //ATUALIZA A GRID DOS FORNECEDORES CAMPEOES

  if cboFornecedor.Text <> '' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC   '+
                        ' WHERE COT_CODIGO=:COT_CODIGO                      ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.First;

    if (not IBTransLocal.InTransaction) then
       IBTransLocal.StartTransaction;

    WHILE not qryPesquisa.Eof do
    begin
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO_ATUAL FROM ITENS_COTACAO_COMPRA                    '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO_ATUAL').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;
      qryPesqAux.Open;

      IF qryPesqAux.IsEmpty then
      begin
        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_FORNEC_VENC                    '+
                              ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;

        qryTransLocal.ExecSQL;
      end;

      qryPesquisa.Next;
    end;

    IBTransLocal.Commit;

    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FOR_CODIGO_ATUAL, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE              '+
                        ' FROM ITENS_COTACAO_COMPRA                                                  '+
                        ' WHERE COT_CODIGO=:COT_CODIGO AND                                           '+
                        ' (FOR_CODIGO_ATUAL IS NOT null or FOR_CODIGO_ATUAL <> '+ #39 + ''+ #39 + ') ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.First;

    while not qryPesquisa.Eof do
    begin
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC         '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
      qryPesqAux.Open;

      if qryPesqAux.IsEmpty then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                                 '+
                              ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE )     '+
                              ' VALUES                                                               '+
                              ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA, :COT_VALOR_FRETE ) ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
        qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := qryPesquisa.fieldbyname('COT_PREVISAO_ENTREGA').AsString;
        qryTransLocal.ParamByName('COT_VALOR_FRETE').AsString := qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsString;

        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;
      end;
      qryPesquisa.Next;
    end;

  end;

  //FIM ATUALIZA A GRID DOS FORNECEDORES CAMPEOES


  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  '+
                     'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  '+
                     'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    '+
                     'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  '+
                     'FROM itens_cotacao_compra I INNER JOIN                                                  '+
                     '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              '+
                     'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           '+
                     'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                     '  AND ICCF.for_codigo = I.for_codigo_atual                                              '+
                     'LEFT JOIN agenda_telefone FORN ON                                                       '+
                     'I.for_codigo_atual = FORN.at_codigo                                                     '+
                     'WHERE ' + cod_cotacao + fornecedor_global                                                +
                     'GROUP BY I.ITENS_COT_CODIGO,                                                            '+
                     'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  '+
                     'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      '+
                     'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs '+
                     ' order by ' + campo );
  qryProduto.Open;

  cdsProduto.Close;
  cdsProduto.FetchParams;
  cdsProduto.Open;

  btn_Finalizar.Enabled := true;

  if linha_global <> 0 then
  begin
    cdsProduto.RecNo := linha_global;
    DBGrid1.SetFocus;
  end
  else
  begin
    cdsProduto.RecNo := cdsProduto.RecordCount;
    txt_cod_barra.SetFocus;
  end;

  linha_global :=0;

  txt_cod_barra.Clear;
  txt_cod_produto.Clear;
  txt_produto.Clear;
  cbo_unidade.KeyValue := NULL;
  edtQuantidade.Clear;
  txt_Valor.Clear;
  txt_flag.Clear;

end;

procedure Tfrm_cotacao_compra.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

Const
CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,
      DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  CheckBoxRectangle : TRect;
  Bitmap: TBitmap;
begin
  if cdsProduto.FieldByName('COT_EMPATE').AsString = 'S' then
    DBGrid1.Canvas.Brush.Color := $00B0B7DB;

  if cdsProduto.FieldByName('COT_CONFIRMAR_PRECO').AsString = 'S' then
    DBGrid1.Canvas.Brush.Color := $005EAEFF;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
    Font.Style  := [fsbold];
    DBGrid1.Canvas.Brush.Color := clWhite;

    if cdsProduto.FieldByName('COT_EMPATE').AsString = 'S' then
      DBGrid1.Canvas.Brush.Color := $00B0B7DB;

    if cdsProduto.FieldByName('COT_CONFIRMAR_PRECO').AsString = 'S' then
      DBGrid1.Canvas.Brush.Color := $005EAEFF;

  end;

  DBGrid1.Canvas.Font.Color:= clBlack;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Column.FieldName = 'FOR_INSERIDO') and (cdsProduto.FieldByName('FOR_INSERIDO').AsString = 'S')  then
    Bitmap := imgPagar.Picture.Bitmap
  else
    Bitmap := imgNulo.Picture.Bitmap;

  DBGrid1.Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
  (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);


end;

procedure Tfrm_cotacao_compra.cbo_unidadeEnter(Sender: TObject);
begin
  cbo_unidade.Color := $00F5EEDE;
end;

procedure Tfrm_cotacao_compra.cbo_unidadeExit(Sender: TObject);
begin
  cbo_unidade.Color := clwindow;
end;

procedure Tfrm_cotacao_compra.cbo_unidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    edtQuantidade.SetFocus;
end;

procedure Tfrm_cotacao_compra.edtQuantidadeEnter(Sender: TObject);
begin
  edtQuantidade.Color := $00F5EEDE;
end;

procedure Tfrm_cotacao_compra.edtQuantidadeExit(Sender: TObject);
begin
  edtQuantidade.Color := clwindow;
end;

procedure Tfrm_cotacao_compra.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    if txt_Valor.Visible = False then
      btnInserir.Click
    else
      txt_Valor.SetFocus;
  end;
end;

procedure Tfrm_cotacao_compra.dsProdutoDataChange(Sender: TObject;
  Field: TField);
var
  cot_codigo, pro_codigo : string;
begin
  cot_codigo := ' AND I.COT_CODIGO = '  + #39 + lbl_cod_cotacao.Caption  + #39 ;
  if not cdsProduto.IsEmpty then
   pro_codigo := ' AND P.PRO_CODIGO = '  + #39 + cdsProduto.fieldbyname('PRO_CODIGO').AsString + #39
  else
   pro_codigo := '';

  qryFornecedor.Close;
  qryFornecedor.SQL.Clear;
  qryFornecedor.SQL.Add('SELECT F.AT_CODIGO, F.AT_NOME, F.AT_CELULAR, F.AT_TELEFONE, I.COT_VALOR, I.PRO_CODIGO, I.COT_OBS     '+
       ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I, produto p      '+
       ' WHERE I.for_codigo = F.AT_codigo AND I.PRO_CODIGO = P.PRO_CODIGO ' + cot_codigo + pro_codigo +
       ' ORDER BY I.COT_VALOR ');
  qryFornecedor.Open;

  cdsFornecedor.Close;
  cdsFornecedor.FetchParams;
  cdsFornecedor.Open;

  ////VERIFICA SE TEM VALOR SELECIONADO NO PRODUTO/////////////

  if cdsProduto.FieldByName('COT_VALOR').AsString <> '' then
  begin
    cdsFornecedor.First;
    while not cdsFornecedor.Eof do
    begin
      if cdsFornecedor.FieldByName('AT_CODIGO').AsString = cdsProduto.FieldByName('FOR_CODIGO_ATUAL').AsString then
      begin
        DBGrid2.SelectedField.Dataset.Edit;
        DBGrid2.SelectedField.AsBoolean := true;
        DBGrid2.SelectedField.Dataset.Post;
      end;
      cdsFornecedor.Next;
    end;
  end;

  /////FIM VERIFICA SE TEM VALOR SELECIONADO NO PRODUTO/////////////

  qryFornecedorLancados.Close;
  qryFornecedorLancados.SQL.Clear;
  qryFornecedorLancados.SQL.Add('SELECT F.AT_CODIGO, F.AT_NOME, F.AT_TELEFONE, AT_CELULAR                                        '+
                                ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I, PRODUTO P                               '+
                                ' WHERE I.for_codigo = F.AT_codigo AND P.PRO_CODIGO = I.PRO_CODIGO AND I.COT_CODIGO =:COT_CODIGO '+
                                ' GROUP BY F.AT_CODIGO, F.AT_NOME, F.AT_TELEFONE, AT_CELULAR                                     ');
  qryFornecedorLancados.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryFornecedorLancados.Open;
  qryFornecedorLancados.FetchAll;

  qryFornecedorVencedor.Close;
  qryFornecedorVencedor.SQL.Clear;
  qryFornecedorVencedor.SQL.Add('SELECT I.FOR_CODIGO, F.AT_nome, I.COT_PREVISAO_ENTREGA,                                                                          '+
                                ' I.COT_VALOR_FRETE, F.AT_TELEFONE, F.AT_CELULAR, I.COT_COMPRA_EFETUADA                                                           '+
                                'FROM  itens_cotacao_fornec_venc I,  AGENDA_TELEFONE F                                                                            '+
                                'WHERE  F.AT_codigo = I.for_codigo                                                                                                '+
                                'AND I.COT_CODIGO =:COT_CODIGO AND                                                                                                '+
                                ' (COT_FORNEC_PARTICIPANTE <> ' + #39 + 'N'+ #39 + ' OR COT_FORNEC_PARTICIPANTE IS NULL)                                          '+
                                'group by I.for_codigo, F.AT_nome, F.AT_TELEFONE, F.AT_CELULAR, I.COT_PREVISAO_ENTREGA, I.COT_VALOR_FRETE, I.COT_COMPRA_EFETUADA  '+
                                'ORDER BY I.for_codigo                                                                                                            ');
  qryFornecedorVencedor.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryFornecedorVencedor.Open;
  qryFornecedorVencedor.FetchAll;

end;

procedure Tfrm_cotacao_compra.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  cod_cotacao : string;

begin
  if (key = VK_DELETE) AND not (cdsProduto.IsEmpty) and (gpb_dados.Enabled = true) then
  begin
    case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir o produto  ' + cdsProduto.FieldByName('PRO_CODIGO').AsString  + ' - ' + cdsProduto.FieldByName('PRO_DESCRICAO').AsString +
        ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) of
    IDNO:
    begin
       exit;
    end;
    end;

    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;
    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA_FORNEC WHERE COT_CODIGO =:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString;
    qryTransLocal.ExecSQL;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA WHERE COT_CODIGO =:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString;
    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;
    /////VERIFICA SE FORNECEDOR PARTICIPA DOS CAMPEOES/////////

    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC   '+
         ' WHERE COT_CODIGO=:COT_CODIGO ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.First;

    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    WHILE not qryPesquisa.Eof do
    begin
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO_ATUAL FROM ITENS_COTACAO_COMPRA                    '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO_ATUAL').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;
      qryPesqAux.Open;

      IF qryPesqAux.IsEmpty then
      begin
        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_FORNEC_VENC                    '+
                              ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;

        qryTransLocal.ExecSQL;

      end;
      qryPesquisa.Next;
     end;

    IBTransLocal.Commit;

    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FOR_CODIGO_ATUAL, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE               '+
                        ' FROM ITENS_COTACAO_COMPRA                                                   '+
                        ' WHERE COT_CODIGO=:COT_CODIGO AND                                            '+
                        ' (FOR_CODIGO_ATUAL IS NOT null or FOR_CODIGO_ATUAL <> '+ #39 + ''+ #39 + ')  ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.First;

    while not qryPesquisa.Eof do
    begin
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC         '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
      qryPesqAux.Open;

      if qryPesqAux.IsEmpty then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                                 '+
                              ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE )     '+
                              ' VALUES                                                               '+
                              ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA, :COT_VALOR_FRETE ) ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
        qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := qryPesquisa.fieldbyname('COT_PREVISAO_ENTREGA').AsString;
        qryTransLocal.ParamByName('COT_VALOR_FRETE').AsString := qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsString;

        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;
      end;

      qryPesquisa.Next;

    end;
    /////FIM VERIFICA SE FORNECEDOR PARTICIPA DOS CAMPEOES/////////

    cod_cotacao := ' I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;

    qryProduto.Close;
    qryProduto.SQL.Clear;
    qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  '+
                       'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  '+
                       'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    '+
                       'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  '+
                       'FROM itens_cotacao_compra I INNER JOIN                                                  '+
                       '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              '+
                       'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           '+
                       'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                       '  AND ICCF.for_codigo = I.for_codigo_atual                                              '+
                       'LEFT JOIN agenda_telefone FORN ON                                                       '+
                       'I.for_codigo_atual = FORN.at_codigo                                                     '+
                       'WHERE ' + cod_cotacao                                                                    +
                       'GROUP BY I.ITENS_COT_CODIGO,                                                            '+
                       'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  '+
                       'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      '+
                       'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs '+
                       ' order by ' + campo );
    qryProduto.Open;

    frm_cotacao_compra.cdsProduto.Close;
    frm_cotacao_compra.cdsProduto.FetchParams;
    frm_cotacao_compra.cdsProduto.Open;

    if cdsProduto.IsEmpty then
      btn_Finalizar.Enabled := false;

  end;

end;

procedure Tfrm_cotacao_compra.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const
CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,
      DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  CheckBoxRectangle : TRect;
  Bitmap: TBitmap;

begin
  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clMenuHighlight;
      Font.Style  := [fsbold];
      Font.Color  := clWhite
    end
    else
      DBGrid2.Canvas.Font.Color:= clBlack;

  DBGrid2.Canvas.FillRect(Rect);
  DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Column.FieldName = 'CHEQUED') and (cdsFornecedor.RecordCount > 0)  then
  begin
      Self.DBGrid2.Canvas.FillRect(Rect);
      CheckBoxRectangle.Left := Rect.Left + 2;
      CheckBoxRectangle.Right := Rect.Right - 2;
      CheckBoxRectangle.Top := Rect.Top + 2;
      CheckBoxRectangle.Bottom := Rect.Bottom - 2;
      DrawFrameControl(Self.DBGrid2.Canvas.Handle,
      CheckBoxRectangle, DFC_BUTTON,
      CtrlState[Column.Field.AsBoolean]);
  end;
  
end;

procedure Tfrm_cotacao_compra.DBGrid3DrawColumnCell(Sender: TObject;
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
      DBGrid3.Canvas.Font.Color:= clBlack;

  DBGrid3.Canvas.FillRect(Rect);
  DBGrid3.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrm_cotacao_compra.dsFornecedorLancadosDataChange(Sender: TObject;
  Field: TField);
begin
  qryProdutoLancados.Close;
  qryProdutoLancados.SQL.Clear;
  qryProdutoLancados.SQL.Add(' SELECT P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, II.COT_OBS, f.at_codigo, ');
  qryProdutoLancados.SQL.Add('(CASE WHEN II.cot_valor = 0 THEN   ');
  qryProdutoLancados.SQL.Add(' 0         ');
  qryProdutoLancados.SQL.Add('ELSE       ');
  qryProdutoLancados.SQL.Add(' II.cot_valor END) AS COT_VALOR         ');
  qryProdutoLancados.SQL.Add('  FROM AGENDA_TELEFONE f INNER JOIN     ');
  qryProdutoLancados.SQL.Add('   itens_cotacao_compra_fornec II ON    ');
  qryProdutoLancados.SQL.Add('   II.for_codigo = F.at_codigo          ');
  qryProdutoLancados.SQL.Add('   INNER JOIN PRODUTO P ON              ');
  qryProdutoLancados.SQL.Add('   P.pro_codigo = II.pro_codigo         ');
  qryProdutoLancados.SQL.Add('   LEFT JOIN itens_cotacao_compra I ON  ');
  qryProdutoLancados.SQL.Add('   II.pro_codigo = I.pro_codigo AND     ');
  qryProdutoLancados.SQL.Add('   II.cot_codigo = I.cot_codigo         ');
  qryProdutoLancados.SQL.Add('   AND I.for_codigo_atual = II.for_codigo   ');
  qryProdutoLancados.SQL.Add('   WHERE II.COT_CODIGO =:COT_CODIGO AND II.for_codigo =:FOR_CODIGO ');
  qryProdutoLancados.ParamByName('FOR_CODIGO').AsString := qryFornecedorLancados.fieldbyname('AT_CODIGO').AsString;
  qryProdutoLancados.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryProdutoLancados.Open;

end;

procedure Tfrm_cotacao_compra.btnExcelClick(Sender: TObject);
begin
  if qryProdutoLancados.IsEmpty then
    exit;

  flag_excel := 'LANCADOS';

  GridToExcel(DBGrid4);
end;

procedure Tfrm_cotacao_compra.DBGrid4DrawColumnCell(Sender: TObject;
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
      DBGrid4.Canvas.Font.Color:= clBlack;

  DBGrid4.Canvas.FillRect(Rect);
  DBGrid4.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_cotacao_compra.DBGrid2CellClick(Column: TColumn);
var
  cod_fornec, linha, cod_cotacao : string;
  i_fornec, i_prod : integer;

begin
  if cdsFornecedor.IsEmpty then
    Exit;

  //Verifica se produto está 2 ou mais vezes na tabela itens_cotacao_compra,
  //se estiver não pode ser alterado pelo checkbox da dbgrid

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM ITENS_COTACAO_COMPRA             '+
                      'WHERE PRO_CODIGO=:PRO_CODIGO AND COT_CODIGO=:COT_CODIGO ');
  qryPesquisa.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString;
  qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryPesquisa.Open;
  qryPesquisa.FetchAll;

  if qryPesquisa.RecordCount > 1 then
  begin
    mensagem:= 'Produto possui mais de 1 fornecedor, não pode ser alterado por aqui' ;
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    exit;
  end;

  //fim Verifica se produto está 2 ou mais vezes na tabela itens_cotacao_compra,
  //se estiver não pode ser alterado pelo checkbox da dbgrid

  if Column.Field = cdsFornecedorCHEQUED then
  begin

    if (DBGrid2.SelectedField.DataType = ftString) and (Column.Field.FieldName = 'CHEQUED')  then
    begin
      DBGrid2.SelectedField.Dataset.Edit;
      DBGrid2.SelectedField.AsBoolean := not Self.DBGrid2.SelectedField.AsBoolean;
      DBGrid2.SelectedField.Dataset.Post;

      i_fornec :=cdsFornecedor.RecNo;
      i_prod := cdsProduto.RecNo;
    end;

      if DBGrid2.SelectedField.AsBoolean = true then
      begin
        cod_fornec := cdsFornecedor.fieldbyname('AT_CODIGO').AsString;

        ////GRAVA O VALOR SELECIONADO NA GRID NA SELECAO DE VALORES DO PRODUTO/////
        qryPesquisa.Close;
        qryPesquisa.SQL.Clear;
        qryPesquisa.SQL.Add('SELECT COT_PREVISAO_ENTREGA, COT_VALOR_FRETE FROM ITENS_COTACAO_FORNEC_VENC                  '+
                            'WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO AND COT_PREVISAO_ENTREGA IS NOT NULL ');
        qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
        qryPesquisa.ParamByName('FOR_CODIGO').AsString := cdsFornecedor.fieldbyname('AT_CODIGO').AsString;
        qryPesquisa.open;

        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET COT_VALOR=:COT_VALOR, FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL,                               '+
                              ' COT_PREVISAO_ENTREGA=:COT_PREVISAO_ENTREGA, COT_VALOR_FRETE=:COT_VALOR_FRETE WHERE ITENS_COT_CODIGO =:ITENS_COT_CODIGO ');
        qryTransLocal.ParamByName('ITENS_COT_CODIGO').AsString := cdsProduto.fieldbyname('ITENS_COT_CODIGO').AsString;

        if not qryPesquisa.IsEmpty then
        begin
          qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := qryPesquisa.fieldbyname('COT_PREVISAO_ENTREGA').AsString;
          qryTransLocal.ParamByName('COT_VALOR_FRETE').asfloat :=  qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsFloat;
        end
        else
        begin
          qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := '';
          qryTransLocal.ParamByName('COT_VALOR_FRETE').asfloat :=  0;
        end;

        if cdsFornecedor.fieldbyname('COT_VALOR').AsString <> '' then
        begin
          qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cod_fornec;
          qryTransLocal.ParamByName('COT_VALOR').AsFloat   := cdsFornecedor.fieldbyname('COT_VALOR').AsFloat;
        end
        else
        begin
          qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := '';
          qryTransLocal.ParamByName('COT_VALOR').AsString   := '';
        end;

        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;

        /////FIM GRAVA O VALOR SELECIONADO NA GRID NA SELECAO DE VALORES DO PRODUTO/////


        ///////////VERIFICA SE FORNECEDOR PARTICIPA DOS CAMPEOES/////////

        if cod_fornec <> '' then
        begin
          qryPesquisa.Close;
          qryPesquisa.SQL.Clear;
          qryPesquisa.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC   '+
                              ' WHERE COT_CODIGO=:COT_CODIGO                      ');
          qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
          qryPesquisa.Open;
          qryPesquisa.First;

          if (not IBTransLocal.InTransaction) then
            IBTransLocal.StartTransaction;

          WHILE not qryPesquisa.Eof do
          begin
            qryPesqAux.Close;
            qryPesqAux.SQL.Clear;
            qryPesqAux.SQL.Add('SELECT FOR_CODIGO_ATUAL FROM ITENS_COTACAO_COMPRA   '+
               ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
            qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
            qryPesqAux.ParamByName('FOR_CODIGO_ATUAL').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;
            qryPesqAux.Open;

            IF qryPesqAux.IsEmpty then
            begin
              qryTransLocal.Close;
              qryTransLocal.SQL.Clear;
              qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_FORNEC_VENC  '+
                ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
              qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
              qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;

              qryTransLocal.ExecSQL;
            end;
            qryPesquisa.Next;
          end;

          IBTransLocal.Commit;

          qryPesquisa.Close;
          qryPesquisa.SQL.Clear;
          qryPesquisa.SQL.Add('SELECT FOR_CODIGO_ATUAL, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE '+
               ' FROM ITENS_COTACAO_COMPRA  '+
               ' WHERE COT_CODIGO=:COT_CODIGO AND                                 '+
               ' (FOR_CODIGO_ATUAL IS NOT null or FOR_CODIGO_ATUAL <> '+ #39 + ''+ #39 + ')         ');
          qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
          qryPesquisa.Open;
          qryPesquisa.First;

          while not qryPesquisa.Eof do
          begin
            qryPesqAux.Close;
            qryPesqAux.SQL.Clear;
            qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC   '+
               ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
            qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
            qryPesqAux.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
            qryPesqAux.Open;

            if qryPesqAux.IsEmpty then
            begin
              if (not IBTransLocal.InTransaction) then
                IBTransLocal.StartTransaction;

              qryTransLocal.Close;
              qryTransLocal.SQL.Clear;
              qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                                 '+
                                    ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE )     '+
                                    ' VALUES                                                               '+
                                    ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA, :COT_VALOR_FRETE ) ');
              qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
              qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
              qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := qryPesquisa.fieldbyname('COT_PREVISAO_ENTREGA').AsString;
              qryTransLocal.ParamByName('COT_VALOR_FRETE').AsString := qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsString;

              qryTransLocal.ExecSQL;

              IBTransLocal.Commit;
            end;
            qryPesquisa.Next;

          end;
        end;
        /////////////FIM VERIFICA SE FORNECEDOR PARTICIPA DOS CAMPEOES/////////

        cdsFornecedor.First;

        while not cdsFornecedor.Eof do
        begin
          if cod_fornec <> cdsFornecedor.fieldbyname('AT_CODIGO').AsString then
          begin
             DBGrid2.SelectedField.Dataset.Edit;
             DBGrid2.SelectedField.AsBoolean := false;
             DBGrid2.SelectedField.Dataset.Post;
          end;
          cdsFornecedor.Next;
        end;
      end;

      cod_cotacao := ' I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;

      if campo = '' then
        campo := 'i.ite_ordem_insercao';

      qryProduto.Close;
      qryProduto.SQL.Clear;
      qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  '+
                         'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  '+
                         'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    '+
                         'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO       '+
                         'FROM itens_cotacao_compra I INNER JOIN                                       '+
                         '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                   '+
                         'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                '+
                         'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo            '+
                         'AND ICCF.for_codigo = I.for_codigo_atual                                     '+
                         'LEFT JOIN agenda_telefone FORN ON                                            '+
                         'I.for_codigo_atual = FORN.at_codigo                                          '+
                         'WHERE ' + cod_cotacao                                                         +
                         'GROUP BY I.ITENS_COT_CODIGO,                                                 '+
                         'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,       '+
                         'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME, '+
                         'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs '+
                         ' order by ' + campo );
      qryProduto.Open;

      cdsProduto.Close;
      cdsProduto.FetchParams;
      cdsProduto.Open;

      cdsProduto.RecNo := i_prod;

      cdsFornecedor.RecNo := i_fornec;

      DBGrid2.SelectedField.Dataset.Edit;
      DBGrid2.SelectedField.AsBoolean := true;
      DBGrid2.SelectedField.Dataset.Post;

  end;

end;

procedure Tfrm_cotacao_compra.btnImprimirClick(Sender: TObject);
begin

  if qryProdutoFornecVenc.IsEmpty then
    exit;

  Application.CreateForm(TfrmRelCotacaoFornecedores, frmRelCotacaoFornecedores);

  frmRelCotacaoFornecedores.qryFornecedores.Close;
  frmRelCotacaoFornecedores.qryFornecedores.SQL.Clear;
  frmRelCotacaoFornecedores.qryFornecedores.SQL.Add('SELECT I.COT_CODIGO, P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,                                             '+
                                                    ' I.FOR_CODIGO_ATUAL ||'+ #39 + ' - '+ #39 + '|| F.AT_nome as fornec, i.for_codigo_atual, II.COT_PREVISAO_ENTREGA, II.COT_VALOR_FRETE   '+
                                                    ' FROM produto P, itens_cotacao_compra I, itens_cotacao_fornec_venc II, AGENDA_TELEFONE F                                               '+
                                                    ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual                                                                '+
                                                    ' AND I.COT_CODIGO =:COT_CODIGO AND II.cot_codigo = I.cot_codigo AND II.for_codigo = F.AT_codigo                                        '+
                                                    ' ORDER BY I.for_codigo_atual, P.pro_codigo                                                                                             ');
  frmRelCotacaoFornecedores.qryFornecedores.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  frmRelCotacaoFornecedores.qryFornecedores.Open;

  frmRelCotacaoFornecedores.txt_cotacao.Caption := lbl_cod_cotacao.Caption;
  frmRelCotacaoFornecedores.txt_data_cotacao.Caption := dta_cotacao.Text;
  frmRelCotacaoFornecedores.txt_data_vencimento.Caption := dta_vencimento.Text;

  frmRelCotacaoFornecedores.frFornecedores.Prepare;
  frmRelCotacaoFornecedores.frFornecedores.PreviewModal();

end;

procedure Tfrm_cotacao_compra.dsFornecedorVencedorDataChange(
  Sender: TObject; Field: TField);
begin

  qryProdutoFornecVenc.Close;
  qryProdutoFornecVenc.SQL.Clear;
  qryProdutoFornecVenc.SQL.Add('SELECT P.PRO_CODIGO,  P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor,   '+
                               ' SUM(I.cot_qtd * I.cot_valor) AS VALOR_TOTAL                                    '+
                               ' FROM produto P, itens_cotacao_compra I, AGENDA_TELEFONE F                      '+
                               ' WHERE I.pro_codigo = P.pro_codigo AND F.AT_codigo = I.for_codigo_atual         '+
                               ' AND I.COT_CODIGO =:COT_CODIGO AND I.FOR_CODIGO_ATUAL=:FOR_CODIGO               '+
                               ' GROUP BY P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, I.cot_valor  '+
                               ' ORDER BY P.pro_DESCRICAO                                                       ');
  qryProdutoFornecVenc.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryProdutoFornecVenc.ParamByName('FOR_CODIGO').AsString := qryFornecedorVencedor.fieldbyname('FOR_CODIGO').AsString;
  qryProdutoFornecVenc.Open;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT SUM(cot_qtd * cot_valor) AS VALOR_TOTAL FROM itens_cotacao_compra '+
                      ' WHERE COT_CODIGO =:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO          ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryPesquisa.ParamByName('FOR_CODIGO').AsString := qryFornecedorVencedor.fieldbyname('FOR_CODIGO').AsString;
  qryPesquisa.Open;

  txt_total_itens.Value := qryPesquisa.fieldbyname('VALOR_TOTAL').AsFloat;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT COT_VALOR_FRETE FROM itens_cotacao_fornec_venc       '+
                      ' WHERE COT_CODIGO =:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO   ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryPesquisa.ParamByName('FOR_CODIGO').AsString := qryFornecedorVencedor.fieldbyname('FOR_CODIGO').AsString;
  qryPesquisa.Open;

  txt_frete.Value := qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsFloat;

  txt_total_geral.Value := txt_total_itens.Value + txt_frete.Value;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT SUM(cot_qtd * cot_valor) AS VALOR_TOTAL FROM itens_cotacao_compra '+
                      ' WHERE COT_CODIGO =:COT_CODIGO                                           ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryPesquisa.Open;

  txt_total_cotacao.value := qryPesquisa.fieldbyname('VALOR_TOTAL').AsFloat;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT SUM(COT_VALOR_FRETE) AS COT_VALOR_FRETE FROM itens_cotacao_fornec_venc '+
                      ' WHERE COT_CODIGO =:COT_CODIGO                                                ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryPesquisa.Open;

  txt_total_cotacao.value := txt_total_cotacao.value + qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsFloat;

end;

procedure Tfrm_cotacao_compra.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  IF (qryFornecedorVencedor.FieldByName('COT_COMPRA_EFETUADA').AsString = 'S' ) then
    dbgrd1.Canvas.Brush.Color := $0000EAEA;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Font.Style  := [fsbold];
      dbgrd1.Canvas.Brush.Color := clWhite;

      IF (qryFornecedorVencedor.FieldByName('COT_COMPRA_EFETUADA').AsString = 'S' ) then
        dbgrd1.Canvas.Brush.Color := $0000EAEA;
    end;

  dbgrd1.Canvas.Font.Color:= clBlack;
  dbgrd1.Canvas.FillRect(Rect);
  dbgrd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrm_cotacao_compra.DBGrid7DrawColumnCell(Sender: TObject;
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
      DBGrid7.Canvas.Font.Color:= clBlack;

  DBGrid7.Canvas.FillRect(Rect);
  DBGrid7.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrm_cotacao_compra.btnExcel2Click(Sender: TObject);
begin
  if qryProdutoFornecVenc.IsEmpty then
    exit;

  flag_excel := 'VENCEDORES';
  GridToExcel(DBGrid7);
end;

procedure Tfrm_cotacao_compra.DBGrid1DblClick(Sender: TObject);
begin

  linha_global := cdsProduto.RecNo;
  txt_cod_produto.Text := cdsProduto.fieldbyname('PRO_CODIGO').AsString;
  txt_cod_barra.Text   := cdsProduto.fieldbyname('PRO_CODIGO').AsString;
  txt_produto.Text     := cdsProduto.fieldbyname('PRO_DESCRICAO').AsString;

  if cdsProduto.FieldByName('FOR_CODIGO_ATUAL').AsString <> '' then
  begin
    txt_Valor.Visible := True;
    cboFornecedor.KeyValue := cdsProduto.FieldByName('FOR_CODIGO_ATUAL').AsString;
    txt_Valor.Value := cdsProduto.fieldbyname('COT_VALOR').AsFloat;
    cheInserirPreco.Checked := False;
  end;

  ////PROCURA UN////
  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT UN_CODIGO FROM UNIDADE WHERE UN_DESCRICAO=:UN_DESCRICAO');
  qryPesquisa.ParamByName('UN_DESCRICAO').AsString := cdsProduto.fieldbyname('COT_UNIDADE').AsString;
  qryPesquisa.Open;
  /////FIM PROCURA UN/////////

  cbo_unidade.KeyValue := qryPesquisa.fieldbyname('UN_CODIGO').AsString;
  edtQuantidade.Value  := cdsProduto.fieldbyname('COT_QTD').AsFloat;
  txt_flag.Text := cdsProduto.fieldbyname('PRO_CODIGO').AsString;

  edtQuantidade.SetFocus;

end;

procedure Tfrm_cotacao_compra.btnGerarPedidoCompraClick(Sender: TObject);
begin

 if (qryProdutoFornecVenc.IsEmpty) or (gpb_dados.Enabled = false) then
   exit;

  Application.CreateForm(TfrmGerarPedidoCompra_cotacao, frmGerarPedidoCompra_cotacao);

  frmGerarPedidoCompra_cotacao.txt_cod_fornec.Text := qryFornecedorVencedor.fieldbyname('FOR_CODIGO').AsString;
  frmGerarPedidoCompra_cotacao.txt_fornecedor.Text := qryFornecedorVencedor.fieldbyname('AT_NOME').AsString;
  frmGerarPedidoCompra_cotacao.txt_cod_cotacao.Text := lbl_cod_cotacao.Caption;

  frmGerarPedidoCompra_cotacao.showmodal;

end;

procedure Tfrm_cotacao_compra.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure Tfrm_cotacao_compra.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;
  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('UPDATE COTACAO_COMPRA SET COT_OBS=:COT_OBS WHERE COT_CODIGO=:COT_CODIGO');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryTransLocal.ParamByName('COT_OBS').AsString    := txt_obs.Text;
  qryTransLocal.ExecSQL;
  IBTransLocal.Commit;
end;

procedure Tfrm_cotacao_compra.btnImprimirGrupoClick(Sender: TObject);
begin

  frmRelCotacaoGrupoProd.qry_pesquisa.Close;
  frmRelCotacaoGrupoProd.qry_pesquisa.SQL.Clear;
  frmRelCotacaoGrupoProd.qry_pesquisa.SQL.Add('SELECT GRP_DESCRICAO, PRO_DESCRICAO, ITE.COT_VALOR AS VALOR,                             '+
                                              ' SUBSTRING(AT_NOME from 1 for 4) AS AT_NOME, AT_CODIGO,                                  '+
                                              ' ITE.COT_QTD, ITE.COT_UNIDADE                                                            '+
                                              ' FROM COTACAO_COMPRA COTA                                                                '+
                                              ' INNER JOIN ITENS_COTACAO_COMPRA ITE ON                                                  '+
                                              ' COTA.cot_codigo = ITE.cot_codigo                                                        '+
                                              ' LEFT JOIN AGENDA_TELEFONE FORN ON                                                       '+
                                              ' ITE.for_codigo_atual = FORN.at_codigo                                                   '+
                                              ' INNER JOIN PRODUTO PROD ON                                                              '+
                                              ' ITE.pro_codigo = PROD.pro_codigo                                                        '+
                                              ' INNER JOIN GRUPO GRU ON                                                                 '+
                                              ' PROD.grp_codigo = GRU.grp_codigo                                                        '+
                                              ' WHERE COTA.cot_codigo =:CODIGO_COTACAO                                                  '+
                                              ' GROUP BY GRP_DESCRICAO, PRO_DESCRICAO, ITE.COT_VALOR,                                   '+
                                              ' AT_NOME, AT_CODIGO, ITE.COT_QTD, ITE.COT_UNIDADE ORDER BY GRP_DESCRICAO, PRO_DESCRICAO  ');
  frmRelCotacaoGrupoProd.qry_pesquisa.ParamByName('CODIGO_COTACAO').AsString := lbl_cod_cotacao.Caption;
  frmRelCotacaoGrupoProd.qry_pesquisa.Open;
  frmRelCotacaoGrupoProd.qry_pesquisa.FetchAll;

  if frmRelCotacaoGrupoProd.qry_pesquisa.isempty then
  begin
    mensagem := 'Registro nao encontrado !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    exit;
  end;

  frmRelCotacaoGrupoProd.lblCotacao.caption := lbl_cod_cotacao.Caption;
  frmRelCotacaoGrupoProd.frRelatorio.Prepare;
  frmRelCotacaoGrupoProd.frRelatorio.PreviewModal;
end;

procedure Tfrm_cotacao_compra.DBGrid1TitleClick(Column: TColumn);
var
  cod_cotacao: string;
begin
  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

  cod_cotacao := ' I.COT_CODIGO = ' + lbl_cod_cotacao.Caption;

  if (campo = 'PRO_CODIGO') or (campo = 'pro_descricao') then
    campo := 'P.' + campo
  else if (campo = 'cot_unidade') or (campo = 'cot_qtd') or (campo = 'cot_valor') or
    (campo = 'FOR_INSERIDO') or (campo = 'ITE_ORDEM_INSERCAO') then
      campo := 'I.' + campo
  else if (campo = 'AT_NOME') Then
    campo := '9'
  else if (campo = 'VALOR_TOTAL') then
    campo := '8'
  else if (campo = 'cot_obs') then
    campo := '10'
  else
    campo := '' + campo ;

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  '+
                     'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  '+
                     'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    '+
                     'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  '+
                     'FROM itens_cotacao_compra I INNER JOIN                                                  '+
                     '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              '+
                     'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           '+
                     'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                     'AND ICCF.for_codigo = I.for_codigo_atual                                                '+
                     'LEFT JOIN agenda_telefone FORN ON                                                       '+
                     'I.for_codigo_atual = FORN.at_codigo                                                     '+
                     'WHERE ' + cod_cotacao + fornecedor_global                                                +
                     'GROUP BY  I.ITENS_COT_CODIGO,                                                           '+
                     'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  '+
                     'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      '+
                     'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs '+
                     ' order by ' + campo );
  qryProduto.Open;

  frm_cotacao_compra.cdsProduto.Close;
  frm_cotacao_compra.cdsProduto.FetchParams;
  frm_cotacao_compra.cdsProduto.Open;
  
end;

procedure Tfrm_cotacao_compra.btnConfirmarPrecoClick(Sender: TObject);
var
  linha: integer;
begin
  if (cdsProduto.IsEmpty) or (btn_Finalizar.Enabled = false) or (cdsProduto.FieldByName('FOR_INSERIDO').AsString <> 'S')  then
    Exit;

  linha := cdsProduto.RecNo;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET                                                                   '+
                        ' COT_CONFIRMAR_PRECO=:COT_CONFIRMAR_PRECO WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO ');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryTransLocal.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString;
  qryTransLocal.ParamByName('COT_CONFIRMAR_PRECO').AsString := 'S';
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  cdsProduto.Close;
  cdsProduto.FetchParams;
  cdsProduto.Open;

  cdsProduto.RecNo := linha;

end;

procedure Tfrm_cotacao_compra.Excluir1Click(Sender: TObject);
var
  cod_cotacao: string;
  cont : integer;
begin

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir ' + cdsProduto.fieldbyname('PRO_DESCRICAO').AsString +
    ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) of
  IDNO:
  begin
    exit;
  end;
  end;

  if (not IBTransLocal.InTransaction) then
     IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('delete FROM itens_cotacao_compra          ');
  qryTransLocal.SQL.Add(' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO     ');
  if cdsProduto.FieldByName('FOR_CODIGO_ATUAL').AsString <> '' then
    qryTransLocal.SQL.Add(' AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ')
  else
    qryTransLocal.SQL.Add(' AND (FOR_CODIGO_ATUAL =:FOR_CODIGO_ATUAL OR FOR_CODIGO_ATUAL IS NULL) ');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
  qryTransLocal.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString;
  if cdsProduto.FieldByName('FOR_CODIGO_ATUAL').AsString <> '' then
    qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cdsProduto.fieldbyname('FOR_CODIGO_ATUAL').AsString
  else
    qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := '';
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  //Reordenar ite_ordem_insercao

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT COT_CODIGO, PRO_CODIGO, FOR_CODIGO_ATUAL FROM ITENS_COTACAO_COMPRA '+
                      'WHERE COT_CODIGO=:COT_CODIGO                                              ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
  qryPesquisa.Open;
  qryPesquisa.FetchAll;
  qryPesquisa.First;

  cont := 0;

  while not qryPesquisa.Eof do
  begin
    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('UPDATE itens_cotacao_compra SET                                           '+
                          ' ITE_ORDEM_INSERCAO=:ITE_ORDEM_INSERCAO WHERE COT_CODIGO=:COT_CODIGO AND  '+
                          ' PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL            ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := qryPesquisa.fieldbyname('PRO_CODIGO').AsString;
    qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
    qryTransLocal.ParamByName('ITE_ORDEM_INSERCAO').AsInteger := cont +1;
    qryTransLocal.ExecSQL;

    cont := cont +1;

    qryPesquisa.Next;
  end;

  IBTransLocal.Commit;

  //FIM Reordenar ite_ordem_insercao

  cod_cotacao := ' I.COT_CODIGO = ' + lbl_cod_cotacao.Caption;

  if campo = '' then
    campo := '2';

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  '+
                     'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  '+
                     'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    '+
                     'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  '+
                     'FROM itens_cotacao_compra I INNER JOIN                                                  '+
                     '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              '+
                     'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           '+
                     'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                     'AND ICCF.for_codigo = I.for_codigo_atual                                                '+
                     'LEFT JOIN agenda_telefone FORN ON                                                       '+
                     'I.for_codigo_atual = FORN.at_codigo                                                     '+
                     'WHERE ' + cod_cotacao + fornecedor_global                                                +
                     'GROUP BY I.ITENS_COT_CODIGO,                                                            '+
                     'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  '+
                     'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      '+
                     'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs '+
                     ' order by ' + campo );
  qryProduto.Open;

  cdsProduto.Close;
  cdsProduto.FetchParams;
  cdsProduto.Open;

  SetLength(fornecedor_vetor_global,0);
  i_vetor_din:=0;

end;

procedure Tfrm_cotacao_compra.inserirPrecoMaisBarato;
var
  sair_laco_menor_produto, obs, sql_fornecedor: string;
  vetor_fornecedor: array of string;
  data_max, data_cotacao : TDate;
  i, i_total : Integer;
begin

  //COLOCAR O FORNECEDOR MAIS BARATO

  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT DATA_PROD_BARATO FROM CONFIGURACAO_COTACAO ');
  qryPesqAux.Open;

  data_cotacao := qryPesqAux.fieldbyname('DATA_PROD_BARATO').AsDateTime;

  valor_global := 999999999;
  fornec_global := '';
  data_compra_global := '';
  cod_fornecedor_global := '';
  obs:= '';

  //SELECIONAR TODOS OS FORNECEDORES DO RESPECTIVO PRODUTO
  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT  ICCF.for_codigo                                                   '+
                     'FROM itens_cotacao_compra_fornec ICCF INNER JOIN cotacao_compra COTA ON   '+
                     'COTA.cot_codigo = ICCF.cot_codigo                                         '+
                     'WHERE ICCF.PRO_CODIGO=:PRO_CODIGO                                         '+
                     'AND COTA.COT_VENCIMENTO between :DATAI AND :DATAF                         '+
                     'AND (ICCF.cot_obs <> ''OFERTA'' or iccf.cot_obs is NULL )                 '+
                     'AND COTA.COT_CODIGO <>:COT_CODIGO                                         '+
                     'GROUP BY ICCF.for_codigo                                                  ');
  qryPesqAux.ParamByName('DATAI').AsDate := data_cotacao;
  qryPesqAux.ParamByName('DATAF').AsDate := dta_vencimento.Date;
  if txt_cod_produto.Text = '' then
    qryPesqAux.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString
  else
    qryPesqAux.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryPesqAux.Open;
  qryPesqAux.FetchAll;
  qryPesqAux.First;

  i_total:=0;
  while not qryPesqAux.Eof do
  begin
    SetLength(vetor_fornecedor, Length(vetor_fornecedor)+1);
    vetor_fornecedor[i_total]:= qryPesqAux.fieldbyname('for_codigo').AsString;
    i_total:=i_total+1;
    qryPesqAux.Next;
  end;

  //FIM SELECIONAR TODOS OS FORNECEDORES DO RESPECTIVO PRODUTO

  //PEGAR O MAXIMO VALOR COM MAXIMA DATA
    i:=0;
  while i < i_total do
  begin
    qryPesqAux.Close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT COT_VENCIMENTO, ICCF.cot_valor, AG.AT_codigo,                      '+
                       ' AG.AT_codigo ||'' - ''|| AG.AT_nome AS FORNEC                            '+
                       ' FROM itens_cotacao_compra_fornec ICCF INNER JOIN cotacao_compra COTA ON  '+
                       ' COTA.cot_codigo = ICCF.cot_codigo                                        '+
                       ' LEFT JOIN agenda_telefone AG ON                                          '+
                       ' ICCF.for_codigo = AG.at_codigo                                           '+
                       ' WHERE ICCF.PRO_CODIGO=:PRO_CODIGO AND ICCF.for_codigo=:FOR_CODIGO        '+
                       ' AND COTA.COT_VENCIMENTO between :DATAI AND :DATAF                        '+
                       ' AND (ICCF.cot_obs <> ''OFERTA'' or iccf.cot_obs is NULL )                '+
                       ' AND COTA.COT_CODIGO <>:COT_CODIGO                                        '+
                       ' GROUP BY ICCF.cot_valor, AG.AT_codigo, AG.AT_nome, COT_VENCIMENTO        '+
                       ' order by COT_VENCIMENTO                                                  ');
    qryPesqAux.ParamByName('DATAI').AsDate := data_cotacao;
    qryPesqAux.ParamByName('DATAF').AsDate := dta_vencimento.Date;
    if txt_cod_produto.Text = '' then
      qryPesqAux.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString
    else
      qryPesqAux.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    qryPesqAux.ParamByName('FOR_CODIGO').AsString := vetor_fornecedor[i];
    qryPesqAux.Open;
    qryPesqAux.FetchAll;
    qryPesqAux.last;

    i:=i+1;

    if (qryPesqAux.FieldByName('COT_VALOR').AsString <> '') and (qryPesqAux.FieldByName('COT_VALOR').Asfloat > 0) then
    begin
      if qryPesqAux.FieldByName('COT_VALOR').AsFloat < valor_global then
      begin
         valor_global := qryPesqAux.FieldByName('COT_VALOR').AsFloat;
         fornec_global := qryPesqAux.FieldByName('FORNEC').asstring;
         cod_fornecedor_global := qryPesqAux.FieldByName('AT_codigo').asstring;
         data_compra_global := qryPesqAux.FieldByName('COT_VENCIMENTO').asstring;
      end;
    end;

  end;
 //FIM PEGAR O MAXIMO VALOR COM MAXIMA DATA

end;

procedure Tfrm_cotacao_compra.cboFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF KEY =VK_back then
    cboFornecedor.KeyValue := -1;
end;

procedure Tfrm_cotacao_compra.cboFornecedorCloseUp(Sender: TObject);
begin
  if cboFornecedor.Text <> '' then
  begin
    cheInserirPreco.Checked := false;
    txt_Valor.Visible := True;
    lbl_valor.Visible := true;
  end;
end;

procedure Tfrm_cotacao_compra.cheInserirPrecoClick(Sender: TObject);
begin
  if cheInserirPreco.Checked = True then
  begin
    cboFornecedor.KeyValue := -1;
    txt_Valor.Visible := false;
    lbl_valor.Visible := false;
  end;
end;

procedure Tfrm_cotacao_compra.txt_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnInserir.Click
end;

procedure Tfrm_cotacao_compra.txt_ValorEnter(Sender: TObject);
begin
  txt_Valor.Color := $00F5EEDE;
end;

procedure Tfrm_cotacao_compra.txt_ValorExit(Sender: TObject);
begin
  txt_Valor.Color := clWhite;
end;

procedure Tfrm_cotacao_compra.DBGrid4TitleClick(Column: TColumn);
var
  campo : string;
begin
  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

   if (campo = 'PRO_CODIGO') or (campo = 'pro_descricao') then
      campo := 'P.' + campo
   else if (campo = 'cot_unidade') or (campo = 'cot_qtd') or (campo = 'cot_valor') then
      campo := 'I.' + campo
   else if (campo = 'cot_obs') then
    campo := '10'
   else
    campo := '' + campo ;  

   qryProdutoLancados.Close;
   qryProdutoLancados.SQL.Clear;
   qryProdutoLancados.SQL.Add(' SELECT P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, II.COT_OBS, f.at_codigo, ');
   qryProdutoLancados.SQL.Add('(CASE WHEN II.cot_valor = 0 THEN   ');
   qryProdutoLancados.SQL.Add(' 0         ');
   qryProdutoLancados.SQL.Add('ELSE       ');
   qryProdutoLancados.SQL.Add(' II.cot_valor END) AS COT_VALOR         ');
   qryProdutoLancados.SQL.Add('  FROM AGENDA_TELEFONE f INNER JOIN     ');
   qryProdutoLancados.SQL.Add('   itens_cotacao_compra_fornec II ON    ');
   qryProdutoLancados.SQL.Add('   II.for_codigo = F.at_codigo          ');
   qryProdutoLancados.SQL.Add('   INNER JOIN PRODUTO P ON              ');
   qryProdutoLancados.SQL.Add('   P.pro_codigo = II.pro_codigo         ');
   qryProdutoLancados.SQL.Add('   LEFT JOIN itens_cotacao_compra I ON  ');
   qryProdutoLancados.SQL.Add('   II.pro_codigo = I.pro_codigo AND     ');
   qryProdutoLancados.SQL.Add('   II.cot_codigo = I.cot_codigo         ');

   qryProdutoLancados.SQL.Add('   AND I.for_codigo_atual = II.for_codigo   ');
   qryProdutoLancados.SQL.Add('   WHERE II.COT_CODIGO =:COT_CODIGO AND II.for_codigo =:FOR_CODIGO ORDER BY ' + campo);

   qryProdutoLancados.ParamByName('FOR_CODIGO').AsString := qryFornecedorLancados.fieldbyname('AT_CODIGO').AsString;
   qryProdutoLancados.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
   qryProdutoLancados.Open;

end;

procedure Tfrm_cotacao_compra.Button1Click(Sender: TObject);
begin
  frmRelCotacaoFornecedorGrupoProd.qry_pesquisa.Close;
  frmRelCotacaoFornecedorGrupoProd.qry_pesquisa.SQL.Clear;
  frmRelCotacaoFornecedorGrupoProd.qry_pesquisa.SQL.Add('SELECT GRP_DESCRICAO, PRO_DESCRICAO, ITE.COT_VALOR AS VALOR,                 '+
                                                        ' SUBSTRING(AT_NOME from 1 for 4) AS NOME_RESUMIDO, AT_CODIGO, AT_NOME,       '+
                                                        ' ITE.COT_QTD, ITE.COT_UNIDADE                                                '+
                                                        ' FROM COTACAO_COMPRA COTA                                                    '+
                                                        ' INNER JOIN ITENS_COTACAO_COMPRA ITE ON                                      '+
                                                        ' COTA.cot_codigo = ITE.cot_codigo                                            '+
                                                        ' LEFT JOIN AGENDA_TELEFONE FORN ON                                           '+
                                                        ' ITE.for_codigo_atual = FORN.at_codigo                                       '+
                                                        ' INNER JOIN PRODUTO PROD ON                                                  '+
                                                        ' ITE.pro_codigo = PROD.pro_codigo                                            '+
                                                        ' INNER JOIN GRUPO GRU ON                                                     '+
                                                        ' PROD.grp_codigo = GRU.grp_codigo                                            '+
                                                        ' WHERE COTA.cot_codigo =:CODIGO_COTACAO                                      '+
                                                        ' GROUP BY AT_CODIGO, AT_NOME, GRP_DESCRICAO, PRO_DESCRICAO, ITE.COT_VALOR,   '+
                                                        ' ITE.COT_QTD, ITE.COT_UNIDADE ORDER BY AT_NOME, GRP_DESCRICAO, PRO_DESCRICAO ');
  frmRelCotacaoFornecedorGrupoProd.qry_pesquisa.ParamByName('CODIGO_COTACAO').AsString := lbl_cod_cotacao.Caption;
  frmRelCotacaoFornecedorGrupoProd.qry_pesquisa.Open;
  frmRelCotacaoFornecedorGrupoProd.qry_pesquisa.FetchAll;
 
  if frmRelCotacaoFornecedorGrupoProd.qry_pesquisa.isempty then
  begin
     mensagem := 'Registro nao encontrado !';
     Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
     exit;
  end;

  frmRelCotacaoFornecedorGrupoProd.lblCotacao.caption := lbl_cod_cotacao.Caption;
  frmRelCotacaoFornecedorGrupoProd.frRelatorio.Prepare;
  frmRelCotacaoFornecedorGrupoProd.frRelatorio.PreviewModal;
end;

procedure Tfrm_cotacao_compra.btnPesquisarFornecedorClick(Sender: TObject);
var
  cod_cotacao: string;
begin
  cod_cotacao := ' I.COT_CODIGO = ' + lbl_cod_cotacao.Caption;

  if fornecedor_global = '' then
  begin
    btnPesquisarFornecedor.Tag := 1;
    btnPesquisarFornecedor.Caption := 'Desfazer';
    fornecedor_global:= ' and I.FOR_CODIGO_ATUAL = ' + IntToStr(cboFornecedor.KeyValue);
  end
  else
  begin
    btnPesquisarFornecedor.Tag := 0;
    btnPesquisarFornecedor.Caption := 'Pesquisar';
    fornecedor_global:= '';
  end;

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,   '+
                     'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,   '+
                     'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                     '+
                     'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                   '+
                     'FROM itens_cotacao_compra I INNER JOIN                                                   '+
                     '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                               '+
                     'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                            '+
                     'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                        '+
                     '  AND ICCF.for_codigo = I.for_codigo_atual                                               '+
                     'LEFT JOIN agenda_telefone FORN ON                                                        '+
                     'I.for_codigo_atual = FORN.at_codigo                                                      '+
                     'WHERE ' + cod_cotacao + fornecedor_global                                                 +
                     'GROUP BY I.ITENS_COT_CODIGO,                                                             '+
                     'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                   '+
                     'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,       '+
                     'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs  '+
                     ' order by i.ite_ordem_insercao' );
  qryProduto.Open;

  cdsProduto.Close;
  cdsProduto.FetchParams;
  cdsProduto.Open;
end;

procedure Tfrm_cotacao_compra.cboFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnInserir.Click
end;

procedure Tfrm_cotacao_compra.ExcluirItemda2Aba1Click(Sender: TObject);
begin
  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM ITENS_COTACAO_COMPRA                                                     '+
                      ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryPesquisa.ParamByName('PRO_CODIGO').AsString := qryProdutoLancados.fieldbyname('PRO_CODIGO').AsString;
  qryPesquisa.ParamByName('FOR_CODIGO_ATUAL').AsString := qryProdutoLancados.fieldbyname('AT_CODIGO').AsString;
  qryPesquisa.Open;

  if not qryPesquisa.IsEmpty then
  begin
    mensagem:= 'Este produtoprecisa ser excluido na 1º aba (produto)!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    exit;
  end;

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir ' + qryProdutoLancados.fieldbyname('PRO_DESCRICAO').AsString +
    ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) of
  IDNO:
  begin
    exit;
  end;
  end;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('delete FROM itens_cotacao_compra_fornec   ');
  qryTransLocal.SQL.Add(' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO=:FOR_CODIGO_ATUAL ');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
  qryTransLocal.ParamByName('PRO_CODIGO').AsString := qryProdutoLancados.fieldbyname('PRO_CODIGO').AsString;
  qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := qryProdutoLancados.fieldbyname('AT_CODIGO').AsString;
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  qryProdutoLancados.Close;
  qryProdutoLancados.SQL.Clear;
  qryProdutoLancados.SQL.Add(' SELECT P.PRO_CODIGO, P.pro_descricao, I.cot_unidade, I.cot_qtd, II.COT_OBS, f.at_codigo, ');
  qryProdutoLancados.SQL.Add('(CASE WHEN II.cot_valor = 0 THEN   ');
  qryProdutoLancados.SQL.Add(' 0         ');
  qryProdutoLancados.SQL.Add('ELSE       ');
  qryProdutoLancados.SQL.Add(' II.cot_valor END) AS COT_VALOR         ');
  qryProdutoLancados.SQL.Add('  FROM AGENDA_TELEFONE f INNER JOIN     ');
  qryProdutoLancados.SQL.Add('   itens_cotacao_compra_fornec II ON    ');
  qryProdutoLancados.SQL.Add('   II.for_codigo = F.at_codigo          ');
  qryProdutoLancados.SQL.Add('   INNER JOIN PRODUTO P ON              ');
  qryProdutoLancados.SQL.Add('   P.pro_codigo = II.pro_codigo         ');
  qryProdutoLancados.SQL.Add('   LEFT JOIN itens_cotacao_compra I ON  ');
  qryProdutoLancados.SQL.Add('   II.pro_codigo = I.pro_codigo AND     ');
  qryProdutoLancados.SQL.Add('   II.cot_codigo = I.cot_codigo         ');
  qryProdutoLancados.SQL.Add('   AND I.for_codigo_atual = II.for_codigo   ');
  qryProdutoLancados.SQL.Add('   WHERE II.COT_CODIGO =:COT_CODIGO AND II.for_codigo =:FOR_CODIGO ');
  qryProdutoLancados.ParamByName('FOR_CODIGO').AsString := qryFornecedorLancados.fieldbyname('AT_CODIGO').AsString;
  qryProdutoLancados.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryProdutoLancados.Open;

  qryFornecedorLancados.Close;
  qryFornecedorLancados.Open;
  qryFornecedorLancados.FetchAll;

  cdsFornecedor.Close;
  cdsFornecedor.Open;

  qryFornecedorVencedor.Close;
  qryFornecedorVencedor.Open;
  qryFornecedorVencedor.FetchAll;

end;

procedure Tfrm_cotacao_compra.Button2Click(Sender: TObject);
var
  iLinhaExcel, iColunaExcel : Integer;
  objExcel : Variant;
  desconto : string;


  ArquivoCSV: TextFile;
  Contador, I, iContador : Integer;
  Linha: String;
  teste : string;

  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado, strAux: String;
    ii : integer;
  begin
    ValorMontado := '';
    I :=0;
    inc(I);
    iContador := 0;
    iColunaExcel := 1;

    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('INSERT INTO CARREGAR_EXCEL_COTACAO                                                     '+
                          '(PRODUTO_DESCRICAO, VALOR_UNIT, QTDE, VALOR_TOTAL, COD_PRODUTO_EXCEL, DESCONTO )       '+
                          'VALUES                                                                                 '+
                          '(:PRODUTO_DESCRICAO, :VALOR_UNIT, :QTDE, :VALOR_TOTAL, :COD_PRODUTO_EXCEL, :DESCONTO ) ');
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ',' then
      begin
        if  AnsiContainsStr(ValorMontado, '"') then
        begin
          iContador := 0;
          for ii := 1 to Length(ValorMontado) do
          begin
            strAux := ValorMontado[ii];
            if strAux = '"' then
              Inc(iContador);
          end;
          if (iContador > 1) or (iContador = 0) then
          begin
            ValorMontado :=  StringReplace(ValorMontado, '"', '', [rfReplaceAll]);
            ValorMontado :=  StringReplace(ValorMontado, ',', '.', [rfReplaceAll]);

            if iColunaExcel = 1 then
              qryTransLocal.ParamByName('PRODUTO_DESCRICAO').AsString := ValorMontado
            else if iColunaExcel = 4 then
              qryTransLocal.ParamByName('COD_PRODUTO_EXCEL').AsString := ValorMontado
            else if iColunaExcel = 2 then
              qryTransLocal.ParamByName('QTDE').AsString := ValorMontado
            else if iColunaExcel = 5 then
              qryTransLocal.ParamByName('VALOR_UNIT').AsString := ValorMontado
            else if iColunaExcel = 6 then
            begin
              if ValorMontado = 'Não Informado' then
                ValorMontado := '0';
              qryTransLocal.ParamByName('DESCONTO').AsString := ValorMontado;
            end
            else if iColunaExcel = 3 then
              qryTransLocal.ParamByName('VALOR_TOTAL').AsString := ValorMontado;

            Inc(iColunaExcel);

            ValorMontado := ''   //LANCAR AQUI OS DADOS DO ValorMontado DENTRO DA TABELA
          end
          else
            ValorMontado := ValorMontado + Linha[I];
        end
        else
        begin

             ValorMontado :=  StringReplace(ValorMontado, '"', '', [rfReplaceAll]);

             ValorMontado :=  StringReplace(ValorMontado, ',', '.', [rfReplaceAll]);

             if iColunaExcel = 1 then
                qryTransLocal.ParamByName('PRODUTO_DESCRICAO').AsString := ValorMontado
             else if iColunaExcel = 4 then
                qryTransLocal.ParamByName('COD_PRODUTO_EXCEL').AsString := ValorMontado
             else if iColunaExcel = 2 then
                qryTransLocal.ParamByName('QTDE').AsString := ValorMontado
             else if iColunaExcel = 5 then
                qryTransLocal.ParamByName('VALOR_UNIT').AsString := ValorMontado
             else if iColunaExcel = 6 then
             begin

                if ValorMontado = 'Não Informado' then
                  ValorMontado := '0';

                qryTransLocal.ParamByName('DESCONTO').AsString := ValorMontado;
             end
             else if iColunaExcel = 3 then
                qryTransLocal.ParamByName('VALOR_TOTAL').AsString := ValorMontado;

          Inc(iColunaExcel);

          ValorMontado := ''; //LANCAR AQUI OS DADOS DO ValorMontado DENTRO DA TABELA
        end

      end
      else
        ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := ValorMontado;

    ValorMontado :=  StringReplace(ValorMontado, '"', '', [rfReplaceAll]);

    ValorMontado :=  StringReplace(ValorMontado, ',', '.', [rfReplaceAll]);

    if iColunaExcel = 6 then
    begin
      if ValorMontado = 'NÃ£o Informado' then
         ValorMontado := '0';

      qryTransLocal.ParamByName('DESCONTO').AsString := ValorMontado;
    end;

    qryTransLocal.ExecSQL;
    IBTransLocal.Commit;
  end;
begin
  if cboFornecedorExcel.Text = '' then
  begin
    showmessage('Selecione um fornecedor');
    cboFornecedorExcel.setfocus;
    exit;
  end;

  OpenDialog1.DefaultExt := '.csv*';
  OpenDialog1.FileName := '*.csv*';
  If OpenDialog1.Execute then
    edtCaminhoExcel.text := OpenDialog1.FileName;

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, edtCaminhoExcel.text);

  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    Contador := 1;

    while not Eoln(ArquivoCSV) do
    begin
      if Contador >= 2 then
        teste := MontaValor;
      Readln(ArquivoCSV, Linha);
      Contador := Contador + 1;
    end;
    teste := MontaValor;

  finally
    CloseFile(ArquivoCSV);
  end;

  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('select * from carregar_excel_cotacao order by produto_descricao');
  qryCarregarExcel.Open;
  qryCarregarExcel.First;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM carregar_excel_cotacao');
  qryPesquisa.Open;
  edtTotalExcel.Value := qryPesquisa.fieldbyname('TOTAL').AsFloat;

  ///VERIFICA SE TEM PRODUTO LANCADO NA COTACAO COM O MESMO FORNECEDOR
  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  while not qryCarregarExcel.eof do
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM COD_PRODUTO_MEU_FORNECEDOR                    '+
                        ' WHERE PRO_CODIGO_FORNEC=:PRO_CODIGO_FORNEC AND AT_CODIGO=:AT_CODIGO ');
    qryPesquisa.ParamByName('PRO_CODIGO_FORNEC').AsString := qryCarregarExcel.fieldbyname('COD_PRODUTO_EXCEL').asstring;
    qryPesquisa.ParamByName('AT_CODIGO').AsString  := cboFornecedorExcel.KeyValue;
    qryPesquisa.Open;

    if not qryPesquisa.IsEmpty then
    begin
      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO '+
                            ' AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL                                                  ');
      qryTransLocal.ParamByName('COT_CODIGO').asstring := lbl_cod_cotacao.Caption;
      qryTransLocal.ParamByName('PRO_CODIGO').asstring := qryPesquisa.fieldbyname('PRO_CODIGO').AsString;
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').asstring := cboFornecedorExcel.KeyValue;
      qryTransLocal.ExecSQL;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA_FORNEC WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO '+
                            ' AND FOR_CODIGO=:FOR_CODIGO                                                                     ');
      qryTransLocal.ParamByName('COT_CODIGO').asstring := lbl_cod_cotacao.Caption;
      qryTransLocal.ParamByName('PRO_CODIGO').asstring := qryPesquisa.fieldbyname('PRO_CODIGO').AsString;
      qryTransLocal.ParamByName('FOR_CODIGO').asstring := cboFornecedorExcel.KeyValue;
      qryTransLocal.ExecSQL;

     end;

     qryCarregarExcel.Next;

  end;

  IBTransLocal.Commit;

  //Verifica os descontos de cada item
  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('select * from carregar_excel_cotacao order by produto_descricao');
  qryCarregarExcel.Open;
  qryCarregarExcel.First;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  while not qryCarregarExcel.eof do
  begin
    if qryCarregarExcel.fieldbyname('DESCONTO').AsFloat <> 0 then
    begin
      desconto := formatfloat('##0.00', qryCarregarExcel.fieldbyname('VALOR_TOTAL').AsFloat / qryCarregarExcel.fieldbyname('QTDE').AsFloat);
      desconto :=  StringReplace(desconto, ',', '.', [rfReplaceAll]);

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('UPDATE CARREGAR_EXCEL_COTACAO SET VALOR_UNIT=:VALOR_UNIT WHERE ID=:ID ');
      qryTransLocal.ParamByName('VALOR_UNIT').asstring := desconto;
      qryTransLocal.ParamByName('ID').asstring := qryCarregarExcel.fieldbyname('ID').AsString;
      qryTransLocal.ExecSQL;
    end;

    qryCarregarExcel.Next;
  end;

  IBTransLocal.Commit;

  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('select * from carregar_excel_cotacao order by produto_descricao');
  qryCarregarExcel.Open;
  qryCarregarExcel.First;

end;

procedure Tfrm_cotacao_compra.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if qryCarregarExcel.FieldByName('DESCONTO').AsFloat > 0 then
    DBGrid5.Canvas.Brush.Color := $005EAEFF;

  if (gdSelected in state) then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clMenuHighlight;
      Font.Style  := [fsbold];
      Font.Color  := clWhite
    end
    else
      DBGrid5.Canvas.Font.Color:= clBlack;

  DBGrid5.Canvas.FillRect(Rect);
  DBGrid5.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_cotacao_compra.Button3Click(Sender: TObject);
var
  cod_produto_local, id_carregar_excel_cotacao, cod_cotacao_local, fornecedor_local, un_descricao_local: string;
  ite_ordem_insercao: integer;
  valorReferenteLocal: REAL;
begin
  if cboFornecedorExcel.Text = '' then
  begin
    showmessage('Selecione um fornecedor');
    cboFornecedorExcel.setfocus;
    exit;
  end;
  qryCarregarExcel.First;

  while not qryCarregarExcel.eof do
  begin
    id_carregar_excel_cotacao:= qryCarregarExcel.fieldbyname('ID').asstring;

    //verifica se produto ja foi lancado alguma vez
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM COD_PRODUTO_MEU_FORNECEDOR                      '+
                        ' WHERE PRO_CODIGO_FORNEC=:PRO_CODIGO_FORNEC AND AT_CODIGO=:AT_CODIGO   ');
    qryPesquisa.ParamByName('PRO_CODIGO_FORNEC').AsString := qryCarregarExcel.fieldbyname('COD_PRODUTO_EXCEL').asstring;
    qryPesquisa.ParamByName('AT_CODIGO').AsString  := cboFornecedorExcel.KeyValue;
    qryPesquisa.Open;
    //FIM verifica se produto ja foi lancado alguma vez


    if not qryPesquisa.IsEmpty then
    begin
      cod_produto_local:= qryPesquisa.fieldbyname('PRO_CODIGO').AsString;

      //verifica se produto ja foi lancado na cotacao
      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Add('SELECT COT_QTD FROM ITENS_COTACAO_COMPRA                                                        '+
                          ' WHERE PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL AND COT_CODIGO=:COT_CODIGO ');
      qryPesquisa.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
      qryPesquisa.ParamByName('FOR_CODIGO_ATUAL').AsString  := cboFornecedorExcel.KeyValue;
      qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
      qryPesquisa.Open;

      if not qryPesquisa.IsEmpty then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET                                                                                  '+
                              ' COT_QTD=:COT_QTD WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString:= lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('PRO_CODIGO').AsString:= cod_produto_local;
        qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString:= cboFornecedorExcel.KeyValue;
        qryTransLocal.ParamByName('COT_QTD').asfloat:= qryPesquisa.fieldbyname('COT_QTD').asfloat + qryCarregarExcel.fieldbyname('QTDE').asfloat;
        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;
      end
      else
      begin
        //1º INSERIR PRODUTO DO ITENS_COMPRA_COMPRA
        qryPesquisa.Close;
        qryPesquisa.SQL.Clear;
        qryPesquisa.SQL.Add('SELECT ITE_ORDEM_INSERCAO FROM ITENS_COTACAO_COMPRA         '+
                            'WHERE COT_CODIGO=:COT_CODIGO ORDER BY ITE_ORDEM_INSERCAO    ');
        qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
        qryPesquisa.Open;
        qryPesquisa.Last;

        ite_ordem_insercao:= qryPesquisa.fieldbyname('ITE_ORDEM_INSERCAO').asinteger;

        qryPesquisa.Close;
        qryPesquisa.SQL.Clear;
        qryPesquisa.SQL.Add('SELECT U.UN_DESCRICAO                                             '+
                            'FROM  PRODUTO P INNER JOIN UNIDADE U ON P.UN_CODIGO = U.UN_CODIGO '+
                            'WHERE PRO_CODIGO=:PRO_CODIGO ORDER BY P.PRO_DESCRICAO             ');
        qryPesquisa.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
        qryPesquisa.Open;

        un_descricao_local := qryPesquisa.fieldbyname('UN_DESCRICAO').asstring;

        qryPesquisa.Close;
        qryPesquisa.SQL.Clear;
        qryPesquisa.SQL.Add('SELECT PESO_PRODUTO, PESO_REFERENTE        '+
                            'FROM  PRODUTO WHERE PRO_CODIGO=:PRO_CODIGO ');
        qryPesquisa.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
        qryPesquisa.Open;

        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocalCompra.Close;
        qryTransLocalCompra.SQL.Clear;
        qryTransLocalCompra.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA                                                                                       '+
                                    '(COT_CODIGO, PRO_CODIGO, COT_UNIDADE, COT_QTD, ITE_ORDEM_INSERCAO, FOR_CODIGO_ATUAL, COT_VALOR, FOR_INSERIDO, COT_OBS )         '+
                                    'VALUES                                                                                                                 '+
                                    '(:COT_CODIGO, :PRO_CODIGO, :COT_UNIDADE, :COT_QTD, :ITE_ORDEM_INSERCAO, :FOR_CODIGO_ATUAL, :COT_VALOR, :FOR_INSERIDO, :COT_OBS ) ');
        qryTransLocalCompra.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
        qryTransLocalCompra.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
        qryTransLocalCompra.ParamByName('COT_UNIDADE').AsString := un_descricao_local;
        qryTransLocalCompra.ParamByName('COT_QTD').AsFloat := qryCarregarExcel.fieldbyname('QTDE').asfloat;
        qryTransLocalCompra.ParamByName('ITE_ORDEM_INSERCAO').AsInteger := ite_ordem_insercao +1;
        qryTransLocalCompra.ParamByName('FOR_CODIGO_ATUAL').AsInteger := cboFornecedorExcel.KeyValue;
        qryTransLocalCompra.ParamByName('FOR_INSERIDO').AsString := 'S';
        qryTransLocalCompra.ParamByName('COT_VALOR').AsFloat := qryCarregarExcel.fieldbyname('VALOR_UNIT').asfloat;
        if qryCarregarExcel.FieldByName('DESCONTO').AsFloat > 0 then
          qryTransLocalCompra.ParamByName('COT_OBS').AsString := 'OFERTA';

        IF qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat > 0 then
        begin
          valorReferenteLocal:= (qryCarregarExcel.fieldbyname('VALOR_UNIT').asfloat * qryPesquisa.FieldByName('PESO_REFERENTE').AsFloat)/ qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat;
          qryTransLocalCompra.ParamByName('COT_VALOR').AsFloat := valorReferenteLocal;
          qryTransLocalCompra.ParamByName('COT_QTD').AsFloat := qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat;
        end;

        qryTransLocalCompra.ExecSQL;
        IBTransLocal.Commit;

        //2º VERIFICAR SE PRODUTO COM O FORNECEDOR E COTACAO JA FORAM LANCADOS ITENS_COTACAO_COMPRA_FORNEC
        qryPesquisa.Close;
        qryPesquisa.SQL.Clear;
        qryPesquisa.SQL.Add('SELECT COT_CODIGO FROM ITENS_COTACAO_COMPRA_FORNEC                                 '+
                            'WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO AND PRO_CODIGO=:PRO_CODIGO ');
        qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
        qryPesquisa.ParamByName('FOR_CODIGO').AsString := cboFornecedorExcel.KeyValue;
        qryPesquisa.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
        qryPesquisa.Open;

        if qryPesquisa.IsEmpty then
        begin
          if (not IBTransLocal.InTransaction) then
            IBTransLocal.StartTransaction;

          qryTransLocalCompraFornec.Close;
          qryTransLocalCompraFornec.SQL.Clear;
          qryTransLocalCompraFornec.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA_FORNEC              '+
                                            ' (COT_CODIGO, PRO_CODIGO, FOR_CODIGO, COT_VALOR, COT_OBS)     '+
                                            ' VALUES                                              '+
                                            ' (:COT_CODIGO, :PRO_CODIGO, :FOR_CODIGO, :COT_VALOR, :COT_OBS) ');
          qryTransLocalCompraFornec.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
          qryTransLocalCompraFornec.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
          qryTransLocalCompraFornec.ParamByName('FOR_CODIGO').AsInteger:= cboFornecedorExcel.KeyValue;
          qryTransLocalCompraFornec.ParamByName('COT_VALOR').AsFloat := qryCarregarExcel.fieldbyname('VALOR_UNIT').asfloat;
          if qryCarregarExcel.FieldByName('DESCONTO').AsFloat > 0 then
            qryTransLocalCompraFornec.ParamByName('COT_OBS').AsString := 'OFERTA';
          qryTransLocalCompraFornec.ExecSQL;

          IBTransLocal.Commit;
        end;

        //3º VERIFICAR SE FORNECEDOR JA FOI LANCADO NO ITENS_COTACAO_FORNEC_VENC
        qryPesqAux.Close;
        qryPesqAux.SQL.Clear;
        qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC          '+
                           ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO  ');
        qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
        qryPesqAux.ParamByName('FOR_CODIGO').AsString := cboFornecedorExcel.KeyValue;
        qryPesqAux.Open;

        if qryPesqAux.IsEmpty then
        begin
          if (not IBTransLocal.InTransaction) then
            IBTransLocal.StartTransaction;

          qryTransLocal.Close;
          qryTransLocal.SQL.Clear;
          qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                    '+
                                ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA)          '+
                                ' VALUES                                                  '+
                                ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA)       ');
          qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
          qryTransLocal.ParamByName('FOR_CODIGO').AsString := cboFornecedorExcel.KeyValue;
          qryTransLocal.ExecSQL;

          IBTransLocal.Commit;
        end;
      end;

      //FIM verifica se produto ja foi lancado na cotacao

      //DELETAR PRODUTO DO CARREGAR_EXCEL_COTACAO
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('DELETE FROM CARREGAR_EXCEL_COTACAO WHERE ID=:ID');
      qryTransLocal.ParamByName('ID').AsString:= id_carregar_excel_cotacao;
      qryTransLocal.ExecSQL;
      IBTransLocal.Commit;

    end;
    qryCarregarExcel.Next;
  end;

  cod_cotacao_local := ' I.COT_CODIGO = ' + lbl_cod_cotacao.Caption;
  fornecedor_local:= ' and I.FOR_CODIGO_ATUAL = ' + IntToStr(cboFornecedorExcel.KeyValue);

  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('select * from carregar_excel_cotacao order by produto_descricao');
  qryCarregarExcel.Open;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM carregar_excel_cotacao');
  qryPesquisa.Open;
  edtTotalExcel.Value := qryPesquisa.fieldbyname('TOTAL').AsFloat;

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,   '+
                     'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,   '+
                     'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                     '+
                     'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                   '+
                     'FROM itens_cotacao_compra I INNER JOIN                                                   '+
                     '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                               '+
                     'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                            '+
                     'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                        '+
                     '  AND ICCF.for_codigo = I.for_codigo_atual                                               '+
                     'LEFT JOIN agenda_telefone FORN ON                                                        '+
                     'I.for_codigo_atual = FORN.at_codigo                                                      '+
                     'WHERE ' + cod_cotacao_local + fornecedor_local                                            +
                     'GROUP BY I.ITENS_COT_CODIGO,                                                             '+
                     'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                   '+
                     'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,       '+
                     'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs  ');
  qryProduto.Open;

  cdsProduto.Close;
  cdsProduto.FetchParams;
  cdsProduto.Open;

  btn_Finalizar.Enabled := true;

  showmessage('Importação finalizada');

end;

procedure Tfrm_cotacao_compra.Button4Click(Sender: TObject);
begin
  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('delete from carregar_excel_cotacao');
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('SELECT * FROM CARREGAR_EXCEL_COTACAO ORDER BY PRODUTO_DESCRICAO');
  qryCarregarExcel.Open;

end;

procedure Tfrm_cotacao_compra.DBGrid5TitleClick(Column: TColumn);
var
  campo_local: string;
begin
  campo_local := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages;

  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('SELECT * FROM CARREGAR_EXCEL_COTACAO ORDER BY ' + campo_local);
  qryCarregarExcel.Open;
end;

procedure Tfrm_cotacao_compra.txt_descricao_pesqChange(Sender: TObject);
var
  descricao: string;
begin
  if (txt_descricao_pesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
    descricao  := ' AND UPPER(P.PRO_DESCRICAO) LIKE UPPER('+ #39 + txt_descricao_pesq.Text + '%' + #39 + ')'
  else if (txt_descricao_pesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
    descricao  := ' AND UPPER(P.PRO_DESCRICAO) LIKE UPPER('+ #39 + '%' + txt_descricao_pesq.Text + '%' + #39 + ')'
  else
    descricao  := '';

  qryProdutoExcel.Close;
  qryProdutoExcel.SQL.Clear;
  qryProdutoExcel.SQL.Add('SELECT P.pro_codigo, P.pro_descricao, U.UN_DESCRICAO               '+
                          'FROM  PRODUTO P INNER JOIN UNIDADE U ON P.UN_CODIGO = U.UN_CODIGO  '+
                          'WHERE 1=1 ' + descricao + ' ORDER BY P.PRO_DESCRICAO               ');
  qryProdutoExcel.Open;
end;

procedure Tfrm_cotacao_compra.txt_descricao_pesqKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    dbgProdutoExcel.SetFocus;
end;

procedure Tfrm_cotacao_compra.txt_cod_produto_pesqChange(Sender: TObject);
var
  codigo: string;
begin
  if txt_cod_produto_pesq.Text <> '' then
    codigo  := ' AND PRO_CODIGO = ' + txt_cod_produto_pesq.Text
  else
    codigo  := '';

  qryProdutoExcel.Close;
  qryProdutoExcel.SQL.Clear;
  qryProdutoExcel.SQL.Add('SELECT P.pro_codigo, P.pro_descricao, u.UN_DESCRICAO               '+
                          'FROM PRODUTO P INNER JOIN UNIDADE U ON P.UN_CODIGO = U.UN_CODIGO   '+
                          'WHERE 1=1 ' + codigo + ' ORDER BY P.PRO_DESCRICAO                  ');
  qryProdutoExcel.Open;
end;


procedure Tfrm_cotacao_compra.dbgProdutoExcelDblClick(Sender: TObject);
begin
  edtProdutoSelecionado.Text := qryProdutoExcel.fieldbyname('PRO_CODIGO').AsString + ' - ' + qryProdutoExcel.fieldbyname('PRO_DESCRICAO').AsString ;
  pro_codigo_meu:= qryProdutoExcel.fieldbyname('PRO_CODIGO').AsString;
  pro_unidade_meu:= qryProdutoExcel.fieldbyname('UN_DESCRICAO').AsString;
end;

procedure Tfrm_cotacao_compra.dbgProdutoExcelDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
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
     dbgProdutoExcel.Canvas.Font.Color:= clBlack;

  dbgProdutoExcel.Canvas.FillRect(Rect);
  dbgProdutoExcel.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_cotacao_compra.rdb_posicaoClick(Sender: TObject);
begin
  txt_descricao_pesq.SetFocus;
end;

procedure Tfrm_cotacao_compra.rdb_inicioClick(Sender: TObject);
begin
  txt_descricao_pesq.SetFocus;
end;

procedure Tfrm_cotacao_compra.dbgProdutoExcelKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF key=#13 then
  begin
    edtProdutoSelecionado.Text := qryProdutoExcel.fieldbyname('PRO_CODIGO').AsString + ' - ' + qryProdutoExcel.fieldbyname('PRO_DESCRICAO').AsString ;
    pro_codigo_meu:= qryProdutoExcel.fieldbyname('PRO_CODIGO').AsString;
    pro_unidade_meu:= qryProdutoExcel.fieldbyname('UN_DESCRICAO').AsString;
  end;

end;

procedure Tfrm_cotacao_compra.DBGrid5DblClick(Sender: TObject);
begin
  edtProdutoSelecionadoExcel.Text := qryCarregarExcel.fieldbyname('COD_PRODUTO_EXCEL').AsString + ' - ' + qryCarregarExcel.fieldbyname('PRODUTO_DESCRICAO').AsString ;
  valor_unit_fornec:= qryCarregarExcel.fieldbyname('VALOR_UNIT').AsFloat;
  valor_total_fornec:= qryCarregarExcel.fieldbyname('VALOR_TOTAL').ASFloat;
  qtde_fornec:= qryCarregarExcel.fieldbyname('QTDE').ASFloat;
  pro_codigo_fornecedor:= qryCarregarExcel.fieldbyname('COD_PRODUTO_EXCEL').AsString;
  id_carregar_excel_cotacao_global:= qryCarregarExcel.fieldbyname('ID').AsString;
  desconto_global:= qryCarregarExcel.FieldByName('DESCONTO').AsFloat;

end;

procedure Tfrm_cotacao_compra.DBGrid5KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF key=#13 then
  begin
    edtProdutoSelecionadoExcel.Text := qryCarregarExcel.fieldbyname('COD_PRODUTO_EXCEL').AsString + ' - ' + qryCarregarExcel.fieldbyname('PRODUTO_DESCRICAO').AsString;
    id_carregar_excel_cotacao_global:= qryCarregarExcel.fieldbyname('ID').AsString;
    valor_unit_fornec:= qryCarregarExcel.fieldbyname('VALOR_UNIT').AsFloat;
    valor_total_fornec:= qryCarregarExcel.fieldbyname('VALOR_TOTAL').ASFloat;
    pro_codigo_fornecedor:= qryCarregarExcel.fieldbyname('COD_PRODUTO_EXCEL').AsString;
    qtde_fornec:= qryCarregarExcel.fieldbyname('QTDE').ASFloat;
    desconto_global:= qryCarregarExcel.FieldByName('DESCONTO').AsFloat;

  end;
end;

procedure Tfrm_cotacao_compra.Button5Click(Sender: TObject);
var
  cod_cotacao_local, fornecedor_local: string;
  valorReferenteLocal: real;
  ordemInsercaoLocal: integer;
begin
  if cboFornecedorExcel.Text = '' then
  begin
    showmessage('Selecione um fornecedor');
    cboFornecedorExcel.setfocus;
    exit;
  end;

  if (edtProdutoSelecionado.Text = '') or (edtProdutoSelecionadoExcel.text = '') then
  begin
    showmessage('Selecione os produtos');
    exit;
  end;

  ///Verificar se produto já foi lançado para o respectivo fornecedor
  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT ID FROM COD_PRODUTO_MEU_FORNECEDOR                            '+
                      ' WHERE PRO_CODIGO_FORNEC=:PRO_CODIGO_FORNEC AND AT_CODIGO=:AT_CODIGO ');
  qryPesquisa.ParamByName('PRO_CODIGO_FORNEC').AsString := pro_codigo_fornecedor;
  qryPesquisa.ParamByName('AT_CODIGO').AsString  := cboFornecedorExcel.KeyValue;
  qryPesquisa.Open;

  if not qryPesquisa.IsEmpty then
  begin
    mensagem:= 'Este produto com o respectivo fornecedor já está ligado!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    exit;
  end;
  ///FIM Verificar se produto já foi lançado para o respectivo fornecedor


  ///VERIFICA SE TEM PRODUTO LANCADO NA COTACAO COM O MESMO FORNECEDOR
  if (not IBTransLocal.InTransaction) then
   IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO '+
                        ' AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL                                                  ');
  qryTransLocal.ParamByName('COT_CODIGO').asstring := lbl_cod_cotacao.Caption;
  qryTransLocal.ParamByName('PRO_CODIGO').asstring := pro_codigo_meu;
  qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').asstring := cboFornecedorExcel.KeyValue;
  qryTransLocal.ExecSQL;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA_FORNEC WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO '+
                        ' AND FOR_CODIGO=:FOR_CODIGO                                                                     ');
  qryTransLocal.ParamByName('COT_CODIGO').asstring := lbl_cod_cotacao.Caption;
  qryTransLocal.ParamByName('PRO_CODIGO').asstring := pro_codigo_meu;
  qryTransLocal.ParamByName('FOR_CODIGO').asstring := cboFornecedorExcel.KeyValue;
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;
  ///fim VERIFICA SE TEM PRODUTO LANCADO NA COTACAO COM O MESMO FORNECEDOR

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT ITE_ORDEM_INSERCAO FROM ITENS_COTACAO_COMPRA         '+
                      'WHERE COT_CODIGO=:COT_CODIGO ORDER BY ITE_ORDEM_INSERCAO    ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
  qryPesquisa.Open;
  qryPesquisa.Last;

  ordemInsercaoLocal:= qryPesquisa.fieldbyname('ITE_ORDEM_INSERCAO').asInteger;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  try
    qryTransLocalFornecMeu.Close;
    qryTransLocalFornecMeu.SQL.Clear;
    qryTransLocalFornecMeu.SQL.Add('INSERT INTO COD_PRODUTO_MEU_FORNECEDOR               '+
                                   ' (PRO_CODIGO, PRO_CODIGO_FORNEC, AT_CODIGO)          '+
                                   ' VALUES                                              '+
                                   ' (:PRO_CODIGO, :PRO_CODIGO_FORNEC, :AT_CODIGO)       ');
    qryTransLocalFornecMeu.ParamByName('PRO_CODIGO').AsString := pro_codigo_meu;
    qryTransLocalFornecMeu.ParamByName('PRO_CODIGO_FORNEC').AsString := pro_codigo_fornecedor;
    qryTransLocalFornecMeu.ParamByName('AT_CODIGO').AsInteger:= cboFornecedorExcel.KeyValue;
    qryTransLocalFornecMeu.ExecSQL;

    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PESO_PRODUTO, PESO_REFERENTE        '+
                        'FROM  PRODUTO WHERE PRO_CODIGO=:PRO_CODIGO ');
    qryPesquisa.ParamByName('PRO_CODIGO').AsString := pro_codigo_meu;
    qryPesquisa.Open;

    qryTransLocalCompra.Close;
    qryTransLocalCompra.SQL.Clear;
    qryTransLocalCompra.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA                                                                                      '+
                                '(COT_CODIGO, PRO_CODIGO, COT_UNIDADE, COT_QTD, ITE_ORDEM_INSERCAO, FOR_CODIGO_ATUAL, COT_VALOR, FOR_INSERIDO, COT_OBS )        '+
                                'VALUES                                                                                                                '+
                                '(:COT_CODIGO, :PRO_CODIGO, :COT_UNIDADE, :COT_QTD, :ITE_ORDEM_INSERCAO, :FOR_CODIGO_ATUAL, :COT_VALOR, :FOR_INSERIDO, :COT_OBS )');
    qryTransLocalCompra.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
    qryTransLocalCompra.ParamByName('PRO_CODIGO').AsString := pro_codigo_meu;
    qryTransLocalCompra.ParamByName('COT_UNIDADE').AsString := pro_unidade_meu;
    qryTransLocalCompra.ParamByName('COT_QTD').AsFloat := qtde_fornec;
    qryTransLocalCompra.ParamByName('ITE_ORDEM_INSERCAO').AsInteger := ordemInsercaoLocal +1;
    qryTransLocalCompra.ParamByName('FOR_CODIGO_ATUAL').AsInteger := cboFornecedorExcel.KeyValue;
    qryTransLocalCompra.ParamByName('FOR_INSERIDO').AsString := 'S';
    qryTransLocalCompra.ParamByName('COT_VALOR').AsFloat := valor_unit_fornec;
    if qryCarregarExcel.FieldByName('DESCONTO').AsFloat > 0 then
          qryTransLocalCompra.ParamByName('COT_OBS').AsString := 'OFERTA';

    IF qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat > 0 then
    begin
        valorReferenteLocal:= (qryCarregarExcel.fieldbyname('VALOR_UNIT').asfloat * qryPesquisa.FieldByName('PESO_REFERENTE').AsFloat)/ qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat;
        qryTransLocalCompra.ParamByName('COT_VALOR').AsFloat := valorReferenteLocal;
        qryTransLocalCompra.ParamByName('COT_QTD').AsFloat := qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat;
    end;


    qryTransLocalCompra.ExecSQL;

    qryTransLocalCompraFornec.Close;
    qryTransLocalCompraFornec.SQL.Clear;
    qryTransLocalCompraFornec.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA_FORNEC              '+
                                      ' (COT_CODIGO, PRO_CODIGO, FOR_CODIGO, COT_VALOR, COT_OBS)     '+
                                      ' VALUES                                              '+
                                      ' (:COT_CODIGO, :PRO_CODIGO, :FOR_CODIGO, :COT_VALOR, :COT_OBS) ');
    qryTransLocalCompraFornec.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
    qryTransLocalCompraFornec.ParamByName('PRO_CODIGO').AsString := pro_codigo_meu;
    qryTransLocalCompraFornec.ParamByName('FOR_CODIGO').AsInteger:= cboFornecedorExcel.KeyValue;
    qryTransLocalCompraFornec.ParamByName('COT_VALOR').AsFloat := valor_unit_fornec;
    if qryCarregarExcel.FieldByName('DESCONTO').AsFloat > 0 then
          qryTransLocalCompraFornec.ParamByName('COT_OBS').AsString := 'OFERTA';
    qryTransLocalCompraFornec.ExecSQL;

    qryPesqAux.Close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC         '+
                       ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
    qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    qryPesqAux.ParamByName('FOR_CODIGO').AsString := cboFornecedorExcel.KeyValue;
    qryPesqAux.Open;

    if qryPesqAux.IsEmpty then
    begin
       qryTransLocal.Close;
       qryTransLocal.SQL.Clear;
       qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                             '+
                             ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA)                   '+
                             ' VALUES                                                           '+
                             ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA)                ');
       qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
       qryTransLocal.ParamByName('FOR_CODIGO').AsString := cboFornecedorExcel.KeyValue;

       qryTransLocal.ExecSQL;
    end;

  except
    IBTransLocal.Rollback;
    exit;
  end;

  IBTransLocal.Commit;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('DELETE FROM CARREGAR_EXCEL_COTACAO WHERE ID=:ID');
  qryTransLocal.ParamByName('ID').AsString:= id_carregar_excel_cotacao_global;
  qryTransLocal.ExecSQL;

  IBTransLocal.Commit;

  cod_cotacao_local := ' I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;
  fornecedor_local:= ' and I.FOR_CODIGO_ATUAL = ' + IntToStr(cboFornecedorExcel.KeyValue);

  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('select * from carregar_excel_cotacao order by produto_descricao');
  qryCarregarExcel.Open;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM carregar_excel_cotacao');
  qryPesquisa.Open;
  edtTotalExcel.Value := qryPesquisa.fieldbyname('TOTAL').AsFloat;

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  '+
                     'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  '+
                     'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    '+
                     'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  '+
                     'FROM itens_cotacao_compra I INNER JOIN                                                  '+
                     '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              '+
                     'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           '+
                     'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                     '  AND ICCF.for_codigo = I.for_codigo_atual                                              '+
                     'LEFT JOIN agenda_telefone FORN ON                                                       '+
                     'I.for_codigo_atual = FORN.at_codigo                                                     '+
                     'WHERE ' + cod_cotacao_local + fornecedor_local                                           +
                     'GROUP BY I.ITENS_COT_CODIGO,                                                            '+
                     'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  '+
                     'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      '+
                     'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs ');

  qryProduto.Open;

  cdsProduto.Close;
  cdsProduto.FetchParams;
  cdsProduto.Open;

  btn_Finalizar.Enabled := true;

end;

procedure Tfrm_cotacao_compra.InserirItemIndividualmente1Click(
  Sender: TObject);
var
  cod_produto_local, id_carregar_excel_cotacao, cod_cotacao_local, fornecedor_local, un_descricao_local: string;
  ite_ordem_insercao: integer;
  valorReferenteLocal: real;
begin
  if cboFornecedorExcel.Text = '' then
  begin
    showmessage('Selecione um fornecedor');
    cboFornecedorExcel.setfocus;
    exit;
  end;

  id_carregar_excel_cotacao:= qryCarregarExcel.fieldbyname('ID').asstring;

  //verifica se produto ja foi lancado alguma vez
  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM COD_PRODUTO_MEU_FORNECEDOR                    '+
                      ' WHERE PRO_CODIGO_FORNEC=:PRO_CODIGO_FORNEC AND AT_CODIGO=:AT_CODIGO ');
  qryPesquisa.ParamByName('PRO_CODIGO_FORNEC').AsString := qryCarregarExcel.fieldbyname('COD_PRODUTO_EXCEL').asstring;
  qryPesquisa.ParamByName('AT_CODIGO').AsString  := cboFornecedorExcel.KeyValue;
  qryPesquisa.Open;
  //FIM verifica se produto ja foi lancado alguma vez

  if not qryPesquisa.IsEmpty then
  begin
    cod_produto_local:= qryPesquisa.fieldbyname('PRO_CODIGO').AsString;

    //verifica se produto ja foi lancado na cotacao
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT COT_QTD FROM ITENS_COTACAO_COMPRA                                                        '+
                        ' WHERE PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL AND COT_CODIGO=:COT_CODIGO ');
    qryPesquisa.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
    qryPesquisa.ParamByName('FOR_CODIGO_ATUAL').AsString  := cboFornecedorExcel.KeyValue;
    qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    qryPesquisa.Open;

    if not qryPesquisa.IsEmpty then
    begin
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET                                                                                  '+
                            ' COT_QTD=:COT_QTD WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
      qryTransLocal.ParamByName('COT_CODIGO').AsString:= lbl_cod_cotacao.Caption;
      qryTransLocal.ParamByName('PRO_CODIGO').AsString:= cod_produto_local;
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString:= cboFornecedorExcel.KeyValue;
      qryTransLocal.ParamByName('COT_QTD').asfloat:= qryPesquisa.fieldbyname('COT_QTD').asfloat + qryCarregarExcel.fieldbyname('QTDE').asfloat;
      qryTransLocal.ExecSQL;

      IBTransLocal.Commit;

    end
    else
    begin
      //1º INSERIR PRODUTO DO ITENS_COMPRA_COMPRA
      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Add('SELECT ITE_ORDEM_INSERCAO FROM ITENS_COTACAO_COMPRA         '+
                          'WHERE COT_CODIGO=:COT_CODIGO ORDER BY ITE_ORDEM_INSERCAO    ');
      qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
      qryPesquisa.Open;
      qryPesquisa.Last;

      ite_ordem_insercao:= qryPesquisa.fieldbyname('ITE_ORDEM_INSERCAO').asinteger;

      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Add('SELECT U.UN_DESCRICAO                                             '+
                          'FROM  PRODUTO P INNER JOIN UNIDADE U ON P.UN_CODIGO = U.UN_CODIGO '+
                          'WHERE PRO_CODIGO=:PRO_CODIGO ORDER BY P.PRO_DESCRICAO             ');
      qryPesquisa.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
      qryPesquisa.Open;

      un_descricao_local := qryPesquisa.fieldbyname('UN_DESCRICAO').asstring;

      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Add('SELECT PESO_PRODUTO, PESO_REFERENTE        '+
                          'FROM  PRODUTO WHERE PRO_CODIGO=:PRO_CODIGO ');
      qryPesquisa.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
      qryPesquisa.Open;

      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocalCompra.Close;
      qryTransLocalCompra.SQL.Clear;
      qryTransLocalCompra.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA                                                                                       '+
                                  '(COT_CODIGO, PRO_CODIGO, COT_UNIDADE, COT_QTD, ITE_ORDEM_INSERCAO, FOR_CODIGO_ATUAL, COT_VALOR, FOR_INSERIDO, COT_OBS )         '+
                                  'VALUES                                                                                                                 '+
                                  '(:COT_CODIGO, :PRO_CODIGO, :COT_UNIDADE, :COT_QTD, :ITE_ORDEM_INSERCAO, :FOR_CODIGO_ATUAL, :COT_VALOR, :FOR_INSERIDO, :COT_OBS)  ');
      qryTransLocalCompra.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
      qryTransLocalCompra.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
      qryTransLocalCompra.ParamByName('COT_UNIDADE').AsString := un_descricao_local;
      qryTransLocalCompra.ParamByName('COT_QTD').AsFloat := qryCarregarExcel.fieldbyname('QTDE').asfloat;
      qryTransLocalCompra.ParamByName('ITE_ORDEM_INSERCAO').AsInteger := ite_ordem_insercao +1;
      qryTransLocalCompra.ParamByName('FOR_CODIGO_ATUAL').AsInteger := cboFornecedorExcel.KeyValue;
      qryTransLocalCompra.ParamByName('FOR_INSERIDO').AsString := 'S';
      qryTransLocalCompra.ParamByName('COT_VALOR').AsFloat := qryCarregarExcel.fieldbyname('VALOR_UNIT').asfloat;
      if qryCarregarExcel.FieldByName('DESCONTO').AsFloat > 0 then
          qryTransLocalCompra.ParamByName('COT_OBS').AsString := 'OFERTA';

      IF qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat > 0 then
      begin
          valorReferenteLocal:= (qryCarregarExcel.fieldbyname('VALOR_UNIT').asfloat * qryPesquisa.FieldByName('PESO_REFERENTE').AsFloat)/ qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat;
          qryTransLocalCompra.ParamByName('COT_VALOR').AsFloat := valorReferenteLocal;
          qryTransLocalCompra.ParamByName('COT_QTD').AsFloat := qryPesquisa.FieldByName('PESO_PRODUTO').AsFloat;
      end;

      qryTransLocalCompra.ExecSQL;

      IBTransLocal.Commit;

      //2º VERIFICAR SE PRODUTO COM O FORNECEDOR E COTACAO JA FORAM LANCADOS ITENS_COTACAO_COMPRA_FORNEC
      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Add('SELECT COT_CODIGO FROM ITENS_COTACAO_COMPRA_FORNEC                                 '+
                          'WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO AND PRO_CODIGO=:PRO_CODIGO ');
      qryPesquisa.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
      qryPesquisa.ParamByName('FOR_CODIGO').AsString := cboFornecedorExcel.KeyValue;
      qryPesquisa.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
      qryPesquisa.Open;

      if qryPesquisa.IsEmpty then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocalCompraFornec.Close;
        qryTransLocalCompraFornec.SQL.Clear;
        qryTransLocalCompraFornec.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA_FORNEC              '+
                                          ' (COT_CODIGO, PRO_CODIGO, FOR_CODIGO, COT_VALOR, COT_OBS)     '+
                                          ' VALUES                                              '+
                                          ' (:COT_CODIGO, :PRO_CODIGO, :FOR_CODIGO, :COT_VALOR, :COT_OBS) ');
        qryTransLocalCompraFornec.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
        qryTransLocalCompraFornec.ParamByName('PRO_CODIGO').AsString := cod_produto_local;
        qryTransLocalCompraFornec.ParamByName('FOR_CODIGO').AsInteger:= cboFornecedorExcel.KeyValue;
        qryTransLocalCompraFornec.ParamByName('COT_VALOR').AsFloat := qryCarregarExcel.fieldbyname('VALOR_UNIT').asfloat;
        if qryCarregarExcel.FieldByName('DESCONTO').AsFloat > 0 then
          qryTransLocalCompraFornec.ParamByName('COT_OBS').AsString := 'OFERTA';
        qryTransLocalCompraFornec.ExecSQL;
        IBTransLocal.Commit;
      end;

      //3º VERIFICAR SE FORNECEDOR JA FOI LANCADO NO ITENS_COTACAO_FORNEC_VENC
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC         '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO').AsString := cboFornecedorExcel.KeyValue;
      qryPesqAux.Open;

      if qryPesqAux.IsEmpty then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC              '+
                              ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA)    '+
                              ' VALUES                                            '+
                              ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA) ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := cboFornecedorExcel.KeyValue;

        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;
      end;
    end;

    //FIM verifica se produto ja foi lancado na cotacao

    //DELETAR PRODUTO DO CARREGAR_EXCEL_COTACAO
    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('DELETE FROM CARREGAR_EXCEL_COTACAO WHERE ID=:ID');
    qryTransLocal.ParamByName('ID').AsString:= id_carregar_excel_cotacao;
    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;


  end;
  qryCarregarExcel.Next;

  cod_cotacao_local := ' I.COT_CODIGO = ' + lbl_cod_cotacao.Caption;
  fornecedor_local:= ' and I.FOR_CODIGO_ATUAL = ' + IntToStr(cboFornecedorExcel.KeyValue);

  qryCarregarExcel.close;
  qryCarregarExcel.SQL.Clear;
  qryCarregarExcel.SQL.Add('select * from carregar_excel_cotacao order by produto_descricao');
  qryCarregarExcel.Open;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM carregar_excel_cotacao');
  qryPesquisa.Open;
  edtTotalExcel.Value := qryPesquisa.fieldbyname('TOTAL').AsFloat;

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  '+
                     'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  '+
                     'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    '+
                     'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  '+
                     'FROM itens_cotacao_compra I INNER JOIN                                                  '+
                     '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              '+
                     'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           '+
                     'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                     '  AND ICCF.for_codigo = I.for_codigo_atual                                              '+
                     'LEFT JOIN agenda_telefone FORN ON                                                       '+
                     'I.for_codigo_atual = FORN.at_codigo                                                     '+
                     'WHERE ' + cod_cotacao_local + fornecedor_local                                           +
                     'GROUP BY I.ITENS_COT_CODIGO,                                                            '+
                     'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  '+
                     'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      '+
                     'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs ');

  qryProduto.Open;

  cdsProduto.Close;
  cdsProduto.FetchParams;
  cdsProduto.Open;

  btn_Finalizar.Enabled := true;

end;

procedure Tfrm_cotacao_compra.Button6Click(Sender: TObject);
begin
  Application.CreateForm(TfrmProduto, frmProduto);
  frmProduto.pesquisa := 'pesq_cotacao_excel';
  frmProduto.ShowModal;
end;

procedure Tfrm_cotacao_compra.inserirPrecoMaisBaratoProximaOpcao;
var
  sair_laco_menor_produto, obs, sql_fornecedor, sql_fornecedor_proximo_barato: string;
  vetor_fornecedor: array of string;
  data_max, data_cotacao : TDate;
  i, i_total : Integer;
begin
  //COLOCAR O FORNECEDOR MAIS BARATO
  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT DATA_PROD_BARATO FROM CONFIGURACAO_COTACAO ');
  qryPesqAux.Open;

  data_cotacao := qryPesqAux.fieldbyname('DATA_PROD_BARATO').AsDateTime;

  valor_global := 999999999;
  fornec_global := '';
  data_compra_global := '';
  cod_fornecedor_global := '';
  obs:= '';

  //SELECIONAR TODOS OS FORNECEDORES DO RESPECTIVO PRODUTO
  i:=0;
  sql_fornecedor_proximo_barato:= '';
  while i < Length(fornecedor_vetor_global) do
  begin
    sql_fornecedor_proximo_barato := sql_fornecedor_proximo_barato + ' AND ICCF.for_codigo <>' + fornecedor_vetor_global[i];
    i:=i+1;
  end;

  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT  ICCF.for_codigo                                                   '+
                     'FROM itens_cotacao_compra_fornec ICCF INNER JOIN cotacao_compra COTA ON   '+
                     'COTA.cot_codigo = ICCF.cot_codigo                                         '+
                     'WHERE ICCF.PRO_CODIGO=:PRO_CODIGO                                         '+
                     'AND COTA.COT_VENCIMENTO between :DATAI AND :DATAF                         '+
                     'AND (ICCF.cot_obs <> ''OFERTA'' or iccf.cot_obs is NULL )                 '+
                     'AND COTA.COT_CODIGO <>:COT_CODIGO   '+ sql_fornecedor_proximo_barato       +
                     'GROUP BY ICCF.for_codigo                                                  ');
  qryPesqAux.ParamByName('DATAI').AsDate := data_cotacao;
  qryPesqAux.ParamByName('DATAF').AsDate := dta_vencimento.Date;
  if txt_cod_produto.Text = '' then
    qryPesqAux.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString
  else
    qryPesqAux.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
  qryPesqAux.Open;
  qryPesqAux.FetchAll;
  qryPesqAux.First;

  codigo_produto_global:= cdsProduto.fieldbyname('PRO_CODIGO').AsString;

  i_total:=0;
  while not qryPesqAux.Eof do
  begin
    SetLength(vetor_fornecedor, Length(vetor_fornecedor)+1);
    vetor_fornecedor[i_total]:= qryPesqAux.fieldbyname('for_codigo').AsString;
    i_total:=i_total+1;
    qryPesqAux.Next;
  end;
  //FIM SELECIONAR TODOS OS FORNECEDORES DO RESPECTIVO PRODUTO


  //PEGAR O MAXIMO VALOR COM MAXIMA DATA
  i:=0;
  while i < i_total do
  begin
    qryPesqAux.Close;
    qryPesqAux.SQL.Clear;
    qryPesqAux.SQL.Add('SELECT COT_VENCIMENTO, ICCF.cot_valor, AG.AT_codigo,                                        '+
                       ' AG.AT_codigo ||'' - ''|| AG.AT_nome AS FORNEC                                              '+
                       ' FROM itens_cotacao_compra_fornec ICCF INNER JOIN cotacao_compra COTA ON                    '+
                       ' COTA.cot_codigo = ICCF.cot_codigo                                                          '+
                       ' LEFT JOIN agenda_telefone AG ON                                                            '+
                       ' ICCF.for_codigo = AG.at_codigo                                                             '+
                       ' WHERE ICCF.PRO_CODIGO=:PRO_CODIGO AND ICCF.for_codigo=:FOR_CODIGO                          '+
                       ' AND COTA.COT_VENCIMENTO between :DATAI AND :DATAF                                          '+
                       ' AND (ICCF.cot_obs <> ''OFERTA'' or iccf.cot_obs is NULL )                                  '+
                       ' AND COTA.COT_CODIGO <>:COT_CODIGO '+ sql_fornecedor_proximo_barato                          +
                       ' GROUP BY ICCF.cot_valor, AG.AT_codigo, AG.AT_nome, COT_VENCIMENTO order by COT_VENCIMENTO  ');
    qryPesqAux.ParamByName('DATAI').AsDate := data_cotacao;
    qryPesqAux.ParamByName('DATAF').AsDate := dta_vencimento.Date;
    if txt_cod_produto.Text = '' then
      qryPesqAux.ParamByName('PRO_CODIGO').AsString := cdsProduto.fieldbyname('PRO_CODIGO').AsString
    else
      qryPesqAux.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
    qryPesqAux.ParamByName('FOR_CODIGO').AsString := vetor_fornecedor[i];
    qryPesqAux.Open;
    qryPesqAux.FetchAll;
    qryPesqAux.last;

    i:=i+1;

    if (qryPesqAux.FieldByName('COT_VALOR').AsString <> '') and (qryPesqAux.FieldByName('COT_VALOR').Asfloat > 0) then
    begin
      if qryPesqAux.FieldByName('COT_VALOR').AsFloat < valor_global then
      begin
        valor_global := qryPesqAux.FieldByName('COT_VALOR').AsFloat;
        fornec_global := qryPesqAux.FieldByName('FORNEC').asstring;
        cod_fornecedor_global := qryPesqAux.FieldByName('AT_codigo').asstring;
        data_compra_global := qryPesqAux.FieldByName('COT_VENCIMENTO').asstring;
      end;
    end;
  end;
  //FIMPEGAR O MAXIMO VALOR COM MAXIMA DATA

end;

procedure Tfrm_cotacao_compra.Prximomaisbarato1Click(Sender: TObject);
var
  cod_cotacao :string;
begin

  linha_global := cdsProduto.RecNo;

  if cod_produto_proximo_barato_global <> cdsProduto.fieldbyname('PRO_CODIGO').asstring then
  begin
    SetLength(fornecedor_vetor_global,0);
    i_vetor_din:=0;

    cod_produto_proximo_barato_global := cdsProduto.fieldbyname('PRO_CODIGO').asstring;
  end;

  SetLength(fornecedor_vetor_global, Length(fornecedor_vetor_global) +1);

  fornecedor_vetor_global[i_vetor_din]:= cdsProduto.fieldbyname('FOR_CODIGO_ATUAL').asstring;

  i_vetor_din := i_vetor_din +1;

  inserirPrecoMaisBaratoProximaOpcao;

  cod_cotacao := ' I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;

  if cod_fornecedor_global <> '' then
  begin
    if cheInserirPreco.Checked then
    begin
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_COMPRA_FORNEC   '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO AND PRO_CODIGO=:PRO_CODIGO ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO').AsString := cod_fornecedor_global;
      qryPesqAux.ParamByName('PRO_CODIGO').AsString := codigo_produto_global;
      qryPesqAux.Open;

      if qryPesqAux.IsEmpty then
      begin
        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA_FORNEC                        '+
                              ' (COT_CODIGO, PRO_CODIGO, FOR_CODIGO, COT_VALOR, COT_OBS)      '+
                              ' VALUES                                                        '+
                              ' (:COT_CODIGO, :PRO_CODIGO, :FOR_CODIGO, :COT_VALOR, :COT_OBS) ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_Cod_Cotacao.Caption;
        qryTransLocal.ParamByName('PRO_CODIGO').AsString := codigo_produto_global;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := cod_fornecedor_global;
        qryTransLocal.ParamByName('COT_VALOR').AsFloat   := valor_global;

        qryTransLocal.ExecSQL;
      End;

      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC         '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO').AsString := cod_fornecedor_global;
      qryPesqAux.Open;

      if qryPesqAux.IsEmpty then
      begin
         qryTransLocal.Close;
         qryTransLocal.SQL.Clear;
         qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                                 '+
                               ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE )     '+
                               ' VALUES                                                               '+
                               ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA, :COT_VALOR_FRETE ) ');
         qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
         qryTransLocal.ParamByName('FOR_CODIGO').AsString := cod_fornecedor_global;

         qryTransLocal.ExecSQL;
      end;

      IBTransLocal.Commit;

      if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

       qryTransLocal.Close;
       qryTransLocal.SQL.Clear;
       qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET COT_VALOR=:COT_VALOR, COT_DATA_COMPRA_ULT=:COT_DATA_COMPRA_ULT,           '+
                             ' FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL, COT_EMPATE=:COT_EMPATE, COT_OBS=:COT_OBS, FOR_INSERIDO=:FOR_INSERIDO '+
                             ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo                                                 ');
       qryTransLocal.ParamByName('COT_CODIGO').AsString := lbl_cod_cotacao.Caption;
       qryTransLocal.ParamByName('PRO_CODIGO').AsString := codigo_produto_global;
       qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cod_fornecedor_global;
       qryTransLocal.ParamByName('COT_VALOR').AsFloat   := valor_global;
       qryTransLocal.ParamByName('FOR_INSERIDO').AsString := 'S';
       qryTransLocal.ExecSQL;

      IBTransLocal.Commit;
    end;
  end;
  // FIM INSERI O PRECO MAIS BAIXO

  IF campo = '' then
    campo := 'i.ite_ordem_insercao';

  //ATUALIZA A GRID DOS FORNECEDORES CAMPEOES

  if cboFornecedor.Text <> '' then
  begin
    //verificar se produto está duas ou mais vezes na tabela itens_cotacao_compra
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC   '+
                        ' WHERE COT_CODIGO=:COT_CODIGO                      ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.First;


    if (not IBTransLocal.InTransaction) then
       IBTransLocal.StartTransaction;

    WHILE not qryPesquisa.Eof do
    begin
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO_ATUAL FROM ITENS_COTACAO_COMPRA                    '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO_ATUAL').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;
      qryPesqAux.Open;

      IF qryPesqAux.IsEmpty then
      begin
        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_FORNEC_VENC                    '+
                              ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO').AsString;

        qryTransLocal.ExecSQL;
      end;

      qryPesquisa.Next;
    end;


    IBTransLocal.Commit;

    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT FOR_CODIGO_ATUAL, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE                      '+
                        ' FROM ITENS_COTACAO_COMPRA                                                          '+
                        ' WHERE COT_CODIGO=:COT_CODIGO AND                                                   '+
                        ' (FOR_CODIGO_ATUAL IS NOT null or FOR_CODIGO_ATUAL <> '+ #39 + ''+ #39 + ')         ');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.Open;
    qryPesquisa.First;

    while not qryPesquisa.Eof do
    begin
      qryPesqAux.Close;
      qryPesqAux.SQL.Clear;
      qryPesqAux.SQL.Add('SELECT FOR_CODIGO FROM ITENS_COTACAO_FORNEC_VENC         '+
                         ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
      qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryPesqAux.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
      qryPesqAux.Open;

      if qryPesqAux.IsEmpty then
      begin
        if (not IBTransLocal.InTransaction) then
          IBTransLocal.StartTransaction;

        qryTransLocal.Close;
        qryTransLocal.SQL.Clear;
        qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_FORNEC_VENC                                 '+
                              ' (COT_CODIGO, FOR_CODIGO, COT_PREVISAO_ENTREGA, COT_VALOR_FRETE )     '+
                              ' VALUES                                                               '+
                              ' (:COT_CODIGO, :FOR_CODIGO, :COT_PREVISAO_ENTREGA, :COT_VALOR_FRETE ) ');
        qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
        qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;
        qryTransLocal.ParamByName('COT_PREVISAO_ENTREGA').AsString := qryPesquisa.fieldbyname('COT_PREVISAO_ENTREGA').AsString;
        qryTransLocal.ParamByName('COT_VALOR_FRETE').AsString := qryPesquisa.fieldbyname('COT_VALOR_FRETE').AsString;
        qryTransLocal.ExecSQL;

        IBTransLocal.Commit;

      end;
      qryPesquisa.Next;
    end;

  end;

  //FIM ATUALIZA A GRID DOS FORNECEDORES CAMPEOES
  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  '+
                     'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  '+
                     'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    '+
                     'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  '+
                     'FROM itens_cotacao_compra I INNER JOIN                                                  '+
                     '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              '+
                     'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           '+
                     'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       '+
                     '  AND ICCF.for_codigo = I.for_codigo_atual                                              '+
                     'LEFT JOIN agenda_telefone FORN ON                                                       '+
                     'I.for_codigo_atual = FORN.at_codigo                                                     '+
                     'WHERE ' + cod_cotacao + fornecedor_global                                                +
                     'GROUP BY I.ITENS_COT_CODIGO,                                                            '+
                     'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  '+
                     'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      '+
                     'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs '+
                     ' order by ' + campo );
  qryProduto.Open;

  cdsProduto.Close;
  cdsProduto.FetchParams;
  cdsProduto.Open;

  btn_Finalizar.Enabled := true;

  cdsProduto.RecNo := linha_global;
  DBGrid1.SetFocus;

  linha_global :=0;

end;

end.
