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

    # add ~/.local/bin/ to $PATH
    environment.localBinInPath = true;

    # BUG: Temporarily set CMAKE_INSTALL_PREFIX to local install folder. After figuring out how to use cmake to create derivations I might need to reverse this
    environment.variables = rec {
      CMAKE_INSTALL_PREFIX = "$HOME/.local";
    };

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    environment.systemPackages = with pkgs; [
      # packages for i3
      tmux
      ripgrep

      nodejs
      typescript
      nodePackages_latest.typescript-language-server
      nodePackages_latest.eslint
      tailwindcss
      prettierd

      (python3.withPackages (
        python-pkgs: with python-pkgs; [
          matplotlib
          scipy
          numpy
        ]
      ))
      pyright
      black
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

      gfortran9
      fortls
      fprettify
    ];

    # environment.variables = {
    #   CC = "/run/current-system/sw/bin/clang";
    #   CXX = "/run/current-system/sw/bin/clang++";
    # };
  };
}
