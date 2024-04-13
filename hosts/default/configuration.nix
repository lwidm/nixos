# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, stdenv, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  networking.hostName = "lwidmNixOs"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "sg";
  #   useXkbConfig = true; # use xkb.options in tty.
  };

  # Set environment vars
  environment.variables = rec {
    EDITOR = "/run/current-system/sw/bin/nvim";
    NIXCONF = "/etc/nixos/";
  };

  # X11
  services.xserver = {
    enable = true;
    autorun = false;
    xkb.layout = "ch";
    xkb.variant = "de_nodeadkeys";
    # desktopManager.default = "none";
    desktopManager.xterm.enable = false;
    windowManager.i3.enable = true;
    displayManager.startx.enable = true;
    displayManager.sessionCommands = ''
    feh --bg-fill /usr/share/backgrounds/nixos-wallpaper-catppuccin-latte.png
    '';
  };

  # Zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Virtualbox
  virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.x11 = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lukas = {
    isNormalUser = true;
    description = "lukas widmer";
    useDefaultShell = true;
    extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # essential packages
    vim 
    wget
    git
    github-cli
    # X11 packages
    alacritty 
    feh
    xorg.xorgserver
    xorg.xinit
    xorg.xf86videovmware
    xorg.xrdb
    xorg.libXft
    xorg.xrandr
    xclip
    xorg.xf86inputevdev
    xorg.xf86inputsynaptics
    xorg.xf86inputlibinput
    xorg.xmodmap
    picom
    # packages for i3
    i3blocks
    i3lock-color
    envsubst
    acpi
    # development
    (python3.withPackages (python-pkgs: [] ))
    clang
    gnumake
    cargo
    zip
    unzip
    # other
    neovim
    firefox
    tmux
    tree
    stow
    pulseaudio
    neofetch
  ];

  fonts.packages = with pkgs; [
   hack-font 
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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

