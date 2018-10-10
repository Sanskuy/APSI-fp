object UniMainModule: TUniMainModule
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Height = 451
  Width = 395
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'dbapsi'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
    EncryptedPassword = 'CEFFCDFFCCFFCBFF'
  end
  object UniConnectDialog1: TUniConnectDialog
    DatabaseLabel = 'Database'
    PortLabel = 'Port'
    ProviderLabel = 'Provider'
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 128
    Top = 16
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 224
    Top = 16
  end
  object UniPetani: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tdatapetani')
    Left = 32
    Top = 80
  end
  object UniBibit: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tdatabibit')
    Active = True
    Left = 32
    Top = 136
  end
  object UniDBPetani: TUniDataSource
    DataSet = UniPetani
    Left = 96
    Top = 80
  end
  object UniDBBibit: TUniDataSource
    DataSet = UniBibit
    Left = 96
    Top = 136
  end
  object qtampil: TUniQuery
    Connection = UniConnection1
    Left = 296
    Top = 16
  end
  object UniPupuk: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tdatapupuk')
    Active = True
    Left = 32
    Top = 192
  end
  object UniDBPupuk: TUniDataSource
    DataSet = UniPupuk
    Left = 96
    Top = 192
  end
  object qrefresh: TUniQuery
    Connection = UniConnection1
    Left = 344
    Top = 16
  end
  object UniTani: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tdatabtani')
    Active = True
    Left = 224
    Top = 80
  end
  object UniDBTani: TUniDataSource
    DataSet = UniTani
    Left = 288
    Top = 80
  end
  object qbtani: TUniQuery
    Connection = UniConnection1
    Left = 344
    Top = 80
  end
  object qregis: TUniQuery
    Connection = UniConnection1
    Left = 344
    Top = 192
  end
  object UniRegis: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tdataregis')
    Active = True
    Left = 224
    Top = 192
  end
  object UniDBRegis: TUniDataSource
    DataSet = UniRegis
    Left = 288
    Top = 192
  end
  object qpetani: TUniQuery
    Connection = UniConnection1
    Left = 152
    Top = 80
  end
  object UniPeng: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tdatapengepul')
    Active = True
    Left = 224
    Top = 136
  end
  object UniDBPeng: TUniDataSource
    DataSet = UniPeng
    Left = 288
    Top = 136
  end
  object qpeng: TUniQuery
    Connection = UniConnection1
    Left = 344
    Top = 136
  end
end
