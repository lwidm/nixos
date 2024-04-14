# ./hosts/isoimage/configuration.nix

{ pkgs, modulesPath, ... }: {
	imports = [
		"${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
	];

	nixpkgs.hostPlatform = "x86_64-linux";

	networking = { 
		hostName = "nixosIsoImage";
		networkmanager.enable = true;
		# wireless.enable = true;
	};

	environment.systemPackages = with pkgs; [
		gptfdisk
	];
}
