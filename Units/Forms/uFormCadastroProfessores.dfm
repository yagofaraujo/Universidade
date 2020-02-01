inherited formCadastroProfessores: TformCadastroProfessores
  Caption = 'Cadastro de Professores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    inherited tsEdit: TTabSheet
      object lblCPF: TLabel [0]
        Left = 3
        Top = 13
        Width = 23
        Height = 13
        Caption = 'CPF:'
        FocusControl = edCPF
      end
      object lblNome: TLabel [1]
        Left = 3
        Top = 56
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = edNome
      end
      object lblTelefone: TLabel [2]
        Left = 3
        Top = 96
        Width = 46
        Height = 13
        Caption = 'Telefone:'
        FocusControl = edTelefone
      end
      object edCPF: TDBEdit
        Left = 3
        Top = 29
        Width = 150
        Height = 21
        DataField = 'CPF'
        DataSource = dsDados
        TabOrder = 1
      end
      object edNome: TDBEdit
        Left = 3
        Top = 69
        Width = 350
        Height = 21
        DataField = 'NOME'
        DataSource = dsDados
        TabOrder = 2
      end
      object edTelefone: TDBEdit
        Left = 3
        Top = 109
        Width = 150
        Height = 21
        DataField = 'TELEFONE'
        DataSource = dsDados
        TabOrder = 3
      end
    end
  end
  inherited qrDados: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PROFESSORES')
    object qrDadosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrDadosCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      EditMask = '000.000.000-00;0; '
      Size = 30
    end
    object qrDadosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qrDadosTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      EditMask = '(99)99999-9999;0; '
      Size = 30
    end
  end
end
