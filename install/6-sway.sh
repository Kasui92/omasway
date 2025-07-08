# Sway - A Wayland compositor
sudo apt install -y \
  sway swaybg swaylock \
  waybar wofi \
  network-manager greetd

# Start Sway on first session
echo "[[ -z \$DISPLAY && \$(tty) == /dev/tty1 ]] && exec sway" >~/.bash_profile
