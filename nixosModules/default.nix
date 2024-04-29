{ pkgs, lib, ... }: {
	
	imports = [
		./base-config.nix
		./grub.nix
		./systemd-boot.nix
		./fonts.nix
		./development.nix
		./services/gtk-conf.nix
		./services/qt-conf.nix
		./services/X11_i3_startx.nix
		./services/hyprland.nix
		./services/nvidia.nix
		./sddm/sddm.nix
		./services/bluetooth.nix
		
		./wacom.nix
		./steam.nix
	];
	
	base-config.enable = lib.mkDefault true;
	grub.enable = lib.mkDefault false;
	systemd-boot.enable = lib.mkDefault true;

}
