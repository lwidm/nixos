# $NIXCONF/pkgs/fonts/Inter_Nerd_Font

{
  pkgs ? import <nixpkgs> { },
}:
let
  font-patcher = pkgs.callPackage ../font-patcher.nix { inherit pkgs; };
in
pkgs.stdenv.mkDerivation {
  name = "Inter_Nerd_Font";

  meta = {
    description = "The Inter font from google fonts but patched to a nerd font";
    homepage = "https://fonts.google.com/specimen/Inter";
  };

  src = ../../assets/Inter.tar.gz;

  nativeBuildInputs = [
    pkgs.gnutar
    font-patcher
  ];

  unpackPhase = ''
    mkdir -p $out/share/fonts/truetype/
    ${pkgs.gnutar}/bin/tar -xzvf $src -C $out/share/fonts/truetype
  '';

  installPhase = ''
    ${font-patcher}/bin/font-patcher $out/share/fonts/truetype/Inter.ttc -out $out/share/fonts/truetype/
  '';
}
