# development.nix

{ pkgs, lib, config, ... }: {

  options = {

    development.enable = lib.mkEnableOption "enables development.nix";

  };


  config = lib.mkIf config.development.enable {

    environment.systemPackages = with pkgs; [    # packages for i3
      neovim
      tmux

      (python3.withPackages (python-pkgs: [] ))
      clang
      gnumake
      cargo
      zip
      unzip
    ];

  };
}
