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
  ];

  environment.variables = {
    MYSYSTEM = "wslLaptop";
  };

  common_packages.enable = false;

  fonts.enable = true;
  X11_i3_startx.enable = false;
  hyprland.enable = true;
  development.enable = true;
  nvidia.enable = false;
  sddm.enable = false;
  bluetooth.enable = false;

  grub.enable = false;
  systemd-boot.enable = false;

  wsl.enable = true;
  wsl-config.enable = true;
  wsl.defaultUser = "nixos";

  users.users.lukas = {
    isNormalUser = true;
    description = "lukas widmer";
    useDefaultShell = true;
    # WARNING: not sure whether it is smart to add the user to the input group
    extraGroups = [
      "wheel"
      "audio"
      "networkmanager"
      "input"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      texliveFull
      zathura
      texlab
      ltex-ls
    ];
  };
  environment.systemPackages = with pkgs; [ home-manager ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
