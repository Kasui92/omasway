ascii_art='
 ██████╗ ███╗   ███╗ █████╗ ███████╗██╗    ██╗ █████╗ ██╗   ██╗
██╔═══██╗████╗ ████║██╔══██╗██╔════╝██║    ██║██╔══██╗╚██╗ ██╔╝
██║   ██║██╔████╔██║███████║███████╗██║ █╗ ██║███████║ ╚████╔╝ 
██║   ██║██║╚██╔╝██║██╔══██║╚════██║██║███╗██║██╔══██║  ╚██╔╝  
╚██████╔╝██║ ╚═╝ ██║██║  ██║███████║╚███╔███╔╝██║  ██║   ██║   
 ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   
'

# ANSI escape sequence per colore RGB #1b4a49
color='\033[38;2;27;74;73m'
reset='\033[0m'

# Stampa riga per riga con colore uniforme
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"
for line in "${lines[@]}"; do
  echo -e "${color}${line}"
done

# Reset colore
echo -e "$reset"
