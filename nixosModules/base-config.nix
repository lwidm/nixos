# base-config.nix

{ pkgs, lib, config, ... }:  {

  options = {
    base-config.enable = lib.mkEnableOption "enables base-config.nix";
  };


  config = lib.mkIf config.base-config.enable {

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Set your time zone.
    time.timeZone = "Europe/Zurich";

    # Select internationalisation properties.
    i18n = {
      defaultLocale = "en_AU.UTF-8";
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

    # Zsh
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # essential packages
    environment.systemPackages = with pkgs; [
      vim 
      wget
      git
      github-cli
      tree
    ];

  };

}
