{ config, pkgs, inputs, ... }: {
  imports =
    [
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

  users.users.ckhrix = {
    isNormalUser = true;
    description = "ckhrix";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ckhrix" = import ./../hmn/home.nix;
    };
  };

  system.stateVersion = "25.11"; # Don't change.
}
