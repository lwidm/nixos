# $NIXCONF/pkgs/font-patcher.nix

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  pname = "nerd-fonts_font-patcher";
  version = "v3.2.1";

  meta = {
    description = "Patch own fonts using 'font-patcher PATH_TO_FONT'";
    homepage = "https://github.com/ryanoasis/nerd-fonts";
  };

  src = pkgs.fetchurl {
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FontPatcher.zip";
    hash = "sha256-eCXAUHRXQ3+s7K1iFq3hob/9nyS59cWeXoSVjbsx8tY=";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  buildInputs = [
    pkgs.fontforge
    (pkgs.python3.withPackages (python-pkgs: [ python-pkgs.fontforge ]))
  ];

  unpackPhase = ''
    mkdir -p $out/bin
    ${pkgs.unzip}/bin/unzip $src -d $out/bin
    chmod +x $out/bin/font-patcher
  '';

  installPhase = '''';
}
