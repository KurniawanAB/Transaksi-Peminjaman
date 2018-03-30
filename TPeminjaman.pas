unit TPeminjaman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin,
  Math, strutils;

type
  TFPeminjaman = class(TForm)
    GroupBox1: TGroupBox;
    NoPeminjaman: TEdit;
    LamaPinjam: TSpinEdit;
    DTPinjam: TDateTimePicker;
    Cari: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    NoInduk: TEdit;
    NamaSiswa: TEdit;
    Label8: TLabel;
    NoPetugas: TEdit;
    NamaPetugas: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    BatasPinjam: TSpinEdit;
    Label11: TLabel;
    DTKembali: TDateTimePicker;
    DaftarBuku: TButton;
    StringGrid1: TStringGrid;
    Keluar: TButton;
    CetakBuktiPinjam: TButton;
    DaftarPeminjaman: TButton;
    Batal: TButton;
    Simpan: TButton;
    Edit1: TEdit;
    LabelKodeBuku: TLabel;
    Hapus: TButton;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LamaPinjamChange(Sender: TObject);
    procedure NoIndukChange(Sender: TObject);
    procedure CariClick(Sender: TObject);
    procedure NoPetugasChange(Sender: TObject);
    procedure DaftarPeminjamanClick(Sender: TObject);
    procedure HapusClick(Sender: TObject);
    procedure DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
    procedure BatalClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure DaftarBukuClick(Sender: TObject);
    procedure KeluarClick(Sender: TObject);
    procedure CetakBuktiPinjamClick(Sender: TObject);
  private
    { Private declarations }
    Procedure KodeAuto;
    Procedure SimpanDetail;
    procedure Aturkolom;
  public
    { Public declarations }
    Procedure HapusDataSama;
    Procedure NoUrut;
    Procedure Bersih;
    procedure Tampilkan;
    procedure UpdateSTOK;
    //Procedure UpdateSTOK_JIKADIHAPUS;
  end;

var
  FPeminjaman: TFPeminjaman;

implementation

uses
  TCariAnggota, TCariBuku, TDaftarPeminjam, TUDM;

{$R *.dfm}

procedure TFPeminjaman.SimpanClick(Sender: TObject);
  begin
    if (NoInduk.Text = '') then
      MessageDlg('Isi Siapa yang mau Pinjam !!',mtError,[mbOK],0)
    else if StringGrid1.RowCount = 1 then
      MessageDlg('Buku Yang Mau Dipinjam Masih Kosong !!',mtError,[mbOK],0)
    else
    begin
      if MessageDlg('Yakin Ingin Meminjam ? ',mtConfirmation,[mbYes, mbNo],0)=id_YES then
      begin
        with DM.Umum do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tpeminjaman (NoPeminjaman, NoInduk,TglPinjam, Bulan, TglKembali, Lama, Keterangan, IDUser) values (:a,:b,:c,:d,:e,:f,:g,:h)';
                      ParamByName('a').Value  := NoPeminjaman.Text;
                      ParamByName('b').Value  := NoInduk.Text;
                      ParamByName('c').Value  := FormatDateTime('yyyy-MM-dd',DTPinjam.Date);
                      ParamByName('d').Value  := FormatDateTime('yyyy-MM',DTPinjam.Date);
                      ParamByName('e').Value  := FormatDateTime('yyyy-MM-dd',DTKembali.Date);
                      ParamByName('f').Value  := LamaPinjam.Text;
                      ParamByName('g').Value  := '';
                      ParamByName('h').Value  := NoPetugas.Text;
          ExecSQL;
        end;
        SimpanDetail;
        UpdateSTOK;
        MessageDlg('Transaksi Peminjaman Telah Dilakukan !',mtInformation,[mbOK],0);
        if MessageDlg('Cetak Bukti Pembayaran ? ',mtConfirmation,[mbYes, mbNo],0)=id_YES then
        begin
          with DM.CetakBuktiPinjam do
          begin
             Close;
             SQL.Clear;
             SQL.Text := 'select tpd.NoPeminjaman, tpd.KodeBuku,tb.JudulBuku, tpd.Jumlah, tpd.Kembali, tp.NoInduk,ts.NamaSiswa, tp.TglPinjam, tp.Bulan, tp.TglKembali, '+
                         'tp.Lama, tp.Keterangan, tp.IDUser '+
                         'from tpeminjaman_det tpd '+
                         'inner join tpeminjaman tp on tpd.NoPeminjaman=tp.NoPeminjaman '+
                         'inner join tsiswa ts on tp.NoInduk=ts.NoInduk '+
                         'inner join buku tb on tpd.KodeBuku=tb.KodeBuku '+
                         'where tpd.NoPeminjaman = "'+NoPeminjaman.Text+'"';
            Open;
            begin
              DM.frxRCetakBuktiPinjam.LoadFromFile(ExtractFilePath(Application.ExeName)+'Laporan\CetakBuktiPinjam.fr3');
              DM.frxRCetakBuktiPinjam.ShowReport();
            end;
          end;
        end;
        FormShow(Sender);
      end;
    end;
  end;

Procedure TFPeminjaman.SimpanDetail;
  var
    xx : integer;
  begin
    for xx :=0 to StringGrid1.RowCount-2 do
    begin
      with DM.Umum do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tpeminjaman_det (NoPeminjaman, KodeBuku, Jumlah, Kembali) values (:a,:b,:c,:d)';
                    ParamByName('a').Value  := NoPeminjaman.Text;
                    ParamByName('b').Value  := StringGrid1.Cells[1,xx+1];
                    ParamByName('c').Value  := StringGrid1.Cells[3,xx+1];
                    ParamByName('d').Value  := '0';
        ExecSQL;
        Close;
      end;
    end;
  end;

Procedure TFPeminjaman.UpdateSTOK;
  var
    xx : integer;
    KodeBuku,Stok : String;
  begin
    for xx:=0 to StringGrid1.RowCount-2 do
    begin
      with DM.Umum do
      begin
        KodeBuku  := StringGrid1.Cells[1,xx+1];
        Stok      := StringGrid1.Cells[3,xx+1];
        Close;
        SQL.Clear;
        SQL.Text := 'update buku set pinjam=pinjam+"'+Stok+'" where kodebuku="'+KodeBuku+'"';
        ExecSQL;
        Close;
      end;
    end;
  end;

procedure TFPeminjaman.Tampilkan;
  begin
    Bersih;
    with DM.Umum do
    begin
      Close;
      SQL.Text := 'select tpd.*, tb.JudulBuku from tpeminjaman_det tpd, buku tb where tpd.KodeBuku = tb.KodeBuku and tpd.NoPeminjaman ="'+NoPeminjaman.Text+'"';
      Open;
      while Not Eof do
      begin
        With StringGrid1 Do
        begin
          RowCount:= RowCount+ 1;
          Cells[1,RowCount - 1]:=FieldByName('KodeBuku').AsString;
          Cells[2,RowCount - 1]:=FieldByName('JudulBuku').AsString;
          Cells[3,RowCount - 1]:=FieldByName('Jumlah').AsString;
          NoUrut;
        end;
      Next;
      end;
    end;
  end;

procedure TFPeminjaman.BatalClick(Sender: TObject);
  begin
    Bersih;
    FormShow(Sender);
  end;

Procedure TFPeminjaman.Bersih;
  var
    i:integer;
  begin
    for i := 1 to StringGrid1.RowCount - 1 do
    begin
      StringGrid1.Rows[i].Clear;
      StringGrid1.RowCount:=1;
    end;
  end;

procedure TFPeminjaman.CariClick(Sender: TObject);
  begin
    FCariAnggota.ShowModal;
  end;

procedure TFPeminjaman.CetakBuktiPinjamClick(Sender: TObject);
  begin
    if NoInduk.Text = '' then
    else
    if MessageDlg('Cetak Bukti Peminjaman ? ',mtConfirmation,[mbYes, mbNo],0)=id_YES then
    begin
      with DM.CetakBuktiPinjam do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select tpd.NoPeminjaman, tpd.KodeBuku,tb.JudulBuku, tpd.Jumlah, tpd.Kembali, tp.NoInduk,ts.NamaSiswa, tp.TglPinjam, tp.Bulan, tp.TglKembali, '+
                      'tp.Lama, tp.Keterangan, tp.IDUser '+
                      'from tpeminjaman_det tpd '+
                      'inner join tpeminjaman tp on tpd.NoPeminjaman=tp.NoPeminjaman '+
                      'inner join tsiswa ts on tp.NoInduk=ts.NoInduk '+
                      'inner join buku tb on tpd.KodeBuku=tb.KodeBuku '+
                      'where tpd.NoPeminjaman = "'+NoPeminjaman.Text+'"';
        Open;
        if not DM.CetakBuktiPinjam.Eof then
          begin
            DM.frxRCetakBuktiPinjam.LoadFromFile(ExtractFilePath(Application.ExeName)+'Laporan\CetakBuktiPinjam.fr3');
            DM.frxRCetakBuktiPinjam.ShowReport();
          end
        else
        MessageDlg('Data Tidak Ditemukan!',mtInformation,[mbOK],0);
      end;
    end;
  end;

procedure TFPeminjaman.DaftarBukuClick(Sender: TObject);
  begin
    if NoInduk.Text = '' then
      MessageDlg('Silahkan Isi Atau Cari Peminjam !',mtError,[mbOK],0)
    else
    FCariBuku.ShowModal;
  end;

procedure TFPeminjaman.DaftarPeminjamanClick(Sender: TObject);
  begin
    FDaftarPeminjam.ShowModal;
  end;

procedure TFPeminjaman.NoIndukChange(Sender: TObject);
  begin
    with DM.Umum do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select namasiswa from tsiswa where noinduk="'+NoInduk.Text+'"';
      Open;
      NamaSiswa.Text  := FieldByName('namasiswa').AsString;
    end;
  end;

procedure TFPeminjaman.NoPetugasChange(Sender: TObject);
  begin
    with DM.Umum do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select tgs.NamaPetugas from tuser tu, tpetugas tgs where tu.IDUser=tgs.IDPetugas and tu.IDUser ="'+NoPetugas.Text+'"';
      Open;
      NamaPetugas.Text  := FieldByName('NamaPetugas').AsString;
    end;
  end;

Procedure TFPeminjaman.NoUrut;
  var
    x : integer;
  begin
    for x:=0 to StringGrid1.RowCount-1 do
    StringGrid1.Cells[0,x+1]:=IntToStr(x+1);
  end;

procedure TFPeminjaman.DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
  var
    i, j: Integer;
  begin
    with yourStringGrid do
    begin
      for i := ARow to RowCount-2 do
        for j := 0 to ColCount-1 do
          Cells[j, i] := Cells[j, i+1];
      RowCount := RowCount - 1
    end;
  end;

procedure TFPeminjaman.HapusClick(Sender: TObject);
  begin
    DeleteRow(StringGrid1,1);
    NoUrut;
  end;

procedure TFPeminjaman.HapusDataSama;
  var
    i,j : integer;
  begin
    for i:=StringGrid1.RowCount-1 downto 1 do
    begin
      for j:=StringGrid1.RowCount-1 downto i+1 do
      begin
        if SameText(StringGrid1.Cells[2,j],StringGrid1.Cells[2,i]) then
            DeleteRow(StringGrid1,i);
      end;
    end;
  end;

procedure TFPeminjaman.Aturkolom;
  begin
    with StringGrid1 do
    begin
      ColCount          := 4;
      RowCount          := 1;
      FixedRows         := 0;
      DefaultROwHeight  := 20;
      Cells[0,0]        := 'No.';
      Cells[1,0]        := 'Kode Buku';
      Cells[2,0]        := 'Judul Buku';
      Cells[3,0]        := 'QTY';
      ColWidths[0]      := 30;
      ColWidths[1]      := 150;
      ColWidths[2]      := 485;
      ColWidths[3]      := 60;
    end;
  end;

procedure TFPeminjaman.KeluarClick(Sender: TObject);
  begin
    Close;
  end;

procedure TFPeminjaman.KodeAuto;
  var
    kd,st,nwk : String;
    i,n : Integer;
  begin
    with DM.Umum do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select NoPeminjaman from tpeminjaman where left(NoPeminjaman,8)='+FormatDateTime('yyyyMMdd',now)+'';
      Open;
      Last;
      if not (Eof and Bof) then
        begin
          kd  :=RightStr(FieldByName('NoPeminjaman').AsString,5);
          for i:= 1 to 5 do
            st := st+kd[i+1];
            n := StrToInt(st)+1;
          case Length (IntToStr(n)) of
            1:nwk:= '0000'+ IntToStr(n);
            2:nwk:= '000'+ IntToStr(n);
            3:nwk:= '00'+ IntToStr(n);
            4:nwk:= '0'+ IntToStr(n);
            5:nwk:= IntToStr(n);
          end
        end
      else
    nwk:='00001';
    NoPeminjaman.Text:= FormatDateTime('yyyyMMdd',now)+'P'+ nwk;
    Close;
    end;
  end;

procedure TFPeminjaman.LamaPinjamChange(Sender: TObject);
  begin
    DTKembali.Date:= (DTPinjam.Date + LamaPinjam.Value);
  end;

procedure TFPeminjaman.Edit1Change(Sender: TObject);
  begin
    if (Edit1.Text='') or (Edit1.Text='0') or (Edit1.Text<IntToStr(0)) then
      Edit1.Text:='1';
  end;

procedure TFPeminjaman.Edit1KeyPress(Sender: TObject; var Key: Char);
  var
    intRow: Integer;
  begin
    if Key=#13 then
    begin
      with DM.Umum do
      begin
        inherited;
        Close;
        SQL.Clear;
        SQL.Add('select sum(QTY-Pinjam) as STOK from Buku where KodeBuku="'+LabelKodeBuku.Caption+'" ');
        Open;
        if not Eof then
        begin
          if Edit1.Text > FieldByName('STOK').AsString then
            begin
              MessageDlg('Stok Tinggal '+IntToStr(FieldByName('STOK').AsInteger)+' !!',mtError,[mbOK],0);
              Edit1.Text:=IntToStr(FieldByName('STOK').AsInteger);
            end
          else
          begin
            with Edit1 do
            begin
              intRow := StringGrid1.Row;
              if (StringGrid1.Col = 3) then
                StringGrid1.Cells[3, intRow] := Edit1.Text
              else
              StringGrid1.Cells[StringGrid1.Col, intRow] := Edit1.Text;
              Visible := False;
            end;
            StringGrid1.SetFocus;
          end
        end;
      end;
    end;
  end;

procedure TFPeminjaman.FormShow(Sender: TObject);
  begin
    Aturkolom;
    KodeAuto;
    NoInduk.Clear;
    NamaSiswa.Clear;
    NoPetugas.Clear;
    NamaPetugas.Clear;
    LamaPinjam.Value    := 3;
    BatasPinjam.Value   := 2;
    DTKembali.Date      :=(DTPinjam.Date+LamaPinjam.Value);
    DTPinjam.Date       := Now;
    Simpan.Enabled      := True;
    DaftarBuku.Enabled  := True;
    Cari.Enabled        := True;
  end;

procedure TFPeminjaman.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var
    text: string;
    WidthOfCell: integer;
    LeftOffset: real;
  begin
    if (ACol=3) then
    begin
      with StringGrid1 do
      begin
        text        := Cells[ACol,ARow];
        WidthOfCell := ColWidths[ACol];
        LeftOffset  := RoundTo(WidthOfCell /2,0);
        Canvas.TextRect(Rect,Rect.Left+strtoint(floattostr(LeftOffset)),Rect.Top,text);
      end;
    end;
  end;

procedure TFPeminjaman.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    di: integer;
    i: integer;
  begin
    if Key=VK_delete then
    begin
      di := StringGrid1.Selection.Bottom - StringGrid1.Selection.Top+1;
      for i := StringGrid1.Selection.Bottom + 1 to StringGrid1.RowCount-1 do
        StringGrid1.Rows[i-di] := StringGrid1.Rows[i];
        StringGrid1.RowCount := StringGrid1.RowCount - di;
    End;
    //NoUrut;
  end;

procedure TFPeminjaman.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
    R: TRect;
  begin
    LabelKodeBuku.Caption:=StringGrid1.Cells[1, ARow];
    if ((ACol = 3) and (ARow <> 0)) then
      begin
        R := StringGrid1.CellRect(ACol, ARow);
        R.Left := R.Left + StringGrid1.Left;
        R.Right := R.Right + StringGrid1.Left;
        R.Top := R.Top + StringGrid1.Top;
        R.Bottom := R.Bottom + StringGrid1.Top;
        with Edit1 do
        begin
          Left := R.Left;
          Top := R.Top;
          Width := (R.Right) - R.Left;
          Height := (R.Bottom) - R.Top;
          Text := StringGrid1.Cells[ACol, ARow];
          Visible := True;
          SetFocus;
        end;
        CanSelect := True;
      end
    else
    Edit1.Visible := False;
  end;

end.
