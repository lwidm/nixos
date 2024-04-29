{ pkgs, modulesPath, ... }: {

	imports = [
		"${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
	];

	base-config.enable = true;
	systemd-boot.enable = false;
	grub.enable = false;

	nixpkgs.hostPlatform = "x86_64-linux";

	environment.systemPackages = with pkgs; [
		gptfdisk
		parted
		disko
	];
}
