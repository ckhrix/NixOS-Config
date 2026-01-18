{ config, pkgs, inputs, ... }: {
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./bundle.nix
      inputs.home-manager.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # If you change this, change flake.nix and home.nix too

  users.users.ckhrix = {
    isNormalUser = true;
    description = "ckhrix";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ckhrix" = import ./../home/home.nix;
    };
  };

  system.stateVersion = "25.11"; # Don't change.
}
