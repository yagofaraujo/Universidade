object frameFiltro: TframeFiltro
  Left = 0
  Top = 0
  Width = 453
  Height = 36
  TabOrder = 0
  object lblCampos: TLabel
    Left = 1
    Top = 0
    Width = 42
    Height = 13
    Caption = 'Campos:'
  end
  object lblPesquisa: TLabel
    Left = 96
    Top = 0
    Width = 46
    Height = 13
    Caption = 'Pesquisa:'
  end
  object edPesquisa: TEdit
    Left = 96
    Top = 15
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object btnFiltrar: TButton
    Left = 375
    Top = 15
    Width = 75
    Height = 21
    Caption = 'Filtrar'
    TabOrder = 2
  end
  object cbBusca: TComboBox
    Left = 1
    Top = 15
    Width = 89
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    TextHint = 'Pesquisar por'
  end
end
