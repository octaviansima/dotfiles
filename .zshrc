# automatically open TMUX on terminal start
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

# change how the prompt (left of cursor) looks
PROMPT='%f %B%F{240}%1~%f%b %# '

# access iCloud quickly
alias cloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

# refresh on cd; used for working directory path in TMUX status bar
cd() {
    builtin cd $1
    tmux refresh-client -S
}

# use nvim by default
alias vim=nvim

# ll command Ubuntu command
alias ll='ls -lGaf'

# caps match nocaps
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit && compinit

# used for 256 color
export TERM=xterm-256color
