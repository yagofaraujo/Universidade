unit uFormDadosBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, uFrameBotoesCrud,
  Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFrameFiltro, uDmDados,
  uFrameConfirmarInsercao;

type
  TformDadosBase = class(TformBase)
    pnGridBotoes: TPanel;
    frameBotoesLaterais1: TframeBotoesCrud;
    pcPrincipal: TPageControl;
    pnInferiorFiltro: TPanel;
    frameFiltro1: TframeFiltro;
    qrDados: TFDQuery;
    dsDados: TDataSource;
    tsGrid: TTabSheet;
    tsEdit: TTabSheet;
    DBGrid1: TDBGrid;
    pnEditBotoes: TPanel;
    frameInsercaoECancelamento1: TframeInsercaoECancelamento;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure frameBotoesLaterais1btnNovoClick(Sender: TObject);
    procedure frameBotoesLaterais1btnEditarClick(Sender: TObject);
    procedure frameBotoesLaterais1btnExcluirClick(Sender: TObject);
    procedure frameInsercaoECancelamento1btnSalvarClick(Sender: TObject);
    procedure frameInsercaoECancelamento1btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure EsconderAbas;
    function ContinuarIncluindo : boolean;
  protected
    function ValidarObrigatorios: boolean; virtual;
  public
    { Public declarations }
  end;

var
  formDadosBase: TformDadosBase;

implementation

{$R *.dfm}

procedure TformDadosBase.FormShow(Sender: TObject);
begin
  inherited;
  EsconderAbas;
end;

function TformDadosBase.ContinuarIncluindo: boolean;
begin
  if frameInsercaoECancelamento1.cbContinuarIncluindo.Checked then
    Result := true
  else
    Result := false;
end;

procedure TformDadosBase.EsconderAbas;
Var
  I: Integer;
begin
  for I := 0 to pcPrincipal.PageCount - 1 do
    pcPrincipal.Pages[I].TabVisible := false;

  pcPrincipal.ActivePage := tsGrid;
end;

procedure TformDadosBase.frameBotoesLaterais1btnNovoClick(Sender: TObject);
begin
  inherited;
  pcPrincipal.ActivePage := tsEdit;
  //qrDados.Append;
  //cbContinuarIncluindo.Enabled := true;
end;

procedure TformDadosBase.frameInsercaoECancelamento1btnCancelarClick(
  Sender: TObject);
begin
  inherited;
  //qrDados.Cancel;
  pcPrincipal.ActivePage := tsGrid;
end;

procedure TformDadosBase.frameInsercaoECancelamento1btnSalvarClick(
  Sender: TObject);
begin
  inherited;
  if ValidarObrigatorios then
  begin
    if ContinuarIncluindo then
    begin
      // qrDados.Post;
      // qrDados.Append;
    end
    else
    begin
      //qrDados.Post;
      pcPrincipal.ActivePage := tsGrid;
    end;
  end;

end;

function TformDadosBase.ValidarObrigatorios: boolean;
begin
  Result := True;
end;

procedure TformDadosBase.frameBotoesLaterais1btnEditarClick(Sender: TObject);
begin
  inherited;
  //qrDados.Edit;
  pcPrincipal.ActivePage := tsEdit;

end;

procedure TformDadosBase.frameBotoesLaterais1btnExcluirClick(Sender: TObject);
begin
  inherited;
  qrDados.Delete;
end;

procedure TformDadosBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  formDadosBase := Nil;
end;

end.