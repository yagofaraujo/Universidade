object formPrincipal: TformPrincipal
  Left = 0
  Top = 0
  Caption = 'Projeto Universidade'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 560
    Top = 128
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
      object Professores1: TMenuItem
        Caption = 'Professores'
        OnClick = Professores1Click
      end
      object Alunos1: TMenuItem
        Caption = 'Alunos'
      end
      object Disciplinas1: TMenuItem
        Caption = 'Disciplinas'
        OnClick = Disciplinas1Click
      end
    end
    object Movimentos1: TMenuItem
      Caption = 'Movimentos'
      object AtribuirProfessoresADisciplinas1: TMenuItem
        Caption = 'Atribuir professores '#224' disciplinas'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object Utilitrios1: TMenuItem
      Caption = 'Utilit'#225'rios'
      object Configurarbancodedados1: TMenuItem
        Caption = 'Configurar banco de dados'
      end
    end
  end
end
