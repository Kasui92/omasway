CHOICES=(
  "Omasway       Update Omasway itself and run any migrations"
  "System        Update all system packages and remove unused packages"
  "Firmware      Update firmware packages"
  "<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 10 --header "Update manually-managed applications")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't update anything
  echo ""
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  "omasway") INSTALLER_FILE="$OMASWAY_PATH/bin/omasway-sub/update/migrate.sh" ;;
  "system") INSTALLER_FILE="$OMASWAY_PATH/bin/omasway-sub/update/update-system.sh" ;;
  "firmware") INSTALLER_FILE="$OMASWAY_PATH/bin/omasway-sub/update/update-firmware.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Update completed!" -- sleep 3
fi

clear
source $OMASWAY_PATH/bin/omasway
