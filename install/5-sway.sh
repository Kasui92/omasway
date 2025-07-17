# Sway - A Wayland compositor
sudo apt install -y \
  sway swaybg swaylock swayidle mate-polkit-bin \
  waybar wofi mako-notifier \
  xwayland wayland-protocols wayland-utils xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
  qtwayland5 qt6-wayland

# Autotiling - a tiling script for Sway
sudo apt install -y python3-i3ipc

cd /tmp
AUTOTILING_VERSION=$(curl -s "https://api.github.com/repos/nwg-piotr/autotiling/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo autotiling.tar.gz "https://github.com/nwg-piotr/autotiling/archive/refs/tags/v${AUTOTILING_VERSION}.tar.gz"
tar -xf autotiling.tar.gz "autotiling-${AUTOTILING_VERSION}"
sudo mv "autotiling-${AUTOTILING_VERSION}/autotiling/main.py" /usr/bin/autotiling
sudo chmod +x /usr/bin/autotiling
rm -R autotiling.tar.gz "autotiling-${AUTOTILING_VERSION}"
cd -
