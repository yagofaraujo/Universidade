unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDmDados,
  uFormCadastroProfessores;

type
  TformPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    Professores1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Professores1Click(Sender: TObject);
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

procedure TformPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  formPrincipal := Nil;
end;

procedure TformPrincipal.Professores1Click(Sender: TObject);
begin
  if formCadastroProfessores = nil then
    formCadastroProfessores := TformCadastroProfessores.Create(Self);

  formCadastroProfessores.Show;
end;

end.
