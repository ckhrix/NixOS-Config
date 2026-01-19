# Welcome to my NixOS config! ❄️
The name of the user in this config is set to be my username; "ckhrix", and the contents of the repository should be moved to /home/ckhrix/NixOS for the config to work without any changes.
This also makes it easy to change the configs without root privileges.
```bash
git clone https://github.com/ckhrix/NixOS-Config.git ~/NixOS
cd ~/NixOS
sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixos --install-bootloader
```

Then use the following to update:
```bash
nix flake update
rebuildnix
```
(rebuildnix is an alias for "sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixos")

GRUB Theme: https://github.com/Coopydood/HyperFluent-GRUB-Theme
