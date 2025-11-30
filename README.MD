# Hyprland config

Install with yadm:
```bash
yadm clone https://github.com/celewin/hyprland_config.git
yadm checkout --force
```

Depencies:
```bash
paru -S rofi swww nwg-look google-chrome grim slurp thunar resources spotify steam discord hyprsunset breeze visual-studio-code-bin ttf-firacode-nerd wlogout telegram-desktop feh
```

- rofi = dmenu
- swww = wallpaper manager
- grim = screenshot
- slurp = area marker
- thunar = filemanger
- resources = taskmanager
- hyprsunset = blue filter

***

## sddm config
[sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
```
#### Selecting a theme

You can select theme by editing [metadata](./metadata.desktop) (`/usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop`).

Just edit this line:
```
ConfigFile=Themes/astronaut.conf
```
All available configs are in [Themes](./Themes/) directory.

#### Previewing a theme

You can preview the set theme without logging out by runnning:
```sh
sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/sddm-astronaut-theme/
```
## Rofi themes
https://github.com/newmanls/rofi-themes-collection/tree/master

## Wallpapers
https://github.com/vyrx-dev/Wallpapers
