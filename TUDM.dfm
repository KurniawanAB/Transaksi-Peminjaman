object DM: TDM
  OldCreateOrder = False
  Height = 273
  Width = 502
  object Koneksi: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'perpustakaan_3'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\Kurniawan\Documents\RAD Studio\Projects\New folder\libm' +
      'ysql.dll'
    Left = 40
    Top = 16
  end
  object DaftarPeminjam: TZQuery
    Connection = Koneksi
    Active = True
    SQL.Strings = (
      'select tp.*, ts.NamaSiswa'
      'from tpeminjaman tp, tsiswa ts'
      'where tp.NoInduk=ts.NoInduk')
    Params = <>
    Left = 40
    Top = 72
  end
  object DTDaftarPeminjam: TDataSource
    DataSet = DaftarPeminjam
    Left = 152
    Top = 73
  end
  object CariBuku: TZQuery
    Connection = Koneksi
    Active = True
    SQL.Strings = (
      
        'SELECT a.`KodeBuku`, a.`JudulBuku`,a.`Pengarang`, a.`QTY`, a.`Pi' +
        'njam`, (a.`QTY` - a.`Pinjam`) AS stok'
      'FROM buku a')
    Params = <>
    Left = 40
    Top = 128
  end
  object DTCariBuku: TDataSource
    DataSet = CariBuku
    Left = 152
    Top = 129
  end
  object CariAnggota: TZQuery
    Connection = Koneksi
    Active = True
    SQL.Strings = (
      'SELECT  a.`NoInduk`, a.`NamaSiswa`, a.`Kelas`'
      'FROM tsiswa a')
    Params = <>
    Left = 40
    Top = 184
  end
  object DTCariAnggota: TDataSource
    DataSet = CariAnggota
    Left = 152
    Top = 185
  end
  object Umum: TZQuery
    Connection = Koneksi
    Params = <>
    Left = 152
    Top = 16
  end
  object frxDBDTsCetakBuktiPinjam: TfrxDBDataset
    UserName = 'frxDBDTsCetakBuktiPinjam'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NoPeminjaman=NoPeminjaman'
      'KodeBuku=KodeBuku'
      'JudulBuku=JudulBuku'
      'Jumlah=Jumlah'
      'Kembali=Kembali'
      'NoInduk=NoInduk'
      'NamaSiswa=NamaSiswa'
      'TglPinjam=TglPinjam'
      'Bulan=Bulan'
      'TglKembali=TglKembali'
      'Lama=Lama'
      'Keterangan=Keterangan'
      'IDUser=IDUser')
    DataSet = CetakBuktiPinjam
    BCDToCurrency = False
    Left = 288
    Top = 72
  end
  object frxRCetakBuktiPinjam: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43176.583780381900000000
    ReportOptions.LastChange = 43184.598189027800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 288
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDTsCetakBuktiPinjam
        DataSetName = 'frxDBDTsCetakBuktiPinjam'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 182.000000000000000000
      PaperHeight = 257.000000000000000000
      PaperSize = 13
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 612.283860000000000000
      end
      object ReportSummary1: TfrxReportSummary
        Height = 120.944960000000000000
        Top = 453.543600000000000000
        Width = 612.283860000000000000
        object Memo18: TfrxMemoView
          Left = 411.968770000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Yogyakarta,')
          ParentFont = False
          VAlign = vaCenter
        end
        object Date: TfrxMemoView
          Left = 487.559370000000000000
          Top = 3.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[Date #ddd - MMMM - yyyy]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 411.968770000000000000
          Top = 22.677180000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ' Mengetahui,')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 411.968770000000000000
          Top = 102.047310000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '(                                                  )')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        Height = 109.606370000000000000
        Top = 154.960730000000000000
        Width = 612.283860000000000000
        object Memo9: TfrxMemoView
          Top = 64.252010000000000000
          Width = 34.015770000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'No.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 34.015770000000000000
          Top = 64.252010000000000000
          Width = 98.267780000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Kode Buku')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 132.283550000000000000
          Top = 64.252010000000000000
          Width = 306.141930000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Judul Buku')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 438.425480000000000000
          Top = 64.252010000000000000
          Width = 86.929190000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Jumlah Pinjam')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 487.559370000000000000
          Top = 7.559060000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 374.173470000000000000
          Top = 30.236240000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tanggal Kembali')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 56.692950000000000000
          Width = 612.283860000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Memo1: TfrxMemoView
          Left = 37.795300000000000000
          Top = 7.559060000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'No. Induk')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Top = 30.236240000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nama Peminjam')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 151.181200000000000000
          Top = 7.559060000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 151.181200000000000000
          Top = 30.236240000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 374.173470000000000000
          Top = 7.559060000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tanggal Pinjam')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 487.559370000000000000
          Top = 30.236240000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 525.354670000000000000
          Top = 64.252010000000000000
          Width = 86.929190000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Jumlah Kembali')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDTsCetakBuktiPinjamNoInduk: TfrxMemoView
          Left = 158.740260000000000000
          Top = 7.559060000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NoInduk'
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDTsCetakBuktiPinjam."NoInduk"]')
          ParentFont = False
        end
        object frxDBDTsCetakBuktiPinjamNamaSiswa: TfrxMemoView
          Left = 158.740260000000000000
          Top = 30.236240000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NamaSiswa'
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDTsCetakBuktiPinjam."NamaSiswa"]')
          ParentFont = False
        end
        object frxDBDTsCetakBuktiPinjamTglPinjam: TfrxMemoView
          Left = 495.118430000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TglPinjam'
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDTsCetakBuktiPinjam."TglPinjam"]')
          ParentFont = False
        end
        object frxDBDTsCetakBuktiPinjamTglKembali: TfrxMemoView
          Left = 495.118430000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TglKembali'
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDTsCetakBuktiPinjam."TglKembali"]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        Height = 26.456710000000000000
        Top = 404.409710000000000000
        Width = 612.283860000000000000
        object Memo15: TfrxMemoView
          Top = 3.779530000000000000
          Width = 438.425480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total Pinjam')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 438.425480000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<frxDBDTsCetakBuktiPinjam."Jumlah">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 525.354670000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<frxDBDTsCetakBuktiPinjam."Kembali">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 325.039580000000000000
        Width = 612.283860000000000000
        DataSet = frxDBDTsCetakBuktiPinjam
        DataSetName = 'frxDBDTsCetakBuktiPinjam'
        RowCount = 0
        object frxDBDataset1KodeBuku: TfrxMemoView
          Left = 34.015770000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'KodeBuku'
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDTsCetakBuktiPinjam."KodeBuku"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1JudulBuku: TfrxMemoView
          Left = 132.283550000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haBlock
          Memo.UTF8W = (
            ' [frxDBDTsCetakBuktiPinjam."JudulBuku"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1Jumlah: TfrxMemoView
          Left = 438.425480000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Jumlah'
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDTsCetakBuktiPinjam."Jumlah"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 525.354670000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Kembali'
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDTsCetakBuktiPinjam."Kembali"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 68.031540000000000000
        Top = 64.252010000000000000
        Width = 612.283860000000000000
        object Memo14: TfrxMemoView
          Top = 3.779530000000000000
          Width = 612.283860000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cetak Bukti Pengembalian')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 64.252010000000000000
          Width = 612.283860000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Memo23: TfrxMemoView
          Left = 306.141930000000000000
          Top = 37.795300000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 196.535560000000000000
          Top = 37.795300000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'No. Peminjaman')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDTsCetakBuktiPinjamNoPeminjaman: TfrxMemoView
          Left = 313.700990000000000000
          Top = 37.795300000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NoPeminjaman'
          DataSet = frxDBDTsCetakBuktiPinjam
          DataSetName = 'frxDBDTsCetakBuktiPinjam'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxDBDTsCetakBuktiPinjam."NoPeminjaman"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object CetakBuktiPinjam: TZQuery
    Connection = Koneksi
    Active = True
    SQL.Strings = (
      
        'select tpd.NoPeminjaman, tpd.KodeBuku,tb.JudulBuku, tpd.Jumlah, ' +
        'tpd.Kembali, tp.NoInduk,ts.NamaSiswa, tp.TglPinjam, tp.Bulan, tp' +
        '.TglKembali,'
      'tp.Lama, tp.Keterangan, tp.IDUser'
      'from tpeminjaman_det tpd'
      'inner join tpeminjaman tp on tpd.NoPeminjaman=tp.NoPeminjaman'
      'inner join tsiswa ts on tp.NoInduk=ts.NoInduk'
      'inner join buku tb on tpd.KodeBuku=tb.KodeBuku'
      'where tpd.NoPeminjaman = '#39'20180325P00002'#39)
    Params = <>
    Left = 416
    Top = 16
  end
  object DTsCetakBuktiPinjam: TDataSource
    DataSet = CetakBuktiPinjam
    Left = 416
    Top = 72
  end
end
