# X11_i3_startx.nix

{ pkgs, lib, config, ... }: {

	options = {
		X11_i3_startx.enable = lib.mkEnableOption "enables X11_i3_startx";
	};

	config = lib.mkIf config.X11_i3_startx.enable {

		services.xserver = {
			enable = true;
			autorun = false;
			xkb.layout = "ch";
			xkb.variant = "de_nodeadkeys";
			# desktopManager.default = "none";
			desktopManager.xterm.enable = false;
			windowManager.i3.enable = true;
			displayManager.startx.enable = true;
		};

		environment.systemPackages = with pkgs; [	
			# X11 packages	
			xorg.xorgserver
			xorg.xinit
			xorg.xf86videovmware
			xorg.xrdb
			xorg.libXft
			xorg.xrandr
			xclip
			xorg.xf86inputevdev
			xorg.xf86inputsynaptics
			xorg.xf86inputlibinput
			xorg.xmodmap
			picom

			# i3 packages
			i3blocks
			i3lock-color
			envsubst
			acpi
			alacritty 
			feh
		];

	};
}
