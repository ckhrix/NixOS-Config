{ pkgs, ... }: {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
}
