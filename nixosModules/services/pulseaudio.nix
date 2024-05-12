# nixosModules/services/pulseaudio.nix

{ pkgs, lib, config, ... }: {

	options = {
		pulseaudio.enable = lib.mkEnableOption "enable pulseaudio";
	};

	config = lib.mkIf config.pulseaudio.enable {

		hardware.pulseaudio = {
			enable = true;
			support32Bit = true;
		};

	};

}
