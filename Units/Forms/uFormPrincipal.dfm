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
    end
  end
end
