inherited formMatriculas: TformMatriculas
  Caption = 'Matr'#237'culas de alunos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    inherited tsGrid: TTabSheet
      ExplicitWidth = 627
      ExplicitHeight = 271
      inherited pnInferiorFiltro: TPanel
        ExplicitTop = 230
        ExplicitWidth = 627
        inherited frameFiltro1: TframeFiltro
          inherited cbBusca: TComboBox
            Items.Strings = (
              'Aluno'
              'Disciplina')
          end
        end
      end
    end
    inherited tsEdit: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 627
      ExplicitHeight = 271
      inherited pnEditEdits: TPanel
        object lblNota1: TLabel
          Left = 7
          Top = 120
          Width = 107
          Height = 13
          Caption = 'Nota primeiro per'#237'odo:'
          FocusControl = edNota1
        end
        object lblNota2: TLabel
          Left = 80
          Top = 163
          Width = 110
          Height = 13
          Caption = 'Nota segundo per'#237'odo:'
          FocusControl = edNota2
        end
        object lblNota3: TLabel
          Left = 176
          Top = 206
          Width = 85
          Height = 13
          Caption = 'Nota de trabalho:'
          FocusControl = edNotaTrabalho
        end
        object lblDisciplina: TLabel
          Left = 7
          Top = 56
          Width = 47
          Height = 13
          Caption = 'Disciplina:'
          FocusControl = edIdDisciplina
        end
        object lblAluno: TLabel
          Left = 7
          Top = 13
          Width = 31
          Height = 13
          Caption = 'Aluno:'
          FocusControl = edIdAluno
        end
        object edNota1: TDBEdit
          Left = 7
          Top = 136
          Width = 134
          Height = 21
          DataField = 'NOTA_1'
          DataSource = dsDados
          TabOrder = 4
        end
        object edNota2: TDBEdit
          Left = 80
          Top = 179
          Width = 134
          Height = 21
          DataField = 'NOTA_2'
          DataSource = dsDados
          TabOrder = 5
        end
        object edNotaTrabalho: TDBEdit
          Left = 176
          Top = 222
          Width = 134
          Height = 21
          DataField = 'NOTA_TRABALHO'
          DataSource = dsDados
          TabOrder = 6
        end
        object edIdDisciplina: TDBEdit
          Left = 7
          Top = 75
          Width = 50
          Height = 21
          DataField = 'ID_DISCIPLINA'
          DataSource = dsDados
          TabOrder = 2
        end
        object edIdAluno: TDBEdit
          Left = 7
          Top = 29
          Width = 50
          Height = 21
          DataField = 'ID_ALUNO'
          DataSource = dsDados
          TabOrder = 0
          OnExit = edIdAlunoExit
        end
        object LkUpDisciplina: TDBLookupComboBox
          Left = 63
          Top = 75
          Width = 234
          Height = 21
          DataField = 'ID_DISCIPLINA'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = DmDados.dsLkUpDisciplina
          TabOrder = 3
        end
        object edNomeAluno: TEdit
          Left = 63
          Top = 29
          Width = 234
          Height = 21
          Enabled = False
          TabOrder = 7
        end
        object btnConsultarAluno: TButton
          Left = 303
          Top = 27
          Width = 34
          Height = 25
          Caption = '...'
          TabOrder = 1
          OnClick = btnConsultarAlunoClick
        end
      end
    end
  end
  inherited qrDados: TFDQuery
    SQL.Strings = (
      
        'SELECT M.ID, M.ID_ALUNO, M.ID_DISCIPLINA, M.NOTA_1, M.NOTA_2, M.' +
        'NOTA_TRABALHO, M.MEDIA'
      'FROM MATRICULA M')
    object qrDadosID: TFDAutoIncField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object qrDadosID_ALUNO: TIntegerField
      FieldName = 'ID_ALUNO'
      Origin = 'ID_ALUNO'
      Required = True
      Visible = False
    end
    object qrDadosNOME_ALUNO: TStringField
      DisplayLabel = 'Aluno'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'NOME_ALUNO'
      LookupDataSet = DmDados.qrLkUpAluno
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_ALUNO'
      Size = 100
      Lookup = True
    end
    object qrDadosID_DISCIPLINA: TIntegerField
      FieldName = 'ID_DISCIPLINA'
      Origin = 'ID_DISCIPLINA'
      Required = True
      Visible = False
    end
    object qrDadosNOME_DISCIPLINA: TStringField
      DisplayLabel = 'Disciplina'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'NOME_DISCIPLINA'
      LookupDataSet = DmDados.qrLkUpDisciplina
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_DISCIPLINA'
      Size = 100
      Lookup = True
    end
    object qrDadosNOTA_1: TFloatField
      DisplayLabel = 'Nota primeiro per'#237'odo'
      FieldName = 'NOTA_1'
      Origin = 'NOTA_1'
    end
    object qrDadosNOTA_2: TFloatField
      DisplayLabel = 'Nota segundo per'#237'odo'
      FieldName = 'NOTA_2'
      Origin = 'NOTA_2'
    end
    object qrDadosNOTA_TRABALHO: TFloatField
      DisplayLabel = 'Nota de trabalho'
      FieldName = 'NOTA_TRABALHO'
      Origin = 'NOTA_TRABALHO'
    end
    object qrDadosMEDIA: TFloatField
      DisplayLabel = 'M'#233'dia'
      FieldName = 'MEDIA'
      Origin = 'MEDIA'
      DisplayFormat = ',0.00'
    end
  end
  object qrConsulta: TFDQuery
    Connection = DmDados.FDConnection1
    Left = 608
    Top = 176
  end
end
