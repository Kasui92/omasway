if ! command -v nvim &>/dev/null; then
  cd /tmp
  NVIM_VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
  curl -Lo nvim.tar.gz "https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-linux-x86_64.tar.gz"
  sudo rm -rf /opt/nvim
  sudo tar -xzf nvim.tar.gz --directory /opt
  rm -f nvim.tar.gz
  cd -

  # Install luarocks and tree-sitter-cli to resolve lazyvim :checkhealth warnings
  sudo apt install -y luarocks tree-sitter-cli

  # Use LazyVim
  rm -rf ~/.config/nvim/.git
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  cp -R ~/.local/share/omasway/config/nvim/* ~/.config/nvim/
  rm -rf ~/.config/nvim/.git
  echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua
fi
