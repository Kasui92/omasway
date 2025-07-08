#!/bin/bash

source $OMASWAY_PATH/ascii.sh
echo "" # Add spacing
echo "                                            $(cat $OMASWAY_PATH/version) $(cd $OMASWAY_PATH && git branch --show-current | grep -q "dev" && echo -e "\033[0;33m(dev)\033[0m" || echo "")"
echo "" # Add spacing

