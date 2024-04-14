# X11.nix

{ pkgs, ... }: {

	services.xserver = {
		enable = true;
		autorun = false;
		xkb.layout = "ch";
		xkb.variant = "de_nodeadkeys";
		# desktopManager.default = "none";
		desktopManager.xterm.enable = false;
		windowManager.i3.enable = true;
		displayManager.startx.enable = true;
		displayManager.sessionCommands = ''
		feh --bg-fill /usr/share/backgrounds/nixos-wallpaper-catppuccin-latte.png
		'';
	};

	# X11 packages
	environment.systemPackages = with pkg; [	
		alacritty 
		feh
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
	];
}
