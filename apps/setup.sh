# install additional apps

echo "we are in apps setup"

# Casks to install. If already installed, cask will be skipped
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
  "zotero"
  "google-chrome"
  "wezterm"
  "visual-studio-code"
  "rectangle"
  "zettlr"
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

# Formulae to install using Homebrew. If already installed, formula will be skipped
packages=(
  "zsh"
  "git"
  "tree"
  "gum"
  "fastfetch"
  "latexindent"
  "tree"
  "jq"
  "wget"
  "tmux"
  "mise"
  "uv"
  "zsh-autosuggestions"
  "zsh-syntax-highlighting"
  "fzf"
  "neovim"
  "lua-language-server"
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

# Upgrade any already-installed casks and formulae
echo "Upgrading installed apps......"
brew upgrade
brew upgrade --cask
brew cleanup

# Run app updates
for i in tmux rectangle mise wezterm uv vscode nvim; do
  echo "$HOME/dotfiles/apps/$i/setup.sh"
  # shellcheck disable=SC1090
  source "$HOME/dotfiles/apps/$i/setup.sh"
  # cd $i && ./setup.sh
  # cd -
done
