{ pkgs, lib, ... }: {
	
	imports = [
		./base-config.nix
		./boot.nix
		./fonts.nix
		./development.nix
		./services/X11_i3_startx.nix
		./services/hyprland.nix
		./services/nvidia.nix
		./services/gtk-conf.nix
	];
	
	base-config.enable = lib.mkDefault true;
	boot.enable = lib.mkDefault true;

}
