#!/bin/zsh

# clone a new vanilla vm to test bootstrapping a Mac
tart list
tart delete sonoma-1
tart clone ghcr.io/cirruslabs/macos-sonoma-vanilla:latest sonoma-1
tart run --dir=myhost:~/Developer/dotfiles sonoma-1

# keeping this here purely for my testing purposes. I dont want it executed on my host

# zsh <(curl -s https://raw.githubusercontent.com/murraysilber/dotfiles/main/install/bootstrap.sh) --branch main


/install/lib/globals:source:8: no such file or directory: /install/lib/globals
/install/lib/functions:source:9: no such file or directory: /install/lib/functions
/Users/admin/dotfiles/install/bin/install.sh:13: command not found: loggers
/install/bin/verify_mac_supported.sh:source:15: no such file or directory: /install/bin/verify_mac_supported.sh
/Users/admin/dotfiles/install/bin/install.sh:16: command not found: pre_flight_checks
/Users/admin/dotfiles/install/bin/install.sh:23: command not found: welcome
Setting up macOS defaults
/install/bin/macos_defaults.sh:source:33: no such file or directory: /install/bin/macos_defaults.sh
