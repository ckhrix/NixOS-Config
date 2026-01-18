{ pkgs, ... }: {
  # Enable the Sway Wayland compositor
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Required for GTK apps to look right
  };

  # Security & Polkit (Crucial for things like screen locking and mounting USBs)
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    # --- GUI Essentials ---
    waybar           # The status bar at the top/bottom
    wofi             # The "start menu" app launcher (Wayland version of Rofi)
    mako             # Notification daemon
    swaylock         # Screen locker
    swayidle         # Idle management (locks screen after X minutes)
    wl-clipboard     # Copy/paste support

    # --- System Tools ---
    grim             # Screenshots
    slurp            # Select region for screenshots
    pavucontrol      # Audio volume control GUI
    networkmanagerapplet # Wi-Fi icon for the bar (nm-applet)

    # --- Terminal (Sway's default is 'foot') ---
    foot             # Extremely fast, Wayland-native terminal
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # Useful for consistent file pickers
  };
}
