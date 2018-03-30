unit TCariBuku;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFCariBuku = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Cari;
  end;

var
  FCariBuku: TFCariBuku;

implementation

{$R *.dfm}

uses TUDM, TPeminjaman;

procedure TFCariBuku.Cari;
  begin
    with DM.CariBuku do
    begin
      if Edit1.Text = '' then
         Edit1.Text := ''
      else if (ComboBox1.Text = '-Berdasarkan-') then
        begin
          ShowMessage('Silahkan Pilih Kriteria Pencarian');
          Edit1.Clear;
        end
      else
      if ComboBox1.ItemIndex = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT a.`KodeBuku`, a.`JudulBuku`,a.`Pengarang`, a.`QTY`, a.`Pinjam`, (a.`QTY` - a.`Pinjam`) AS stok'+' '
                      +'FROM buku a'+' '
                      +'WHERE a.KodeBuku Like ''%'+Edit1.Text+'%''';
          Open;
        end
      else
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT a.`KodeBuku`, a.`JudulBuku`,a.`Pengarang`, a.`QTY`, a.`Pinjam`, (a.`QTY` - a.`Pinjam`) AS stok'+' '
                      +'FROM buku a'+' '
                      +'WHERE a.JudulBuku Like ''%'+Edit1.Text+'%''';
          Open;
        end;
    end;
  end;

procedure TFCariBuku.Button1Click(Sender: TObject);
  var
    i : integer;
  begin
    if DM.CariBuku.IsEmpty then
    else
    begin
      for i := 0 to DBGrid1.SelectedRows.Count - 1 do
      begin
        DM.CariBuku.GotoBookmark(Pointer(DBGrid1.SelectedRows[i]));
        {Peringatan Jika Buku Yang Dicari Kosong}
        if DM.CariBuku.FieldByName('stok').AsInteger = 0 then
          ShowMessage('Buku Yang Anda Pilih Sedang Kosong !')
        else
        {Peringatan Jika Jumlah Buku Melebihi Batas Maksimal Peminjaman}
        if FPeminjaman.StringGrid1.RowCount > FPeminjaman.BatasPinjam.Value  then
          ShowMessage('Tidak Dapat Memilih Buku, Karena Melebihi Batas Pinjam !')
        else
        begin
          with FPeminjaman.StringGrid1 do
          begin
            RowCount              := RowCount + 1;
            Cells[1,RowCount - 1] := DM.CariBuku.FieldByName('KodeBuku').AsString;
            Cells[2,RowCount - 1] := DM.CariBuku.FieldByName('JudulBuku').AsString;
            Cells[3,RowCount - 1] := '1';
          end;
          Close
          {Menutup Form Jika Buku Yang Dicari Tersedia Stoknya}
        end;
        FPeminjaman.HapusDataSama;
        FPeminjaman.NoUrut;
      end;
    end;
  end;

procedure TFCariBuku.Button2Click(Sender: TObject);
  begin
    Close;
  end;

procedure TFCariBuku.Edit1Change(Sender: TObject);
  begin
    Cari;
    if Edit1.Text = '' then
    begin
      with DM.CariBuku do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT a.`KodeBuku`, a.`JudulBuku`,a.`Pengarang`, a.`QTY`, a.`Pinjam`, (a.`QTY` - a.`Pinjam`) AS stok'+' '
                    +'FROM buku a';
        Open;
      end;
    end;
  end;

procedure TFCariBuku.FormShow(Sender: TObject);
  begin
    ComboBox1.Text  := '-Berdasarkan-';
    Edit1.Clear;
  end;

end.
