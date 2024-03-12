#!/usr/bin/env zsh

# wallpaper_path="$HOME/.config/wallpaper/african_sunset.jpeg"
# osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$wallpaper_path"'"'
# ret=$?
# if [[ $ret -eq 0 ]]; then
#   echo "Wallpaper set successfully "
# else
#   echo "Operation failed."
# fi

# Get the absolute path to the image
IMAGE_PATH="${HOME}/.config/wallpaper/african_sunset.jpeg"

# AppleScript command to set the desktop background
osascript <<EOF
tell application "System Events"
    set desktopCount to count of desktops
    repeat with desktopNumber from 1 to desktopCount
        tell desktop desktopNumber
            set picture to "$IMAGE_PATH"
        end tell
    end repeat
end tell
EOF
