{ config, pkgs, ... }: {
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

  environment.systemPackages = [ pkgs.alsa-utils ];

  systemd.user.services.keep-dac-awake = {
    description = "Keep-alive silent signal for DAC";
    after = [ "pipewire.service" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      # -t sine: plays a sine wave
      # -f 1: frequency of 1Hz (well below human hearing range of 20Hz)
      # -c 2: 2 channels (stereo)
      # > /dev/null: suppress terminal output
      ExecStart = "${pkgs.alsa-utils}/bin/speaker-test -t sine -f 1 -c 2";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
