object frmAjudaContasPagar: TfrmAjudaContasPagar
  Left = 356
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmAjudaContasPagar'
  ClientHeight = 349
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 473
    Height = 337
    Lines.Strings = (
      'OBS : FAZER BACKUP DA BASE ANTES DE INSERIR PARCELAS,'
      '             CASO ERRE ALGUMA COISA'
      ''
      ''
      ''
      '1 - INSERIR VENDAS P/ GERAR PARCELAS'
      '  '
      '    Selecione todas as vendas que ser'#227'o geradas parcelas, '
      
        '       depois clique no botao " Reunir vendas p/ gerar parcela(s' +
        ')".'
      
        '    Abrira uma tela com as vendas selecionadas, aparecer'#225' o tota' +
        'l destas'
      
        '        vendas no campo "Total", ent'#227'o coloque a qtde de parcela' +
        's desejadas e o valor'
      
        '        de cada parcela, coloque a Descricao e a OBS e depois cl' +
        'ique no bot'#227'o'
      
        '        "Confirmar Parcela" e pronto as parcelas ser'#227'o geradas e' +
        ' as vendas aparecer'#227'o'
      '        apenas nesta tela.'
      ''
      ''
      '2 - PARA PAGAR AS PARCELAS'
      ''
      '     Na tela "Contas Pagar" bot'#227'o direito na parcela desejada, '
      
        '       op'#231#227'o "Dar baixa nas contas reunidas em parcelas", na tel' +
        'a'
      
        '       que aparecer'#225', de a baixa nas vendas normalmente igual na' +
        ' '
      '       tela "Contas Pagar" '
      
        '    Depois disso na tela "Contas Pagar", exclua a parcela ou alt' +
        'ere'
      
        '       o valor da parcela, caso o valor das vendas baixadas nao ' +
        'bata'
      '       com o valor da parcela e pronto.'
      ''
      
        '    OBS: Os itens da cota'#231#227'o est'#227'o inseridos nas vendas normalme' +
        'nte')
    ReadOnly = True
    TabOrder = 0
  end
end
