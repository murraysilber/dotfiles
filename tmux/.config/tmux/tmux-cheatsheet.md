
# Tmux Cheatsheet

## Key Commands

Start a new session

```shell
tmux new -s NewSession
```

Exit session

```shell
tmux detach
```

List sessions

```shell
tmux ls
```

Go back into session

```shell
tmux attach -t NewSession
```

Show all available options

```shell
tmux show-options -g
```

Show all available shortcuts

```shell
tmux list-keys
```

Show all available commands

```shell
tmux list-commands
```

Start fresh

```shell
tmux kill-server && rm -rf /tmp/tmux-*
```

Enable plugins

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Essential Shortcuts

### Windows

- Create new tmux window: `Prefix + c`
- Navigate to window: `Prefix + number`
- Cycle through window: `Prefix + n/p`
- See all windows: `Prefix + w`
- Rename window: `Prefix + ,`
- Find window by name: `Prefix + f`
- To close a window: `Prefix + &`

### Panes

- Split window vertically: `Prefix + %`
- Split window horizontally: `Prefix + "`
- Close current active pane: `Prefix + x`

### Sessions

- Rename session: `Prefix + $`
- Explore sessions: `Prefix + s`
- Save sessions: `Prefix + CTRL + s`
- Detach: `Prefix + d`
- Restore session: `Prefix + CTRL + r`

### General

- Prefix: `CTRL + b`
- Install plugins: `Prefix + I`

### Pomodoro Shortcuts

- To toggle between starting/pausing a Pomodoro/break: `Prefix + p`
- To cancel a Pomodoro/break: `Prefix + P`
- To skip a Pomodoro/break: `Prefix + _`
- To restart a Pomodoro: `Prefix + e`
- To open the Pomodoro timer menu: `Prefix + C-p`
- To set a custom Pomodoro timer: `Prefix + M-p`

## Useful Snippets

Add this to your `.zshrc` to always work in a Tmux session:

```shell
# Always work in a tmux session if Tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t default || tmux new -s default; exit
  fi
fi
```
