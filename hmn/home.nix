{ config, pkgs, inputs, ... }: {
  imports = [
    ./git.nix
    ./homebundle.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "ckhrix";
    homeDirectory = "/home/ckhrix";
    stateVersion = "25.11"; # Don't change.
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rbnixdesk = "sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixdesktop";
      rbnixlap = "sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixlaptop";
      ff = "fastfetch";
    };
  };
}
