# sddm.nix

{ pkgs, lib, config, ... }: {
	
	options = {
		sddm.enable = lib.mkEnableOption "enables sddm with a theme";
		sddm.xrandr = lib.mkOption {
			type = lib.types.str;
			default = ''
				xrandr --output Virtual-1 --mode 2560x1440 --rate 59.91
			'';
			example = ''
				xrandr --output Virtual-1 --mode 2560x1440 --rate 59.91
			'';
			discription = lib.mdDoc "xrandr command to run before sddm starts (e.g.: xrandr --output Virtual-1 --mode 2560x1440 --rate 59.91 )";
		};
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
			displayManager.sddm.setupScript = config.sddm.xrandr;
			displayManager.sddm.enable = true;
			displayManager.sddm.wayland.enable = true;
			displayManager.sddm.theme = "${import ./sddm-theme_sugar-dark.nix { inherit pkgs; }}";
		};
	};

}
