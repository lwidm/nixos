# fonts.nix

{ pkgs, ... }: {

  options = {
    fonts.enable = lib.mkEnableOption "enables fonst.nix"
  };


  config = lib.mkIf config.fonts.enable {

    fonts.packages = with pkgs; [
      hack-font 
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    };

}
