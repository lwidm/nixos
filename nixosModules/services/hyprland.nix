# hyprland.nix

{ pkgs, lib, config, ... }: {

	options = {
		hyprland.enable = lib.mkEnableOption "enables hyprland";
		nvidia.enable = lib.mkEnableOption "enables nvidia module";
	};

	config = lib.mkIf config.hyprland.enable {
		programs.hyprland = {
			enable = true;
			xwayland.enable = true;
		};
		environment.sessionVariables = {
			# Hint electron apps to use wayland
			NIXOS_OZONE_WL = "1";
		};

		environment.systemPackages = [
			pkgs.waybar
			pkgs.mako
			pkgs.libnotify
			pkgs.swww
			pkgs.alacritty
			pkgs.wofi
			(pkgs.waybar.overrideAttrs (oldAttrs: {
				mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
			}) )
		];

		xdg.portal = {
			enable = true;
			extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
		};
		
		# options to be enable in case of nvidia
		programs.hyprland = lib.mkIf (config.nvidia.enable) { nvidiaPatches = true };
 		environment.sessionVariables = lib.mkIf (config.nvidia.enable) {
			# If your curser becomes invisible
			WLR_NO_HARDWARE_CURSORS = "1";
		};
		hardware = lib.mkIf (config.nvidia.enable) {
			opengl.enable = true;
			nvidia.modesetting.enable = true;
		};
	};

}
