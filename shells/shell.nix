{ pkgs ? import <nixpkgs>  { } }:

pkgs.mkShell {

  nativeBuildInputs = with pkgs; [

      (python3.withPackages (python-pkgs: [] ))
      clang
      cmake
      gnumake
      cargo
      zip
      unzip

  ];

}
