{ pkgs, lib, ... }: {
	
	imports = [
		./base-config.nix
		./boot.nix
		./fonts.nix
		./development.nix
		./services/gtk-conf.nix
		./services/qt-conf.nix
		./services/X11_i3_startx.nix
		./services/hyprland.nix
		./services/nvidia.nix
		./sddm/sddm.nix
	];
	
	base-config.enable = lib.mkDefault true;
	systemd-boot.enable = lib.mkDefault true;

}
