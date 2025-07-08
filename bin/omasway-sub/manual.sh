if ! xdg-open "https://github.com/Kasui92/omasway/wiki" &>/dev/null; then
  echo -e "\nUnable to open the manual in your browser."
fi
source $OMASWAY_PATH/bin/omasway-sub/menu.sh
