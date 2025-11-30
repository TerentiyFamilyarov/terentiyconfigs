### configs for sway, waybar, swaylock, nvim..etc

i use us,ru langs, so add this in /etc/locale.gen and run 
```bash
sudo locale-gen
``` 

Requires:
```bash
sudo pacman -S waybar otf-font-awesome ttf-jetbrains-mono-nerd pipewire pipewire-pulse pipewire-jack pavucontrol adw-gtk-theme adwaita-icon-theme lxqt-openssh-askpass wofi
```
##### Pipewire
start and enable pipewire:
```bash
systemctl --user enable pipewire.service
systemctl --user start pipewire.service
systemctl --user enable pipewire-pulse.service
systemctl --user start pipewire-pulse.service
```
also see instalation.md in custom for custom settings as powermenu and env variables
