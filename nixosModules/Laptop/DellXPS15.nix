# nixosModules/Laptops/DellXPS15.nix

{ pkgs, lib, config, ... }: {

	options = {
		DellXPS15.enable = lib.mkEnableOption "enables modules for DellXPS15";
	};

	config = lib.mkIf config.DellXPS15.enable {

		thermald_tlp.enable = true;
		

		hardware.nvidia.prime = { 
			offload = {
				enable = true;
				enableOffloadCmd = true;
			};

			# Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA 
			nvidiaBusId = "PCI:01:00:0"; 

			# Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA 
			intelBusId = "PCI:00:02:0"; 
		};

		specialization = {
			dgpu.configuration = {
				hardware.nvidia = {
					prime.sync.enable = lib.mkForce true;
					prime.offload = {
						enable = lib.mkForce false;
						enableOffloadCmd = lib.mkForce false;
					};
				};
			};
		};

	};

}
