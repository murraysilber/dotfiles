#!/bin/zsh

# clone a new vanilla vm to test bootstrapping a Mac
tart list
tart delete sonoma-1
tart clone ghcr.io/cirruslabs/macos-sonoma-vanilla:latest sonoma-1
tart run --dir=myhost:~/ sonoma-1

zsh <(curl -s https://raw.githubusercontent.com/murraysilber/dotfiles/main/bootstrap.sh) --branch main
