#!/bin/zsh

# clone a new vanilla vm to test bootstrapping a Mac
tart list
tart delete sonoma
tart clone ghcr.io/cirruslabs/macos-sonoma-vanilla:latest sonoma
tart run --dir=myhost:~/dotfiles sonoma

# keeping this here purely for my testing purposes. I dont want it executed on my host

# zsh <(curl -s https://raw.githubusercontent.com/murraysilber/dotfiles/main/bootstrap.sh) --branch main

# https://raw.githubusercontent.com/murraysilber/dotfiles/main/bootstrap.sh
