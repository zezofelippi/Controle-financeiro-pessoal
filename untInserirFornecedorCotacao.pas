unit untInserirFornecedorCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, IBCustomDataSet,
  IBQuery, IBDatabase, Mask, ToolEdit, CurrEdit, Menus;

type
  TfrmInserirFornecedorCotacao = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    txt_cod_fornec: TEdit;
    btn_pesq_fornec: TBitBtn;
    txt_fornecedor: TEdit;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    btnGravar: TBitBtn;
    txt_cod_barra: TEdit;
    txt_cod_produto: TEdit;
    Label2: TLabel;
    txt_produto: TEdit;
    Label11: TLabel;
    Label7: TLabel;
    txt_unidade: TEdit;
    qryPesquisa: TIBQuery;
    IBTransLocal: TIBTransaction;
    qryTransLocal: TIBQuery;
    dsFornecedor: TDataSource;
    qryFornecedor: TIBQuery;
    qryFornecedorCOT_VALOR: TIBBCDField;
    Label1: TLabel;
    txt_ultimo_fornecedor: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    txt_valor: TCurrencyEdit;
    txt_flag: TEdit;
    txt_ult_valor: TCurrencyEdit;
    qryPesqAux: TIBQuery;
    qryFornecedorAT_CODIGO: TIntegerField;
    qryFornecedorAT_NOME: TIBStringField;
    Label6: TLabel;
    txt_obs: TEdit;
    qryFornecedorCOT_OBS: TIBStringField;
    Label8: TLabel;
    txtFornecedorBarato: TEdit;
    txtValorBarato: TCurrencyEdit;
    Label10: TLabel;
    txtDataBarato: TDateEdit;
    Label35: TLabel;
    Label12: TLabel;
    txtDataUltCompra: TDateEdit;
    txtObsUlt: TEdit;
    Label13: TLabel;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txt_cod_fornecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_cod_fornecExit(Sender: TObject);
    procedure txt_cod_fornecEnter(Sender: TObject);
    procedure txt_cod_fornecKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_pesq_fornecClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_valorEnter(Sender: TObject);
    procedure txt_valorExit(Sender: TObject);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure Excluir1Click(Sender: TObject);
    procedure atualizarDadosProdutoFornecedor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInserirFornecedorCotacao: TfrmInserirFornecedorCotacao;

implementation

uses untCotacaoCompra, untAgendaTelefone, unt_modulo;

{$R *.dfm}

procedure TfrmInserirFornecedorCotacao.btnGravarClick(Sender: TObject);
var
  valor : real;
  cod_fornec, empate, cod_cotacao : string;
  i, cont_fornecedor : integer;
begin
  if txt_fornecedor.Text = '' then
  begin
    txt_flag.Clear;
    mensagem:= 'Informe o fornecedor!';
    Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
    txt_cod_fornec.SetFocus;
    exit;
  end;

  if txt_flag.Text = '' then /////FLAG P/ VERIFICAR SE FORNECEDOR ESTA SENDO INSERIDO OU ALTERADO
  begin
    /////VERIFICA SE FORNECEDOR JA FOI INSERIDO////////
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT PRO_CODIGO FROM ITENS_COTACAO_COMPRA_FORNEC WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO AND PRO_CODIGO=:PRO_CODIGO');
    qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryPesquisa.ParamByName('FOR_CODIGO').AsString := txt_cod_fornec.Text;
    qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryPesquisa.Open;

    if not qryPesquisa.IsEmpty then
    begin
      txt_flag.Clear;
      mensagem:= 'Fornecedor ja foi inserido para este produto!';
      Application.MessageBox(Pchar(mensagem), 'Informação!', MB_OK+MB_ICONWARNING + MB_TOPMOST);
      txt_cod_fornec.SetFocus;
      exit;
    end;
    /////FIM VERIFICA SE FORNECEDOR JA FOI INSERIDO////////


    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('INSERT INTO ITENS_COTACAO_COMPRA_FORNEC                        '+
                          ' (COT_CODIGO, PRO_CODIGO, FOR_CODIGO, COT_VALOR, COT_OBS)      '+
                          ' VALUES                                                        '+
                          ' (:COT_CODIGO, :PRO_CODIGO, :FOR_CODIGO, :COT_VALOR, :COT_OBS) ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_Cod_Cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryTransLocal.ParamByName('FOR_CODIGO').AsString := txt_cod_fornec.Text;
    qryTransLocal.ParamByName('COT_OBS').AsString    := txt_obs.Text;

    if txt_valor.Value > 0 then
      qryTransLocal.ParamByName('COT_VALOR').AsFloat   := txt_valor.Value;

    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;

  end
  else
  begin
    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA_FORNEC SET COT_VALOR=:COT_VALOR, COT_OBS =:COT_OBS       '+
                          ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo and FOR_CODIGO=:FOR_CODIGO ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryTransLocal.ParamByName('FOR_CODIGO').AsString := txt_flag.Text;
    qryTransLocal.ParamByName('COT_OBS').AsString    := txt_obs.Text;

    if txt_valor.value > 0 then
      qryTransLocal.ParamByName('COT_VALOR').AsFloat   := txt_valor.Value
    else
      qryTransLocal.ParamByName('COT_VALOR').AsString  := '';

    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;

  end;

  txt_cod_fornec.SetFocus;

  atualizarDadosProdutoFornecedor;

end;

procedure TfrmInserirFornecedorCotacao.FormShow(Sender: TObject);
begin
  txt_cod_produto.Text := frm_cotacao_compra.cdsProduto.fieldbyname('PRO_CODIGO').AsString;
  txt_cod_barra.Text   := frm_cotacao_compra.cdsProduto.fieldbyname('PRO_CODIGO').AsString;
  txt_produto.Text     := frm_cotacao_compra.cdsProduto.fieldbyname('PRO_DESCRICAO').AsString;
  txt_unidade.Text     := frm_cotacao_compra.cdsProduto.fieldbyname('COT_UNIDADE').AsString;

  qryFornecedor.Close;
  qryFornecedor.SQL.Clear;
  qryFornecedor.SQL.Add('SELECT F.AT_CODIGO, F.AT_NOME, I.COT_VALOR, I.COT_OBS                                                                        '+
                        ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I, produto p                                                            '+
                        ' WHERE I.for_codigo = F.AT_codigo AND I.PRO_CODIGO = P.PRO_CODIGO AND I.COT_CODIGO =:COT_CODIGO AND P.PRO_CODIGO=:PRO_CODIGO ');
  qryFornecedor.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryFornecedor.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryFornecedor.Open;

  txt_cod_fornec.SetFocus;

end;

procedure TfrmInserirFornecedorCotacao.txt_cod_fornecKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    btn_Pesq_Fornec.Click;
end;

procedure TfrmInserirFornecedorCotacao.txt_cod_fornecExit(Sender: TObject);
begin
  txt_cod_fornec.Color := clinfobk;

  if txt_cod_fornec.Text = '' then
    txt_fornecedor.Clear
  else
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT AT_NOME FROM AGENDA_TELEFONE WHERE AT_CODIGO = '+txt_cod_fornec.Text);
    qryPesquisa.Open;

    txt_fornecedor.Text:= qryPesquisa.FieldByName('AT_NOME').AsString;

    if qryPesquisa.IsEmpty then
    begin
      mensagem:= 'Fornecedor não encontrado!';
      Application.MessageBox(Pchar(mensagem), 'Atenção', MB_OK+MB_ICONWARNING);
      txt_cod_fornec.Clear;
      txt_fornecedor.Clear;
      txt_flag.Clear;
      txt_cod_fornec.SetFocus;
    end;

    if txt_cod_fornec.Text <> txt_flag.Text then
      txt_flag.Clear;

  end;
  
end;

procedure TfrmInserirFornecedorCotacao.txt_cod_fornecEnter(
  Sender: TObject);
begin
  txt_cod_fornec.Color := $00F5EEDE;
end;

procedure TfrmInserirFornecedorCotacao.txt_cod_fornecKeyPress(
  Sender: TObject; var Key: Char);
begin

  if not (Key in ['0'..'9', #13, #8, #7]) Then
    key := #0
  else
    if key =#13 then
      txt_valor.SetFocus;
      
end;

procedure TfrmInserirFornecedorCotacao.DBGrid1DrawColumnCell(
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
      DBGrid1.Canvas.Font.Color:= clBlack;

  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmInserirFornecedorCotacao.btn_pesq_fornecClick(
  Sender: TObject);
begin

  Application.CreateForm(TfrmAgendaTelefone, frmAgendaTelefone);
  frmAgendaTelefone.pesquisa:= 'pesq_cotacao_compra';
  frmAgendaTelefone.ShowModal;

end;

procedure TfrmInserirFornecedorCotacao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  valor : real;
  cod_fornec, cod_cotacao : string;
  linha : integer;
begin

  if (key = VK_DELETE) AND not (qryFornecedor.IsEmpty) then
  begin

    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_COMPRA_FORNEC WHERE COT_CODIGO =:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO AND FOR_CODIGO=:FOR_CODIGO');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('AT_CODIGO').AsString;
    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;

    qryFornecedor.Close;
    qryFornecedor.SQL.Clear;
    qryFornecedor.SQL.Add('SELECT F.AT_CODIGO, F.AT_NOME, I.COT_VALOR, I.COT_OBS, I.PRO_CODIGO                                                          '+
                          ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I, produto p                                                            '+
                          ' WHERE I.for_codigo = F.AT_codigo AND I.PRO_CODIGO = P.PRO_CODIGO AND I.COT_CODIGO =:COT_CODIGO AND P.PRO_CODIGO=:PRO_CODIGO ');
    qryFornecedor.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryFornecedor.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.text;
    qryFornecedor.Open;
    qryFornecedor.FetchAll;

    linha := frm_cotacao_compra.cdsProduto.RecNo;

    //////VERIFICA VALOR VENCEDOR//////////
    qryFornecedor.First;

    valor := 999999999;
    cod_fornec := '';

    while not qryFornecedor.Eof do
    begin
      if qryFornecedor.FieldByName('COT_VALOR').AsString <> '' then
      begin
        if qryFornecedor.FieldByName('COT_VALOR').AsFloat < valor then
        begin
          valor := qryFornecedor.FieldByName('COT_VALOR').AsFloat;
          cod_fornec := qryFornecedor.FieldByName('AT_CODIGO').asstring;
        end;
      end;
      qryFornecedor.Next;
    end;

    if cod_fornec <> '' then
    begin
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET COT_VALOR=:COT_VALOR, FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL '+
                            ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo                                ');
      qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cod_fornec;
      qryTransLocal.ParamByName('COT_VALOR').AsFloat   := valor;

      qryTransLocal.ExecSQL;

      IBTransLocal.Commit;
    end;
    /////FIM VERIFICA VALOR VENCEDOR/////////

    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET FOR_INSERIDO=:FOR_INSERIDO '+
                          ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo  ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;

    if qryFornecedor.IsEmpty then
      qryTransLocal.ParamByName('FOR_INSERIDO').AsString := ''
    else
      qryTransLocal.ParamByName('FOR_INSERIDO').AsString := 'S';

    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;

    if qryFornecedor.IsEmpty then
    begin
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET FOR_INSERIDO=:FOR_INSERIDO, FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL, COT_VALOR=:COT_VALOR '+
                            ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo                                                            ');
      qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
      qryTransLocal.ParamByName('FOR_INSERIDO').AsString := '';
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := '';
      qryTransLocal.ParamByName('COT_VALOR').AsString := '';

      qryTransLocal.ExecSQL;

      IBTransLocal.Commit;
    end;

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
    /////FIM VERIFICA SE FORNECEDOR PARTICIPA DOS CAMPEOES/////////


    cod_cotacao := ' AND I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;

    frm_cotacao_compra.qryProduto.Close;
    frm_cotacao_compra.qryProduto.SQL.Clear;
    frm_cotacao_compra.qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,   '+
                                          'I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,   '+
                                          'ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                     '+
                                          'I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                   '+
                                          'FROM itens_cotacao_compra I INNER JOIN                                                   '+
                                          '  PRODUTO P ON I.pro_codigo = P.pro_codigo                                               '+
                                          'LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                            '+
                                          'I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                        '+
                                          ' AND ICCF.for_codigo = I.for_codigo_atual                                                '+
                                          'LEFT JOIN agenda_telefone FORN ON                                                        '+
                                          'I.for_codigo_atual = FORN.at_codigo                                                      '+
                                          'WHERE ' + cod_cotacao                                                                     +
                                          'GROUP BY I.ITENS_COT_CODIGO,                                                             '+
                                          'P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                   '+
                                          'I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,       '+
                                          'I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs  ');
    frm_cotacao_compra.qryProduto.Open;

    frm_cotacao_compra.cdsProduto.Close;
    frm_cotacao_compra.cdsProduto.FetchParams;
    frm_cotacao_compra.cdsProduto.Open;

    frm_cotacao_compra.cdsProduto.RecNo := linha;

  end; 

end;

procedure TfrmInserirFornecedorCotacao.txt_valorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure TfrmInserirFornecedorCotacao.txt_valorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure TfrmInserirFornecedorCotacao.txt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_obs.setfocus;
end;

procedure TfrmInserirFornecedorCotacao.DBGrid1DblClick(Sender: TObject);
begin
  txt_cod_fornec.Text := qryFornecedor.fieldbyname('AT_CODIGO').AsString;
  txt_fornecedor.Text := qryFornecedor.fieldbyname('AT_NOME').AsString;
  txt_valor.Value     := qryFornecedor.fieldbyname('COT_VALOR').AsFloat;
  txt_obs.Text        := qryFornecedor.fieldbyname('COT_OBS').AsString;

  txt_flag.Text := qryFornecedor.fieldbyname('AT_CODIGO').AsString;

  txt_valor.SetFocus;
end;

procedure TfrmInserirFornecedorCotacao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#27 then
    close;
end;

procedure TfrmInserirFornecedorCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmInserirFornecedorCotacao.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color :=$00F5EEDE;
end;

procedure TfrmInserirFornecedorCotacao.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;
end;

procedure TfrmInserirFornecedorCotacao.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmInserirFornecedorCotacao.Excluir1Click(Sender: TObject);
begin

  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir ' + qryFornecedor.fieldbyname('AT_NOME').AsString +
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
  qryTransLocal.SQL.Add('delete FROM itens_cotacao_compra_fornec                                               '+
                        ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO AND PRO_CODIGO=:PRO_CODIGO   ');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('AT_CODIGO').AsString;
  qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryTransLocal.ExecSQL;

  //VERIFICA SE FORNECEDOR ESTÁ NO PRODUTO, SE ESTIVER, COLOCAR NULL NO FOR_CODIGO_ATUAL
  qryTransLocal.Close;
  qryTransLocal.SQL.Clear;
  qryTransLocal.SQL.Add('UPDATE itens_cotacao_compra SET FOR_CODIGO_ATUAL=:NULL, FOR_INSERIDO=:NULL                    '+
                        ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO AND PRO_CODIGO=:PRO_CODIGO     ');
  qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('AT_CODIGO').AsString;
  qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryTransLocal.ExecSQL;
  //FIM VERIFICA SE FORNECEDOR ESTÁ NO PRODUTO, SE ESTIVER, COLOCAR NULL NO FOR_CODIGO_ATUAL

  IBTransLocal.Commit;

  //VERIFICAR SE FORENCEDOR AINDA TEM PRODUTO CAMPEAO, SE NAO TIVER, EXLUIR ELE DA TABEL itens_cotacao_fornec_venc
  qryPesqAux.Close;
  qryPesqAux.SQL.Clear;
  qryPesqAux.SQL.Add('SELECT FOR_CODIGO_ATUAL FROM ITENS_COTACAO_COMPRA                    '+
                     ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL ');
  qryPesqAux.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryPesqAux.ParamByName('FOR_CODIGO_ATUAL').AsString := qryFornecedor.fieldbyname('AT_CODIGO').AsString;
  qryPesqAux.Open;

  IF qryPesqAux.IsEmpty then
  begin
    if (not IBTransLocal.InTransaction) then
      IBTransLocal.StartTransaction;

    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('DELETE FROM ITENS_COTACAO_FORNEC_VENC                    '+
                          ' WHERE COT_CODIGO=:COT_CODIGO AND FOR_CODIGO=:FOR_CODIGO ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('FOR_CODIGO').AsString := qryFornecedor.fieldbyname('AT_CODIGO').AsString;

    qryTransLocal.ExecSQL;

    IBTransLocal.Commit;
  end;
  //FIM VERIFICAR SE FORENCEDOR AINDA TEM PRODUTO CAMPEAO, SE NAO TIVER, EXLUIR ELE DA TABEL itens_cotacao_fornec_venc  

  atualizarDadosProdutoFornecedor;

end;

procedure TfrmInserirFornecedorCotacao.atualizarDadosProdutoFornecedor;
var
  valor : real;
  cod_fornec, empate, cod_cotacao : string;
  linha, i, cont_fornecedor : integer;

begin

  linha := frm_cotacao_compra.cdsProduto.RecNo;

  ///ATUALIZA GRIDS///////////////
  qryFornecedor.Close;
  qryFornecedor.SQL.Clear;
  qryFornecedor.SQL.Add('SELECT F.AT_CODIGO, F.AT_NOME, I.COT_VALOR, I.COT_OBS, I.COT_CODIGO                              '+
                        ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I, produto p                                '+
                        ' WHERE I.for_codigo = F.AT_codigo AND p.pro_codigo = i.pro_codigo and I.COT_CODIGO =:COT_CODIGO  '+
                        ' AND i.pro_codigo=:pro_codigo                                                                    '+
                        ' ORDER BY I.COT_VALOR                                                                            ');
  qryFornecedor.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryFornecedor.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryFornecedor.Open;

  frm_cotacao_compra.qryFornecedor.Close;
  frm_cotacao_compra.qryFornecedor.SQL.Clear;
  frm_cotacao_compra.qryFornecedor.SQL.Add('SELECT F.AT_CODIGO, F.AT_NOME, I.COT_VALOR, I.COT_OBS, P.PRO_CODIGO      '+
                                           ' FROM AGENDA_TELEFONE f, itens_cotacao_compra_fornec I, produto p        '+
                                           ' WHERE I.for_codigo = F.AT_codigo AND p.pro_codigo = i.pro_codigo and    '+
                                           ' I.COT_CODIGO =:COT_CODIGO and i.pro_codigo=:pro_codigo                  '+
                                           ' ORDER BY I.COT_VALOR                                                    ');
  frm_cotacao_compra.qryFornecedor.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  frm_cotacao_compra.qryFornecedor.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  frm_cotacao_compra.qryFornecedor.Open;
  //FIM ATUALIZA GRIDS///////////////


  //////VERIFICA VALOR VENCEDOR//////////

  //Se produto tiver 2 ou + fornecedores na tabela itens_cotacao_compra,
  //nao será feita a cotaco c/ menor valor

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT COT_CODIGO FROM ITENS_COTACAO_COMPRA              '+
                      ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryPesquisa.Open;
  qryPesquisa.FetchAll;

  IF qryPesquisa.RecordCount = 1 then
  begin
    qryFornecedor.First;

    valor := 999999999;
    cod_fornec := '';
    empate := '';
    i:= 0;
    cont_fornecedor := 0;

    while not qryFornecedor.Eof do
    begin
      if (qryFornecedor.FieldByName('COT_VALOR').AsString <> '') and (qryFornecedor.FieldByName('COT_VALOR').Asfloat > 0) then
      begin
        if qryFornecedor.FieldByName('COT_VALOR').AsFloat <= valor then
        begin
          valor := qryFornecedor.FieldByName('COT_VALOR').AsFloat;
          cod_fornec := qryFornecedor.FieldByName('AT_CODIGO').asstring;

          if qryFornecedor.FieldByName('COT_VALOR').AsFloat = valor then
          begin
             empate := 'S';
             i:= i+1;
          end;
        end;
      end
      else
        cont_fornecedor := cont_fornecedor + 1;
        qryFornecedor.Next;
    end;

    if cod_fornec <> '' then
    begin
      if (not IBTransLocal.InTransaction) then
        IBTransLocal.StartTransaction;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET COT_VALOR=:COT_VALOR, COT_DATA_COMPRA_ULT=:COT_DATA_COMPRA_ULT, '+
                            ' FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL, COT_EMPATE=:COT_EMPATE, COT_OBS=:COT_OBS                   '+
                            ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo                                       ');
      qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
      qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cod_fornec;
      qryTransLocal.ParamByName('COT_VALOR').AsFloat   := valor;
      qryTransLocal.ParamByName('COT_OBS').AsString := txt_obs.Text;
      qryTransLocal.ParamByName('COT_DATA_COMPRA_ULT').AsString := frm_cotacao_compra.dta_vencimento.Text;

      if (empate = 'S') and (i>=2) then
        qryTransLocal.ParamByName('COT_EMPATE').AsString := 'S'
      else
        qryTransLocal.ParamByName('COT_EMPATE').AsString := '';

      qryTransLocal.ExecSQL;

      qryTransLocal.Close;
      qryTransLocal.SQL.Clear;
      qryTransLocal.SQL.Add('UPDATE PRODUTO SET PRO_PRECO_ULT=:PRO_PRECO_ULT,  '+
              ' FOR_CODIGO_ULT=:FOR_CODIGO_ULT, DATA_COMPRA_ULT=:DATA_COMPRA_ULT, COT_CODIGO=:COT_CODIGO '+
              ' WHERE  pro_codigo=:pro_codigo ');
      qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
      qryTransLocal.ParamByName('FOR_CODIGO_ULT').AsString := cod_fornec;
      qryTransLocal.ParamByName('PRO_PRECO_ULT').AsFloat   := valor;
      qryTransLocal.ParamByName('DATA_COMPRA_ULT').AsString := frm_cotacao_compra.dta_vencimento.Text;
      qryTransLocal.ParamByName('COT_CODIGO').AsString :=  frm_cotacao_compra.lbl_cod_cotacao.Caption;

      qryTransLocal.ExecSQL;


      IBTransLocal.Commit;

    end;

  end;

  /////FIM VERIFICA VALOR VENCEDOR/////////

  //verificar se produto está duas ou mais vezes na tabela itens_cotacao_compra

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT COT_CODIGO FROM ITENS_COTACAO_COMPRA              '+
                      ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryPesquisa.Open;
  qryPesquisa.FetchAll;

  if (not IBTransLocal.InTransaction) then
    IBTransLocal.StartTransaction;

  if qryPesquisa.RecordCount = 1 then
  begin
    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET FOR_INSERIDO =:FOR_INSERIDO,                '+
                          ' FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL, COT_VALOR=:COT_VALOR, COT_OBS=:COT_OBS '+
                          ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo                   ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryTransLocal.ParamByName('COT_OBS').AsString := txt_obs.Text;

    if cont_fornecedor = qryFornecedor.RecordCount then
    begin
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := '';
      qryTransLocal.ParamByName('COT_VALOR').AsString := '';
    end
    else
    begin
      qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := cod_fornec;
      qryTransLocal.ParamByName('COT_VALOR').AsFloat := valor;
      qryTransLocal.ParamByName('FOR_INSERIDO').AsString := 'S';
    end;

    qryTransLocal.ExecSQL;

  end
  else
  begin
    qryTransLocal.Close;
    qryTransLocal.SQL.Clear;
    qryTransLocal.SQL.Add('UPDATE ITENS_COTACAO_COMPRA SET FOR_INSERIDO =:FOR_INSERIDO,                                      '+
                          ' COT_VALOR=:COT_VALOR, COT_OBS=:COT_OBS                                                           '+
                          ' WHERE COT_CODIGO =:COT_CODIGO and pro_codigo=:pro_codigo AND FOR_CODIGO_ATUAL=:FOR_CODIGO_ATUAL  ');
    qryTransLocal.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
    qryTransLocal.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
    qryTransLocal.ParamByName('COT_OBS').AsString := txt_obs.Text;
    qryTransLocal.ParamByName('FOR_CODIGO_ATUAL').AsString := txt_cod_fornec.Text;
    qryTransLocal.ParamByName('COT_VALOR').AsFloat := txt_valor.Value;
    qryTransLocal.ParamByName('FOR_INSERIDO').AsString := 'S';

    qryTransLocal.ExecSQL;
  end;

  IBTransLocal.Commit;

  /////VERIFICA SE FORNECEDOR PARTICIPA DOS CAMPEOES/////////

  //verificar se produto está duas ou mais vezes na tabela itens_cotacao_compra
  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT FOR_CODIGO_ATUAL FROM ITENS_COTACAO_COMPRA        '+
                      ' WHERE COT_CODIGO=:COT_CODIGO AND PRO_CODIGO=:PRO_CODIGO ');
  qryPesquisa.ParamByName('COT_CODIGO').AsString := frm_cotacao_compra.lbl_cod_cotacao.Caption;
  qryPesquisa.ParamByName('PRO_CODIGO').AsString := txt_cod_produto.Text;
  qryPesquisa.Open;
  qryPesquisa.FetchAll;

  if qryPesquisa.RecordCount >= 2 then
    cod_fornec:= qryPesquisa.fieldbyname('FOR_CODIGO_ATUAL').AsString;

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
  end;

  cod_cotacao := ' I.COT_CODIGO = ' + frm_cotacao_compra.lbl_cod_cotacao.Caption;

  frm_cotacao_compra.qryProduto.Close;
  frm_cotacao_compra.qryProduto.SQL.Clear;
  frm_cotacao_compra.qryProduto.SQL.Add('SELECT I.FOR_INSERIDO, i.ite_ordem_insercao, P.PRO_CODIGO, P.pro_descricao, I.cot_qtd,  ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_unidade, I.cot_valor, SUM(I.COT_QTD * I.COT_VALOR) as VALOR_TOTAL, FORN.at_nome,  ');
  frm_cotacao_compra.qryProduto.SQL.Add('ICCF.cot_obs,  i.cot_empate, I.FOR_CODIGO_ATUAL, I.ITENS_COT_CODIGO,                    ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, P.UN_CODIGO                  ');
  frm_cotacao_compra.qryProduto.SQL.Add('FROM itens_cotacao_compra I INNER JOIN                                                  ');
  frm_cotacao_compra.qryProduto.SQL.Add('  PRODUTO P ON I.pro_codigo = P.pro_codigo                                              ');
  frm_cotacao_compra.qryProduto.SQL.Add('LEFT JOIN itens_cotacao_compra_fornec ICCF ON                                           ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_codigo = ICCF.cot_codigo AND P.pro_codigo = ICCF.pro_codigo                       ');
  frm_cotacao_compra.qryProduto.SQL.Add(' AND ICCF.for_codigo = I.for_codigo_atual                                               ');
  frm_cotacao_compra.qryProduto.SQL.Add('LEFT JOIN agenda_telefone FORN ON                                                       ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.for_codigo_atual = FORN.at_codigo                                                     ');
  frm_cotacao_compra.qryProduto.SQL.Add('WHERE ' + cod_cotacao + fornecedor_global                                                );
  frm_cotacao_compra.qryProduto.SQL.Add('GROUP BY I.ITENS_COT_CODIGO,                                                            ');
  frm_cotacao_compra.qryProduto.SQL.Add('P.PRO_CODIGO, P.pro_descricao, P.UN_CODIGO,  I.cot_unidade, I.cot_qtd,                  ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.cot_valor, i.cot_empate, i.ite_ordem_insercao, I.FOR_CODIGO_ATUAL, FORN.AT_NOME,      ');
  frm_cotacao_compra.qryProduto.SQL.Add('I.FOR_INSERIDO, I.COT_CONFIRMAR_PRECO, I.FOR_CODIGO_ANT,  I.COT_VALOR_ANT, ICCF.cot_obs ');
  frm_cotacao_compra.qryProduto.Open;

  if frm_cotacao_compra.campo <> '' then
    frm_cotacao_compra.qryProduto.SQL.Add(' ORDER BY ' + frm_cotacao_compra.campo                                        );

  frm_cotacao_compra.qryProduto.Open;

  frm_cotacao_compra.cdsProduto.Close;
  frm_cotacao_compra.cdsProduto.FetchParams;
  frm_cotacao_compra.cdsProduto.Open;

  frm_cotacao_compra.cdsProduto.RecNo := linha;

  txt_cod_fornec.Clear;
  txt_fornecedor.Clear;
  txt_valor.Clear;
  txt_flag.Clear;
  txt_obs.Clear;

end;

end.
