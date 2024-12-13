# nixosModules/services/onedrive.nix

{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{

  options = {
    onedrive.enable = lib.mkEnableOption "enables onedrive.nix";
  };

  config = lib.mkIf config.onedrive.enable {

    services.onedrive.enable = true;

    environment.systemPackages = with pkgs; [ onedrivegui ];
  };
}
