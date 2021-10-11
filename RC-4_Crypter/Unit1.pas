unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  RC4;

procedure TForm1.Button1Click(Sender: TObject);
const
  BLOCKSIZE: Integer = 1024;
var
  RC4: TRC4Context;
  Filename: string;
  source, dest: TFileStream;
  Len: Int64;
  SourceBuffer, DestBuffer: Pointer;
begin
  Filename := 'D:\Tmp\RC4Demo\Unit1.pas';
  source := TFileStream.Create(Filename, fmOpenRead);
  dest := TFileStream.Create(Filename + '.foo', fmCreate);
  try
    GetMem(SourceBuffer, BLOCKSIZE);
    GetMem(DestBuffer, BLOCKSIZE);
    try
      RC4Init(RC4, 'Foobar');
      Progressbar1.Max := source.Size;
      while source.Position < source.Size do
      begin
        if source.Size - source.Position > BLOCKSIZE then
          Len := BLOCKSIZE
        else
          Len := source.Size - source.Position;
        Progressbar1.Position := source.Position;
        Progressbar1.Refresh;
        source.ReadBuffer(SourceBuffer^, Len);
        RC4Code(RC4, SourceBuffer^, DestBuffer^, len);
        dest.WriteBuffer(DestBuffer^, Len);
      end;
      RC4Done(RC4);
    finally
      FreeMemory(SourceBuffer);
      FreeMemory(DestBuffer);
    end;
  finally
    FreeAndNil(source);
    FreeAndnIl(dest);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  RC4: TRC4Context;
  s, s1: String;
begin
  s := Edit1.Text;
  setlength(s1, length(s));
  RC4Init(RC4, 'foo');
  RC4Code(RC4, s[1], s1[1], length(Edit1.Text));
  RC4Done(RC4);
  Edit2.Text := s1;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  RC4: TRC4Context;
  s, s1: String;
begin
  s := Edit2.Text;
  setlength(s1, length(s));
  RC4Init(RC4, 'foo');
  RC4Code(RC4, s[1], s1[1], length(Edit1.Text));
  RC4Done(RC4);
  Edit3.Text := s1;
end;

end.

