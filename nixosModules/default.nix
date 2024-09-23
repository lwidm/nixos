# $NIXCONF/nixosModules/default.nix

{ pkgs, lib, ... }:
{

  imports = [
    ./base-config.nix
    ./grub.nix
    ./systemd-boot.nix
    ./fonts.nix
    ./development.nix
    ./linuxDebug.nix
    ./ntfs.nix
    ./common_packages.nix
    ./wine-config.nix
    ./wsl-config.nix
    ./services/gtk-conf.nix
    ./services/qt-conf.nix
    ./services/X11_i3_startx.nix
    ./services/hyprland.nix
    ./services/nvidia.nix
    ./services/bluetooth.nix
    ./services/onedrive.nix
    ./services/pulseaudio.nix
    ./services/printing.nix
    ./sddm/sddm.nix

    ./Laptop/thermald-tlp.nix
    ./Laptop/DellXPS15.nix

    ./wacom.nix

    # gaming
    ./games/steam.nix
    ./games/ksp.nix
  ];

  base-config.enable = lib.mkDefault true;
}
