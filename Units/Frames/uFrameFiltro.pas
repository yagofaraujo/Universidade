unit uFrameFiltro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TframeFiltro = class(TFrame)
    lblCampos: TLabel;
    lblPesquisa: TLabel;
    btnFiltrar: TButton;
    cbBusca: TComboBox;
    edPesquisa: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
