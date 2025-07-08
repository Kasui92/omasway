# Theme
AVAILABLE_THEMES=(
  "Tokyo Night"
  "Catppuccin"
  "Nord"
  "Everforest"
  "Gruvbox"
  "Kanagawa"
)
DEFAULT_THEME="Tokyo Night"
OMASWAY_FIRST_RUN_THEME=$(gum choose "${AVAILABLE_THEMES[@]}" --limit 1 --selected "$DEFAULT_THEME" --height 10 --header "Select your theme" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
if [[ -z "$OMASWAY_FIRST_RUN_THEME" ]]; then
  OMASWAY_FIRST_RUN_THEME="tokyo-night"
fi
export OMASWAY_FIRST_RUN_THEME

# Apps
OPTIONAL_APPS=(
  "FlameShot"
  "Libreoffice"
  "LocalSend"
  "Pinta"
  "Spotify"
  "Xournalpp"
  "Visual Studio Code"
)
DEFAULT_OPTIONAL_APPS='FlameShot','LocalSend','Pinta','Spotify'
export OMASWAY_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 10 --header "Select optional apps" | tr ' ' '-')
