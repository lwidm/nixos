# nixosModules/services/printing.nix

{ pkgs, lib, config, ... }: {

  options = {

    printing.enable = lib.mkEnableOption "enables printing.nix";

  };

  config = lib.mkIf config.printing.enable {
    services.printing.enable = true;

    services.avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };

    services.printing.drivers = with pkgs; [ epsonscan2 peson-escpr2 ];
  };

}
