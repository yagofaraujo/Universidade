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
  uBiblioteca in 'Units\uBiblioteca.pas',
  uFormCadastroDisciplinas in 'Units\Forms\uFormCadastroDisciplinas.pas' {formCadastroDisciplinas},
  uFormCadastroAlunos in 'Units\Forms\uFormCadastroAlunos.pas' {formCadastroAlunos},
  uFormAtribuirProfessoresDisciplinas in 'Units\Forms\uFormAtribuirProfessoresDisciplinas.pas' {formAtribuirProfessoresDiscilplinas},
  uFormMatriculas in 'Units\Forms\uFormMatriculas.pas' {formMatriculas},
  uFormConsultarAluno in 'Units\Forms\uFormConsultarAluno.pas' {formConsultarAluno},
  uFormRelatorioAlunos in 'Units\Forms\uFormRelatorioAlunos.pas' {formRelatorioAlunos},
  uFormRelatorioAlunosEProfessores in 'Units\Forms\uFormRelatorioAlunosEProfessores.pas' {formRelatorioListagemAlunosEProfessores},
  uFormConfigBancoDeDados in 'Units\Forms\uFormConfigBancoDeDados.pas' {formConfigBancoDeDados},
  uFormFiltroRelatorioAlunos in 'Units\Forms\uFormFiltroRelatorioAlunos.pas' {formFiltroRelatorioAlunos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TformFiltroRelatorioAlunos, formFiltroRelatorioAlunos);
  Application.Run;
end.
