# sddm.nix

{ pkgs, lib, config, ... }: {
	
	options = {
		sddm.enable = lib.mkEnableOption "enables sddm with a theme";
	};

	config = lib.mkIf config.sddm.enable {

		qt-conf.enable = true;

		environment.systemPackages = with pkgs; [
			libsForQt5.qt5.qtquickcontrols2
			libsForQt5.qt5.qtgraphicaleffects
		];

		services.xserver = {
			enable = true;
			xkb.layout = "ch";
			xkb.variant = "de";
			displayManager.sddm.enable = true;
			displayManager.sddm.wayland.enable = true;
			displayManager.sddm.theme = "${import ./sddm-theme_sugar-dark.nix { inherit pkgs; }}";
		};
	};

}
