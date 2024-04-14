# boot.nix

{ pkgs, ... }: {

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

}
