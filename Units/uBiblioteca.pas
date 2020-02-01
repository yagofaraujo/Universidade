unit uBiblioteca;

interface
Uses
   Winapi.Windows, System.SysUtils, Vcl.Forms;


function EhNumero(Key: Char): boolean;

function MsgConfirmacao(pMensagem: string): boolean;
function MsgErro(pMensagem: string): boolean;
function MsgOK(pMensagem: string): boolean;

implementation

function EhNumero(Key: Char): boolean;
begin
  Result := CharInSet(Key, ['0'..'9']);
end;


function MsgConfirmacao(pMensagem: string): boolean;
begin
  Result := Application.MessageBox(PWideChar(pMensagem), 'Sistema Fortes Academy', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES;
end;

function MsgErro(pMensagem: string): boolean;
begin
  Result := Application.MessageBox(PWideChar(pMensagem), 'Sistema Fortes Academy', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1) = ID_YES;
end;

function MsgOK(pMensagem: string): boolean;
begin
  Result := Application.MessageBox(PWideChar(pMensagem), 'Sistema Fortes Academy', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1) = ID_YES;
end;

end.
