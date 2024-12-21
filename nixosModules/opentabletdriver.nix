# $NIXCONF/opentabletdriver.nixx

{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    opentabletdriver.enable = lib.mkEnableOption "enable opentabletdriver";
  };

  config = lib.mkIf config.opentabletdriver.enable {

    # services.xserver.wacom.enable = true;

    hardware.opentabletdriver.enable = true;

    environment.systemPackages = with pkgs; [
      opentabletdriver
    ];

  };

}
