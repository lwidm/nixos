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

		environment.sessionVariables = {
			STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/lukas/.steam/root/compatibilitytools.d";
		};

		programs.gamemode.enable = true;

		# programs.java.enable = true;
		# programs.steam-package = pkgs.steam.override { withJava = true; };

		nixpkgs.config.allowUnfreePrediacte = pkg: builtins.elem (lib.getName pkg) [
			"steam"
			"steam-original"
			"steam-run"
		];

		# i18n.supportedLocales = [
		# 	"en_US.UTF-8/UTF-8"
		# ];

		networking.extraHosts =
		''
			2.21.22.169 client-download.steampowered.com
		'';

	};

}

