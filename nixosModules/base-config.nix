# base-config.nix

{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    base-config.enable = lib.mkEnableOption "enables base-config.nix";
  };

  config = lib.mkIf config.base-config.enable {

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    nixpkgs.config.allowUnfree = true;

    # Set your time zone.
    time.timeZone = "Europe/Zurich";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_AU.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_CH.UTF-8";
      LC_IDENTIFICATION = "de_CH.UTF-8";
      LC_MEASUREMENT = "de_CH.UTF-8";
      LC_MONETARY = "de_CH.UTF-8";
      LC_NAME = "de_CH.UTF-8";
      LC_NUMERIC = "de_CH.UTF-8";
      LC_PAPER = "de_CH.UTF-8";
      LC_TELEPHONE = "de_CH.UTF-8";
      LC_TIME = "de_CH.UTF-8";
    };

    console = {
      # font = "Lat2-Terminus16";
      keyMap = "sg";
      # useXkbConfig = true; # use xkb.options in tty.
    };

    # Set environment vars
    environment.variables = rec {
      EDITOR = "/run/current-system/sw/bin/nvim";
      NIXCONF = "/etc/nixos/";
    };

    # add Local Binary folder to PATH
    environment.localBinInPath = true;

    # Touchpad settings
    services.libinput.enable = true;

    # Zsh
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    services.actkbd = {
      enable = true;
      bindings = [
        {
          keys = [ 225 ];
          events = [ "key" ];
          command = "/run/current-system/sw/bin/brightnessctl set 5%+";
        }
        {
          keys = [ 224 ];
          events = [ "key" ];
          command = "/run/current-system/sw/bin/brightnessctl set 5%-";
        }
      ];
    };

    # essential packages
    environment.systemPackages = with pkgs; [
      neovim
      vim
      wget
      git
      github-cli
      stow
      tree
      fzf
      nil
      nixpkgs-fmt
      nixfmt-rfc-style

      tldr
      zoxide
      eza
      btop

      pavucontrol
      brightnessctl

      nemo-with-extensions
      dolphin
    ];
  };
}
