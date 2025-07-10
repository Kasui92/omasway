# Sway - A Wayland compositor
sudo apt install -y \
  sway swaybg swaylock \
  waybar wofi \
  network-manager

# Start Sway on first session - Ubuntu compatible approach
echo "[[ -z \$DISPLAY && \$(tty) == /dev/tty1 ]] && exec sway" >> ~/.profile
