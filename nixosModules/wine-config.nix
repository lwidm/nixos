# $NIXCONF/nixosModules/wine-config.nix

{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    wine-config.enable = lib.mkEnableOption "enables wine";
  };

  config = lib.mkIf config.wine-config.enable {

    environment.systemPackages = with pkgs; [ 
      wineWowPackages.stable
      wineWowPackages.waylandFull
    ];

  };
}
