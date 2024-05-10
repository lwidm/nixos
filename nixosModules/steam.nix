# steam.nix

{ pkgs, lib, config, ... }: {

	options = {
		steam.enable = lib.mkEnableOption "enables steam.nix module";
	};

	config = lib.mkIf config.steam.enable {
		
		programs.steam = {
			enable = true;
			remotePlay.openFirewall = true;
			gamescopeSession.enable = true;
		};

		environment.systemPackages = with pkgs; [
			mangohud
			protonup
		];

		programs.gamemode.enable = true;

		# programs.java.enable = true;
		# programs.steam-package = pkgs.steam.override { withJava = true; };

		nixpkgs.config.allowUnfreePrediacte = pkg: builtins.elem (lib.getName pkg) [
			"steam"
			"steam-original"
			"steam-run"
		];

	};

}

