THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  cp $HOME/.local/share/omasway/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml

  if [ -f "$HOME/.local/share/omasway/themes/$THEME/btop.theme" ]; then
    cp $HOME/.local/share/omasway/themes/$THEME/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i "s/theme = \".*\"/theme = \"$THEME\"/g" ~/.config/btop/btop.conf
  else
    sed -i "s/theme = \".*\"/theme = \"Default\"/g" ~/.config/btop/btop.conf
  fi

  if [ -d "$HOME/.config/nvim" ]; then
    cp $HOME/.local/share/omasway/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
  fi

  gum spin --spinner globe --title "Theme changed!" -- sleep 3
fi

clear
source $HOME/.local/share/omasway/bin/omakub-sub/header.sh
source $HOME/.local/share/omasway/bin/omakub-sub/appearance.sh
