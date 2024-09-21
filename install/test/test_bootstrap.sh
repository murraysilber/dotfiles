#!/bin/zsh

# clone a new vanilla vm to test bootstrapping a Mac
tart list
tart delete sequoia
tart clone ghcr.io/cirruslabs/macos-sequoia-vanilla:latest sequoia
tart set sequoia --disk-size 65
tart run --dir=myhost:~/dotfiles sequoia

# keeping this here purely for my testing purposes. I dont want it executed on my host

# zsh <(curl -s https://raw.githubusercontent.com/murraysilber/dotfiles/main/bootstrap.sh) --branch main

# https://raw.githubusercontent.com/murraysilber/dotfiles/main/bootstrap.sh
