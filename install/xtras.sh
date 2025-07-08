# Optional Apps
if [[ -v OMASWAY_FIRST_RUN_OPTIONAL_APPS ]]; then
  apps=$OMASWAY_FIRST_RUN_OPTIONAL_APPS

  if [[ -n "$apps" ]]; then
    for app in $apps; do
      source "$OMASWAY_PATH/install/optional/app-${app,,}.sh"
    done
  fi
fi

# Applications
for script in ~/.local/share/omasway/applications/*.sh; do source $script; done

# Remove Btop entry for one that runs in alacritty
sudo rm -rf /usr/share/applications/btop.desktop

# App doesn't do anything when started from the app grid
sudo rm -rf /usr/share/applications/org.flameshot.Flameshot.desktop

# Remove the ImageMagick icon
sudo rm -rf /usr/share/applications/display-im6.q16.desktop

# Replacing this with btop
sudo rm -rf /usr/share/applications/org.gnome.SystemMonitor.desktop

# We added our own meant for Alacritty
sudo rm -rf /usr/local/share/applications/nvim.desktop
sudo rm -rf /usr/local/share/applications/vim.desktop
