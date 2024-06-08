# nixosModules/services/printing.nix

{ pkgs, lib, config, ... }: {

  options = {

    printing.enable = lib.mkEnableOption "enables printing.nix";

  };

  config = lib.mkIf config.printing.enable {
    services.printing.enable = true;

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    services.printing.drivers = with pkgs; [ epson-escpr2 ];

    hardware.printers = {
      ensurePrinters = [{
        name = "EPSON_ET-3850_Series";
        location = "Home";
        deviceUri =
          "dnssd://EPSON%20ET-3850%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-e0bb9e329d02";
        model =
          "epson-inkjet-printer-escpr2/Epson-ET-3850_Series-epson-escpr2-en.ppd";
        ppdOptions = { PageSize = "A4"; };
      }];
      ensureDefaultPrinter = "Epson-ET-3850_Series";
    };

    environment.systemPackages = with pkgs; [    # packages for i3
      epsonscan2
    ];

  };

}
