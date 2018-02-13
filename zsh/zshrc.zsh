# Zsh config.

# _Source things
# Only run once (exec zsh won't run what's inside)
if (( ! $+ETC_ZSH_ZSHRC )); then
    # Load environment
    source ~/.dotfiles/zsh/env.zsh
fi
export ETC_ZSH_ZSHRC=1

source ~/.zsh_plugins.sh # Load zsh plugins

# TODO: Do some smart for loop iteration (source all .zsh files)
source ~/.dotfiles/zsh/functions/functions.zsh
source ~/.dotfiles/zsh/functions/fzf-functions.zsh
source ~/.dotfiles/zsh/functions/git-functions.zsh
source ~/.dotfiles/zsh/bindings.zsh
source ~/.dotfiles/zsh/aliases/alias.zsh

source ~/.secrets # Private configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # FZF

autoload -Uz compinit && compinit # TODO: ?
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' matcher-list +'l:|=* r:|=*'

HISTFILESIZE=8000
HISTSIZE=80000 # How many lines of history to keep in memory
HISTFILE=~/.zsh_history # Where to save history to disk
SAVEHIST=8000 # Number of history entries to save to disk
#HISTDUP=erase # Erase duplicates in the history file
setopt    appendhistory # Append history to the history file (no overwriting)
setopt    sharehistory # Share history across terminals
setopt    incappendhistory # Immediately append to the history file, not just when a term is killed

setopt autocd # Can just write down the name

eval "$(hub alias -s)" # alias git -> hub
eval "$(thefuck --alias)" # alias fuck -> thefuck

[[ -f ~/.yarn-cache/.global/node_modules/tabtab/.completions/yarn.zsh ]] && . ~/.yarn-cache/.global/node_modules/tabtab/.completions/yarn.zsh # Yarn autocomplete

typeset -U PATH # Remove duplicates in $PATH