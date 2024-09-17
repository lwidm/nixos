# $NIXCONF/nixosModules/common_packages.nix

{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    common_packages.enable = lib.mkEnableOption "installs general packages used on all my machines";
  };

  config = lib.mkIf config.common_packages.enable {
    users.users.lukas = {
      packages = with pkgs; [
        firefox
        thunderbird
        gimp
        obsidian
        anki
        zoom-us
        discord
        libreoffice-fresh
        xournalpp

        texliveFull
        zathura
        texlab
        ltex-ls
      ];
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      nix-prefetch
      nix-prefetch-git
      nix-prefetch-github
      neofetch
    ];
  };
}
