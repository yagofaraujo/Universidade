object DmDados: TDmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 255
  Width = 334
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=C:\Projetos\Universidade\Banco de dados\DB.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 136
    Top = 24
  end
  object qrLkUpProfessor: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PROFESSOR')
    Left = 24
    Top = 144
  end
  object qrLkUpAluno: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM ALUNO')
    Left = 136
    Top = 144
  end
  object qrLkUpDisciplina: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM DISCIPLINA')
    Left = 256
    Top = 144
  end
  object dsLkUpProfessor: TDataSource
    DataSet = qrLkUpProfessor
    Left = 24
    Top = 200
  end
  object dsLkUpAluno: TDataSource
    DataSet = qrLkUpAluno
    Left = 136
    Top = 200
  end
  object dsLkUpDisciplina: TDataSource
    DataSet = qrLkUpDisciplina
    Left = 256
    Top = 192
  end
end
