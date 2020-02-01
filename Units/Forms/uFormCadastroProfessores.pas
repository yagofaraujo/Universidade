unit uFormCadastroProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDadosBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uFrameConfirmarInsercao, uFrameFiltro, uFrameBotoesCrud, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TformCadastroProfessores = class(TformDadosBase)
    qrDadosID: TIntegerField;
    qrDadosCPF: TStringField;
    qrDadosNOME: TStringField;
    qrDadosTELEFONE: TStringField;
    lblCPF: TLabel;
    edCPF: TDBEdit;
    lblNome: TLabel;
    edNome: TDBEdit;
    lblTelefone: TLabel;
    edTelefone: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastroProfessores: TformCadastroProfessores;

implementation

{$R *.dfm}

procedure TformCadastroProfessores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  formCadastroProfessores := Nil;
end;

end.