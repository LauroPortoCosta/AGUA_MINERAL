object agua_DM: Tagua_DM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 582
  Width = 696
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 
      'https://laurolivro-606860-default-rtdb.firebaseio.com/tab_adm/co' +
      'd_adm.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 56
    Top = 216
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 56
    Top = 280
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 56
    Top = 160
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 72
    Top = 480
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'controle'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'data_geral'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem1'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem10'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem2'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem3'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem4'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem5'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem6'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem7'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem8'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'mensagem9'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'statusx'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'unidade'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 56
    Top = 98
    object FDMemTable1controle: TWideStringField
      FieldName = 'controle'
      Size = 255
    end
    object FDMemTable1data_geral: TWideStringField
      FieldName = 'data_geral'
      Size = 255
    end
    object FDMemTable1id: TWideStringField
      FieldName = 'id'
      Size = 255
    end
    object FDMemTable1mensagem1: TWideStringField
      FieldName = 'mensagem1'
      Size = 255
    end
    object FDMemTable1mensagem10: TWideStringField
      FieldName = 'mensagem10'
      Size = 255
    end
    object FDMemTable1mensagem2: TWideStringField
      FieldName = 'mensagem2'
      Size = 255
    end
    object FDMemTable1mensagem3: TWideStringField
      FieldName = 'mensagem3'
      Size = 255
    end
    object FDMemTable1mensagem4: TWideStringField
      FieldName = 'mensagem4'
      Size = 255
    end
    object FDMemTable1mensagem5: TWideStringField
      FieldName = 'mensagem5'
      Size = 255
    end
    object FDMemTable1mensagem6: TWideStringField
      FieldName = 'mensagem6'
      Size = 255
    end
    object FDMemTable1mensagem7: TWideStringField
      FieldName = 'mensagem7'
      Size = 255
    end
    object FDMemTable1mensagem8: TWideStringField
      FieldName = 'mensagem8'
      Size = 255
    end
    object FDMemTable1mensagem9: TWideStringField
      FieldName = 'mensagem9'
      Size = 255
    end
    object FDMemTable1statusx: TWideStringField
      FieldName = 'statusx'
      Size = 255
    end
    object FDMemTable1unidade: TWideStringField
      FieldName = 'unidade'
      Size = 255
    end
  end
  object RESTClient2: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 
      'https://laurolivro-606860-default-rtdb.firebaseio.com/tab_usuari' +
      'o/cod_usuario.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg'
    Params = <>
    Left = 200
    Top = 224
  end
  object RESTRequest2: TRESTRequest
    Client = RESTClient2
    Params = <>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 200
    Top = 288
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    Left = 200
    Top = 160
  end
  object RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable2
    FieldDefs = <>
    Response = RESTResponse2
    Left = 280
    Top = 472
  end
  object FDMemTable2: TFDMemTable
    Active = True
    Filtered = True
    FieldDefs = <
      item
        Name = 'aptx'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'campo1'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'campo2'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'campo3'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'campo4'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'email'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'nivel'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'nomex'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'senha'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'sequencia'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'statusx'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'FDMemTable2Index1'
        Fields = 'nomex'
        Options = [ixNonMaintained]
      end>
    Indexes = <
      item
        Name = 'FDMemTable2Index1'
        Fields = 'nomex'
      end>
    DetailFields = 'nomex'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 200
    Top = 96
    Content = {
      414442530F000000D9040000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C006500320005000A0000005400610062006C0065
      00060000000000070000080032000000090000FF0AFF0B040008000000610070
      007400780005000800000061007000740078000C00010000000E000D000F00FF
      0000001000011100011200011300011400011500011600080000006100700074
      0078001700FF000000FEFF0B04000C000000630061006D0070006F0031000500
      0C000000630061006D0070006F0031000C00020000000E000D000F00FF000000
      10000111000112000113000114000115000116000C000000630061006D007000
      6F0031001700FF000000FEFF0B04000C000000630061006D0070006F00320005
      000C000000630061006D0070006F0032000C00030000000E000D000F00FF0000
      0010000111000112000113000114000115000116000C000000630061006D0070
      006F0032001700FF000000FEFF0B04000C000000630061006D0070006F003300
      05000C000000630061006D0070006F0033000C00040000000E000D000F00FF00
      000010000111000112000113000114000115000116000C000000630061006D00
      70006F0033001700FF000000FEFF0B04000C000000630061006D0070006F0034
      0005000C000000630061006D0070006F0034000C00050000000E000D000F00FF
      00000010000111000112000113000114000115000116000C000000630061006D
      0070006F0034001700FF000000FEFF0B04000A00000065006D00610069006C00
      05000A00000065006D00610069006C000C00060000000E000D000F00FF000000
      10000111000112000113000114000115000116000A00000065006D0061006900
      6C001700FF000000FEFF0B04000400000069006400050004000000690064000C
      00070000000E000D000F00FF0000001000011100011200011300011400011500
      01160004000000690064001700FF000000FEFF0B04000A0000006E0069007600
      65006C0005000A0000006E006900760065006C000C00080000000E000D000F00
      FF00000010000111000112000113000114000115000116000A0000006E006900
      760065006C001700FF000000FEFF0B04000A0000006E006F006D006500780005
      000A0000006E006F006D00650078000C00090000000E000D000F00FF00000010
      000111000112000113000114000115000116000A0000006E006F006D00650078
      001700FF000000FEFF0B04000A000000730065006E006800610005000A000000
      730065006E00680061000C000A0000000E000D000F00FF000000100001110001
      12000113000114000115000116000A000000730065006E00680061001700FF00
      0000FEFF0B040012000000730065007100750065006E00630069006100050012
      000000730065007100750065006E006300690061000C000B0000000E000D000F
      00FF000000100001110001120001130001140001150001160012000000730065
      007100750065006E006300690061001700FF000000FEFF0B04000E0000007300
      74006100740075007300780005000E0000007300740061007400750073007800
      0C000C0000000E000D000F00FF00000010000111000112000113000114000115
      000116000E00000073007400610074007500730078001700FF000000FEFEFF18
      FEFF19FEFF1AFEFEFEFF1BFEFF1C1D0074000000FF1EFEFEFE0E004D0061006E
      0061006700650072001E00550070006400610074006500730052006500670069
      00730074007200790012005400610062006C0065004C006900730074000A0054
      00610062006C00650008004E0061006D006500140053006F0075007200630065
      004E0061006D0065000A0054006100620049004400240045006E0066006F0072
      006300650043006F006E00730074007200610069006E00740073001E004D0069
      006E0069006D0075006D00430061007000610063006900740079001800430068
      00650063006B004E006F0074004E0075006C006C00140043006F006C0075006D
      006E004C006900730074000C0043006F006C0075006D006E00100053006F0075
      0072006300650049004400180064007400570069006400650053007400720069
      006E0067001000440061007400610054007900700065000800530069007A0065
      001400530065006100720063006800610062006C006500120041006C006C006F
      0077004E0075006C006C000800420061007300650014004F0041006C006C006F
      0077004E0075006C006C0012004F0049006E0055007000640061007400650010
      004F0049006E00570068006500720065001A004F0072006900670069006E0043
      006F006C004E0061006D006500140053006F007500720063006500530069007A
      0065001C0043006F006E00730074007200610069006E0074004C006900730074
      00100056006900650077004C006900730074000E0052006F0077004C00690073
      0074001800520065006C006100740069006F006E004C006900730074001C0055
      007000640061007400650073004A006F00750072006E0061006C001200530061
      007600650050006F0069006E0074000E004300680061006E00670065007300}
    object FDMemTable2aptx: TWideStringField
      FieldName = 'aptx'
      Size = 255
    end
    object FDMemTable2campo1: TWideStringField
      FieldName = 'campo1'
      Size = 255
    end
    object FDMemTable2campo2: TWideStringField
      FieldName = 'campo2'
      Size = 255
    end
    object FDMemTable2campo3: TWideStringField
      FieldName = 'campo3'
      Size = 255
    end
    object FDMemTable2campo4: TWideStringField
      FieldName = 'campo4'
      Size = 255
    end
    object FDMemTable2email: TWideStringField
      FieldName = 'email'
      Size = 255
    end
    object FDMemTable2id: TWideStringField
      FieldName = 'id'
      Size = 255
    end
    object FDMemTable2nivel: TWideStringField
      FieldName = 'nivel'
      Size = 255
    end
    object FDMemTable2nomex: TWideStringField
      FieldName = 'nomex'
      Size = 255
    end
    object FDMemTable2senha: TWideStringField
      FieldName = 'senha'
      Size = 255
    end
    object FDMemTable2sequencia: TWideStringField
      FieldName = 'sequencia'
      Size = 255
    end
    object FDMemTable2statusx: TWideStringField
      FieldName = 'statusx'
      Size = 255
    end
  end
  object RESTClient3: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 
      'https://laurolivro-606860-default-rtdb.firebaseio.com/tab_agua/r' +
      'eg_agua.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg'
    Params = <>
    Left = 336
    Top = 240
  end
  object RESTRequest3: TRESTRequest
    Client = RESTClient3
    Params = <>
    Response = RESTResponse3
    SynchronizedEvents = False
    Left = 336
    Top = 304
  end
  object RESTResponse3: TRESTResponse
    ContentType = 'application/json'
    Left = 336
    Top = 160
  end
  object RESTResponseDataSetAdapter3: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable3
    FieldDefs = <>
    Response = RESTResponse3
    Left = 72
    Top = 392
  end
  object FDMemTable3: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = '0'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '1'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '2'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '3'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '4'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '5'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '6'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '7'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '8'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '9'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '10'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '11'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '12'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '13'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '14'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '15'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '16'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '17'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = '18'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'statusx'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'datax'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'descri'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'marca'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'nomex'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'qt'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'valor'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 336
    Top = 100
    object FDMemTable3datax: TWideStringField
      FieldName = 'datax'
      Size = 255
    end
    object FDMemTable3descri: TWideStringField
      FieldName = 'descri'
      Size = 255
    end
    object FDMemTable3id: TWideStringField
      FieldName = 'id'
      Size = 255
    end
    object FDMemTable3marca: TWideStringField
      FieldName = 'marca'
      Size = 255
    end
    object FDMemTable3nomex: TWideStringField
      FieldName = 'nomex'
      Size = 255
    end
    object FDMemTable3qt: TWideStringField
      FieldName = 'qt'
      Size = 255
    end
    object FDMemTable3statusx: TWideStringField
      FieldName = 'statusx'
      Size = 255
    end
    object FDMemTable3valor: TWideStringField
      FieldName = 'valor'
      Size = 255
    end
  end
  object RESTClient4: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 
      'https://laurolivro-606860-default-rtdb.firebaseio.com/tab_faleco' +
      'migo/cod_falecomigo.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuv' +
      'qCkrBg'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 456
    Top = 232
  end
  object RESTRequest4: TRESTRequest
    Client = RESTClient4
    Params = <>
    Response = RESTResponse4
    SynchronizedEvents = False
    Left = 456
    Top = 304
  end
  object RESTResponse4: TRESTResponse
    ContentType = 'application/json'
    Left = 456
    Top = 160
  end
  object RESTResponseDataSetAdapter4: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable4
    FieldDefs = <>
    Response = RESTResponse4
    Left = 280
    Top = 400
  end
  object FDMemTable4: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'aptx'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'assuntoa'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'assuntob'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'assuntoc'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'datax'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'nome'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'statusx'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 456
    Top = 104
    object FDMemTable4aptx: TWideStringField
      FieldName = 'aptx'
      Size = 255
    end
    object FDMemTable4assuntoa: TWideStringField
      FieldName = 'assuntoa'
      Size = 255
    end
    object FDMemTable4assuntob: TWideStringField
      FieldName = 'assuntob'
      Size = 255
    end
    object FDMemTable4assuntoc: TWideStringField
      FieldName = 'assuntoc'
      Size = 255
    end
    object FDMemTable4datax: TWideStringField
      FieldName = 'datax'
      Size = 255
    end
    object FDMemTable4id: TWideStringField
      FieldName = 'id'
      Size = 255
    end
    object FDMemTable4nome: TWideStringField
      FieldName = 'nome'
      Size = 255
    end
    object FDMemTable4statusx: TWideStringField
      FieldName = 'statusx'
      Size = 255
    end
  end
  object RESTClient5: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 
      'https://laurolivro-606860-default-rtdb.firebaseio.com/tab_tabela' +
      '/cod_tabela.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 592
    Top = 224
  end
  object RESTRequest5: TRESTRequest
    Client = RESTClient5
    Params = <>
    Response = RESTResponse5
    SynchronizedEvents = False
    Left = 592
    Top = 296
  end
  object RESTResponse5: TRESTResponse
    ContentType = 'application/json'
    Left = 592
    Top = 160
  end
  object RESTResponseDataSetAdapter5: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable5
    FieldDefs = <>
    Response = RESTResponse5
    Left = 488
    Top = 400
  end
  object FDMemTable5: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'dados1'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'dados2'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'dados3'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'dados4'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'statusx'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'unidade'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 592
    Top = 102
    Content = {
      414442530F00000032080000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C0065003500050016000000460044004D0065006D
      005400610062006C0065003500060000000000070000080032000000090000FF
      0AFF0B04000C0000006400610064006F007300310005000C0000006400610064
      006F00730031000C00010000000E000D000F00FF000000100001110001120001
      13000114000115000116000C0000006400610064006F00730031001700FF0000
      00FEFF0B04000C0000006400610064006F007300320005000C00000064006100
      64006F00730032000C00020000000E000D000F00FF0000001000011100011200
      0113000114000115000116000C0000006400610064006F00730032001700FF00
      0000FEFF0B04000C0000006400610064006F007300330005000C000000640061
      0064006F00730033000C00030000000E000D000F00FF00000010000111000112
      000113000114000115000116000C0000006400610064006F00730033001700FF
      000000FEFF0B04000C0000006400610064006F007300340005000C0000006400
      610064006F00730034000C00040000000E000D000F00FF000000100001110001
      12000113000114000115000116000C0000006400610064006F00730034001700
      FF000000FEFF0B04000400000069006400050004000000690064000C00050000
      000E000D000F00FF000000100001110001120001130001140001150001160004
      000000690064001700FF000000FEFF0B04000E00000073007400610074007500
      7300780005000E00000073007400610074007500730078000C00060000000E00
      0D000F00FF00000010000111000112000113000114000115000116000E000000
      73007400610074007500730078001700FF000000FEFF0B04000E00000075006E
      006900640061006400650005000E00000075006E00690064006100640065000C
      00070000000E000D000F00FF0000001000011100011200011300011400011500
      0116000E00000075006E00690064006100640065001700FF000000FEFEFF18FE
      FF19FEFF1AFF1B1C0000000000FF1D000022000000410070006C006900630061
      00E700E3006F0020004E00610074007500720061006C00010032000000540069
      00700073002F006D006F006C00640065002F0046006900620072006100200064
      006500200076006900640072006F00020010000000520024003100330030002C
      0030003000030000000000040002000000300005000200000073000600080000
      006100670075006100FEFEFF1B1C0001000000FF1D00002C000000410070006C
      00690063006100E700E3006F00200065006E00630061007000730075006C0061
      0064006100200001003600000054006900700073002F004D006F006C00640065
      0020002F00200046006900620072006100200064006500200076006900640072
      006F000200120000005200240020003100350030002C00300030000300000000
      0004000200000031000500020000007300FEFEFF1B1C0002000000FF1D000026
      0000004D0061006E007500740065006E00E700E3006F0020006E006100740075
      00720061006C00200001003600000054006900700073002C0020004D006F006C
      006400650020006F007500200020004600690062007200610020007600690064
      0072006F00020010000000520024002000380030002C00300030000300000000
      0004000200000032000500020000007300FEFEFF1B1C0003000000FF1D00002E
      0000004D0061006E007500740065006E00E700E3006F00200065006E00630061
      007000730075006C00610064006100200001003200000054006900700073002F
      006D006F006C00640065002F0046006900620072006100200064006500200076
      006900640072006F000200120000005200240020003100300030002C00300030
      0003000000000004000200000033000500020000007300FEFEFF1B1C00040000
      00FF1D000028000000420061006E0068006F002000440065002000670065006C
      0020006E00610074007500720061006C00010010000000520024002000380030
      002C003000300002000000000003000000000004000200000034000500020000
      007300FEFEFF1B1C0005000000FF1D000030000000420061006E0068006F0020
      00440065002000670065006C00200045006E00630061007000730075006C0061
      0064006F00010010000000520024003100300030002C00300030000200000000
      0003000000000004000200000035000500020000007300FEFEFF1B1C00060000
      00FF1D0000100000005000E9002000650020004D00E3006F0001000E00000052
      002400330030002C003000300002000000000003000000000004000200000036
      000500020000007300FEFEFF1B1C0007000000FF1D0000060000005000E90020
      00010010000000520024002000310038002C0030003000020000000000030000
      00000004000200000037000500020000007300FEFEFF1B1C0008000000FF1D00
      00060000004D00E3006F00010000000000020010000000520024002000310038
      002C003000300003000000000004000200000038000500020000007300FEFEFF
      1B1C0009000000FF1D0000520000004300680061007600650020007000690078
      0020004300500046003A0020003100300039002E003400370030002E00340030
      0036002F003700360020002800700061006700730065006700750072006F0029
      0001003A0000005000690063007000610079003A002000400061006E0061002E
      006B00610072006F006C0069006E0061002E006D0061006300650064006F0032
      0002000000000003000000000004000200000039000500020000007300FEFEFE
      FEFEFF1EFEFF1F20000E000000FF21FEFEFE0E004D0061006E00610067006500
      72001E0055007000640061007400650073005200650067006900730074007200
      790012005400610062006C0065004C006900730074000A005400610062006C00
      650008004E0061006D006500140053006F0075007200630065004E0061006D00
      65000A0054006100620049004400240045006E0066006F007200630065004300
      6F006E00730074007200610069006E00740073001E004D0069006E0069006D00
      75006D0043006100700061006300690074007900180043006800650063006B00
      4E006F0074004E0075006C006C00140043006F006C0075006D006E004C006900
      730074000C0043006F006C0075006D006E00100053006F007500720063006500
      49004400180064007400570069006400650053007400720069006E0067001000
      440061007400610054007900700065000800530069007A006500140053006500
      6100720063006800610062006C006500120041006C006C006F0077004E007500
      6C006C000800420061007300650014004F0041006C006C006F0077004E007500
      6C006C0012004F0049006E0055007000640061007400650010004F0049006E00
      570068006500720065001A004F0072006900670069006E0043006F006C004E00
      61006D006500140053006F007500720063006500530069007A0065001C004300
      6F006E00730074007200610069006E0074004C00690073007400100056006900
      650077004C006900730074000E0052006F0077004C0069007300740006005200
      6F0077000A0052006F0077004900440010004F0072006900670069006E006100
      6C001800520065006C006100740069006F006E004C006900730074001C005500
      7000640061007400650073004A006F00750072006E0061006C00120053006100
      7600650050006F0069006E0074000E004300680061006E00670065007300}
    object FDMemTable5dados1: TWideStringField
      FieldName = 'dados1'
      Size = 255
    end
    object FDMemTable5dados2: TWideStringField
      FieldName = 'dados2'
      Size = 255
    end
    object FDMemTable5dados3: TWideStringField
      FieldName = 'dados3'
      Size = 255
    end
    object FDMemTable5dados4: TWideStringField
      FieldName = 'dados4'
      Size = 255
    end
    object FDMemTable5id: TWideStringField
      FieldName = 'id'
      Size = 255
    end
    object FDMemTable5statusx: TWideStringField
      FieldName = 'statusx'
      Size = 255
    end
    object FDMemTable5unidade: TWideStringField
      FieldName = 'unidade'
      Size = 255
    end
  end
end
