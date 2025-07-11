# Install iwd explicitly
if ! command -v iwd &>/dev/null; then
  sudo apt install -y iwd
  sudo systemctl enable --now iwd.service
fi

