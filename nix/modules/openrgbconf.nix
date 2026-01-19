{ pkgs, ... }: {
  systemd.user.services.openrgb-set-red = {
  description = "Set all RGB LEDs to red on startup";
  wantedBy = [ "default.target" ];
  serviceConfig = {
    Type = "oneshot";
    ExecStart = "${pkgs.openrgb}/bin/openrgb --mode static --color FF0000";
  };
};
}
