{ pkgs, ... }: {
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    services.xserver.enable = true;
    services.xserver.xkb = {
        layout = "dk";
        variant = "";
    };

    environment.systemPackages = with pkgs; [
        kdePackages.kdenlive
        kdePackages.filelight
        kdePackages.kate
        kdePackages.konsole
        kdePackages.dolphin
    ];

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration # The browser extension bridge
        oxygen                     # Old icon/cursor theme
        elisa                      # Music player
        khelpcenter                # Help documentation
        gwenview                   # Image viewer
        okular                     # PDF viewer
    ];
}
