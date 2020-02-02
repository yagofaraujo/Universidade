unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, uBiblioteca, uFormConfigBancoDeDados, Vcl.Forms;

type
  TDmDados = class(TDataModule)
    FDConnection1: TFDConnection;
    qrLkUpProfessor: TFDQuery;
    qrLkUpAluno: TFDQuery;
    qrLkUpDisciplina: TFDQuery;
    dsLkUpProfessor: TDataSource;
    dsLkUpAluno: TDataSource;
    dsLkUpDisciplina: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure VerificarBancoDeDados;
  end;

var
  DmDados: TDmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmDados.DataModuleCreate(Sender: TObject);
begin
  VerificarBancoDeDados;
end;

procedure TDmDados.VerificarBancoDeDados;
begin
  try
    fdConnection1.Params.Database := ReceberValorIni(ExtractFilePath(Application.ExeName)
                                  + 'UNI.ini', 'CONFIGURACAO', 'LOCAL_DB');
    fdConnection1.Connected := true;
    qrLkUpProfessor.Open;
    qrLkUpAluno.Open;
    qrLkUpDisciplina.Open;
  except
    on E: Exception do
    begin
      if E.Message.Contains('is not a valid database') then
      begin
       if formConfigBancoDeDados = nil then
        formConfigBancoDeDados := TformConfigBancoDeDados.Create(Self);

      formConfigBancoDeDados.ShowModal
      end
      else
        MsgErro('Evento inesperado: ' + E.Message);
    end;
  end;
end;
end.
