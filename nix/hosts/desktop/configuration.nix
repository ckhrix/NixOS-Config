{ config, pkgs, inputs, ... }: {
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./bundle.nix
      inputs.home-manager.nixosModules.default
    ];

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];

    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-generations +10";
    };
  };

  networking.hostName = "nixdesktop"; # If you change this, change flake.nix and home.nix too

  fileSystems."/mnt/sda" = {
    device = "/dev/disk/by-uuid/beeac917-e404-4e35-9bf4-8353c3b24298";
    fsType = "ext4";
    options = [ "defaults" "nofail" ];
  };

  users.users.ckhrix = {
    isNormalUser = true;
    description = "ckhrix";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ckhrix" = import ./../../../hmn/home.nix;
    };
  };

  system.stateVersion = "25.11"; # Don't change.
}
