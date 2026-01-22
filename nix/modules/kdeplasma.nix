{ config, pkgs, ... }: {
    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm = {
        enable = true;
        theme = "sddm-astronaut-theme";
        extraPackages = with pkgs; [
            sddm-astronaut
            kdePackages.qtsvg
            kdePackages.qtmultimedia
            kdePackages.qtvirtualkeyboard
        ];
    };

    services.xserver = {
        enable = true;

        videoDrivers = [ "amdgpu" ];
        defaultDepth = 30;

        xkb = {
            layout = "dk";
            variant = "";
        };

        extraConfig = ''
        Section "OutputClass"
            Identifier "AMD"
            MatchDriver "amdgpu"
            Driver "amdgpu"
            Option "EnablePageFlip" "off"
            Option "TearFree" "false"
        EndSection
        '';
    };

    environment.systemPackages = with pkgs; [
        kdePackages.kdenlive
        kdePackages.filelight
        kdePackages.kate
        kdePackages.konsole
        kdePackages.dolphin
        sddm-astronaut
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
