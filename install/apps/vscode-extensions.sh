#!/usr/bin/env bash

. $SCRIPT_DIR/utils.sh

install_vscode_extensions() {
    info "Installing VSCode extensions..."

    # List of Extensions
    extensions=(
        aaron-bond.better-comments
        akashagarwal.markdown-meaningful-wordcount
        ban.spellright
        bradlc.vscode-tailwindcss
        byi8220.indented-block-highlighting
        ciarant.vscode-structurizr
        dotjoshjohnson.xml
        esbenp.prettier-vscode
        foxundermoon.shell-format
        golang.go
        hediet.vscode-drawio
        jakebecker.elixir-ls
        james-yu.latex-workshop
        jdinhlife.gruvbox
        jebbs.plantuml
        kevinrose.vsc-python-indent
        mechatroner.rainbow-csv
        mhutchie.git-graph
        mrmlnc.vscode-duplicate
        ms-azuretools.vscode-docker
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        ms-vscode.makefile-tools
        mushan.vscode-paste-image
        pkief.material-icon-theme
        redhat.vscode-yaml
        shd101wyy.markdown-preview-enhanced
        sumneko.lua
        tamasfe.even-better-toml
        timonwong.shellcheck
        tyriar.lorem-ipsum
        vscodevim.vim
        yzhang.markdown-all-in-one
    )

    for e in "${extensions[@]}"; do
        code --install-extension "$e"
    done

    success "VSCode extensions installed successfully"
}
