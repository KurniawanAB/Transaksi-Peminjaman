unit TDaftarPeminjam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TFDaftarPeminjam = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Keluar: TButton;
    Pilih: TButton;
    procedure KeluarClick(Sender: TObject);
    procedure PilihClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Cari;
  end;

var
  FDaftarPeminjam: TFDaftarPeminjam;

implementation

{$R *.dfm}

uses TUDM, TPeminjaman;

procedure TFDaftarPeminjam.Cari;
  begin
  with DM.DaftarPeminjam do
    begin
      if Edit1.Text = '' then
         Edit1.Text  := ''
      else if ComboBox1.Text = '- Berdasarkan -' then
        begin
          ShowMessage('Silahkan Pilih Kriteria Pencarian');
          Edit1.Clear;
        end
      else
        if ComboBox1.ItemIndex = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'select tp.*, ts.NamaSiswa from tpeminjaman tp, tsiswa ts where tp.NoInduk=ts.NoInduk AND tp.NoPeminjaman Like ''%'+Edit1.Text+'%''';
          Open;
        end
      else
      if ComboBox1.ItemIndex = 1 then
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'select tp.*, ts.NamaSiswa from tpeminjaman tp, tsiswa ts where tp.NoInduk=ts.NoInduk AND tp.NoInduk Like ''%'+Edit1.Text+'%''';
          Open;
        end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select tp.*, ts.NamaSiswa from tpeminjaman tp, tsiswa ts where tp.NoInduk=ts.NoInduk AND ts.NamaSiswa Like ''%'+Edit1.Text+'%''';
        Open;
      end;
    end;
  end;

procedure TFDaftarPeminjam.Edit1Change(Sender: TObject);
  begin
    Cari;
    if Edit1.Text = '' then
    begin
      with DM.DaftarPeminjam do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select tp.*, ts.NamaSiswa from tpeminjaman tp, tsiswa ts where tp.NoInduk=ts.NoInduk';
        Open;
      end;
    end;
  end;

procedure TFDaftarPeminjam.FormShow(Sender: TObject);
  begin
    ComboBox1.Text  := '- Berdasarkan -';
    Edit1.Text      := '';
    DM.DaftarPeminjam.Refresh;
  end;

procedure TFDaftarPeminjam.KeluarClick(Sender: TObject);
  begin
    Close;
    FormShow(Sender);
  end;

procedure TFDaftarPeminjam.PilihClick(Sender: TObject);
  begin
    with DM.DaftarPeminjam do
    begin
      FPeminjaman.NoPeminjaman.Text := FieldByName('NoPeminjaman').AsString;
      FPeminjaman.NoInduk.Text      := FieldByName('NoInduk').AsString;
      FPeminjaman.DTPinjam.Date     := FieldByName('TglPinjam').AsDateTime;
      FPeminjaman.LamaPinjam.Text   := IntToStr(FieldByName('Lama').AsInteger);
      FPeminjaman.DTKembali.Date    := FieldByName('TglKembali').AsDateTime;
    end;
    FPeminjaman.Tampilkan;
    FPeminjaman.Simpan.Enabled      := False;
    FPeminjaman.DaftarBuku.Enabled    := False;
    FPeminjaman.Cari.Enabled := False;
    Close;
    FormShow(Sender);
  end;

end.
