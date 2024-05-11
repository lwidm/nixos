# nixosModules/ntfs.nix

{ pkgs, lib, config, ... }: {

	options = {
		ntfs.enable = lib.mkEnableOption "enables tools for reading and writing to ntfs file systems";
	};

	config = lib.mkIf config.ntfs.enable {

		environment.systemPackages = with pkgs; [
			fuse
			ntfs3g
		];

	};

}
