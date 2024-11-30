# Update macOS defaults and wallpaper
for i in wallpaper defaults; do
  echo "$HOME/dotfiles/macos/$i/setup.sh"
  # shellcheck disable=SC1090
  source "$HOME/dotfiles/macos/$i/setup.sh"
  # cd $i && ./setup.sh
  # cd -
done
