unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Samples.Spin, FireDAC.Stan.StorageBin;

type
  TForm1 = class(TForm)
    btnFDAppend: TButton;
    btnAppend: TButton;
    btnFDEmptyDataSet: TButton;
    btnEmptyDataSet: TButton;
    lblClientDataset: TLabel;
    lblFDMemTable: TLabel;
    btnSaveToFile: TButton;
    btnFDSaveToFile: TButton;
    btnLoadFromFile: TButton;
    btnFDLoadFromFile: TButton;
    btnSaveToStream: TButton;
    btnFDSaveToStream: TButton;
    btnFDLoadFromStream: TButton;
    btnLoadFromStream: TButton;
    lblRecordCount: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btnFDInsert: TButton;
    btnInsert: TButton;
    btnFDCopyData: TButton;
    btnCopyData: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFDAppendClick(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnFDEmptyDataSetClick(Sender: TObject);
    procedure btnLoadFromFileClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure btnFDSaveToFileClick(Sender: TObject);
    procedure btnFDLoadFromFileClick(Sender: TObject);
    procedure btnSaveToStreamClick(Sender: TObject);
    procedure btnFDSaveToStreamClick(Sender: TObject);
    procedure btnLoadFromStreamClick(Sender: TObject);
    procedure btnFDLoadFromStreamClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEmptyDataSetClick(Sender: TObject);
    procedure AjustaCount(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnFDInsertClick(Sender: TObject);
    procedure btnCopyDataClick(Sender: TObject);
    procedure btnFDCopyDataClick(Sender: TObject);
  private
    FStartTime: DWORD;
    FFDStream, FCDSStream: TMemoryStream;
    FClientDataSet: TClientDataSet;
    FFDMemTable: TFDMemTable;
    FCount: Integer;
    FTexto: TStrings;

    function NewFDMemTable: TFDMemTable;
    function NewClientDataSet: TClientDataSet;

    procedure ShowDuration(Sender: TObject);

    procedure CriaDataSets;
    procedure DestroyDataSets;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Faker;

{$R *.dfm}


procedure TForm1.btnFDAppendClick(Sender: TObject);
var
  I: Integer;
begin
  btnFDEmptyDataSetClick(nil);
  FStartTime := GetTickCount;
  FFDMemTable.BeginBatch;
  try
    for I := 1 to FCount do
    begin
      FFDMemTable.Append;
      FFDMemTable.FieldByName('ID').AsInteger := I;
      FFDMemTable.FieldByName('Status').AsString := 'Code' + IntToStr(i);
      FFDMemTable.FieldByName('Created').AsDateTime := Date();
      FFDMemTable.FieldByName('Volume').AsFloat := Random(10000);
      FFDMemTable.FieldByName('Descricao').AsString := TFaker.LOREM_IPSUM;
      FFDMemTable.FieldByName('Conteudo').AsString := FTexto.Text;
      TBlobField(FFDMemTable.FieldByName('Arquivo')).LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'pdf.pdf');

      FFDMemTable.Post;
    end;

  finally
    FFDMemTable.EndBatch;
  end;
  ShowDuration(Sender);
  lblFDMemTable.Caption := 'FDMemTable - ' + IntToStr(FFDMemTable.RecordCount);
end;

procedure TForm1.btnFDCopyDataClick(Sender: TObject);
var
  FDMemTable1, FDMemTable2: TFDMemTable;
begin
  FStartTime := GetTickCount;
  FDMemTable1 := TFDMemTable.Create(nil);
  FDMemTable2 := TFDMemTable.Create(nil);
  try
    FDMemTable1.LoadFromFile('FD.dat');
    FDMemTable2.Data := FDMemTable1.Data;
  finally
    FreeAndNil(FDMemTable1);
    FreeAndNil(FDMemTable2);
  end;
  ShowDuration(Sender);
end;

procedure TForm1.btnLoadFromFileClick(Sender: TObject);
begin
  btnEmptyDataSetClick(nil);
  FStartTime := GetTickCount;
  FClientDataSet.LoadFromFile('CDS.dat');
  ShowDuration(Sender);
  lblClientDataset.Caption := 'ClientDataset - ' + IntToStr(FClientDataSet.RecordCount);
end;

procedure TForm1.btnSaveToFileClick(Sender: TObject);
begin
  FStartTime := GetTickCount;
  FClientDataSet.SaveToFile('CDS.dat', dfBinary);
  ShowDuration(Sender);
  lblClientDataset.Caption := 'ClientDataset - ' + IntToStr(FClientDataSet.RecordCount);
end;

procedure TForm1.btnFDEmptyDataSetClick(Sender: TObject);
begin
  FStartTime := GetTickCount;
  FFDMemTable.EmptyDataSet;
  ShowDuration(Sender);
end;

procedure TForm1.btnFDInsertClick(Sender: TObject);
var
  I: Integer;
begin
  btnFDEmptyDataSetClick(nil);
  FStartTime := GetTickCount;
  FFDMemTable.BeginBatch;
  try
    for I := 1 to FCount do
    begin
      FFDMemTable.Insert;
      FFDMemTable.FieldByName('ID').AsInteger := I;
      FFDMemTable.FieldByName('Status').AsString := 'Code' + IntToStr(i);
      FFDMemTable.FieldByName('Created').AsDateTime := Date();
      FFDMemTable.FieldByName('Volume').AsFloat := Random(10000);
      FFDMemTable.FieldByName('Descricao').AsString := TFaker.LOREM_IPSUM;
      FFDMemTable.FieldByName('Conteudo').AsString := FTexto.Text;
      TBlobField(FFDMemTable.FieldByName('Arquivo')).LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'pdf.pdf');

      FFDMemTable.Post;
    end;

  finally
    FFDMemTable.EndBatch;
  end;
  ShowDuration(Sender);
  lblFDMemTable.Caption := 'FDMemTable - ' + IntToStr(FFDMemTable.RecordCount);
end;

procedure TForm1.btnEmptyDataSetClick(Sender: TObject);
begin
  FStartTime := GetTickCount;
  FClientDataSet.EmptyDataSet;
  ShowDuration(Sender);
  lblClientDataset.Caption := 'ClientDataset - ' + IntToStr(FClientDataSet.RecordCount);
end;

procedure TForm1.btnFDSaveToFileClick(Sender: TObject);
begin
  FStartTime := GetTickCount;
  FFDMemTable.SaveToFile('FD.dat', sfBinary);
  ShowDuration(Sender);
  lblFDMemTable.Caption := 'FDMemTable - ' + IntToStr(FFDMemTable.RecordCount);
end;

procedure TForm1.btnSaveToStreamClick(Sender: TObject);
begin
  FCDSStream.Clear;

  FStartTime := GetTickCount;
  FClientDataSet.SaveToStream(FCDSStream, dfBinary);
  ShowDuration(Sender);
  lblClientDataset.Caption := 'ClientDataset - ' + IntToStr(FClientDataSet.RecordCount);
end;

procedure TForm1.AjustaCount(Sender: TObject);
var
  iCount: Integer;
begin
  iCount := 0;

  if Sender = btn1 then
    iCount := 10
  else if Sender = btn2 then
    iCount := 100
  else if Sender = btn3 then
    iCount := 1000
  else if Sender = btn4 then
    iCount := 10000
  else if Sender = btn5 then
    iCount := 100000
  else if Sender = btn6 then
    iCount := 1000000
  else if Sender = btn7 then
    iCount := 10000000
  else if Sender = btn8 then
    iCount := 100000000;


  DestroyDataSets;
  FCount := iCount;
  lblRecordCount.Caption := IntToStr(iCount);
  CriaDataSets;
end;

procedure TForm1.CriaDataSets;
begin
  FFDMemTable := NewFDMemTable;
  FClientDataSet := NewClientDataSet;
end;

procedure TForm1.DestroyDataSets;
begin
  FreeAndNil(FFDMemTable);
  FreeAndNil(FClientDataSet);
end;

procedure TForm1.btnFDLoadFromFileClick(Sender: TObject);
begin
  btnFDEmptyDataSetClick(nil);
  FStartTime := GetTickCount;
  FFDMemTable.LoadFromFile('FD.dat', sfBinary);
  ShowDuration(Sender);
  lblFDMemTable.Caption := 'FDMemTable - ' + IntToStr(FFDMemTable.RecordCount);
end;

procedure TForm1.btnFDSaveToStreamClick(Sender: TObject);
begin
  FFDStream.Clear;
  FStartTime := GetTickCount;
  FFDMemTable.SaveToStream(FFDStream, sfBinary);
  ShowDuration(Sender);
  lblFDMemTable.Caption := 'FDMemTable - ' + IntToStr(FFDMemTable.RecordCount);
end;

procedure TForm1.btnInsertClick(Sender: TObject);
var
  I: Integer;
begin
  btnEmptyDataSetClick(nil);
  FStartTime := GetTickCount;
  FClientDataSet.DisableControls;
  try
    for I := 1 to FCount do
    begin
      FClientDataSet.Insert;
      FClientDataSet.FieldByName('ID').AsInteger := I;
      FClientDataSet.FieldByName('Status').AsString := 'Code' + I.ToString;
      FClientDataSet.FieldByName('Created').AsDateTime := Date();
      FClientDataSet.FieldByName('Volume').AsFloat := Random(10000);
      FClientDataSet.FieldByName('Descricao').AsString := TFaker.LOREM_IPSUM;
      FClientDataSet.FieldByName('Conteudo').AsString := FTexto.Text;
      TBlobField(FClientDataSet.FieldByName('Arquivo')).LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'pdf.pdf');
      FClientDataSet.Post;
    end;

  finally
    FClientDataSet.EnableControls;
  end;
  ShowDuration(Sender);
  lblClientDataset.Caption := 'ClientDataset - ' + IntToStr(FClientDataSet.RecordCount);
end;

procedure TForm1.btnFDLoadFromStreamClick(Sender: TObject);
begin
  btnFDEmptyDataSetClick(nil);
  FStartTime := GetTickCount;
  FFDStream.Position := 0;
  FFDMemTable.LoadFromStream(FFDStream, sfBinary);
  ShowDuration(Sender);
  lblFDMemTable.Caption := 'FDMemTable - ' + IntToStr(FFDMemTable.RecordCount);
end;

procedure TForm1.btnLoadFromStreamClick(Sender: TObject);
begin
  btnEmptyDataSetClick(nil);
  FStartTime := GetTickCount;
  FCDSStream.Position := 0;
  FClientDataSet.LoadFromStream(FCDSStream);
  ShowDuration(Sender);
  lblClientDataset.Caption := 'ClientDataset - ' + IntToStr(FClientDataSet.RecordCount);
end;

procedure TForm1.btnAppendClick(Sender: TObject);
var
  I: Integer;
begin
  btnEmptyDataSetClick(nil);
  FStartTime := GetTickCount;
  FClientDataSet.DisableControls;
  try
    for I := 1 to FCount do
    begin
      FClientDataSet.Append;
      FClientDataSet.FieldByName('ID').AsInteger := I;
      FClientDataSet.FieldByName('Status').AsString := 'Code' + I.ToString;
      FClientDataSet.FieldByName('Created').AsDateTime := Date();
      FClientDataSet.FieldByName('Volume').AsFloat := Random(10000);
      FClientDataSet.FieldByName('Descricao').AsString := TFaker.LOREM_IPSUM;
      FClientDataSet.FieldByName('Conteudo').AsString := FTexto.Text;
      TBlobField(FClientDataSet.FieldByName('Arquivo')).LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'pdf.pdf');
      FClientDataSet.Post;
    end;

  finally
    FClientDataSet.EnableControls;
  end;
  ShowDuration(Sender);
  lblClientDataset.Caption := 'ClientDataset - ' + IntToStr(FClientDataSet.RecordCount);
end;

procedure TForm1.btnCopyDataClick(Sender: TObject);
var
  FClientDataSet1, FClientDataSet2: TClientDataSet;
begin
  FStartTime := GetTickCount;
  FClientDataSet1 := TClientDataSet.Create(nil);
  FClientDataSet2 := TClientDataSet.Create(nil);
  try
    FClientDataSet1.LoadFromFile('CDS.dat');
    FClientDataSet2.Data := FClientDataSet1.Data;
  finally
    FreeAndNil(FClientDataSet1);
    FreeAndNil(FClientDataSet2);
  end;
  ShowDuration(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCDSStream := TMemoryStream.Create;
  FFDStream := TMemoryStream.Create;

  FTexto := TStringList.Create;
  FTexto.Add(TFaker.LOREM_IPSUM);
  FTexto.Add(TFaker.LOREM_IPSUM);
  FTexto.Add(TFaker.LOREM_IPSUM);
  FTexto.Add(TFaker.LOREM_IPSUM);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FCDSStream);
  FreeAndNil(FFDStream);
  FreeAndNil(FTexto);
end;

function TForm1.NewClientDataSet: TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);
  with Result do
  begin
    FieldDefs.Add('ID', ftInteger, 0, False);
    FieldDefs.Add('Status', ftString, 10, False);
    FieldDefs.Add('Created', ftDate, 0, False);
    FieldDefs.Add('Volume', ftFloat, 0, False);
    FieldDefs.Add('Descricao', ftString, 250, False);
    FieldDefs.Add('Conteudo', ftMemo, 2000, False);
    FieldDefs.Add('Arquivo', ftBlob);
    CreateDataSet;
    LogChanges := False;
  end;
end;

function TForm1.NewFDMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  with Result do
  begin
    FieldDefs.Add('ID', ftInteger, 0, False);
    FieldDefs.Add('Status', ftString, 10, False);
    FieldDefs.Add('Created', ftDate, 0, False);
    FieldDefs.Add('Volume', ftFloat, 0, False);
    FieldDefs.Add('Descricao', ftString, 250, False);
    FieldDefs.Add('Conteudo', ftMemo, 2000, False);
    FieldDefs.Add('Arquivo', ftBlob);
    CreateDataSet;
    LogChanges := False;
    FetchOptions.RecsMax := FCount;
    ResourceOptions.SilentMode := True;
    UpdateOptions.LockMode := lmNone;
    UpdateOptions.LockPoint := lpDeferred;
    UpdateOptions.FetchGeneratorsPoint := gpImmediate;
  end;
end;

procedure TForm1.ShowDuration(Sender: TObject);
var
  s: string;
  idx: Integer;
begin
  s := TButton(Sender).Caption;
  idx := s.IndexOf('-');
  if idx > 0 then
    s := s.Substring(0, idx);

  TButton(Sender).Caption := Format('%s-%dms', [s, (GetTickCount - FStartTime)]);
end;

end.
