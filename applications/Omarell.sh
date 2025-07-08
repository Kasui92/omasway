cat <<EOF >~/.local/share/applications/Omarell.desktop
[Desktop Entry]
Version=1.0
Name=Omarell
Comment=Omarell Controls
Exec=alacritty --class=Omarell --title=Omarell -e omasway
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omasway/applications/icons/Omarell.png
Categories=GTK;
StartupNotify=false
EOF
