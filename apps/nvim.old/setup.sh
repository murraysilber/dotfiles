#!/bin/sh

# nvim_dir="$HOME/.config/nvim"

# if [ ! -d "$nvim_dir" ]; then
#   echo "$nvim_dir" does not exist
#   echo Creating "$nvim_dir"
#   mkdir -v "$nvim_dir"
# fi

cp -Rs "$HOME/dotfiles/apps/nvim" "$HOME/.config"
# ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/
# ln -s "$HOME/dotfiles/apps/neovim/*" "$nvim_dir/"
# ln -sf "$HOME/dotfiles/apps/neovim/init.lua" "$nvim_dir/init.lua"
# find /dir -mindepth 1 -maxdepth 1 -type f -exec ln -s -t /dir2 {} +
