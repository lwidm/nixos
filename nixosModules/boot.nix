# boot.nix

{ pkgs, lib, config, ... }: {

	options = {
		boot.enable = lib.mkEnableOption "enables boot.nix";
	};


	config = lib.mkIf config.boot.enable {

		# Use the systemd-boot EFI boot loader.
		# boot.loader.systemd-boot.enable = true;
		# boot.loader.efi.canTouchEfiVariables = true;
		boot.loader = {
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot/efi";
			};
			grub = {
				efiSupport = true;
				device = "nodev";
				useOSProber = true;
			};
		};

	};

}
