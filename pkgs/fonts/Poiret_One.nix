# $NIXCONF/pkgs/fonts/Poiret_One.nix

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  name = "Poiret_One";

  meta = {
    description = "Poiret One font From Google freefonts, in css use the font name: Poiret One";
    homepage = "https://fonts.google.com/specimen/Poiret+One";
  };

  src = ../../assets/Poiret_One.tar.gz;

  nativeBuildInputs = [ pkgs.gnutar ];

  unpackPhase = ''
    mkdir -p $out/share/fonts/truetype/
    ${pkgs.gnutar}/bin/tar -xzvf $src -C $out/share/fonts/truetype
  '';

  installPhase = '''';
}
