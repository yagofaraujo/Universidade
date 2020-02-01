inherited formDadosBase: TformDadosBase
  Caption = 'formDadosBase'
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    ActivePage = tsGrid
    Align = alClient
    TabOrder = 0
    object tsGrid: TTabSheet
      Caption = 'tsGrid'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 537
        Height = 230
        Align = alClient
        DataSource = dsDados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object pnGridBotoes: TPanel
        Left = 537
        Top = 0
        Width = 90
        Height = 230
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        inline frameBotoesLaterais1: TframeBotoesCrud
          Left = 9
          Top = 13
          Width = 75
          Height = 87
          AutoSize = True
          TabOrder = 0
          ExplicitLeft = 9
          ExplicitTop = 13
          inherited btnNovo: TButton
            OnClick = frameBotoesLaterais1btnNovoClick
          end
          inherited btnEditar: TButton
            OnClick = frameBotoesLaterais1btnEditarClick
          end
          inherited btnExcluir: TButton
            OnClick = frameBotoesLaterais1btnExcluirClick
          end
        end
        object btnSair: TButton
          Left = 9
          Top = 184
          Width = 75
          Height = 25
          Caption = 'Sair'
          TabOrder = 1
          OnClick = btnSairClick
        end
      end
      object pnInferiorFiltro: TPanel
        Left = 0
        Top = 230
        Width = 627
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        inline frameFiltro1: TframeFiltro
          Left = 2
          Top = 1
          Width = 453
          Height = 36
          TabOrder = 0
          ExplicitLeft = 2
          ExplicitTop = 1
          inherited lblCampos: TLabel
            Top = 1
            ExplicitTop = 1
          end
        end
      end
    end
    object tsEdit: TTabSheet
      Caption = 'tsEdit'
      ImageIndex = 1
      object pnEditBotoes: TPanel
        Left = 507
        Top = 0
        Width = 120
        Height = 271
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        inline frameInsercaoECancelamento1: TframeInsercaoECancelamento
          Left = 8
          Top = 8
          Width = 112
          Height = 95
          AutoSize = True
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 8
          ExplicitHeight = 95
          inherited btnSalvar: TButton
            Left = 16
            OnClick = frameInsercaoECancelamento1btnSalvarClick
            ExplicitLeft = 16
          end
          inherited btnCancelar: TButton
            Left = 16
            Top = 70
            OnClick = frameInsercaoECancelamento1btnCancelarClick
            ExplicitLeft = 16
            ExplicitTop = 70
          end
        end
      end
    end
  end
  object qrDados: TFDQuery
    Connection = DmDados.FDConnection1
    Left = 600
    Top = 248
  end
  object dsDados: TDataSource
    DataSet = qrDados
    Left = 560
    Top = 248
  end
end
