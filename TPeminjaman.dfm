object FPeminjaman: TFPeminjaman
  Left = 0
  Top = 0
  ClientHeight = 613
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelKodeBuku: TLabel
    Left = 476
    Top = 146
    Width = 86
    Height = 13
    Caption = 'LabelKodeBuku'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 737
    Height = 129
    Caption = 'Data Transaksi Peminjaman'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 91
      Height = 13
      Caption = 'No. Peminjaman'
    end
    object Label2: TLabel
      Left = 16
      Top = 59
      Width = 53
      Height = 13
      Caption = 'No. Induk'
    end
    object Label4: TLabel
      Left = 567
      Top = 86
      Width = 45
      Height = 13
      Caption = 'Kembali'
    end
    object Label6: TLabel
      Left = 349
      Top = 32
      Width = 66
      Height = 13
      Caption = 'No. Petugas'
    end
    object Label8: TLabel
      Left = 16
      Top = 86
      Width = 67
      Height = 13
      Caption = 'Nama Siswa'
    end
    object Label9: TLabel
      Left = 349
      Top = 59
      Width = 73
      Height = 13
      Caption = 'Lama Pinjam'
    end
    object Label10: TLabel
      Left = 567
      Top = 59
      Width = 75
      Height = 13
      Caption = 'Maks. Pinjam'
    end
    object Label11: TLabel
      Left = 349
      Top = 86
      Width = 87
      Height = 13
      Caption = 'Tanggal Pinjam'
    end
    object NoPeminjaman: TEdit
      Left = 120
      Top = 29
      Width = 162
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'NoPeminjaman'
    end
    object LamaPinjam: TSpinEdit
      Left = 456
      Top = 56
      Width = 57
      Height = 22
      Enabled = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = LamaPinjamChange
    end
    object DTPinjam: TDateTimePicker
      Left = 456
      Top = 84
      Width = 105
      Height = 21
      Date = 43184.440858946760000000
      Time = 43184.440858946760000000
      Enabled = False
      TabOrder = 2
    end
    object Cari: TButton
      Left = 288
      Top = 56
      Width = 25
      Height = 21
      Caption = '...'
      TabOrder = 3
      OnClick = CariClick
    end
    object NoInduk: TEdit
      Left = 120
      Top = 56
      Width = 162
      Height = 21
      Enabled = False
      TabOrder = 4
      Text = 'Edit1'
      OnChange = NoIndukChange
    end
    object NamaSiswa: TEdit
      Left = 120
      Top = 83
      Width = 162
      Height = 21
      Enabled = False
      TabOrder = 5
      Text = 'Edit1'
    end
    object NoPetugas: TEdit
      Left = 456
      Top = 29
      Width = 105
      Height = 21
      Enabled = False
      TabOrder = 6
      Text = 'Edit1'
      OnChange = NoPetugasChange
    end
    object NamaPetugas: TEdit
      Left = 567
      Top = 29
      Width = 156
      Height = 21
      Enabled = False
      TabOrder = 7
      Text = 'Edit1'
    end
    object BatasPinjam: TSpinEdit
      Left = 666
      Top = 56
      Width = 57
      Height = 22
      Enabled = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 8
      Value = 0
    end
    object DTKembali: TDateTimePicker
      Left = 618
      Top = 84
      Width = 105
      Height = 21
      Date = 43184.440858946760000000
      Time = 43184.440858946760000000
      Enabled = False
      TabOrder = 9
    end
  end
  object DaftarBuku: TButton
    Left = 24
    Top = 143
    Width = 89
    Height = 25
    Caption = 'Daftar Buku'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = DaftarBukuClick
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 174
    Width = 737
    Height = 400
    TabOrder = 2
    OnDrawCell = StringGrid1DrawCell
    OnKeyDown = StringGrid1KeyDown
    OnSelectCell = StringGrid1SelectCell
  end
  object Keluar: TButton
    Left = 671
    Top = 580
    Width = 75
    Height = 25
    Caption = 'Keluar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = KeluarClick
  end
  object CetakBuktiPinjam: TButton
    Left = 521
    Top = 580
    Width = 144
    Height = 25
    Caption = 'Cetak Bukti Pinjam'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = CetakBuktiPinjamClick
  end
  object DaftarPeminjaman: TButton
    Left = 371
    Top = 580
    Width = 144
    Height = 25
    Caption = 'Daftar Peminjaman'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = DaftarPeminjamanClick
  end
  object Batal: TButton
    Left = 290
    Top = 580
    Width = 75
    Height = 25
    Caption = 'Batal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 128
    Top = 580
    Width = 75
    Height = 25
    Caption = 'Simpan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = SimpanClick
  end
  object Edit1: TEdit
    Left = 610
    Top = 143
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Text = 'Edit1'
    Visible = False
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
  object Hapus: TButton
    Left = 209
    Top = 580
    Width = 75
    Height = 25
    Caption = 'Hapus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = HapusClick
  end
end
