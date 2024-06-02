# shell.nix

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nil
    nixpkgs-fmt
  ];
  shellHook = ''
    zsh
  '';
}
