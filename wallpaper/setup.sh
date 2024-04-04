#!/bin/sh

wallpaper_dir="$HOME/.config/wallpaper"

if [ ! -d "$wallpaper_dir" ]; then
  echo "$wallpaper_dir" does not exist.
  echo Creating "$wallpaper_dir"
  mkdir -v "$wallpaper_dir"
fi

cp "$HOME/dotfiles/wallpaper/gruvbox-3.jpg" "$HOME/.config/wallpaper"

# Get the absolute path to the image
IMAGE_PATH="${HOME}/.config/wallpaper/gruvbox-3.jpg"

osascript <<EOF
tell application "System Events"
    tell every desktop
        set picture to "$IMAGE_PATH"
    end tell
end tell
EOF
