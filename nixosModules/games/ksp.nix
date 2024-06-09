{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    ksp.enable = lib.mkEnableOption "enables ksp config";
  };

  config = lib.mkIf config.ksp.enable { environment.systemPackages = with pkgs; [ ckan ]; };
}
