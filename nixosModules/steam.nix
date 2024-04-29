# steam.nix

{ pkgs, lib, config, ... }: {

	options = {
		steam.enable = lib.mkEnableOption "enables steam.nix module";
	};

	config = lib.mkIf config.steam.enable {
		
		programs.steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;

			package = pkgs.steam.override {
				withPrimus = true;
				extraPkgs = pkgs: [ bumblebee glxinfo ];
			};
		};

		programs.java.enable = true;
		programs.steam-package = pkgs.steam.override { withJava = true; };

		nixpkgs.config.allowUnfreePrediacte = pkg: builtins.elem (lib.getName pkg) [
			"steam"
			"steam-original"
			"steam-run"
		];

	};

}

