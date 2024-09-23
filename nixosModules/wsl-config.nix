# $NIXCONF/nixosModules/wsl-config.nix

{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  options = {
    wsl-config.enable = lib.mkEnableOption "enables options shared among all my wsl configs";
  };

  config = lib.mkIf config.wsl-config.enable {
    environment.variables = rec {
      WINHOME = "/mnt/c/Users/lukas/";
    };

    environment.systemPackages = with pkgs; [
      neofetch
    ];
  };
}
