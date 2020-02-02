unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDmDados,
  uFormCadastroProfessores, uFormCadastroDisciplinas, uFormBase,
  uFormCadastroAlunos, uFormAtribuirProfessoresDisciplinas, uFormMatriculas,
  uFormRelatorioAlunos, uFormRelatorioAlunosEProfessores;

type
  TformPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    CadastroProfessores: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Utilitrios1: TMenuItem;
    CadastroAlunos: TMenuItem;
    CadastroDisciplinas: TMenuItem;
    MovimentosProfessoresDisciplinas: TMenuItem;
    Configurarbancodedados1: TMenuItem;
    MovimentosMatriculas: TMenuItem;
    RelatoriosAlunos: TMenuItem;
    RelatorioListagemAlunoseProfessores1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CadastroProfessoresClick(Sender: TObject);
    procedure CadastroDisciplinasClick(Sender: TObject);
    procedure CadastroAlunosClick(Sender: TObject);
    procedure MovimentosProfessoresDisciplinasClick(Sender: TObject);
    procedure MovimentosMatriculasClick(Sender: TObject);
    procedure RelatoriosAlunosClick(Sender: TObject);
    procedure RelatorioListagemAlunoseProfessores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses uFormDadosBase;

procedure TformPrincipal.CadastroProfessoresClick(Sender: TObject);
begin
  if formCadastroProfessores = nil then
    formCadastroProfessores := TformCadastroProfessores.Create(Self);

  formCadastroProfessores.Show;
end;

procedure TformPrincipal.CadastroAlunosClick(Sender: TObject);
begin
  if formCadastroAlunos = nil then
    formCadastroAlunos := TformCadastroAlunos.Create(Self);

  formCadastroAlunos.Show;
end;

procedure TformPrincipal.CadastroDisciplinasClick(Sender: TObject);
begin
  if formCadastroDisciplinas = Nil then
    formCadastroDisciplinas := TFormCadastroDisciplinas.Create(Self);

  formCadastroDisciplinas.Show;
end;

procedure TformPrincipal.MovimentosMatriculasClick(Sender: TObject);
begin
  if formMatriculas = Nil then
    formMatriculas := TFormMatriculas.Create(Self);

  formMatriculas.Show;
end;

procedure TformPrincipal.MovimentosProfessoresDisciplinasClick(Sender: TObject);
begin
  if formAtribuirProfessoresDiscilplinas = Nil then
    formAtribuirProfessoresDiscilplinas := TformAtribuirProfessoresDiscilplinas.Create(Self);

  formAtribuirProfessoresDiscilplinas.Show;
end;

procedure TformPrincipal.RelatorioListagemAlunoseProfessores1Click(Sender: TObject);
begin
  if formRelatorioListagemAlunosEProfessores = nil then
    formRelatorioListagemAlunosEProfessores := TFormRelatorioListagemAlunosEProfessores.Create(Self);

  formRelatorioListagemAlunosEProfessores.rpListagemAlunosEProfessores.PreviewModal;
end;

procedure TformPrincipal.RelatoriosAlunosClick(Sender: TObject);
begin
  if formRelatorioAlunos = nil then
    formRelatorioAlunos := TFormRelatorioAlunos.Create(Self);

  formRelatorioAlunos.rpAlunos.PreviewModal;
end;

procedure TformPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  formPrincipal := Nil;
end;
end.
