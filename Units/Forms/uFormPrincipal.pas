unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDmDados,
  uFormCadastroProfessores, uFormCadastroDisciplinas, uFormBase;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Professores1Click(Sender: TObject);
    procedure Disciplinas1Click(Sender: TObject);
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

procedure TformPrincipal.Disciplinas1Click(Sender: TObject);
begin
  if formCadastroDisciplinas = Nil then
    formCadastroDisciplinas := TFormCadastroDisciplinas.Create(Self);

  formCadastroDisciplinas.Show;
end;

procedure TformPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  formPrincipal := Nil;
end;

end.
