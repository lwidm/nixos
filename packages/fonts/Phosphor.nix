# packages/fonts/Phosphor.nix

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {

  pname = "Phosphor_icons";
  version = "2.0.2";
  meta = {
    description = "Phosphor icons font (font name is Phosphor), see homepage for how to use";
    homepage = "https://github.com/phosphor-icons/web/tree/master";
  };

  src = ../../assets/Phosphor.tar.gz;
  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp $src/*.ttf $out/share/fonts/truetype/

  '';
}
