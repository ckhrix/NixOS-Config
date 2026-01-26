{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... }@inputs: {
    nixosConfigurations = {

      nixdesktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nix/configuration.nix
          ./nix/hosts/desktop/default.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      nixlaptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nix/configuration.nix
          ./nix/hosts/laptop/default.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
