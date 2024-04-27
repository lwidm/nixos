# sddm.nix

{ pkgs, lib, config, ... }: {
	
	options = {
		sddm.enable = lib.mkEnableOption "enables sddm with a theme";
	};

	config = lib.mkIf config.sddm.enable {

		qt-conf.enable = true;

		services.xserver.displayManager.sddm = {
			enable = true;
			theme = "${import ./sddm-theme_sugar-dark.nix { inherit pkgs; }}";
		};
	};

}
