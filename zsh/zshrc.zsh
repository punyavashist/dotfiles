# Only run once (exec zsh won't run what's inside)
if (( ! $+ETC_ZSH_ZSHRC )); then
    # Load environment
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
source ~/.dotfiles/zsh/functions/fzf.zsh
source ~/.dotfiles/zsh/functions/git-functions.zsh
source ~/.dotfiles/zsh/functions/functions.zsh
source ~/.dotfiles/zsh/bindings.zsh
source ~/.dotfiles/zsh/aliases/alias.zsh

# Can just write down the file name
setopt autocd

# Secret configs
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

HISTFILESIZE=8000
HISTSIZE=80000 # How many lines of history to keep in memory
HISTFILE=~/.zsh_history # Where to save history to disk
SAVEHIST=8000 # Number of history entries to save to disk
#HISTDUP=erase # Erase duplicates in the history file
setopt    appendhistory # Append history to the history file (no overwriting)
setopt    sharehistory # Share history across terminals
setopt    incappendhistory # Immediately append to the history file, not just when a term is killed

# Source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unset IFS

# _Brew
export HOMEBREW_AUTO_UPDATE_SECS=3600

# TODO: ?
eval "$(hub alias -s)"

# Change prompt when in Vim mode
VIM_PROMPT="❯"
PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

prompt_pure_update_vim_prompt() {
    zle || {
        print "error: pure_update_vim_prompt must be called when zle is active"
        return 1
    }
    VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
    zle .reset-prompt
}

function zle-line-init zle-keymap-select {
    prompt_pure_update_vim_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

typeset -U PATH # Remove duplicates in $PATH