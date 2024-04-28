{ pkgs, modulesPath, ... }: {

	imports = [
		"${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
	];

	base-config.enable = true;

	environment.systemPakages = with pkgs; [
		gptfdisk
		parted
		disko
	];
}
