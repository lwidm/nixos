# ./hosts/isoimage/configuration.nix

{ pkgs, modulesPath, ... }: {
	imports = [
		"${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
	];

	nixpkgs.hostPlatform = "x86_64-linux";
}
