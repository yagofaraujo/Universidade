object formRelatorioAlunos: TformRelatorioAlunos
  Left = 0
  Top = 0
  Caption = 'formRelatorioAlunos'
  ClientHeight = 369
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object rpAlunos: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    DataSource = dsDados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = rpAlunosBeforePrint
    OnPageEnding = rpAlunosPageEnding
    object bdTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      object rlLblRelatorioAlunos: TRLLabel
        Left = 248
        Top = 3
        Width = 204
        Height = 24
        Caption = 'Relat'#243'rio de Alunos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlGpAlunos: TRLGroup
      Left = 38
      Top = 73
      Width = 718
      Height = 80
      DataFields = 'ALUNO'
      object bdCabecalhoDados: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel2: TRLLabel
          Left = 3
          Top = 6
          Width = 45
          Height = 16
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 192
          Top = 6
          Width = 66
          Height = 16
          Caption = 'Disciplina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 351
          Top = 6
          Width = 48
          Height = 16
          Caption = 'Nota 1:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 432
          Top = 6
          Width = 48
          Height = 16
          Caption = 'Nota 2:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 507
          Top = 6
          Width = 109
          Height = 16
          Caption = 'Nota de tabalho:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 644
          Top = 6
          Width = 47
          Height = 16
          Caption = 'M'#233'dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object bdDados: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 24
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object dbDisciplina: TRLDBText
          Left = 192
          Top = 3
          Width = 74
          Height = 16
          DataField = 'DISCIPLINA'
          DataSource = dsDados
          Text = ''
        end
        object dbNota1: TRLDBText
          Left = 361
          Top = 2
          Width = 53
          Height = 16
          DataField = 'NOTA_1'
          DataSource = dsDados
          Text = ''
        end
        object dbNota2: TRLDBText
          Left = 443
          Top = 2
          Width = 53
          Height = 16
          DataField = 'NOTA_2'
          DataSource = dsDados
          Text = ''
        end
        object dbNotaTrabalho: TRLDBText
          Left = 547
          Top = 3
          Width = 115
          Height = 16
          DataField = 'NOTA_TRABALHO'
          DataSource = dsDados
          Text = ''
        end
        object dbNome: TRLDBText
          Left = 14
          Top = 3
          Width = 48
          Height = 16
          DataField = 'ALUNO'
          DataSource = dsDados
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 652
          Top = 2
          Width = 45
          Height = 16
          DataField = 'MEDIA'
          DataSource = dsDados
          Text = ''
        end
      end
      object bdRodape: TRLBand
        Left = 0
        Top = 49
        Width = 718
        Height = 8
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
    end
  end
  object qrDados: TFDQuery
    Connection = DmDados.FDConnection1
    SQL.Strings = (
      'SELECT M.ID,'
      '       A.NOME AS ALUNO,'
      '       D.NOME AS DISCIPLINA, '
      '       M.NOTA_1,'
      '       M.NOTA_2,'
      '       M.NOTA_TRABALHO,'
      '       M.MEDIA'
      'FROM MATRICULA M'
      'LEFT JOIN ALUNO A ON A.ID = M.ID_ALUNO '
      'LEFT JOIN DISCIPLINA D ON D.ID = M.ID_DISCIPLINA'
      'LEFT JOIN PROFESSOR_DISCIPLINA PD ON PD.ID_DISCIPLINA = D.ID'
      'LEFT JOIN PROFESSOR P ON P.ID = PD.ID_PROFESSOR'
      'ORDER BY ALUNO')
    Left = 544
    Top = 256
    object qrDadosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrDadosALUNO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ALUNO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qrDadosDISCIPLINA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DISCIPLINA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qrDadosNOTA_1: TFloatField
      FieldName = 'NOTA_1'
      Origin = 'NOTA_1'
    end
    object qrDadosNOTA_2: TFloatField
      FieldName = 'NOTA_2'
      Origin = 'NOTA_2'
    end
    object qrDadosNOTA_TRABALHO: TFloatField
      FieldName = 'NOTA_TRABALHO'
      Origin = 'NOTA_TRABALHO'
    end
    object qrDadosMEDIA: TFloatField
      FieldName = 'MEDIA'
      Origin = 'MEDIA'
      DisplayFormat = ',0.00'
    end
  end
  object dsDados: TDataSource
    DataSet = qrDados
    Left = 608
    Top = 256
  end
end
