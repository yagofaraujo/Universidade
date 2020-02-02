unit uFormRelatorioAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport;

type
  TformRelatorioAlunos = class(TForm)
    rpAlunos: TRLReport;
    bdTitulo: TRLBand;
    rlLblRelatorioAlunos: TRLLabel;
    rlGpAlunos: TRLGroup;
    bdCabecalhoDados: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
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
    RLDBText1: TRLDBText;
    qrDadosMEDIA: TFloatField;
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

procedure TformRelatorioAlunos.rpAlunosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  qrDados.Open;
end;

procedure TformRelatorioAlunos.rpAlunosPageEnding(Sender: TObject);
begin
  qrDados.Close;
end;

procedure TformRelatorioAlunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  formRelatorioAlunos := Nil;
end;

end.