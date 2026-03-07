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
      rbnixdesk = "sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixdesktop && systemctl restart --user plasma-plasmashell";
      rbnixlap = "sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixlaptop";
      ff = "fastfetch";
      gc = "nix-collect-garbage -d";
      helpnix = "man configuration.nix";
    };
  };
}
