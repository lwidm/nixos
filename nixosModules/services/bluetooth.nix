# bluetooth.nix

{ pkgs, lib, config, ... }: {

	options = {
		bluetooth.enable = lib.mkEnableOption "enable bluetooth.nix";
	};

	config = lib.mkIf config.bluetooth.enable {

		hardware.bluetooth.enable = true;
		hardware.bluetooth.powerOnBoot = true;

		services.blueman.enable = true;

	};

}
