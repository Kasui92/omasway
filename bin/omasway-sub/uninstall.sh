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
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 29 --header "Uninstall application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
else
  UNINSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$UNINSTALLER" in
  "docker") UNINSTALLER_FILE="$HOME/.local/share/omasway/uninstall/docker.sh" ;;
  *) UNINSTALLER_FILE="$HOME/.local/share/omasway/uninstall/app-$UNINSTALLER.sh" ;;
  esac

  [[ -n "$UNINSTALLER_FILE" ]] &&
    gum confirm "Run uninstaller?" &&
    source $UNINSTALLER_FILE &&
    gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
fi

clear
source $HOME/.local/share/omasway/bin/omasway
