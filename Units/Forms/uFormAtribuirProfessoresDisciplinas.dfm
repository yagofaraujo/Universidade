inherited formAtribuirProfessoresDiscilplinas: TformAtribuirProfessoresDiscilplinas
  Caption = 'Atribui'#231#227'o de Professores '#224' Disciplinas'
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
              'Professor'
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
        object lblProfessor: TLabel
          Left = 4
          Top = 17
          Width = 50
          Height = 13
          Caption = 'Professor:'
        end
        object lblDisciplina: TLabel
          Left = 4
          Top = 76
          Width = 47
          Height = 13
          Caption = 'Disciplina:'
        end
        object LkUpProfessor: TDBLookupComboBox
          Left = 71
          Top = 35
          Width = 166
          Height = 21
          DataField = 'ID_PROFESSOR'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = DmDados.dsLkUpProfessor
          TabOrder = 1
        end
        object LkUpDisciplina: TDBLookupComboBox
          Left = 71
          Top = 95
          Width = 166
          Height = 21
          DataField = 'ID_DISCIPLINA'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = DmDados.dsLkUpDisciplina
          TabOrder = 3
        end
        object edIdDisciplina: TDBEdit
          Left = 4
          Top = 95
          Width = 50
          Height = 21
          DataField = 'ID_DISCIPLINA'
          DataSource = dsDados
          TabOrder = 2
        end
        object edIdProfessor: TDBEdit
          Left = 4
          Top = 36
          Width = 50
          Height = 21
          DataField = 'ID_PROFESSOR'
          DataSource = dsDados
          TabOrder = 0
        end
      end
    end
  end
  inherited qrDados: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PROFESSOR_DISCIPLINA')
    object qrDadosID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object qrDadosID_PROFESSOR: TIntegerField
      DisplayLabel = 'C'#243'digo Professor'
      FieldName = 'ID_PROFESSOR'
      Origin = 'ID_PROFESSOR'
      Required = True
      Visible = False
    end
    object qrDadosNOME_PROFESSOR: TStringField
      DisplayLabel = 'Professor'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'NOME_PROFESSOR'
      LookupDataSet = DmDados.qrLkUpProfessor
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_PROFESSOR'
      Size = 100
      Lookup = True
    end
    object qrDadosID_DISCIPLINA: TIntegerField
      DisplayLabel = 'C'#243'digo Disciplina'
      FieldName = 'ID_DISCIPLINA'
      Origin = 'ID_DISCIPLINA'
      Required = True
      Visible = False
    end
    object qrDadosNOME_DISCIPLINA: TStringField
      DisplayLabel = 'Disciplina'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'NOME_DISCIPLINA'
      LookupDataSet = DmDados.qrLkUpDisciplina
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_DISCIPLINA'
      Size = 100
      Lookup = True
    end
  end
end
