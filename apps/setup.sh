# install additional apps

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# Define an array of applications to install using Homebrew Cask.
apps=(
  "firefox"
  "brave-browser"
  "1password"
  "1password-cli"
  "spotify"
  "rectangle"
  "alfred"
  "font-jetbrains-mono-nerd-font"
  "logseq"
)

# docker, mactex,	zotero

# Loop over the array to install each application.
for app in "${apps[@]}"; do
  if brew list --cask | grep -q "^$app\$"; then
    echo "$app is already installed. Skipping..."
  else
    echo "Installing $app..."
    brew install --cask "$app"
  fi
done
