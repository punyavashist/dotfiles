# _exports
export EDITOR='nvim'
export DOTFILES="$HOME/.dotfiles"

# _load zsh plugins
source ~/.zsh_plugins.sh

# _source aliases
source ~/.dotfiles/zsh/functions/functions.zsh
source ~/.dotfiles/zsh/functions/fzf.zsh
source ~/.dotfiles/zsh/zsh/bindings.zsh
source ~/.dotfiles/zsh/dev/env.zsh
source ~/.dotfiles/zsh/aliases/git.zsh
source ~/.dotfiles/zsh/aliases/vim.zsh
source ~/.dotfiles/zsh/aliases/cd.zsh
source ~/.dotfiles/zsh/aliases/dev.zsh
source ~/.dotfiles/zsh/aliases/app.zsh
source ~/.dotfiles/zsh/aliases/alias.zsh

setopt autocd

# _secret configs
source ~/.secrets

# 'thefuck' command correction
eval "$(thefuck --alias)"

# neat colour schemes to use
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# _yarn autocomplete
[[ -f /Users/nikivi/.yarn-cache/.global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/nikivi/.yarn-cache/.global/node_modules/tabtab/.completions/yarn.zsh

# TODO: does not work
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

