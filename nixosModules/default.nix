{ pkgs, ... }: {
	
	imports = [
		./services/X11_i3_startx.nix
		./boot.nix
	];

}
