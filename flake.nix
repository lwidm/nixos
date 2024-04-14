# flake.nix

{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {

      VboxDesktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/VboxDesktop/configuration.nix
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
