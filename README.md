This config is set up for the user "ckhrix" and the contents of the repository should be moved to ~/NixOS

```bash
git clone https://github.com/ckhrix/NixOS-Config.git ~/NixOS
cd ~/NixOS
sudo nixos-rebuild switch --flake /home/ckhrix/NixOS#nixos
```
