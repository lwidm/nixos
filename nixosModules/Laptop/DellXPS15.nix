# nixosModules/Laptops/DellXPS15.nix

{ pkgs, lib, config, ... }: {

	options = {
		DellXPS15.enable = lib.mkEnableOption "enables modules for DellXPS15";
	};

	config = lib.mkIf config.DellXPS15.enable {

		thermald_tlp.enable = true;
		
		specialisation = { 
			nvidia.configuration = { 
				# Nvidia Configuration 
				services.xserver.videoDrivers = [ "nvidia" ]; 
				hardware.opengl.enable = true; 

				# Optionally, you may need to select the appropriate driver version for your specific GPU. 
				hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable; 

				# nvidia-drm.modeset=1 is required for some wayland compositors, e.g. sway 
				hardware.nvidia.modesetting.enable = true; 

				hardware.nvidia.prime = { 
					sync.enable = true; 

					# Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA 
					nvidiaBusId = "PCI:01:00:0"; 

					# Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA 
					intelBusId = "PCI:00:02:0"; 
				};
			};
		};

	};

}
