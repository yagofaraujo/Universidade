inherited formMatriculas: TformMatriculas
  Caption = 'Matr'#237'culas de alunos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    ActivePage = tsGrid
    inherited tsGrid: TTabSheet
      inherited pnGridBotoes: TPanel
        inherited btnSair: TButton
          Top = 216
          ExplicitTop = 216
        end
        object btnNotas: TButton
          Left = 9
          Top = 138
          Width = 75
          Height = 30
          Caption = 'Ajustar Notas'
          TabOrder = 2
          OnClick = btnNotasClick
        end
      end
      inherited pnInferiorFiltro: TPanel
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
      inherited pnEditEdits: TPanel
        object lblDisciplina: TLabel
          Left = 7
          Top = 56
          Width = 47
          Height = 13
          Caption = 'Disciplina:'
          FocusControl = edEditIdDisciplina
        end
        object lblAluno: TLabel
          Left = 7
          Top = 13
          Width = 31
          Height = 13
          Caption = 'Aluno:'
          FocusControl = edEditIdAluno
        end
        object edEditIdDisciplina: TDBEdit
          Left = 7
          Top = 75
          Width = 50
          Height = 21
          DataField = 'ID_DISCIPLINA'
          DataSource = dsDados
          TabOrder = 2
        end
        object edEditIdAluno: TDBEdit
          Left = 7
          Top = 29
          Width = 50
          Height = 21
          DataField = 'ID_ALUNO'
          DataSource = dsDados
          TabOrder = 0
          OnExit = edEditIdAlunoExit
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
        object edEditNomeAluno: TEdit
          Left = 63
          Top = 29
          Width = 234
          Height = 21
          Enabled = False
          TabOrder = 4
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
    object tsNotas: TTabSheet
      Caption = 'tsNotas'
      ImageIndex = 2
      object pnNotasEdits: TPanel
        Left = 0
        Top = 0
        Width = 488
        Height = 271
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 507
        object lblNotasNota1: TLabel
          Left = 7
          Top = 113
          Width = 107
          Height = 13
          Caption = 'Nota primeiro per'#237'odo:'
          FocusControl = edNotasNota1
        end
        object lblNotasNota2: TLabel
          Left = 80
          Top = 156
          Width = 110
          Height = 13
          Caption = 'Nota segundo per'#237'odo:'
          FocusControl = edNotasNota2
        end
        object lblNotasNotaTrabalho: TLabel
          Left = 176
          Top = 199
          Width = 85
          Height = 13
          Caption = 'Nota de trabalho:'
          FocusControl = edNotasNotaTrabalho
        end
        object lblNotasDisciplina: TLabel
          Left = 7
          Top = 51
          Width = 47
          Height = 13
          Caption = 'Disciplina:'
        end
        object lblNotasAluno: TLabel
          Left = 7
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Aluno:'
        end
        object edNotasNota1: TDBEdit
          Left = 7
          Top = 129
          Width = 134
          Height = 21
          DataField = 'NOTA_1'
          DataSource = dsDados
          TabOrder = 0
        end
        object edNotasNota2: TDBEdit
          Left = 80
          Top = 172
          Width = 134
          Height = 21
          DataField = 'NOTA_2'
          DataSource = dsDados
          TabOrder = 1
        end
        object edNotasNotaTrabalho: TDBEdit
          Left = 176
          Top = 215
          Width = 134
          Height = 21
          DataField = 'NOTA_TRABALHO'
          DataSource = dsDados
          TabOrder = 2
        end
        object edNotasNomeAluno: TEdit
          Left = 7
          Top = 24
          Width = 234
          Height = 21
          Enabled = False
          TabOrder = 3
        end
        object edNotasNomeDisciplina: TEdit
          Left = 7
          Top = 70
          Width = 234
          Height = 21
          Enabled = False
          TabOrder = 4
        end
      end
      object pnNotasBotoes: TPanel
        Left = 488
        Top = 0
        Width = 139
        Height = 271
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnOk: TButton
          Left = 32
          Top = 22
          Width = 75
          Height = 25
          Caption = 'OK'
          TabOrder = 0
          OnClick = btnOkClick
        end
        object btnCancelar: TButton
          Left = 32
          Top = 68
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btnCancelarClick
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
    Left = 512
    Top = 256
  end
end
