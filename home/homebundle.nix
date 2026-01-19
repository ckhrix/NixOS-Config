{
    imports = [
        ./files/desktopentries/osulazer.nix
        ./files/desktopentries/livegammadesktop.nix
        ./files/desktopentries/setgammadesktop.nix
        ./files/desktopentries/scriptfoldericon.nix
        ./files/desktopentries/desktopfoldericon.nix

        ./files/scripts/live_gamma.nix
        ./files/scripts/set_gamma.nix

        # Start openrgb and add the profile "Red"
        # Then add openrgb-autostart.desktop to ~/.config/autostart/
        ./files/scripts/openrgb_start.nix
    ];
}
