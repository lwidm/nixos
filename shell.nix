# shell.nix

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nil
    nixpkgs-fmt
    nixfmt-rfc-style
  ];
  shellHook = ''
    zsh
  '';
}
