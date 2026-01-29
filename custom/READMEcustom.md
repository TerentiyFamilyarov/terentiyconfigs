# What it is?
this is instruction for some custom scripts installations for Archlinux

## sway-custom
this script needed for evnvironment variables load in sway
step by step:
1. create and open file in /usr/local/bin/sway-custom
2. add sway-custom's file content, i use nvim,firefox,foot
3. save it
4. run for executable```sudo chmod +x /usr/local/bin/sway-custom```
5. create and open file /usr/share/wayland-session/sway-custom.desktop
6. add sway-custom.desktop's content, save
6. reboot system and pick 'Sway Custom' in your login manager

## powermenu in *wofi*
step by step:
1. crate and open file in ~/.local/bin/powermenu
2. add powermenu's content and save
3. make executable ```chmod +x ~./local/bin/powermenu```
4. so configure it in your sway/config with run powermenu file

## baterynotify
this script notify you battery charge level, confgure it in sway/config
NOTE: dont forget reconfigure it in your waybar config for sync changing color powerlevels
step by step:
1. create and open file in ~./local/bin/batterynotify
2. add this one content
3. make executable
