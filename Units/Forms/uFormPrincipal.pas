unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDmDados,
  uFormCadastroProfessores, uFormCadastroDisciplinas, uFormBase,
  uFormCadastroAlunos, uFormAtribuirProfessoresDisciplinas, uFormMatriculas,
  uFormRelatorioAlunos;

type
  TformPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    Professores1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Utilitrios1: TMenuItem;
    Alunos1: TMenuItem;
    Disciplinas1: TMenuItem;
    AtribuirProfessoresADisciplinas1: TMenuItem;
    Configurarbancodedados1: TMenuItem;
    Matriculas1: TMenuItem;
    Alunos2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Professores1Click(Sender: TObject);
    procedure Disciplinas1Click(Sender: TObject);
    procedure Alunos1Click(Sender: TObject);
    procedure AtribuirProfessoresADisciplinas1Click(Sender: TObject);
    procedure Matriculas1Click(Sender: TObject);
    procedure Alunos2Click(Sender: TObject);
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

procedure TformPrincipal.Professores1Click(Sender: TObject);
begin
  if formCadastroProfessores = nil then
    formCadastroProfessores := TformCadastroProfessores.Create(Self);

  formCadastroProfessores.Show;
end;

procedure TformPrincipal.Alunos1Click(Sender: TObject);
begin
  if formCadastroAlunos = Nil then
    formCadastroAlunos := TformCadastroAlunos.Create(Self);

  formCadastroAlunos.Show;
end;

procedure TformPrincipal.Alunos2Click(Sender: TObject);
begin
  if formRelatorioAlunos = nil then
    formRelatorioAlunos := TFormRelatorioAlunos.Create(Self);

  formRelatorioAlunos.rpAlunos.PreviewModal;
end;

procedure TformPrincipal.AtribuirProfessoresADisciplinas1Click(Sender: TObject);
begin
  if formAtribuirProfessoresDiscilplinas = Nil then
    formAtribuirProfessoresDiscilplinas := TformAtribuirProfessoresDiscilplinas.Create(Self);

  formAtribuirProfessoresDiscilplinas.Show;
end;

procedure TformPrincipal.Disciplinas1Click(Sender: TObject);
begin
  if formCadastroDisciplinas = Nil then
    formCadastroDisciplinas := TFormCadastroDisciplinas.Create(Self);

  formCadastroDisciplinas.Show;
end;

procedure TformPrincipal.Matriculas1Click(Sender: TObject);
begin
  if formMatriculas = Nil then
    formMatriculas := TFormMatriculas.Create(Self);

  formMatriculas.Show;
end;

procedure TformPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  formPrincipal := Nil;
end;
end.
