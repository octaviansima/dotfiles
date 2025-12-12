bindkey -e

autoload -Uz compinit
compinit

alias k=kubectl
source <(kubectl completion zsh)
compdef k=kubectl

eval "$(/opt/homebrew/bin/brew shellenv)"

# Function to wrap kubectx
function kubectx() {
  command kubectx "$@"
  local exit_code=$?
  tmux refresh-client -S
  return $exit_code
}

# Set the prompt
setopt PROMPT_SUBST
PROMPT='%F{gray}%*%f %B%F{magenta}%~%f%F{yellow}$(branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); [ -n "$branch" ] && echo " $branch")%f%b %F{cyan}%? %B%F{gray}$%f%b '

# access iCloud quickly
alias cloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

# refresh on cd; used for working directory path in TMUX status bar
cd() {
    builtin cd $1
    if [ "$TERM_PROGRAM" = tmux ]; then
        tmux refresh-client -S
    fi
}

# use nvim by default
export EDITOR=nvim
alias vim=nvim

# Ubuntu ll command
alias ll='ls -lGaf'

alias gf="git fetch --all"

# Fix reverse-i-search in tmux
bindkey '^R' history-incremental-search-backward

# caps match nocaps
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# used for 256 color
export TERM=xterm-256color

# Show colors for different file types
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Docker hack
export DOCKER_DEFAULT_PLATFORM=linux/arm64

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/octavian/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/octavian/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/octavian/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/octavian/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

. "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/octavian/.bun/_bun" ] && source "/Users/octavian/.bun/_bun"

# Auto-suggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[[Z' autosuggest-accept

# Source local secrets (API keys, tokens, etc.)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

