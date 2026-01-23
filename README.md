# Welcome to my NixOS config! ❄️
The name of the user in this config is set to be my username; "ckhrix", and the contents of the repository should be moved to /home/ckhrix/NixOS for the config to work without any changes.
This also makes it easy to change the configs without root privileges.
```bash
git clone https://github.com/ckhrix/NixOS-Config.git ~/NixOS
cd ~/NixOS
```
First, add a new host in the hosts folder following the structure of the other hosts, then add an alias to rebuild the system in /hmn/home.nix for the chosen hostname. At last, add the new setup to flake.nix in the same manner as the others.

(Remember to grab your own hardware-configuration.nix and mount any drives specific to the computer)

Afterwards run the following command.
```bash
sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#HOSTNAME --install-bootloader
```
Then to update your computer run the following, remember to track changes to the config with GitHub.
```bash
nix flake update
rbnixdesk
```
(rbnixdesk is an alias for "sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixdesktop")

GRUB Theme: https://github.com/Coopydood/HyperFluent-GRUB-Theme
