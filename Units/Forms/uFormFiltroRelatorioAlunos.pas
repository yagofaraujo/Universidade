unit uFormFiltroRelatorioAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uFormRelatorioAlunos, uFormConsultarAluno, uDmDados, Vcl.Mask, Vcl.DBCtrls;

type
  TformFiltroRelatorioAlunos = class(TForm)
    btnConsultarAluno: TButton;
    btnFiltrar: TButton;
    lblAluno: TLabel;
    cbAlunosAprovados: TCheckBox;
    cbAlunosReprovados: TCheckBox;
    edIdAluno: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrarClick(Sender: TObject);
    procedure cbAlunosAprovadosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbAlunosReprovadosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnConsultarAlunoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFiltroRelatorioAlunos: TformFiltroRelatorioAlunos;

implementation

{$R *.dfm}

procedure TformFiltroRelatorioAlunos.btnConsultarAlunoClick(Sender: TObject);
begin
  formConsultarAluno := TFormConsultarAluno.Create(Self);
  try
    if formConsultarAluno.ShowModal = mrOk then
    begin
      edIdAluno.Text := formConsultarAluno.qrConsulta.FieldByName('ID').AsString;
    end;
  finally
    formConsultarAluno.Free;
  end;
end;

procedure TformFiltroRelatorioAlunos.btnFiltrarClick(Sender: TObject);
begin
  try
    formRelatorioAlunos := TformRelatorioAlunos.Create(Self);
    formRelatorioAlunos.rpAlunos.PreviewModal;
  finally
    formRelatorioAlunos.Free;
  end;

end;

procedure TformFiltroRelatorioAlunos.cbAlunosAprovadosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cbAlunosReprovados.Checked then
    cbAlunosReprovados.Checked := false;
end;

procedure TformFiltroRelatorioAlunos.cbAlunosReprovadosMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cbAlunosAprovados.Checked then
    cbAlunosAprovados.Checked := false;
end;

procedure TformFiltroRelatorioAlunos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  formFiltroRelatorioAlunos := nil;
end;
end.
