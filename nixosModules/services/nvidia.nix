{ config, lib, pkgs, ... }: {
	
	options = {
		nvidia.enable = lib.mkEnableOption "enables nvidia module";
	};

	config = lib.mkIf config.nvidia.enable {

		hardware.opengl = {
			enable = true;
			driSupport = true;
			driSupport32Bit = true;
		};

		# Load nvidia driver for Xorg and Wayland
		services.xserver.videoDrivers = ["nvidia"];

		hardware.nvidia = {
			
			modesetting.enable = true;
			powerManagement.enable = false;
			powerManagement.finegrained = true;

			open = false;

			nvidiaSettings = true;

		};

	};

}
