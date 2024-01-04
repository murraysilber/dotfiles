#!/bin/zsh

# clone a new vanilla vm to test bootstrapping a Mac
tart list
tart delete sonoma-1
tart clone ghcr.io/cirruslabs/macos-sonoma-vanilla:latest sonoma-1
tart run --dir=myhost:~/Developer/dotfiles sonoma-1

# keeping this here purely for my testing purposes. I dont want it executed on my host

# zsh <(curl -s https://raw.githubusercontent.com/murraysilber/dotfiles/main/install/bootstrap.sh) --branch main
