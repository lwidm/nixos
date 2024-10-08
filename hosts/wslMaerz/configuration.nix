# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # include NixOS-WSL modules
    # <nixos-wsl/modules>
    ./hardware-configuration.nix
  ];

  environment.variables = {
    MYSYSTEM = "wslMaerz";
    WORKDIR = "/mnt/g/K_TECH/GGR-Datenbank/Berechnung\ Neu/02\ In\ Arbeit/python/2023_Lukas/";
  };

  common_packages.enable = true;

  fonts.enable = true;
  X11_i3_startx.enable = false;
  hyprland.enable = false;
  development.enable = true;
  nvidia.enable = false;
  sddm.enable = false;
  bluetooth.enable = false;

  grub.enable = false;
  systemd-boot.enable = false;

  wsl.enable = true;
  wsl-config.enable = true;
  wsl.defaultUser = "nixos";

  environment.systemPackages = with pkgs; [ home-manager ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
