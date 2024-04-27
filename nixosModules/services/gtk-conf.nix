# gtk-conf.nix

{ pkgs, lib, config, ... }: {

	options = {
		gtk-conf.enable = lib.mkEnableOption "enables gtk-conf";
	};

	programs.dconf.enable = true;

	config = lib.mkIf config.gtk-conf.enable {

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
