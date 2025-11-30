# configs for sway, waybar, swaylock, nvim..etc

i use us,ru langs, so add this in /etc/locale.gen and run 
```bash
sudo locale-gen
``` 

## Requires:
### nvim
```bash
sudo pacman -S wl-clipboard unzip
```
### workstation
```bash
sudo pacman -S waybar otf-font-awesome ttf-jetbrains-mono-nerd pipewire pipewire-pulse pipewire-jack pavucontrol adw-gtk-theme adwaita-icon-theme lxqt-openssh-askpass wofi libnotify
```

## Pipewire
start and enable pipewire:
```bash
systemctl --user enable pipewire.service
systemctl --user start pipewire.service
systemctl --user enable pipewire-pulse.service
systemctl --user start pipewire-pulse.service
```

also see instalation.md in custom for custom settings as powermenu and env variables


## Colorsheme
### black #1c1c1c
uses for backgorund

### lightblack #262626
uses for background-2

### gray #4e4e4e
mostly for borders

### gray1 #686868
selected item borders

### gray2 #b8b8b8
why not

### white1 #e8e8e8
mostly for text color

### white #fafafa
for bright text color

### yellow #d7af87
`-

### orange #cc9057
warning

### red #c4746e
critical

### magenta #a58aac
over, specital, rare using

### blue #8aacbd
selected item border

### cyan #4a716e
active window

###### green #89b379
good, charging bat

