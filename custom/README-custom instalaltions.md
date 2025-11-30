# What it is?
this is instruction for some custom scripts installations for Archlinux

## sway-custom
this script needed for evnvironment variables load in sway
step by step:
1. create and open file in /usr/local/bin/sway-custom
2. add this, i use nvim,firefox,foot:
```bash
#!/bin/bash
# Установка переменных окружения
export EDITOR="nvim"
export BROWSER="firefox" 
export TERMINAL="foot"
export QT_QPA_PLATFORM="wayland"
export MOZ_ENABLE_WAYLAND=1
export GTK_THEME="Adwaita:dark"
export XDG_SESSION_TYPE="wayland"
export XDG_CURRENT_DESKTOP="sway"


# Запуск sway
exec sway
```
3. run for executable```sudo chmod +x /usr/local/bin/sway-custom```
4. craate and open file /usr/share/wayland-session/sway-custom.desktop
5. add this and save:
```bash
sway-custom.desktop
[Desktop Entry]
Name=Sway Custom
Comment=An i3-compatible Wayland compositor (Custom)
Exec=sway-custom
Type=Application
```
6. reboot system and pick 'Sway Custom' in your login manager

## powermenu in *wofi*
step by step:
1. crate and open file in ~/.local/bin/powermenu
2. add this:
```bash
#!/bin/bash

options="LogOut\nReboot\nPoweroff\nSuspend\nLock"

selected=$(echo -e "$options" | wofi --dmenu --prompt="Действие:")

case $selected in
    "LogOut")
        swaymsg exit
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Poweroff")
        systemctl poweroff
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Lock")
        swaylock
        ;;
esac
```
3. make executable ```cmod +x ~./local/bin/powermenu
4. so configure it in your sway/config with run powermenu file

