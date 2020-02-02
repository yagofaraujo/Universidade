unit uFormDadosBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, uFrameBotoesCrud,
  Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFrameFiltro, uDmDados,
  uFrameConfirmarInsercao, uBiblioteca, Vcl.StdCtrls;

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
    DBGrid: TDBGrid;
    pnEditBotoes: TPanel;
    frameInsercaoECancelamento1: TframeInsercaoECancelamento;
    btnSair: TButton;
    pnEditEdits: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure frameBotoesLaterais1btnNovoClick(Sender: TObject);
    procedure frameBotoesLaterais1btnEditarClick(Sender: TObject);
    procedure frameBotoesLaterais1btnExcluirClick(Sender: TObject);
    procedure frameInsercaoECancelamento1btnSalvarClick(Sender: TObject);
    procedure frameInsercaoECancelamento1btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure frameFiltro1btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    procedure EsconderAbas;
  protected
    function ContinuarIncluindo : boolean; virtual;
    function ValidarObrigatorios: boolean; virtual;
    procedure Filtrar; virtual;
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
  qrDados.Open;
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
  frameInsercaoECancelamento1.cbContinuarIncluindo.Enabled := true;
  pcPrincipal.ActivePage := tsEdit;
  qrDados.Append;
  pnEditEdits.SetFocus;
end;

procedure TformDadosBase.frameFiltro1btnFiltrarClick(Sender: TObject);
begin
  inherited;
  qrDados.SQL.Clear;
end;

procedure TformDadosBase.frameBotoesLaterais1btnEditarClick(Sender: TObject);
begin
  inherited;
  frameInsercaoECancelamento1.cbContinuarIncluindo.Checked := false;
  frameInsercaoECancelamento1.cbContinuarIncluindo.Enabled := false;
  pcPrincipal.ActivePage := tsEdit;
  qrDados.Edit;
  pnEditEdits.SetFocus;
end;

procedure TformDadosBase.frameBotoesLaterais1btnExcluirClick(Sender: TObject);
begin
  inherited;
  try
    if MsgConfirmacao('Deseja realmente excluir este registro?') then
      qrDados.Delete;
  except
    on E: Exception do
    begin
      if E.Message.Contains('FOREIGN KEY') then
        MsgErro('Este dado está vinculado à outro registro. Certifique-se de'
          + ' remover todas as dependências antes de excluí-lo')
      else if E.Message.Contains('empty dataset') then
        MsgErro('Não há nenhum registro para ser excluído!')
      else
        MsgErro('Evento inesperado: ' + E.Message);
    end;
  end;
  DBGrid.SetFocus;
end;

procedure TformDadosBase.frameInsercaoECancelamento1btnSalvarClick(
  Sender: TObject);
begin
  inherited;
  try
    if ValidarObrigatorios then
    begin
      if ContinuarIncluindo then
      begin
        qrDados.Post;
        qrDados.Append;
        pnEditEdits.SetFocus;
      end
      else
      begin
        qrDados.Post;
        pcPrincipal.ActivePage := tsGrid;
      end;
    end;
  except
    on E: Exception do
    begin
      if E.Message.Contains('UNIQUE KEY') then
        MsgErro('Não é permitido inserir registros duplicados para valores únicos!')
      else if E.Message.Contains('FOREIGN KEY') then
        MsgErro('Verifique se há dados existentes com os códigos informados!')
      else
        MsgErro('Evento inesperado: ' + E.Message);
    end;
  end;
end;

procedure TformDadosBase.frameInsercaoECancelamento1btnCancelarClick(
  Sender: TObject);
begin
  inherited;
  if msgConfirmacao('Deseja realmente cancelar os registros?') then
  begin
    qrDados.Cancel;
    pcPrincipal.ActivePage := tsGrid;
  end;
  frameInsercaoECancelamento1.cbContinuarIncluindo.Checked := false;
end;

procedure TformDadosBase.btnSairClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

function TformDadosBase.ContinuarIncluindo: boolean;
begin
  if frameInsercaoECancelamento1.cbContinuarIncluindo.Checked then
    Result := true
  else
    Result := false;
end;

function TformDadosBase.ValidarObrigatorios: boolean;
begin
  Result := True;
end;

procedure TformDadosBase.Filtrar;
begin
  if (frameFiltro1.cbBusca.Text = '') then
    frameFiltro1.cbBusca.ItemIndex := 0;

  if (frameFiltro1.cbBusca.Text = 'Nome') then
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
  end
  else if frameFiltro1.cbBusca.Text = ('Matrícula') then
  begin
    try
      qrDados.SQL.Add('AND (TRIM(M.ID)) = '
                     + QuotedStr(Trim(frameFiltro1.edPesquisa.Text)));
    except
      MsgErro('Houve um erro inesperado ao filtrar!');
    end;
  end
  else if (frameFiltro1.cbBusca.Text = 'Aluno') then
  begin
    try
      qrDados.SQL.Add('AND UPPER(TRIM(A.NOME)) LIKE ' // P.NOME = Nome Professor
                      + QuotedStr('%' + UpperCase(Trim(frameFiltro1.edPesquisa.Text))
                      + '%'));
    except
      MsgErro('Houve um erro inesperado ao filtrar!');
    end;
  end
  else if (frameFiltro1.cbBusca.Text = 'Professor') then
  begin
    try
      qrDados.SQL.Add('AND UPPER(TRIM(P.NOME)) LIKE ' // P.NOME = Nome Professor
                      + QuotedStr('%' + UpperCase(Trim(frameFiltro1.edPesquisa.Text))
                      + '%'));
    except
      MsgErro('Houve um erro inesperado ao filtrar!');
    end;
  end
  else if (frameFiltro1.cbBusca.Text = 'Disciplina') then
  begin
    try
      qrDados.SQL.Add('AND UPPER(TRIM(D.NOME)) LIKE ' // D.NOME = Nome Disciplina
                      + QuotedStr('%' + UpperCase(Trim(frameFiltro1.edPesquisa.Text))
                      + '%'));
    except
      MsgErro('Houve um erro inesperado ao filtrar!');
    end;
  end;
end;

procedure TformDadosBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrDados.Close;
  formDadosBase := Nil;
end;

end.
