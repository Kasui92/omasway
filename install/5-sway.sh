# Sway - A Wayland compositor
sudo apt install -y \
  sway swaybg swaylock swayidle mate-polkit-bin \
  waybar wofi mako-notifier \
  xwayland wayland-protocols wayland-utils xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
  qtwayland5 qt6-wayland

# Autotiling - a tiling script for Sway
sudo apt install -y python3-i3ipc

cd /tmp
wget -qO- https://raw.githubusercontent.com/nwg-piotr/autotiling/autotiling/main.py > autotiling
mv autotiling ~/.local/bin/autotiling
chmod +x ~/.local/bin/autotiling
cd -