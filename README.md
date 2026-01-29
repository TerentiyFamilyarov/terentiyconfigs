# configs for sway, waybar, swaylock, nvim..etc

i use us,ru langs, so add this in /etc/locale.gen and run 
```bash
sudo locale-gen
``` 

## Instalation:
### install
```bash
sudo pacman -S stow wl-clipboard unzip waybar otf-font-awesome ttf-jetbrains-mono-nerd pipewire pipewire-pulse pipewire-jack pavucontrol adw-gtk-theme adwaita-icon-theme lxqt-openssh-askpass wofi upower mako libnotify grim slurp libreoffice-fresh brightnessctl
```
### GNUstow
- then install and move this repo into $HOME/.dotfiles
- ```cd $HOME/.dotfiles```
- ```stow .```

### install apps(not required)
gpicview(imageviever) pcmanfm(filemananger) geany(texteditor) engrampa(archivetool) nvim(consletexteditor) calc(calculator) pinta(paint) libreoffice-fress(office)
```bash
sudo pacman -S gpicview pcmanfm geany engrampa nvim calc pinta libreoffice-fresh firefox
```


## Requires:
### nvim
```bash
sudo pacman -S wl-clipboard unzip
```
### workstation
```bash
sudo pacman -S waybar otf-font-awesome ttf-jetbrains-mono-nerd pipewire pipewire-pulse pipewire-jack pavucontrol adw-gtk-theme adwaita-icon-theme lxqt-openssh-askpass wofi upower mako libnotify grim slurp brightnessctl
```
### apps
apps for: imageviewer fliemanager texteditor arhivetool tuicodeeditor calculator paint office browser 
```bash
sudo pacman -S gpicview pcmanfm geany engrampa nvim calc pinta libreoffice-fresh firefox
```

## instalation
move this wolders to your .config,
but for custom folder read README, its in custom folder

## Pipewire
start and enable pipewire:
```bash
systemctl --user enable pipewire.service
systemctl --user start pipewire.service
systemctl --user enable pipewire-pulse.service
systemctl --user start pipewire-pulse.service
```

## Screenshot
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/bc2f6761-4725-471c-85c5-a45ef190a91b" />
locked screen
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ec55e285-ea51-439d-b715-e29320ce1135" />



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

