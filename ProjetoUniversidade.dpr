program ProjetoUniversidade;

uses
  Vcl.Forms,
  uFormPrincipal in 'Units\Forms\uFormPrincipal.pas' {formPrincipal},
  uFrameBotoesCrud in 'Units\Frames\uFrameBotoesCrud.pas' {frameBotoesCrud: TFrame},
  uFormBase in 'Units\Forms\uFormBase.pas' {formBase},
  uFormDadosBase in 'Units\Forms\uFormDadosBase.pas' {formDadosBase},
  uFrameFiltro in 'Units\Frames\uFrameFiltro.pas' {frameFiltro: TFrame},
  uDmDados in 'Units\uDmDados.pas' {DmDados: TDataModule},
  uFrameConfirmarInsercao in 'Units\Frames\uFrameConfirmarInsercao.pas' {frameInsercaoECancelamento: TFrame},
  uFormCadastroProfessores in 'Units\Forms\uFormCadastroProfessores.pas' {formCadastroProfessores},
  uBiblioteca in 'Units\uBiblioteca.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TDmDados, DmDados);
  Application.Run;
end.
