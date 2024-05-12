{ pkgs, lib, ... }: {
	
	imports = [
		./base-config.nix
		./grub.nix
		./systemd-boot.nix
		./fonts.nix
		./development.nix
		./linuxDebug.nix
		./ntfs.nix
		./services/gtk-conf.nix
		./services/qt-conf.nix
		./services/X11_i3_startx.nix
		./services/hyprland.nix
		./services/nvidia.nix
		./services/bluetooth.nix
		./sddm/sddm.nix
		
		./Laptop/thermald-tlp.nix
		./Laptop/DellXPS15.nix

		./wacom.nix
		./steam.nix
	];
	
	base-config.enable = lib.mkDefault true;

}
