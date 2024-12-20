# $NIXCONF/nixosModules/ETH.nix

{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  STMCUFinder = pkgs.callPackage ../pkgs/STMCUFinder.nix { inherit pkgs; };
in
{

  options = {
    ETH.enable = lib.mkEnableOption "enables ETH packages";
  };

  config = lib.mkIf config.ETH.enable {

    environment.systemPackages = with pkgs; [
      stm32cubemx
      # STMCUFinder
    ];
  };

}
