{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  services.printing.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    fastfetch
  ];
}
