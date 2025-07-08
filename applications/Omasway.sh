cat <<EOF >~/.local/share/applications/Omasway.desktop
[Desktop Entry]
Version=1.0
Name=Omasway
Comment=Omasway Controls
Exec=alacritty --class=Omasway --title=Omasway -e omasway
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omasway/applications/icons/Omasway.png
Categories=GTK;
StartupNotify=false
EOF
