unit uFormCadastroProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDadosBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uFrameConfirmarInsercao, uFrameFiltro, uFrameBotoesCrud, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  uBiblioteca, uDmDados;

type
  TformCadastroProfessores = class(TformDadosBase)
    qrDadosCPF: TStringField;
    qrDadosNOME: TStringField;
    qrDadosTELEFONE: TStringField;
    lblCPF: TLabel;
    edCPF: TDBEdit;
    lblNome: TLabel;
    edNome: TDBEdit;
    lblTelefone: TLabel;
    edTelefone: TDBEdit;
    qrDadosID: TFDAutoIncField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frameFiltro1btnFiltrarClick(Sender: TObject);
    procedure frameInsercaoECancelamento1btnSalvarClick(Sender: TObject);
    procedure frameBotoesLaterais1btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function ValidarObrigatorios: boolean; override;
    procedure Filtrar;
  public
    { Public declarations }
  end;

var
  formCadastroProfessores: TformCadastroProfessores;

implementation
Const
  SQL_BASE = 'SELECT ID, CPF, NOME, TELEFONE FROM PROFESSOR '
           + 'WHERE 1 = 1';

{$R *.dfm}

procedure TformCadastroProfessores.frameFiltro1btnFiltrarClick(Sender: TObject);
begin
  inherited;
  qrDados.SQL.Text := SQL_BASE;
  if trim(frameFiltro1.edPesquisa.Text) <> '' then
    Filtrar;
  qrDados.Open;
end;

procedure TformCadastroProfessores.Filtrar;
begin
  Inherited;
end;

procedure TformCadastroProfessores.frameInsercaoECancelamento1btnSalvarClick(
  Sender: TObject);
begin
  inherited;
  DmDados.qrLkUpProfessor.Refresh;
end;

procedure TformCadastroProfessores.frameBotoesLaterais1btnExcluirClick(
  Sender: TObject);
begin
  inherited;
  DmDados.qrLkUpProfessor.Refresh;
end;

function TformCadastroProfessores.ValidarObrigatorios: boolean;
begin
  if (trim(edCPF.Text) = '') or (trim(edCPF.Text).Length < 11) then
  begin
    MsgErro('Digite um CPF v�lido');
    edCPF.SetFocus;
    Exit(False);
  end
  else if (trim(edNome.Text) = '') then
  begin
    MsgErro('Digite um nome v�lido!');
    edNome.SetFocus;
    Exit(False);
  end
  else if (trim(edTelefone.Text) = '') or (trim(edTelefone.Text).Length < 10) then
  begin
    MsgErro('Digite um telefone v�lido');
    edTelefone.SetFocus;
    Exit(False);
  end;

  Result := inherited ValidarObrigatorios;
end;

procedure TformCadastroProfessores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  formCadastroProfessores := Nil;
end;
end.
