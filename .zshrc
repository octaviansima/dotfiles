# automatically open TMUX on terminal start
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

# change how the prompt (left of cursor) looks
PROMPT='%f %B%F{240}%1~%f%b %# '

# access iCloud quickly
alias cloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

# use to sync for EECS151
alias s151="scp -r /Users/octaviansima/Documents/College/Fall2020/EECS151/fpga_labs_fa20 eecs151-abw@c125m-1.eecs.berkeley.edu:/home/cc/eecs151/fa20/class/eecs151-abw/fpga_labs_fa20"

# refresh on cd; used for working directory path in TMUX status bar
cd() {
    builtin cd $1
    tmux refresh-client -S
}

# use nvim by default
alias vim=nvim

# caps match nocaps
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit && compinit

# used for 256 color
export TERM=xterm-256color
