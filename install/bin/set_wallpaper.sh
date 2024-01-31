#!/usr/bin/env zsh

wallpaper_path="$HOME/.config/wallpaper/african_sunset.jpeg"
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$wallpaper_path"'"'
ret=$?
if [[ $ret -eq 0 ]]; then
  echo "Wallpaper set successfully "
else
  echo "Operation failed."
fi
