# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    # <nixos-wsl/modules>
  ];

  environment.variables = {
    MYSYSTEM = "wslLaptop";
  };

  fonts.enable = true;
  X11_i3_startx.enable = false;
  hyprland.enable = true;
  development.enable = true;
  nvidia.enable = false;
  sddm.enable = false;
  bluetooth.enable = false;
  pulseaudio.enable = true;

  grub.enable = false;
  systemd-boot.enable = false;

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  environment.systemPackages = with pkgs; [
    nix-prefetch
    nix-prefetch-git
    neofetch
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
