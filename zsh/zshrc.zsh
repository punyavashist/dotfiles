# _Source things
# Only run once (exec zsh won't run what's inside)
if (( ! $+ETC_ZSH_ZSHRC )); then
    # Load environment
    source ~/.dotfiles/zsh/env.zsh
fi
export ETC_ZSH_ZSHRC=1

source ~/.zsh_plugins.sh # Load zsh plugins

# Change prompt when inside nix-shell
if test -n "$IN_NIX_SHELL"; then
	PROMPT='%(?.%F{magenta}λ '
fi

# TODO: Do some smart for loop iteration (source all .zsh files)
source ~/.dotfiles/zsh/functions/functions.zsh
source ~/.dotfiles/zsh/functions/fzf-functions.zsh
source ~/.dotfiles/zsh/functions/git-functions.zsh
source ~/.dotfiles/zsh/bindings.zsh
source ~/.dotfiles/zsh/alias.zsh

source ~/.secrets # Private configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # FZF setup

# _Completions
autoload -Uz compinit && compinit # TODO: ?
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' matcher-list +'l:|=* r:|=*'

# _History
HISTSIZE=10000 # Lines of history to keep in memory for current session
HISTFILESIZE=10000 # Number of commands to save in the file
SAVEHIST=10000 # Number of history entries to save to disk
HISTFILE=~/.zsh_history # Where to save history to disk
HISTDUP=erase # Erase duplicates in the history file
setopt hist_ignore_dups # Ignore duplicates

# _Options - `man zshoptions`
setopt append_history # Append history to the history file (no overwriting)
setopt share_history # Share history across terminals
setopt inc_append_history # Immediately append to the history file, not just when a term is killed
setopt extended_glob # Use extended globbing syntax
setopt auto_cd # Auto change to a dir without typing cd

eval "$(hub alias -s)" # alias git -> hub

[[ -f ~/.yarn-cache/.global/node_modules/tabtab/.completions/yarn.zsh ]] && . ~/.yarn-cache/.global/node_modules/tabtab/.completions/yarn.zsh # Yarn autocomplete

typeset -U PATH # Remove duplicates in $PATH
