# flake.nix

{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOs-WSL/main";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { nixpkgs, nixos-wsl, ... }@inputs: {
    nixosConfigurations = {

      VboxDesktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/VboxDesktop/configuration.nix
          ./nixosModules
          # inputs.home-manager.nixosModules.default
        ];
      };

      wslLaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/wslLaptop/configuration.nix
          ./nixosModules
	  nixos-wsl.nixosModules.wsl
          # inputs.home-manager.nixosModules.default
        ];
      };

      Desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/Desktop/configuration.nix
          ./nixosModules
          # inputs.home-manager.nixosModules.default
        ];
      };

      isoimage = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/isoimage/configuration.nix
          ./nixosModules
        ];
      };

    };
  };
}
