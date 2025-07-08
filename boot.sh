set -o pipefail

ascii_art='
 ██████╗ ███╗   ███╗ █████╗ ███████╗██╗    ██╗ █████╗ ██╗   ██╗
██╔═══██╗████╗ ████║██╔══██╗██╔════╝██║    ██║██╔══██╗╚██╗ ██╔╝
██║   ██║██╔████╔██║███████║███████╗██║ █╗ ██║███████║ ╚████╔╝ 
██║   ██║██║╚██╔╝██║██╔══██║╚════██║██║███╗██║██╔══██║  ╚██╔╝  
╚██████╔╝██║ ╚═╝ ██║██║  ██║███████║╚███╔███╔╝██║  ██║   ██║   
 ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   
'

# ANSI escape
color='\033[38;2;27;74;73m'
reset='\033[0m'

# Apply colors
echo
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"
for line in "${lines[@]}"; do
  echo -e "${color}${line}"
done

# Reset colors
echo -e "$reset"

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo -e "\nCloning Omasway..."
rm -rf ~/.local/share/omasway
git clone https://github.com/Kasui92/omasway.git ~/.local/share/omasway >/dev/null

if [[ $OMASWAY_REF ]]; then
  echo -e "\nUsing branch: $OMASWAY_REF"
  cd ~/.local/share/omasway
  git fetch origin "${OMASWAY_REF}" && git checkout "${OMASWAY_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omasway/install.sh
