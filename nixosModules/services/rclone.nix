# $NIXCONF/nixosModules/services/rclone.nix

{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{

  options = {
    rclone.enable = lib.mkEnableOption "enables rclone.nix";
  };

  config = lib.mkIf config.rclone.enable {

    environment.systemPackages = with pkgs; [ rclone ];
  };
}
