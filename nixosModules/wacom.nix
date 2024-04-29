# wacom.nix

{ pkgs, lib, config, ...}: {

	options = {
		wacom.enable = lib.mkEnableOption "enable wacom.nix module";
	};

	config = lib.mkIf config.wacom.enable {
		
		xserver.wacom.enable = true;

		# hardware.opentabletdriver.enable = true;

	};

}
