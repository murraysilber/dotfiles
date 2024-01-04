#!/bin/zsh

# Download latest release and start setup process
URL=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/murraysilber/dotfiles/releases/latest \
  | grep "zipball_url" \
  | cut -d '"' -f 4)

curl -L -H "Accept: application/vnd.github.v3+json" --url ${URL} -o setup.zip

unzip setup.zip -d setup
cd setup/murraysilber-dotfiles*
echo "$(pwd -P)"

# move dotfiles folder to home
CURRENT_WORKING_DIRECTORY=$(pwd -P)
echo -e "CURRENT_WORKING_DIRECTORY ${CURRENT_WORKING_DIRECTORY} "
cp -R ${CURRENT_WORKING_DIRECTORY}/dotfiles ${HOME}

#caffeinate zsh ./install.sh "$@"
caffeinate zsh ${HOME}/dotfiles/install/bin/install.sh
