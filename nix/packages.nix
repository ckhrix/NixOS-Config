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
  hardware.steam-hardware.enable = true;
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
  hardware.wooting.enable = true;

  services.printing.enable = true;
  services.hardware.openrgb.enable = true;
  services.lact.enable = true;
  #services.blueman.enable = true;

  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.coolercontrol.enable = true;
  programs.nix-ld.enable = true;

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
    proton-vpn
    qbittorrent
    ddcutil
    steam-run
    cameractrls
    cameractrls-gtk4

    # Gaming
    osu-lazer-bin
    vesktop
    ungoogled-chromium
    lutris
    heroic
    protontricks
    strawberry
    wootility
    wooting-udev-rules
    protonup-qt
    r2modman
    prismlauncher

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

  systemd.user.services.opentabletdriver = {
    unitConfig = {
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };
  };
}
