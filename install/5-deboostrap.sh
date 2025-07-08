# Disable gdm3
sudo systemctl disable gdm3
sudo systemctl stop gdm3

# Remove main GNOME packages
sudo apt purge -y \
  ubuntu-desktop \
  gnome-shell gnome-session gdm3 \
  gnome-control-center gnome-settings-daemon gnome-terminal \
  gnome-terminal nautilus gedit eog evince totem cheese \
  gnome-software

# Remove snap
sudo systemctl stop snapd
sudo systemctl disable snapd
sudo apt purge -y snapd
sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd

# Clean packages
sudo apt autoremove --purge -y
sudo apt clean
