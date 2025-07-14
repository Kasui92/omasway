#!/bin/bash

source $HOME/.local/share/omasway/ascii.sh
echo "" # Add spacing
echo "                                            $(cat $HOME/.local/share/omasway/version) $(cd $HOME/.local/share/omasway && git branch --show-current | grep -q "dev" && echo -e "\033[0;33m(dev)\033[0m" || echo "")"
echo "" # Add spacing
