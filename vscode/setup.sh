#!/bin/sh

brew install --cask visual-studio-code

vscode_dir="$HOME/Library/Application\ Support/Code/User"

if [ ! -d "$vscode_dir" ]; then
  echo "$vscode_dir" does not exist.
  echo Creating "$vscode_dir"
  mkdir -v "$vscode_dir"
fi

ln -sf "$HOME/dotfiles/vscode/settings.json" "$vscode_dir/settings.json"

# Install my extensions
code --install-extension golang.go
code --install-extension ms-python.python
code --install-extension jdinhlife.gruvbox
code --install-extension sainnhe.gruvbox-material
code --install-extension vscode-icons-team.vscode-icons

# code --install-extension aaron-bond.better-comments
# code --install-extension akashagarwal.markdown-meaningful-wordcount
# code --install-extension alefragnani.project-manager
# code --install-extension asciidoctor.asciidoctor-vscode
# code --install-extension ban.spellright
# code --install-extension byi8220.indented-block-highlighting
# code --install-extension ciarant.vscode-structurizr
# code --install-extension deerawan.vscode-dash
# code --install-extension dotjoshjohnson.xml
# code --install-extension esbenp.prettier-vscode
# code --install-extension fosshaas.fontsize-shortcuts
# code --install-extension foxundermoon.shell-format
# code --install-extension hediet.vscode-drawio
# code --install-extension james-yu.latex-workshop

# code --install-extension jebbs.plantuml
# code --install-extension kevinrose.vsc-python-indent
# code --install-extension mechatroner.rainbow-csv
# code --install-extension mhutchie.git-graph
# code --install-extension mrmlnc.vscode-duplicate
# code --install-extension ms-azuretools.vscode-docker
# code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
# code --install-extension ms-python.isort

# code --install-extension ms-vscode-remote.remote-containers
# code --install-extension mushan.vscode-paste-image
# code --install-extension njpwerner.autodocstring
# code --install-extension notzaki.pandocciter
# code --install-extension redhat.vscode-yaml
# code --install-extension robole.snippets-ranger

# code --install-extension shd101wyy.markdown-preview-enhanced
# code --install-extension streetsidesoftware.code-spell-checker
# code --install-extension sumneko.lua
# code --install-extension tamasfe.even-better-toml
# code --install-extension tecosaur.latex-utilities
# code --install-extension thefern.vscode-gutenberg
# code --install-extension timonwong.shellcheck
# code --install-extension tyriar.lorem-ipsum

# code --install-extension vscodevim.vim
# code --install-extension yzhang.markdown-all-in-one
