{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.printing.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # System
    neovim
    wget
    git
    fastfetch
    coolercontrol.coolercontrold
    coolercontrol.coolercontrol-gui
    lact
    openrgb
    qpwgraph

    # Gaming
    osu-lazer-bin
    steam
    vesktop
    ungoogled-chromium
    lutris
    protontricks

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
}
