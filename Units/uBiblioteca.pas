unit uBiblioteca;

interface
Uses
   Winapi.Windows, System.SysUtils, Vcl.Forms, IniFiles;


procedure SetarValorIni(pLocal, pSessao, pSubSessao, pValor: string);
function ReceberValorIni(pLocal, pSessao, pSubSessao: string): string;

function MsgConfirmacao(pMensagem: string): boolean;
function MsgErro(pMensagem: string): boolean;
function MsgOK(pMensagem: string): boolean;

implementation

procedure SetarValorIni(pLocal, pSessao, pSubSessao, pValor: string);
var
  Arquivo: TIniFile;
begin
  Arquivo := TIniFile.Create(pLocal);
  Arquivo.WriteString(pSessao, pSubSessao, pValor);
  Arquivo.Free;
end;

function ReceberValorIni(pLocal, pSessao, pSubSessao: string): string;
var
  Arquivo: TIniFile;
begin
  Arquivo := TIniFile.Create(pLocal);
  Result := Arquivo.ReadString(pSessao, pSubSessao, '');
  Arquivo.Free;
end;

function MsgConfirmacao(pMensagem: string): boolean;
begin
  Result := Application.MessageBox(PWideChar(pMensagem), 'F. University', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES;
end;

function MsgErro(pMensagem: string): boolean;
begin
  Result := Application.MessageBox(PWideChar(pMensagem), 'F. University', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1) = ID_YES;
end;

function MsgOK(pMensagem: string): boolean;
begin
  Result := Application.MessageBox(PWideChar(pMensagem), 'F. University', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1) = ID_YES;
end;

end.
