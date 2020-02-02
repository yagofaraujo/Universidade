unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

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
  end;

var
  DmDados: TDmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmDados.DataModuleCreate(Sender: TObject);
begin
  qrLkUpProfessor.Open;
  qrLkUpAluno.Open;
  qrLkUpDisciplina.Open;
end;

end.
