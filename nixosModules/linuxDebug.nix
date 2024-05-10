# nixosModules/linuxDebug.nix

{pkgs, lib, config, ... }: {

	options = {
		linuxDebug.enable = lib.mkEnableOption "enables tools for debugging linux";
	};

	config = lib.mkIf config.linuxDebug.enable {

		environment.systemPackages = with pkgs; [
			libinput
			lshw
		];

	};

}
