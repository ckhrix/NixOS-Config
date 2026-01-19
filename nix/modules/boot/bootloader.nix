{ pkgs, ... }: {
    boot.loader = {
        systemd-boot.enable = false;

        grub = {
            enable = true;
            device = "nodev";
            efiSupport = true;
            useOSProber = true;
            theme = ./hyperfluent-nixos;
        };

        efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
        };
    };

    boot.kernelPackages = pkgs.linuxPackages_latest;
}
