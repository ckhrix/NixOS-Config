{ config, lib, pkgs, ... }: {
  home.activation.clean-plasma-launchers = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD sed -i 's|file:///nix/store/[^/]*/share/applications/|applications:|g' \
      ${config.home.homeDirectory}/.config/plasma-org.kde.plasma.desktop-appletsrc || true
  '';
}
