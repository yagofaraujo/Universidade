unit uFormAtribuirProfessoresDisciplinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDadosBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uFrameConfirmarInsercao, uFrameFiltro, Vcl.StdCtrls, uFrameBotoesCrud,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, uDmDados, Vcl.DBCtrls,
  Vcl.Mask, uBiblioteca;

type
  TformAtribuirProfessoresDiscilplinas = class(TformDadosBase)
    qrDadosID_PROFESSOR: TIntegerField;
    qrDadosID_DISCIPLINA: TIntegerField;
    qrDadosID: TFDAutoIncField;
    LkUpProfessor: TDBLookupComboBox;
    LkUpDisciplina: TDBLookupComboBox;
    lblProfessor: TLabel;
    lblDisciplina: TLabel;
    edIdProfessor: TDBEdit;
    edIdDisciplina: TDBEdit;
    qrDadosNOME_PROFESSOR: TStringField;
    qrDadosNOME_DISCIPLINA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frameFiltro1btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function ValidarObrigatorios: boolean; override;
    procedure Filtrar;
  public
    { Public declarations }
  end;

var
  formAtribuirProfessoresDiscilplinas: TformAtribuirProfessoresDiscilplinas;

implementation
Const
  SQL_BASE = 'SELECT PD.ID, PD.ID_PROFESSOR, PD.ID_DISCIPLINA, P.NOME, D.NOME '
           + 'FROM PROFESSOR_DISCIPLINA PD '
           + 'LEFT JOIN PROFESSOR P ON P.ID = PD.ID_PROFESSOR '
           + 'LEFT JOIN DISCIPLINA D ON D.ID = PD.ID_DISCIPLINA '
           + 'WHERE 1 = 1 ';
{$R *.dfm}

procedure TformAtribuirProfessoresDiscilplinas.frameFiltro1btnFiltrarClick(
  Sender: TObject);
begin
  inherited;
  qrDados.SQL.Text := SQL_BASE;
  if trim(frameFiltro1.edPesquisa.Text) <> '' then
    Filtrar;
  qrDados.Open;
end;

function TformAtribuirProfessoresDiscilplinas.ValidarObrigatorios: boolean;
begin
  if (trim(edIdProfessor.Text) = '') or (LkUpProfessor.Text = '')then
  begin
    MsgErro('Selecione um professor!');
    edIdProfessor.SetFocus;
    Exit(False);
  end
  else if (trim(edIdDisciplina.Text) = '') or (LkUpDisciplina.Text = '')then
  begin
    MsgErro('Selecione uma disciplina!');
    edIdDisciplina.SetFocus;
    Exit(False);
  end;

  Result := inherited ValidarObrigatorios;
end;

procedure TformAtribuirProfessoresDiscilplinas.Filtrar;
begin
  inherited;
end;

procedure TformAtribuirProfessoresDiscilplinas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  formAtribuirProfessoresDiscilplinas := Nil;
end;

end.
