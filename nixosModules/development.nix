# development.nix

{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{

  options = {

    development.enable = lib.mkEnableOption "enables development.nix";
  };

  config = lib.mkIf config.development.enable {

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
      viAlias = true;
      vimAlias = true;
    };

    environment.systemPackages = with pkgs; [
      # packages for i3
      tmux
      ripgrep

      nodejs
      (python3.withPackages (
        python-pkgs: with python-pkgs; [
          matplotlib
          scipy
          numpy
        ]
      ))
      nil
      nixpkgs-fmt
      nixfmt-rfc-style

      llvmPackages.clang
      clang-tools
      cmake
      cmake-language-server
      cmake-format
      gnumake
      cargo
      zip
      unzip
    ];

    # environment.variables = {
    #   CC = "/run/current-system/sw/bin/clang";
    #   CXX = "/run/current-system/sw/bin/clang++";
    # };
  };
}
