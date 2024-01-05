#!/bin/zsh

# ------------------------------ 6 ------------------------------------- #
# Install ZAP plugin manager for zsh (a very simple plugin manager)
# echo ''
# echo "Installing ZAP Plugin Manager for zsh"
# echo ''

# --keep will keep existing .zshrc
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

# finally, source the .zshrc
echo "sourcing .zshrc"
source $HOME/.zshrc
echo ""
