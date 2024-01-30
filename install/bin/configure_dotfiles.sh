#!/usr/bin/env zsh

info() {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

configure_dotfiles() {
  info 'configuring dotfiles'
  info 'install stow to manage dotfiles'
  brew install stow
  source "${DOTFILES}"/install/bin/sstow.sh
}

create_env_file() {
  if test -f "$HOME/.env.sh"; then
    success "$HOME/.env.sh file already exists, skipping"
  else
    echo "export DOTFILES=$DOTFILES" >$HOME/.env.sh
    success 'created ~/.env.sh'
  fi
}

configure_dotfiles
create_env_file

echo ''
echo ''
success 'Dotfiles done'
