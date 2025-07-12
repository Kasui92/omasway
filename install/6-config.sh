# Copy over Omasway configs
mkdir -p ~/.config
cp -R ~/.local/share/omasway/config/* ~/.config/

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Configure the bash shell using Omasway defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
echo "source ~/.local/share/omasway/default/bash/rc" >~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omasway/default/bash/shell

# Configure the inputrc using Omasway defaults
[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
echo "\$include ~/.local/share/omasway/default/bash/inputrc" >~/.inputrc

# Configure the profile using Omasway defaults
[ -f "~/.profile" ] && mv ~/.profile ~/.profile.bak
echo "\$include ~/.local/share/omasway/default/bash/profile" >~/.profile

# Start Sway on first session - Ubuntu compatible approach
echo "if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi" >> ~/.profile

# Login directly as user
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER --noclear %I \$TERM
EOF

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${OMASWAY_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMASWAY_USER_NAME"
fi

if [[ -n "${OMASWAY_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMASWAY_USER_EMAIL"
fi

# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omasway/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMASWAY_USER_NAME"
<Multi_key> <space> <e> : "$OMASWAY_USER_EMAIL"
EOF

