program PjPeminjaman;

uses
  Vcl.Forms,
  TPeminjaman in 'TPeminjaman.pas' {FPeminjaman},
  TCariAnggota in 'TCariAnggota.pas' {FCariAnggota},
  TCariBuku in 'TCariBuku.pas' {FCariBuku},
  TDaftarPeminjam in 'TDaftarPeminjam.pas' {FDaftarPeminjam},
  TUDM in 'TUDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPeminjaman, FPeminjaman);
  Application.CreateForm(TFCariAnggota, FCariAnggota);
  Application.CreateForm(TFCariBuku, FCariBuku);
  Application.CreateForm(TFDaftarPeminjam, FDaftarPeminjam);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
