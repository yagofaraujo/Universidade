unit uFrameConfirmarInsercao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TframeInsercaoECancelamento = class(TFrame)
    btnSalvar: TButton;
    btnCancelar: TButton;
    cbContinuarIncluindo: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
