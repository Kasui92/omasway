CHOICES=(
  "Mainline Kernels    Install newer Linux kernels than Ubuntu defaults"
  "FlameShot           Screenshot tool with annotation"
  "Libreoffice         Free and open source office suite"
  "LocalSend           Send files to nearby devices"
  "Pinta               Simple and easy to use drawing program"
  "Spotify             Stream music from the world's most popular service"
  "Visual Studio Code  Source code editor with support for development operations"
  "Xournalpp           Note taking and PDF annotation application"
  "> All               Re-run any of the default installers"
  "<< Back             "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 23 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  INSTALLER_FILE=$(gum file $OMASWAY_PATH/install)

  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  *) INSTALLER_FILE="$OMASWAY_PATH/install/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMASWAY_PATH/bin/omasway
