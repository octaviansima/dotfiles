# automatically open TMUX on terminal start
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

# change how the prompt (left of cursor) looks
PROMPT='%F{gray}%*%f %F{cyan}%? %B%F{magenta}%~%f%b %B%F{gray}$%f%b '

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

# kubectl alias
alias k=kubectl

# Autocomplete for kubectl and k
source <(kubectl completion zsh)

# Show colors for different file types
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

