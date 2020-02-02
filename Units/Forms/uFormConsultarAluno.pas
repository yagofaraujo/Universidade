unit uFormConsultarAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, uDmDados, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TformConsultarAluno = class(TForm)
    pnSuperior: TPanel;
    DBGrid1: TDBGrid;
    edConsulta: TEdit;
    lblConsulta: TLabel;
    qrConsulta: TFDQuery;
    dsConsulta: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Consultar;
  end;

var
  formConsultarAluno: TformConsultarAluno;

implementation
Const
  SQL_BASE = 'SELECT ID, NOME FROM ALUNO ';

{$R *.dfm}

procedure TformConsultarAluno.FormShow(Sender: TObject);
begin
  inherited;
  Consultar;
end;

procedure TformConsultarAluno.edConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Consultar;
end;

procedure TformConsultarAluno.Consultar;
begin
  qrConsulta.Close;
  qrConsulta.SQL.Text := SQL_BASE;

  if Trim(edConsulta.Text) <> '' then
  begin
    qrConsulta.SQL.Text := qrConsulta.SQL.Text +
      'WHERE UPPER(NOME) LIKE ''%' + UpperCase(edConsulta.Text) + '%''';
  end;

  qrConsulta.Open;
end;

procedure TformConsultarAluno.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := MrOk;
end;

procedure TformConsultarAluno.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := MrOk;
end;

procedure TformConsultarAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  formConsultarAluno := Nil;
end;

end.
