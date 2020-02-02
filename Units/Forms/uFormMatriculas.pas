unit uFormMatriculas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDadosBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uFrameConfirmarInsercao, uFrameFiltro, Vcl.StdCtrls, uFrameBotoesCrud,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, uDmDados, Vcl.DBCtrls,
  Vcl.Mask, uFormConsultarAluno, uBiblioteca, uFormRelatorioAlunos;

type
  TformMatriculas = class(TformDadosBase)
    qrDadosID_ALUNO: TIntegerField;
    qrDadosID_DISCIPLINA: TIntegerField;
    qrDadosNOTA_1: TFloatField;
    qrDadosNOTA_2: TFloatField;
    qrDadosNOTA_TRABALHO: TFloatField;
    qrDadosID: TFDAutoIncField;
    qrDadosNOME_ALUNO: TStringField;
    qrDadosNOME_DISCIPLINA: TStringField;
    lblNota1: TLabel;
    edNota1: TDBEdit;
    lblNota2: TLabel;
    edNota2: TDBEdit;
    lblNota3: TLabel;
    edNotaTrabalho: TDBEdit;
    lblDisciplina: TLabel;
    edIdDisciplina: TDBEdit;
    lblAluno: TLabel;
    edIdAluno: TDBEdit;
    LkUpDisciplina: TDBLookupComboBox;
    edNomeAluno: TEdit;
    btnConsultarAluno: TButton;
    qrConsulta: TFDQuery;
    qrDadosMEDIA: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frameFiltro1btnFiltrarClick(Sender: TObject);
    procedure edIdAlunoExit(Sender: TObject);
    procedure btnConsultarAlunoClick(Sender: TObject);
    procedure frameInsercaoECancelamento1btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure VerificarSeContinuaIncluindo;
  protected
    function EstaMatriculado: boolean;
    function ValidarObrigatorios: boolean; virtual;
    procedure Filtrar; virtual;
  public
    { Public declarations }
  end;

var
  formMatriculas: TformMatriculas;

implementation
Const
  SQL_BASE = 'SELECT M.ID, M.ID_ALUNO, A.NOME AS ALUNO, M.ID_DISCIPLINA, '
           + 'D.NOME AS DISCIPLINA, '
           + 'M.NOTA_1, M.NOTA_2, M.NOTA_TRABALHO, M.MEDIA '
           + 'FROM MATRICULA M '
           + 'LEFT JOIN ALUNO A ON A.ID = M.ID_ALUNO '
           + 'LEFT JOIN DISCIPLINA D ON D.ID = M.ID_DISCIPLINA '
           + 'WHERE 1 = 1 ';

{$R *.dfm}

procedure TformMatriculas.frameFiltro1btnFiltrarClick(Sender: TObject);
begin
  qrDados.SQL.Text := SQL_BASE;
  if trim(frameFiltro1.edPesquisa.Text) <> '' then
    Filtrar;
  qrDados.Open;
end;

procedure TformMatriculas.frameInsercaoECancelamento1btnSalvarClick(
  Sender: TObject);
begin
  if ValidarObrigatorios then
    if qrDados.State in [dsInsert] then
      if not EstaMatriculado then
        VerificarSeContinuaIncluindo
      else
        MsgErro('Este aluno já está matriculado nesta disciplina!')
    else
      VerificarSeContinuaIncluindo;

    qrDados.Refresh;
end;

procedure TformMatriculas.VerificarSeContinuaIncluindo;
begin
  if frameInsercaoECancelamento1.cbContinuarIncluindo.Checked then
  begin
    qrDados.Post;
    qrDados.Append;
    edNomeAluno.Text := '';
    pnEditEdits.SetFocus;
  end
  else
  begin
    qrDados.Post;
    pcPrincipal.ActivePage := tsGrid;
  end
end;

procedure TformMatriculas.btnConsultarAlunoClick(Sender: TObject);
begin
  inherited;
  formConsultarAluno := TFormConsultarAluno.Create(Self);
  try
    if formConsultarAluno.ShowModal = mrOk then
    begin
      edIdAluno.Text := formConsultarAluno.qrConsulta.FieldByName('ID').AsString;
      edNomeAluno.Text := formConsultarAluno.qrConsulta.FieldByName('NOME').AsString;
    end;
  finally
    formConsultarAluno.Free;
  end;
end;

procedure TformMatriculas.edIdAlunoExit(Sender: TObject);
begin
  inherited;
  edNomeAluno.Text := qrDadosNOME_ALUNO.AsString;
end;

procedure TformMatriculas.Filtrar;
begin
  Inherited;
end;

function TformMatriculas.ValidarObrigatorios: boolean;
begin
  if (trim(edIdAluno.Text) = '') then
  begin
    MsgErro('Selecione um Aluno');
    edIdAluno.SetFocus;
    Exit(False);
  end
  else if (trim(edIdDisciplina.Text) = '') or (LkUpDisciplina.Text = '')then
  begin
    MsgErro('Selecione uma disciplina!');
    edIdDisciplina.SetFocus;
    Exit(False);
  end;

  if trim(edNota1.Text) = '' then
  begin
    edNota1.Text := '0';
  end;
  if trim(edNota2.Text) = '' then
  begin
    edNota2.Text := '0';
  end;
  if trim(edNotaTrabalho.Text) = '' then
  begin
    edNotaTrabalho.Text := '0';
  end;

  Result := inherited ValidarObrigatorios;
end;

function TformMatriculas.EstaMatriculado: boolean;
begin
  qrConsulta.Close;
  qrConsulta.SQL.Text := 'SELECT ID, ID_ALUNO, ID_DISCIPLINA FROM MATRICULA ' +
                         'WHERE ID_ALUNO = :ID_ALUNO_MATRICULADO ' +
                         'AND ID_DISCIPLINA = :ID_DISCIPLINA_MATRICULADA';
  qrConsulta.ParamByName('ID_ALUNO_MATRICULADO').AsString := edIdAluno.Text;
  qrConsulta.ParamByName('ID_DISCIPLINA_MATRICULADA').AsString := edIdDisciplina.Text;
  qrConsulta.Open;

  if qrConsulta.IsEmpty then
    Result := False
  else
    Result := True;;
end;

procedure TformMatriculas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  formMatriculas := Nil;
end;

end.
