# systemd-boot.nix

{ pkgs, lib, config, ... }: {

	options = {
		systemd-boot.enable = lib.mkEnableOption "enables systemd-boot.nix";
	};


	config = lib.mkIf config.systemd-boot.enable {
	
		boot.loader.systemd-boot.enable = true;
		boot.loader.efi.canTouchEfiVariables = true;
	
	};
}
