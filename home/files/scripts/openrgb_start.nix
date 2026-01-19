{
home.file."Scripts/openrgb_start.sh" = {
    text = ''
    #!/usr/bin/env bash
    # Wait for the GPU and SMBus drivers to fully load
    sleep 15
    # Force a hardware rescan to find all 9070 XT and RAM zones
    openrgb --rescan --profile "Red.orp"
    # Second apply to catch any 'missed' zones and stay in tray
    sleep 2
    openrgb --profile "Red.orp" --startminimized
    '';
    executable = true;
    };
}
