CHOICES=(
  "Docker            "
  "Mainline Kernels  "
  "Firefox           "
  "NeoVim            "
  "Libreoffice       "
  "LocalSend         "
  "Pinta             "
  "Spotify           "
  "Visual Studio Code"
  "Xournalpp         "
  "> All             Remove all applications"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 29 --header "Uninstall application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  UNINSTALLER_FILE=$(gum file $OMASWAY_PATH/uninstall)

  [[ -n "$UNINSTALLER_FILE" ]] &&
    gum confirm "Run uninstaller?" &&
    source $UNINSTALLER_FILE &&
    gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
else
  UNINSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$UNINSTALLER" in
  "docker") UNINSTALLER_FILE="$OMASWAY_PATH/uninstall/docker.sh" ;;
  *) UNINSTALLER_FILE="$OMASWAY_PATH/uninstall/app-$UNINSTALLER.sh" ;;
  esac

  [[ -n "$UNINSTALLER_FILE" ]] &&
    gum confirm "Run uninstaller?" &&
    source $UNINSTALLER_FILE &&
    gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
fi

clear
source $OMASWAY_PATH/bin/omasway
