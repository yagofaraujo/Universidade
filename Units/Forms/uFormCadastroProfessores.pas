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
  uBiblioteca;

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
  private
    { Private declarations }
  protected
    function ValidarObrigatorios: boolean; override;
    procedure Filtrar; override;
  public
    { Public declarations }
  end;

var
  formCadastroProfessores: TformCadastroProfessores;

implementation

{$R *.dfm}

procedure TformCadastroProfessores.frameFiltro1btnFiltrarClick(Sender: TObject);
begin
  inherited;
  qrDados.SQL.Add('SELECT * FROM PROFESSORES ');
  qrDados.SQL.Add('WHERE 1 = 1 ');
  if trim(frameFiltro1.edPesquisa.Text) <> '' then
    Filtrar;
  qrDados.Open;
end;

procedure TformCadastroProfessores.Filtrar;
begin
  if (frameFiltro1.cbBusca.Text = '') or (frameFiltro1.cbBusca.Text = 'Nome') then
  begin
    try
      qrDados.SQL.Add('AND UPPER(TRIM(NOME)) LIKE '
                      + QuotedStr('%' + UpperCase(Trim(frameFiltro1.edPesquisa.Text))
                      + '%'));
    except
      MsgErro('Houve um erro inesperado ao filtrar!');
    end;
  end
  else if frameFiltro1.cbBusca.Text = ('CPF') then
  begin
    try
      qrDados.SQL.Add('AND (TRIM(CPF)) = '
                     + QuotedStr(Trim(frameFiltro1.edPesquisa.Text)));
    except
      MsgErro('Houve um erro inesperado ao filtrar!');
    end;
  end;
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
