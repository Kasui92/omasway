# Prefer dark mode everything
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Setup theme links
mkdir -p ~/.config/omasway/themes
for f in ~/.local/share/omasway/themes/*; do ln -s "$f" ~/.config/omasway/themes/; done

# Set initial theme
mkdir -p ~/.config/omasway/current
ln -snf ~/.config/omasway/themes/$OMASWAY_FIRST_RUN_THEME ~/.config/omasway/current/theme

# Set specific app links for current theme
ln -snf ~/.config/omasway/current/theme/wofi.css ~/.config/wofi/style.css
ln -snf ~/.config/omasway/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omasway/current/theme/btop.theme ~/.config/btop/themes/current.theme

# Touch alacritty config to pickup the changed theme
touch "$HOME/.config/alacritty/alacritty.toml"
