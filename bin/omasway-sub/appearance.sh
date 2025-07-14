CHOICES=(
  "Theme         Change the system theme"
  "<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 5 --header "Change system appearance")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't update anything
  echo ""
else
  APPEARANCE=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$APPEARANCE" in
  "theme") APPEARANCE_FILE="$HOME/.local/share/omasway/bin/omasway-sub/appearance/theme.sh" ;;
  esac

  source $APPEARANCE_FILE && gum spin --spinner globe --title "Change completed!" -- sleep 3
fi

clear
source $HOME/.local/share/omasway/bin/omasway
