#!/bin/zsh

# Download latest release and start setup process
URL=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/murraysilber/dotfiles/releases/latest \
  | grep "zipball_url" \
  | cut -d '"' -f 4)

curl -L -H "Accept: application/vnd.github.v3+json" --url ${URL} -o setup.zip

unzip setup.zip -d setup
cd setup/murraysilber-dotfiles*
echo pwd

#caffeinate zsh ./install.sh "$@"
caffeinate zsh ./install.sh
