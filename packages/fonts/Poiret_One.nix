# packages/fonts/Poiret_One.nix

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {

  name = "Poiret One Regular Font (From Google freefonts)";
  src = ../../assets/.;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp $src/PoiretOne-Regular.ttf $out/share/fonts/truetype/Poiret_One.ttf

  '';
}
