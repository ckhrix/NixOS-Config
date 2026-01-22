{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
  nixosConfigurations = {

    nixdesktop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nix/hosts/desktop/configuration.nix
        ./nix/hosts/desktop/hardware-configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };

    nixlaptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nix/hosts/laptop/configuration.nix
        ./nix/hosts/laptop/hardware-configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };

  };
};
}
