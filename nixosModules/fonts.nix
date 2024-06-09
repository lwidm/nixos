# fonts.nix

{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    fonts.enable = lib.mkEnableOption "enables fonts.nix";
  };

  config = lib.mkIf config.fonts.enable {

    fonts.packages = with pkgs; [
      hack-font
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "Hack"
        ];
      })
    ];
  };
}
