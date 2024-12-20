# $NIXCONF/nixosModules/external_drives.nix

{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    external_drives.enable = lib.mkEnableOption "enables automounting of external_drives";
  };

  config = lib.mkIf config.external_drives.enable {
    services.udev.packages = with pkgs; [ uddisk2 ];

    services.udisk2.enable = true;

    # Run sudo blkid to get UUID
    # Run sudo fdisk -l to get FSTYPE

    # 4TB NVME case drive - right now: /dev/sde/sde2
    fileSystem."/mnt/F" = {
      device = "UUID=7E06-6506";
      fsType = "exfat";
      options = "relatime";
    };

  };
}
