unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Net.HttpClient, System.Net.Mime,
  Vcl.StdCtrls, Vcl.FileCtrl, System.JSON, System.IOUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,System.IniFiles,RESTRequest4D;

type
  TForm1 = class(TForm)
    qry_arquivos: TFDMemTable;
    dsArquivos: TDataSource;
    qry_arquivosid: TAutoIncField;
    qry_arquivospath: TStringField;
    qry_arquivostipo: TStringField;
    qry_arquivosfile_name: TStringField;
    PageControl1: TPageControl;
    tb_01: TTabSheet;
    tb_02: TTabSheet;
    btnListaDocs: TButton;
    btnEnvioArq: TButton;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Button1: TButton;
    pg_config: TPageControl;
    tb_conf_webservice: TTabSheet;
    tb_config_nfe: TTabSheet;
    GroupBox1: TGroupBox;
    txtUrlNFeNFCeInutilizacao: TEdit;
    Label3: TLabel;
    txtUrlNFeNFCeAut: TEdit;
    Label1: TLabel;
    txtUrlNFeNFCeEventos: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    txtNFCeAut: TEdit;
    txtNFeAut: TEdit;
    Button2: TButton;
    Button3: TButton;
    txtNFeEnv: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    txtNFCeEvent: TEdit;
    Button4: TButton;
    btnev: TButton;
    Label8: TLabel;
    txtNFCeInut: TEdit;
    Label9: TLabel;
    Button5: TButton;
    Label10: TLabel;
    txtNFeInut: TEdit;
    Button6: TButton;
    Button7: TButton;
    qry_arquivosdata_criacao: TDateTimeField;
    qry_arquivosdata_modificacao: TDateTimeField;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnEnvioArqClick(Sender: TObject);
    procedure btnListaDocsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnevClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ListarArquivos(Diretorio, TpArquivo: string; Sub: Boolean);
    function TemAtributo(Attr, Val: Integer): Boolean;
    function FileTime2DateTime(FileTime: TFileTime): TDateTime;
    function UploadFile(Url, Key, Arquivo: String): Boolean;
    procedure Gravar;
    procedure Ler;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  SELDIRHELP = 1000;

procedure TForm1.Button1Click(Sender: TObject);
var
  LRequest: THTTPClient;
  LFormData: TMultipartFormData;
  LResponse: TStringStream;
  Result: string;
begin
  LRequest := THTTPClient.Create;
  LFormData := TMultipartFormData.Create();
  LResponse := TStringStream.Create;
  try
    LFormData.AddField('key', 'SUA_CHAVE_DE_INTEGRACAO');
    LFormData.AddFile('file',
      ExtractFilePath(ParamStr(0)) + 'exemplo-nfe.xml');
    // You can also use the AddStream method if it's available
    LRequest.Post('https://seu-dominio.example/api/docs/nfenfce/upload',
      LFormData, LResponse);
    Result := LResponse.DataString;
    ShowMessage(Result);
  finally
    LFormData.Free;
    LResponse.Free;
    LRequest.Free;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Dir: string;
begin
  if Length(txtNFeAut.Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := txtNFeAut.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    txtNFeAut.Text := Dir;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Dir: string;
begin
  if Length(txtNFCeAut.Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := txtNFCeAut.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    txtNFCeAut.Text := Dir;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Dir: string;
begin
  if Length(txtNFCeEvent.Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName) + '\CTe'
  else
    Dir := txtNFCeEvent.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    txtNFCeEvent.Text := Dir;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  Dir: string;
begin
  if Length(txtNFCeInut.Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := txtNFCeInut.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    txtNFCeInut.Text := Dir;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  Dir: string;
begin
  if Length(txtNFeInut.Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := txtNFeInut.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    txtNFeInut.Text := Dir;
end;


procedure TForm1.Button7Click(Sender: TObject);
begin
  Gravar;
  Ler;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  LRequest: THTTPClient;
  LFormData: TMultipartFormData;
  LResponse: TStringStream;
  vRetJson: TJsonObject;
  vResult: string;
begin


  LRequest := THTTPClient.Create;
  LFormData := TMultipartFormData.Create();
  LResponse := TStringStream.Create;

  try

    LFormData.AddField('id', '1');
    LFormData.AddField('caption', 'Segue boleto mensal');
    LFormData.AddFile('file', ExtractFilePath(ParamStr(0)) + 'exemplo.pdf');

    try
      LRequest.Post('https://seu-servico.example/v3/rest/sendMessage/instancia/document', LFormData, LResponse);
      vResult := LResponse.DataString;

      Memo1.Text := vResult;

    except
      on E: Exception do
      begin
        Memo1.Lines.Clear;
        Memo1.Lines.Add(E.Message);
      end;
    end;

  finally
    LFormData.Free;
    LResponse.Free;
    LRequest.Free;
  end;


end;

procedure TForm1.btnevClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(txtNFeEnv.Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := txtNFeEnv.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    txtNFeEnv.Text := Dir;

end;

procedure TForm1.btnEnvioArqClick(Sender: TObject);
var
  Diretorio: string;
begin
  qry_arquivos.First;
  while not qry_arquivos.Eof do
  begin
    if qry_arquivostipo.AsString = 'NFE_NFCE' then
    begin
      Application.ProcessMessages;
      qry_arquivos.DisableControls;
      UploadFile(txtUrlNFeNFCeAut.Text, 'SUA_CHAVE_DE_INTEGRACAO', qry_arquivospath.AsString);
      qry_arquivos.EnableControls;
    end;
    {if qry_arquivostipo.AsString = 'NFE_NFCE_CANC_CCE' then
    begin
      Application.ProcessMessages;
      qry_arquivos.DisableControls;
      UploadFile(txtUrlNFeNFCeEventos.Text, 'SUA_CHAVE_DE_INTEGRACAO', qry_arquivospath.AsString);
      qry_arquivos.EnableControls;
    end;
    if qry_arquivostipo.AsString = 'NFE_NFCE_INUTILIZACAO' then
    begin
    Application.ProcessMessages;
      qry_arquivos.DisableControls;
      UploadFile(txtUrlNFeNFCeInutilizacao.Text, 'SUA_CHAVE_DE_INTEGRACAO', qry_arquivospath.AsString);
      qry_arquivos.EnableControls;
    end;  }

    qry_arquivos.Next;
  end;

  qry_arquivos.EmptyDataSet;

end;

procedure TForm1.btnListaDocsClick(Sender: TObject);
begin
  ListarArquivos(txtNFeAut.Text,'NFE_NFCE', true);
  ListarArquivos(txtNFCeAut.Text,'NFE_NFCE', true);
  ListarArquivos(txtNFeEnv.Text,'NFE_NFCE_CANC_CCE', true);
  ListarArquivos(txtNFCeEvent.Text,'NFE_NFCE_CANC_CCE', true);
 ListarArquivos(txtNFeInut.Text,'NFE_NFCE_INUTILIZACAO', true);
 ListarArquivos(txtNFCeInut.Text,'NFE_NFCE_INUTILIZACAO', true);
end;

function TForm1.FileTime2DateTime(FileTime: TFileTime): TDateTime;
var
  LocalFileTime: TFileTime;
  SystemTime: TSystemTime;
begin
  FileTimeToLocalFileTime(FileTime, LocalFileTime);
  FileTimeToSystemTime(LocalFileTime, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  qry_arquivos.Open;
  if dsArquivos.State in [dsBrowse] then
  begin
    qry_arquivos.EmptyDataSet;
  end;
  Ler;
end;

procedure TForm1.Gravar;
var
  IniFile: String;
  Ini: TIniFile;
begin
  IniFile := ExtractFileDir(application.ExeName) + '\Config.ini';

  Ini := TIniFile.Create(IniFile);
  try

    Ini.WriteString('NFe', 'URL_NFE_AUT', txtUrlNFeNFCeAut.Text);
    Ini.WriteString('NFe', 'URL_NFE_EVENT', txtUrlNFeNFCeEventos.Text);
    Ini.WriteString('NFe', 'URL_NFE_INUT', txtUrlNFeNFCeInutilizacao.Text);
    Ini.WriteString('NFe', 'PATH_NFE_AUT', txtNFeAut.Text);
    Ini.WriteString('NFe', 'PATH_NFE_EVENT', txtNFeEnv.Text);
    Ini.WriteString('NFe', 'PATH_NFE_INUT', txtNFeInut.Text);
    Ini.WriteString('NFe', 'PATH_NFCE_AUT', txtNFCeAut.Text);
    Ini.WriteString('NFe', 'PATH_NFCE_EVENT', txtNFCeEvent.Text);
    Ini.WriteString('NFe', 'PATH_NFCE_INUT', txtNFCeInut.Text);

  finally
    Ini.Free;
  end;
end;

procedure TForm1.Ler;
var
  IniFile: String;
  Ini: TIniFile;
begin
  IniFile := ExtractFileDir(application.ExeName) + '\Config.ini';

  Ini := TIniFile.Create(IniFile);
  try

    txtUrlNFeNFCeAut.Text := Ini.ReadString('NFe', 'URL_NFE_AUT', '');
    txtUrlNFeNFCeEventos.Text := Ini.ReadString('NFe', 'URL_NFE_EVENT', '');
    txtUrlNFeNFCeInutilizacao.Text := Ini.ReadString('NFe', 'URL_NFE_INUT', '');
    txtNFeAut.Text := Ini.ReadString('NFe', 'PATH_NFE_AUT', '');
    txtNFeEnv.Text := Ini.ReadString('NFe', 'PATH_NFE_EVENT', '');
    txtNFeInut.Text := Ini.ReadString('NFe', 'PATH_NFE_INUT', '');
    txtNFCeAut.Text := Ini.ReadString('NFe', 'PATH_NFCE_AUT', '');
    txtNFCeEvent.Text := Ini.ReadString('NFe', 'PATH_NFCE_EVENT', '');
    txtNFCeInut.Text := Ini.ReadString('NFe', 'PATH_NFCE_INUT', '');

  finally
    Ini.Free;
  end;

end;

procedure TForm1.ListarArquivos(Diretorio, TpArquivo: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome,TempTpArquivo: string;
begin
  Ret := FindFirst(Diretorio + '\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = true then
          begin
            TempNome := Diretorio + '\' + F.Name;
            TempTpArquivo := TpArquivo;
            ListarArquivos(TempNome, TempTpArquivo, true);
          end;
      end
      else
      begin
        Application.ProcessMessages;
        qry_arquivos.DisableControls;
        qry_arquivos.Append;
        qry_arquivospath.AsString := Diretorio + '\' + F.Name;
        qry_arquivosfile_name.AsString := F.Name;
        qry_arquivosdata_criacao.AsDateTime     := FileTime2DateTime(f.FindData.ftCreationTime);
        qry_arquivosdata_modificacao.AsDateTime := FileTime2DateTime(f.FindData.ftLastWriteTime);
        qry_arquivostipo.AsString := TpArquivo;
        qry_arquivos.Post;
        qry_arquivos.EnableControls;
      end;
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

function TForm1.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

function TForm1.UploadFile(Url, Key, Arquivo: String): Boolean;
var
  LRequest: THTTPClient;
  LFormData: TMultipartFormData;
  LResponse: TStringStream;
  vRetJson: TJsonObject;
  vResult: string;
begin
  Result := false;

  LRequest := THTTPClient.Create;
  LFormData := TMultipartFormData.Create();
  LResponse := TStringStream.Create;

  try
    LFormData.AddField('key', Key);
    LFormData.AddFile('file', Arquivo);

    try
      LRequest.Post(Url, LFormData, LResponse);
      vResult := LResponse.DataString;

      vRetJson := TJsonObject.ParseJSONValue(vResult) as TJsonObject;

      if vRetJson.GetValue('msg').Value = '100' then
      begin
        Memo1.Lines.Clear;
        Memo1.Lines.Add('Status : ' + vRetJson.GetValue('msg').Value);
        Result := true;
      end;

    except
      on E: Exception do
      begin
        Memo1.Lines.Clear;
        Memo1.Lines.Add(E.Message);
      end;
    end;

  finally
    LFormData.Free;
    LResponse.Free;
    LRequest.Free;
  end;

end;

end.
