# fonts.nix

{
  pkgs,
  lib,
  config,
  ...
}:
let
  Poiret_One = pkgs.callPackage ../pkgs/fonts/Poiret_One.nix { inherit pkgs; };
  Phosphor = pkgs.callPackage ../pkgs/fonts/Phosphor.nix { inherit pkgs; };
  font-patcher = pkgs.callPackage ../pkgs/font-patcher.nix { inherit pkgs; };
in
{

  options = {
    fonts.enable = lib.mkEnableOption "enables fonts.nix";
  };

  environment.systemPackages = [ font-patcher ];

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
