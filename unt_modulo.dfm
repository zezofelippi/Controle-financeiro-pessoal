object dm: Tdm
  OldCreateOrder = False
  Left = 594
  Top = 204
  Height = 468
  Width = 263
  object tb_cad_despesa: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select *from tb_cad_despesa')
    Left = 48
    Top = 64
    object tb_cad_despesacodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object tb_cad_despesadespesa: TWideStringField
      FieldName = 'despesa'
      Size = 50
    end
    object tb_cad_despesavalor: TFloatField
      FieldName = 'valor'
    end
    object tb_cad_despesadata: TDateTimeField
      FieldName = 'data'
    end
    object tb_cad_despesaforma_pgto: TWideStringField
      FieldName = 'forma_pgto'
      Size = 1
    end
    object tb_cad_despesasemana: TWideStringField
      FieldName = 'semana'
      Size = 15
    end
    object tb_cad_despesadespesa_outros: TWideStringField
      FieldName = 'despesa_outros'
      Size = 150
    end
  end
  object ds_cad_despesa_temp: TDataSource
    DataSet = tb_cad_despesa_temp
    Left = 168
    Top = 176
  end
  object tb_apaga: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'delete from tb_cad_despesa_temp')
    Left = 48
    Top = 120
  end
  object tb_lembrete: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select *from tb_lembrete')
    Left = 48
    Top = 232
    object tb_lembretecodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object tb_lembretedescricao: TWideStringField
      FieldName = 'descricao'
      Size = 50
    end
    object tb_lembretevalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,##0.00'
    end
    object tb_lembretedata: TDateTimeField
      FieldName = 'data'
    end
  end
  object ds_lembrete: TDataSource
    DataSet = tb_lembrete
    Left = 168
    Top = 232
  end
  object ds_obs: TDataSource
    DataSet = tb_obs
    Left = 176
    Top = 288
  end
  object tb_obs: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from tb_obs')
    Left = 48
    Top = 296
    object tb_obscodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object tb_obsobs: TWideStringField
      FieldName = 'obs'
      Size = 100
    end
  end
  object tb_cad_despesa_temp: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from tb_cad_Despesa_temp')
    Left = 48
    Top = 177
    object tb_cad_despesa_tempcodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object tb_cad_despesa_tempdespesa: TWideStringField
      FieldName = 'despesa'
      Size = 50
    end
    object tb_cad_despesa_tempdespesa_outros: TWideStringField
      FieldName = 'despesa_outros'
      Size = 150
    end
    object tb_cad_despesa_tempvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,##0.00'
    end
    object tb_cad_despesa_tempdata: TDateTimeField
      FieldName = 'data'
    end
    object tb_cad_despesa_tempforma_pgto: TWideStringField
      FieldName = 'forma_pgto'
      Size = 1
    end
    object tb_cad_despesa_tempsemana: TWideStringField
      FieldName = 'semana'
      Size = 15
    end
  end
  object BD: TIBDatabase
    DatabaseName = 
      '127.0.0.1:D:\Despesas Pessoais - sitio\base de dados\base-dados-' +
      'pessoais-sitio\DESPESA_PESSOAL.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 80
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = BD
    Params.Strings = (
      'read_committed'
      'rec_version')
    AutoStopAction = saNone
    Left = 152
    Top = 8
  end
  object qryPesqAux: TIBQuery
    Database = BD
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 80
    Top = 360
  end
end
