unit uFormCadastroDisciplinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDadosBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uFrameConfirmarInsercao, uFrameFiltro, Vcl.StdCtrls, uFrameBotoesCrud,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls,
  uBiblioteca;

type
  TformCadastroDisciplinas = class(TformDadosBase)
    qrDadosNOME: TStringField;
    qrDadosID: TFDAutoIncField;
    lblNome: TLabel;
    edNome: TDBEdit;
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
  formCadastroDisciplinas: TformCadastroDisciplinas;

implementation

{$R *.dfm}

procedure TformCadastroDisciplinas.frameFiltro1btnFiltrarClick(Sender: TObject);
begin
  inherited;
  qrDados.SQL.Add('SELECT * FROM DISCIPLINAS ');
  qrDados.SQL.Add('WHERE 1 = 1 ');
  if trim(frameFiltro1.edPesquisa.Text) <> '' then
    Filtrar;
  qrDados.Open;
end;

function TformCadastroDisciplinas.ValidarObrigatorios: boolean;
begin
  if trim(edNome.Text) = '' then
  begin
    MsgErro('Digite um CPF v�lido');
    edNome.SetFocus;
    Exit(False);
  end;
  Result := inherited ValidarObrigatorios;
end;

procedure TformCadastroDisciplinas.Filtrar;
begin
  Inherited;
end;

procedure TformCadastroDisciplinas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  formCadastroDisciplinas := Nil;
end;

end.
