# hyprland.nix

{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {

    # depreciated as I use homemanager for this
    # gtk-conf.enable = true;
    # qt-conf.enable = true;

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.sessionVariables = {
      # Hint electron apps to use wayland
      NIXOS_OZONE_WL = "1";
      DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
      XDG_CURRENT_DESKTOP = "Hyprland";
    };

    environment.systemPackages = with pkgs; [
      waybar
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))
      mako
      libnotify
      hyprpaper
      hyprshot
      wl-clipboard
      wlroots
      kitty
      foot
      wofi
      dunst
      eww
      jq # my eww config requires jq

      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];

    services.libinput.enable = true;

    security.polkit.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    # environment.sessionVariables = lib.mkIf (config.nvidia.enable) {
    #	# If your curser becomes invisible
    #	WLR_NO_HARDWARE_CURSORS = "1";
    #};
  };
}
