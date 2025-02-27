#!/usr/bin/env bash

. "$SCRIPT_DIR/utils.sh"

# Casks to install. If already installed, cask will be skipped
apps=(
  # "firefox"
  # "brave-browser"
  "1password"
  "1password-cli"
  # "spotify"
  "alfred"
  "font-jetbrains-mono-nerd-font"
  "logseq"
  # "docker"
  # "zotero"
  "google-chrome"
  "visual-studio-code"
  "rectangle"
  # "zettlr"
  "ghostty"
  "skim"
)

# Loop over the array to install each cask
info "Installing casks ........"
for app in "${apps[@]}"; do
  if brew list --cask | grep -q "^$app\$"; then
    warning "$app is already installed. Skipping..."
  else
    info "Installing {$app}..."
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
  # "latexindent"
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
  "ripgrep"
  "fd"
  "stow"
  "gcc"
  "hyperkey"
)

# Loop over the array to install each application.
info "Installing formulae ..........."
for package in "${packages[@]}"; do
  if brew list --formula | grep -q "^$package\$"; then
    warning "$package is already installed. Skipping..."
  else
    info "Installing $package..."
    brew install "$package"
  fi
done
