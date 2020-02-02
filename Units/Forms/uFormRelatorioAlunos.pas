unit uFormRelatorioAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport,
  Vcl.Imaging.pngimage;

type
  TformRelatorioAlunos = class(TForm)
    rpAlunos: TRLReport;
    bdCabecalho: TRLBand;
    rlLblRelatorioAlunos: TRLLabel;
    rlGpAlunos: TRLGroup;
    bdCabecalhoDados: TRLBand;
    lblNome: TRLLabel;
    lblDisciplina: TRLLabel;
    lblNota1: TRLLabel;
    lblNota2: TRLLabel;
    lblNotaTrabalho: TRLLabel;
    lblMedia: TRLLabel;
    bdDados: TRLBand;
    dbNome: TRLDBText;
    dbDisciplina: TRLDBText;
    dbNota1: TRLDBText;
    dbNota2: TRLDBText;
    dbNotaTrabalho: TRLDBText;
    qrDados: TFDQuery;
    dsDados: TDataSource;
    qrDadosID: TIntegerField;
    qrDadosALUNO: TStringField;
    qrDadosDISCIPLINA: TStringField;
    qrDadosNOTA_1: TFloatField;
    qrDadosNOTA_2: TFloatField;
    qrDadosNOTA_TRABALHO: TFloatField;
    bdRodape: TRLBand;
    dbMedia: TRLDBText;
    qrDadosMEDIA: TFloatField;
    imageLogo: TRLImage;
    RLSystemInfo1: TRLSystemInfo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rpAlunosBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rpAlunosPageEnding(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioAlunos: TformRelatorioAlunos;

implementation

{$R *.dfm}

uses uFormFiltroRelatorioAlunos;
Const
  SQL_BASE = 'SELECT M.ID, '
           + 'A.NOME AS ALUNO, '
           + 'D.NOME AS DISCIPLINA, '
           + 'M.NOTA_1, '
           + 'M.NOTA_2, '
           + 'M.NOTA_TRABALHO, '
           + 'M.MEDIA '
           + 'FROM MATRICULA M '
           + 'LEFT JOIN ALUNO A ON A.ID = M.ID_ALUNO '
           + 'LEFT JOIN DISCIPLINA D ON D.ID = M.ID_DISCIPLINA '
           + 'LEFT JOIN PROFESSOR_DISCIPLINA PD ON PD.ID_DISCIPLINA = D.ID '
           + 'LEFT JOIN PROFESSOR P ON P.ID = PD.ID_PROFESSOR '
           + 'WHERE 1 = 1 ';
  MEDIA = 7;

procedure TformRelatorioAlunos.rpAlunosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  qrDados.SQL.Text := SQL_BASE;

  if Trim(formFiltroRelatorioAlunos.edIdAluno.Text) <> '' then
    qrDados.SQL.Add('AND A.ID = ' +
                           QuotedStr(formFiltroRelatorioAlunos.edIdAluno.Text));


  if formFiltroRelatorioAlunos.cbAlunosAprovados.Checked then
    qrDados.SQL.Add('AND M.MEDIA >= ' + IntToStr(MEDIA))
  else if formFiltroRelatorioAlunos.cbAlunosReprovados.Checked then
    qrDados.SQL.Add('AND M.MEDIA < ' + IntToStr(MEDIA));

  qrDados.SQL.Add('ORDER BY A.NOME ');
  qrDados.Open;
end;

procedure TformRelatorioAlunos.rpAlunosPageEnding(Sender: TObject);
begin
  qrDados.Close;
end;

procedure TformRelatorioAlunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  formRelatorioAlunos := nil;
end;
end.
