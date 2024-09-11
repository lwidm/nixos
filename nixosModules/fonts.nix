# fonts.nix

{
  pkgs,
  lib,
  config,
  ...
}:
let
  Poiret_One = pkgs.callPackage ../packages/fonts/Poiret_One.nix { inherit pkgs; };
  Phosphor = pkgs.callPackage ../packages/fonts/Phosphor.nix { inherit pkgs; };
in
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
      Poiret_One
      Phosphor
    ];
  };
}
