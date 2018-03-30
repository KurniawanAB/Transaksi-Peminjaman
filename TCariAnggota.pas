unit TCariAnggota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFCariAnggota = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Cari;
  end;

var
  FCariAnggota: TFCariAnggota;

implementation

{$R *.dfm}

uses TUDM, TPeminjaman;

procedure TFCariAnggota.Cari;
  begin
    with DM.CariAnggota do
    begin
      if Edit1.Text = '' then
         Edit1.Text := ''
      else if (ComboBox1.Text = '- Pilih -') then
        begin
          ShowMessage('Silahkan Pilih Kriteria Pencarian');
          Edit1.Clear;
        end
      else
      if ComboBox1.ItemIndex = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'select NoInduk, NamaSiswa, Kelas from tsiswa where NoInduk Like ''%'+Edit1.Text+'%''';
          Open;
        end
      else if ComboBox1.ItemIndex = 1 then
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'select NoInduk, NamaSiswa, Kelas from tsiswa where NamaSiswa Like ''%'+Edit1.Text+'%''';
          Open;
        end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select NoInduk, NamaSiswa, Kelas from tsiswa where Kelas Like ''%'+Edit1.Text+'%''';
        Open;
      end;
    end;
  end;

procedure TFCariAnggota.Edit1Change(Sender: TObject);
  begin
    Cari;
    begin
      with DM.CariBuku do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select NoInduk, NamaSiswa, Kelas from tsiswa';
        Open;
      end;
    end;
  end;

procedure TFCariAnggota.FormShow(Sender: TObject);
  begin
    ComboBox1.Text  := '- Pilih -';
    Edit1.Clear;
  end;

procedure TFCariAnggota.Button1Click(Sender: TObject);
  var
    i : integer;
  begin
        with DM.CariAnggota do
        begin
          FPeminjaman.NoInduk.Text  := FieldByName('NoInduk').AsString;
        end;
      Close;
  end;

procedure TFCariAnggota.Button2Click(Sender: TObject);
  begin
    Close;
  end;

end.
