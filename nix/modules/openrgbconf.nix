{ pkgs, ... }: {
  systemd.services.openrgb-set-red = {
    description = "Set all RGB LEDs to red on startup";
    after = [ "network.target" "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      # --mode static: sets the mode to static
      # --color FF0000: hex code for pure red
      ExecStart = "${pkgs.openrgb}/bin/openrgb --mode static --color FF0000";
      RemainAfterExit = true;
    };
  };
}
