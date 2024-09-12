# qt-conf.nix

{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    qt-conf.enable = lib.mkEnableOption "enable qt module";
  };

  config = lib.mkIf config.qt-conf.enable {

    environment.systemPackages = with pkgs; [ qt5ct ];

    qt = {
      enable = true;
      platformTheme = "qt5ct";
    };
  };
}
