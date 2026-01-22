{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;

    extraConfig.pipewire = {
      "99-low-latency" = {
        "context.properties" = {
          "default.clock.allowed-rates" = [ 44100 48000 88200 96000 176400 192000 ];

          "default.clock.quantum" = 128;
          "default.clock.min-quantum" = 64;
          "default.clock.max-quantum" = 2048;
        };
      };
      "10-no-idle" = {
        "context.properties" = {
          "default.clock.min-quantum" = 64;
          "log.level" = 2;
          "session.suspend-timeout-seconds" = 0;
        };
      };
    };
  };
}
