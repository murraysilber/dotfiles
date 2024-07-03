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
  "docker"
  "hyperkey"
)

# mactex,	zotero

# Loop over the array to install each application.
for app in "${apps[@]}"; do
  if brew list --cask | grep -q "^$app\$"; then
    echo "$app is already installed. Skipping..."
  else
    echo "Installing $app..."
    brew install --cask "$app"
  fi
done

# Define an array of packages to install using Homebrew.
packages=(
  "git"
  "tree"
  "black"
  "gum"
  "tart"
  "cirrus"
  "fastfetch"
  "latexindent"
  "tree"
  "fzf"
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
