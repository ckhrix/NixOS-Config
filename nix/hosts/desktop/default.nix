{
    imports = [
        ./hardware-configuration.nix
    ];

    networking.hostName = "nixdesktop";

    fileSystems."/mnt/sda" = {
        device = "/dev/disk/by-uuid/beeac917-e404-4e35-9bf4-8353c3b24298";
        fsType = "ext4";
        options = [ "defaults" "nofail" ];
    };
}
