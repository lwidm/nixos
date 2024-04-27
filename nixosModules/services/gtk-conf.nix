# gtk.nix

{ pkgs, lib, config, ... }: {

	options = {
		gtk.enable = lib.mkEnableOption "enables hyprland";
	};

	config = lib.mkIf config.gtk.enable {

		environment.systemPackages = with pkgs; [
			(catppuccin-gtk-override {
				accents = [ "blue" ];
				size = "compact";
				# tweaks = [ "rimless "black" ]
				variant = "mocha;
			})
		];

	};

}
