# Only run once (exec zsh won't run what's inside)
if (( ! $+ETC_ZSH_ZSHRC )); then
    # Load enviroment
    source ~/.dotfiles/zsh/env.zsh
fi
export ETC_ZSH_ZSHRC=1

# Load zsh plugins
source ~/.zsh_plugins.sh

# _Exports
export EDITOR='nvim'
export DOTFILES="$HOME/.dotfiles"

# _Source things
# TODO: Do some smart for loop iteration
#source ~/.dotfiles/zsh/env.zsh
source ~/.dotfiles/zsh/aliases/alias.zsh
source ~/.dotfiles/zsh/functions/fzf.zsh
source ~/.dotfiles/zsh/bindings.zsh
source ~/.dotfiles/zsh/aliases/git.zsh
source ~/.dotfiles/zsh/functions/functions.zsh

# Can just write down the file name
setopt autocd

# _Secret configs
source ~/.secrets

# 'thefuck' command correction
eval "$(thefuck --alias)"

# Neat colour schemes to use
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Yarn autocomplete
[[ -f /Users/nikivi/.yarn-cache/.global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/nikivi/.yarn-cache/.global/node_modules/tabtab/.completions/yarn.zsh

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' matcher-list +'l:|=* r:|=*'

PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_TITLE}; ${PROMPT_COMMAND}"

HISTSIZE=5000               # How many lines of history to keep in memory
HISTFILE=~/.zsh_history     # Where to save history to disk
SAVEHIST=5000               # Number of history entries to save to disk
#HISTDUP=erase              # Erase duplicates in the history file
setopt    appendhistory     # Append history to the history file (no overwriting)
setopt    sharehistory      # Share history across terminals
setopt    incappendhistory  # Immediately append to the history file, not just when a term is killed

# Source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unset IFS

# TODO: ?
eval "$(hub alias -s)"

