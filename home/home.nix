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
      rebuildnix = "sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixos";
      ff = "fastfetch";
    };
  };
}
