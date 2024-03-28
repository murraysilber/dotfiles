


# Install ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

#add to .zshrc
. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# add erlang plug-in
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

#erlang info

OSX
Note, for MacOS 10.15.4 and newer, 22.3.1 is the earliest version that can be installed through kerl (and, therefore, asdf). Earlier versions will fail to compile. See this issue for details.

Install the build tools brew install autoconf

Install OpenSSL brew install openssl@1.1 Erlang 24.1 and older require OpenSSL 1.1, read more here

Note, Erlang 25.1 and newer support OpenSSL 3.0, even for production use. If you want to build Erlang with openssl@3.0, install it by brew install openssl

For building with wxWidgets (start observer or debugger!). Note that you may need to select the right wx-config before installing Erlang. brew install wxwidgets

For building documentation and elixir reference builds: brew install libxslt fop


# install Elixir plugin
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git


#pre-requisites for ASDF
# Install common ASDF plugin deps
brew install coreutils automake autoconf openssl libyaml readline libxslt libtool

# Install Erlang plugin deps
brew install unixodbc wxmac

# Install Java. It's optional, but installing it avoids popup prompts.
# If you already have Java installed, you don't need to do this
brew cask install java

# Install Node.js plugin deps
brew install gpg

# Import node gpg keys
# This can be flaky, as it depends on network connections to the GPG key servers
# You may need to run it multiple times
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
