{ config, lib, pkgs, ... }: {
	
	options = {
		nvidia.enable = lib.mkEnableOption "enables nvidia module";
	};

	config = lib.mkIf config.nvidia.enable {

		hardware.graphics = {
			enable = true;
			# driSupport = true;
			enable32Bit = true;
		};

		# Load nvidia driver for Xorg and Wayland
		services.xserver.videoDrivers = ["nvidia"];

		hardware.nvidia = {
			
			modesetting.enable = true;
			powerManagement.enable = true;
			powerManagement.finegrained = false;

			open = false;

			nvidiaSettings = true;

		};

		environment.variables = rec {
			WLR_NO_HARDWARE_CURSORS = "1";
		};

	};

}
