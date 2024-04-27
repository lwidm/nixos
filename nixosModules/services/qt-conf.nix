# qt-conf.nix

{ pkgs, lib, config, ... }: {
	
	options = {
		qt-conf.enable = lib.mkEnableOption "enable qt module";
	};

	config = lib.mkIf config.qt-conf.enable {
		
		qt.enable = true;
		qt.platformTheme = "qt5ct";


	};

}
