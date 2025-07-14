CHOICES=(
  "Mainline Kernels    Install newer Linux kernels than Ubuntu defaults"
  "FlameShot           Screenshot tool with annotation"
  "Libreoffice         Free and open source office suite"
  "LocalSend           Send files to nearby devices"
  "Pinta               Simple and easy to use drawing program"
  "Spotify             Stream music from the world's most popular service"
  "Visual Studio Code  Source code editor with support for development operations"
  "Xournalpp           Note taking and PDF annotation application"
  "<< Back             "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 14 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  *) INSTALLER_FILE="$HOME/.local/share/omasway/install/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $HOME/.local/share/omasway/bin/omasway
