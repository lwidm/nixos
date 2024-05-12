# nixosModules/services/pulseaudio.nix

{ pkgs, lib, config, ... }: {

	options = {
		pulseaudio.enable = lib.mkEnableOption "enable pulseaudio";
	};

	config = {

		hardware.pulseaudio = {
			enable = true;
			support32Bit = true;
		};

	};

}
