# gtk-conf.nix

{ pkgs, lib, config, ... }: {

	options = {
		gtk-conf.enable = lib.mkEnableOption "enables gtk-conf";
	};

	config = lib.mkIf config.gtk-conf.enable {

		programs.dconf.enable = true;

		environment.systemPackages = with pkgs; [
			(catppuccin-gtk.override {
				accents = [ "blue" ];
				size = "compact";
				# tweaks = [ "rimless "black" ]
				variant = "mocha";
			})
		];

	};

}
