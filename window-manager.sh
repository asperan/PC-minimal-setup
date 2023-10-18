${INSTALL_PACKAGE} -y i3 j4-dmenu-desktop lightdm lightdm-gtk-greeter alacritty feh

WALLPAPER_PATH="/etc/wallpaper.jpeg"

wget -O "${WALLPAPER_PATH}" "${BASE_URL}/wallpaper/wallpaper-${WALLPAPER_SIZE}.jpeg"

cat <<FEHBG > "/home/${SYSTEM_USER}/.fehbg"
#!/bin/sh
feh --no-fehbg --bg-scale '${WALLPAPER_PATH}'
FEHBG

I3_CONFIG_FILE="/home/${SYSTEM_USER}/.config/i3/config"

# Copy i3 config file
wget -O "${I3_CONFIG_FILE}" "${BASE_URL}/i3.config"

# Download font and extract it in /usr/local/share/fonts
wget -O "/tmp/roboto.zip" "${BASE_URL}/RobotoMono.zip"
unzip "/tmp/roboto.zip" -d "/usr/local/share/fonts"

wget -O "/home/${SYSTEM_USER}/.config/alacritty/alacritty.yml" "${BASE_URL}/alacritty.yml"

