unit uFormRelatorioAlunosEProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, uDmDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TformRelatorioListagemAlunosEProfessores = class(TForm)
    rpListagemAlunosEProfessores: TRLReport;
    bdCabecalho: TRLBand;
    rlLblRelatorioAlunosProfessores: TRLLabel;
    imageLogo: TRLImage;
    RLSystemInfo1: TRLSystemInfo;
    qrDados: TFDQuery;
    dsDados: TDataSource;
    bdCabecalhoDados: TRLBand;
    lblAluno: TRLLabel;
    lblProfessor: TRLLabel;
    lblDisciplina: TRLLabel;
    bdDados: TRLBand;
    dbAluno: TRLDBText;
    dbProfessor: TRLDBText;
    dbDisciplina: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rpListagemAlunosEProfessoresPageEnding(Sender: TObject);
    procedure rpListagemAlunosEProfessoresBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioListagemAlunosEProfessores: TformRelatorioListagemAlunosEProfessores;

implementation

{$R *.dfm}

procedure TformRelatorioListagemAlunosEProfessores.rpListagemAlunosEProfessoresBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  qrDados.Open;
end;

procedure TformRelatorioListagemAlunosEProfessores.rpListagemAlunosEProfessoresPageEnding(
  Sender: TObject);
begin
  qrDados.Close;
end;

procedure TformRelatorioListagemAlunosEProfessores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  formRelatorioListagemAlunosEProfessores := Nil;
end;

end.
