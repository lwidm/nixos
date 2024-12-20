# ./hosts/default/configuration.nix

{
  config,
  stdenv,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  environment.variables = {
    MYSYSTEM = "Desktop";
  };

  grub.enable = true;
  systemd-boot.enable = false;
  gtk-conf.enable = true;
  qt-conf.enable = true;

  common_packages.enable = true;

  fonts.enable = true;
  X11_i3_startx.enable = false;
  hyprland.enable = true;
  development.enable = true;
  nvidia.enable = true;
  sddm.enable = true;
  bluetooth.enable = true;
  onedrive.enable = false;
  rclone.enable = true;
  ntfs.enable = true;
  linuxDebug.enable = true;
  printing.enable = true;
  wine-config.enable = true;
  ETH.enable = true;

  wacom.enable = true;

  # gaming
  steam.enable = true;
  ksp.enable = true;

  # Networking
  networking = {
    hostName = "lwidmDesktopNixos"; # Define your hostname.
    networkmanager.enable = true;
    # wireless.enable = true; # Enables wireless support via wpa_supplicant.
  };
  # Pick only one of the below networking options.
  # networking.wireless.enable = true; 

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Define a user account. Don't forget to set a password with ‘passwd’.
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
      vscode
      mdadm
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wdisplays
    home-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
