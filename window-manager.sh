${INSTALL_PACKAGE} -y xorg i3 i3status i3lock dmenu j4-dmenu-desktop lightdm lightdm-gtk-greeter alacritty feh xss-lock

WALLPAPER_PATH="/etc/wallpaper.jpeg"

wget -O "${WALLPAPER_PATH}" "${BASE_URL}/wallpaper/wallpaper-${WALLPAPER_SIZE}.jpeg"

cat <<FEHBG > "/home/${SYSTEM_USER}/.fehbg"
#!/bin/sh
feh --no-fehbg --bg-scale '${WALLPAPER_PATH}'
FEHBG

chown "${SYSTEM_USER}" "/home/${SYSTEM_USER}/.fehbg"
chmod +x "/home/${SYSTEM_USER}/.fehbg"

I3_CONFIG_FILE="/home/${SYSTEM_USER}/.config/i3/config"

mkdir -p "/home/${SYSTEM_USER}/.config/i3"

# Copy i3 config file
wget -O "${I3_CONFIG_FILE}" "${BASE_URL}/i3/i3.config"

# Download font and extract it in /usr/local/share/fonts
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/${FONT}.tar.xz"
wget -O "/tmp/${FONT}.tar.xz" "${FONT_URL}"
tar -xf "/tmp/${FONT}.tar.xz" -C "/usr/local/share/fonts"

mkdir -p "/home/${SYSTEM_USER}/.config/alacritty"

wget -O "/home/${SYSTEM_USER}/.config/alacritty/alacritty.yml" "${BASE_URL}/alacritty.yml"

