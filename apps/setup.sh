# install additional apps

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# Applications to install using Homebrew Cask.
apps=(
  "firefox"
  "brave-browser"
  "1password"
  "1password-cli"
  "spotify"
  "alfred"
  "font-jetbrains-mono-nerd-font"
  "logseq"
  "docker"
  "hyperkey"
  "zotero"
  "google-chrome"
)

# Loop over the array to install each application.
for app in "${apps[@]}"; do
  if brew list --cask | grep -q "^$app\$"; then
    echo "$app is already installed. Skipping..."
  else
    echo "Installing $app..."
    brew install --cask "$app"
  fi
done

# Packages to install using Homebrew.
packages=(
  "git"
  "tree"
  "gum"
  "fastfetch"
  "latexindent"
  "tree"
  "jq"
  "wget"
)

# Loop over the array to install each application.
for package in "${packages[@]}"; do
  if brew list --formula | grep -q "^$package\$"; then
    echo "$package is already installed. Skipping..."
  else
    echo "Installing $package..."
    brew install "$package"
  fi
done
