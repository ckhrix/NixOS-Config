{
    home.file."Scripts/openrgb_start.sh" = {
        text = ''
        #!/usr/bin/env bash
        sleep 15
        openrgb --rescan --profile "Red.orp"
        sleep 2
        openrgb --profile "Red.orp" --startminimized
        '';
        executable = true;
    };
}
