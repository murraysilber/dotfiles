#!/usr/bin/env bash

. "$SCRIPT_DIR/utils.sh"
# Installs all my macOS preferences, just the way I like it.
# https://macos-defaults.com/ - useful info..great site.

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Register Keyboard Shortcuts
register_keyboard_shortcuts() {
  # Register CTRL+/ keyboard shortcut to avoid system beep when pressed
  info "Registering keyboard shortcuts..."
  mkdir -p "$HOME/Library/KeyBindings"
  cat >"$HOME/Library/KeyBindings/DefaultKeyBinding.dict" <<EOF
{
 "^\U002F" = "noop";
}
EOF
}

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

apply_osx_system_defaults() {
  info "Applying OSX system defaults..."

  # Set a blazingly fast keyboard repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 1
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Puts the mac into dark mode. This will only take effect after a restart.
  defaults write "Apple Global Domain" "AppleInterfaceStyle" "Dark"

  # Require password after sleep or screen saver begins
  defaults write com.apple.screensaver askForPassword -int 1

  # Save screenshots to the Pictures folder
  defaults write com.apple.screencapture location -string "${HOME}/Pictures"

  # Save screenshots in JPG format (other options: BMP, GIF, JPG, PDF, TIFF)
  defaults write com.apple.screencapture type -string "jpg"

  # Keep desktops organised statically, do NOT rearrange spaces automatically
  defaults write com.apple.dock "mru-spaces" -bool false

  # Spaces do not span all displays (each display has its own spaces)
  defaults write com.apple.spaces "spans-displays" -bool false

  # Don’t automatically rearrange Spaces based on most recent use
  defaults write com.apple.dock mru-spaces -bool false

  # Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  # Remove the auto-hiding Dock delay
  defaults write com.apple.dock autohide-delay -float 0

  # Remove the animation when hiding/showing the Dock
  defaults write com.apple.dock autohide-time-modifier -float 0

  # Make Dock icons of hidden applications translucent
  defaults write com.apple.dock showhidden -bool true

  # Show only active apps on the dock
  defaults write com.apple.dock static-only -bool true

  # Do not show recently opened apps in the dock
  defaults write com.apple.dock "show-recents" -bool "false"

  # Set the icon size of Dock items to 32 pixels,
  defaults write com.apple.dock tilesize -int 32

  # Enable Dock magnification
  defaults write com.apple.dock magnification -bool true

  # Set the magnification size for the dock
  defaults write com.apple.dock largesize -int 64

  killall "Dock"

  # Show the Path Bar:
  defaults write com.apple.finder ShowPathbar -bool true

  # Show the Status Bar:
  defaults write com.apple.finder ShowStatusBar -bool true

  # Always show the Scroll Bars:
  defaults write -g AppleShowScrollBars -string "Always"

  # Preferred view style
  # Icon View   : `icnv`
  # List View   : `Nlsv`
  # Column View : `clmv`
  # Cover Flow  : `Flwv`
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  # After configuring preferred view style, clear all `.DS_Store` files
  # to ensure settings are applied for every directory
  find . -name '.DS_Store' -type f -delete

  # Keep folders on top when sorting by name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true

  # Show icons for hard drives, servers, and removable media on the desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  # Finder: show hidden files by default
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # Finder: show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Display full POSIX path as Finder window title
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  # Keep folders on top when sorting by name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true

  # Avoid creating .DS_Store files on network or USB volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  # New window target
  # Computer     : `PfCm`
  # Volume       : `PfVo`
  # $HOME        : `PfHm`
  # Desktop      : `PfDe`
  # Documents    : `PfDo`
  # All My Files : `PfAF`
  # Other…       : `PfLo`
  defaults write com.apple.finder NewWindowTarget -string 'PfHm'
  #defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

  # Show the ~/Library folder
  chflags nohidden ~/Library
  # && xattr -d com.apple.FinderInfo ~/Library

  # Show the /Volumes folder
  sudo chflags nohidden /Volumes

  # Set Sidebar icon size to medium
  defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "2"

  # kill Finder
  killall "Finder"

  # Prevent Photos from opening automatically when devices are plugged in
  defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

  success "Done. Note that some of these changes require a logout/restart to take effect."
}
