# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# source my own paths
if [[ $SHLVL == 1 && ! -o LOGIN ]]; then
  source $HOME/.config/zsh/.zpath
fi

# /opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
