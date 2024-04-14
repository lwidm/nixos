{ pkgs, lib, ... }: {
	
	imports = [
		./base-config.nix
		./boot.nix
		./fonts.nix
		./services/X11_i3_startx.nix
		./development.nix
	];
	
	base-config.enable = lib.mkDefaullt true;
	boot.enable = lib.mkDefault true;

}
