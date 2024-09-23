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

  outputs = { nixpkgs, nixos-wsl, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {

    nixosConfigurations = {

      VboxDesktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/VboxDesktop/configuration.nix
          ./nixosModules
          # inputs.home-manager.nixosModules.default
        ];
      };

      VboxLaptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/VboxLaptop/configuration.nix
          ./nixosModules
          # inputs.home-manager.nixosModules.default
        ];
      };

      wslDesktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/wslDesktop/configuration.nix
          ./nixosModules
	  nixos-wsl.nixosModules.wsl
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

      wslMaerz = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ 
          ./hosts/wslMaerz/configuration.nix
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
      
      Laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/Laptop/configuration.nix
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
