{ config, pkgs, inputs, ... }:
let
        stable = import inputs.nixpkgs-stable {
            inherit (pkgs.stdenv.hostPlatform) system;
            config.allowUnfree = true;
        };
in {
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
  hardware.wooting.enable = true;

  services.printing.enable = true;
  services.hardware.openrgb.enable = true;
  services.lact.enable = true;

  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.coolercontrol.enable = true;

  environment.systemPackages = with pkgs; [
    # System
    neovim
    wget
    git
    fastfetch
    coolercontrol.coolercontrold
    coolercontrol.coolercontrol-gui
    lm_sensors
    lact
    openrgb
    qpwgraph
    protonvpn-gui
    qbittorrent
    ddcutil

    # Gaming
    osu-lazer-bin
    vesktop
    ungoogled-chromium
    lutris
    heroic
    protontricks
    strawberry
    opentabletdriver
    wootility
    wooting-udev-rules

    # Creative
    cameractrls
    audacity
    celluloid
    gimp
    krita
    obs-studio
    rnote
    speedcrunch

    # KDE Packages are under kdeplasma.nix
    # Sway Packages are under sway.nix
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
  ];
}
