# Optional Apps
if [[ -v OMASWAY_FIRST_RUN_OPTIONAL_APPS ]]; then
  apps=$OMASWAY_FIRST_RUN_OPTIONAL_APPS

  if [[ -n "$apps" ]]; then
    for app in $apps; do
      source "$OMASWAY_PATH/install/optional/app-${app,,}.sh"
    done
  fi
fi

# Apps
# Copy and sync icon files
mkdir -p ~/.local/share/icons/hicolor/48x48/apps/
cp ~/.local/share/omasway/applications/icons/*.png ~/.local/share/icons/hicolor/48x48/apps/
gtk-update-icon-cache ~/.local/share/icons/hicolor &>/dev/null

# Copy .desktop declarations
mkdir -p ~/.local/share/applications
cp ~/.local/share/omasway/applications/*.desktop ~/.local/share/applications/
cp ~/.local/share/omasway/applications/hidden/*.desktop ~/.local/share/applications/

update-desktop-database ~/.local/share/applications

