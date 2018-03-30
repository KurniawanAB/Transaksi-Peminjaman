unit TUDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, frxClass,
  frxDBSet;

type
  TDM = class(TDataModule)
    Koneksi: TZConnection;
    DaftarPeminjam: TZQuery;
    DTDaftarPeminjam: TDataSource;
    CariBuku: TZQuery;
    DTCariBuku: TDataSource;
    CariAnggota: TZQuery;
    DTCariAnggota: TDataSource;
    Umum: TZQuery;
    frxDBDTsCetakBuktiPinjam: TfrxDBDataset;
    frxRCetakBuktiPinjam: TfrxReport;
    CetakBuktiPinjam: TZQuery;
    DTsCetakBuktiPinjam: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
