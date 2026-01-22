{
    imports = [
        ./files/desktopentries/osulazer.nix
        ./files/desktopentries/livegammadesktop.nix
        ./files/desktopentries/setgammadesktop.nix
        ./files/desktopentries/scriptfoldericon.nix
        ./files/desktopentries/desktopfoldericon.nix
        ./files/desktopentries/openrgbautostartdesktop.nix

        ./files/scripts/live_gamma.nix
        ./files/scripts/set_gamma.nix
        ./files/scripts/openrgb_start.nix # Create Red.orp and exclude unwanted devices first
    ];
}
