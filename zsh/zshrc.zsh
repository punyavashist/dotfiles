# Change prompt if inside nix-shell
if test -n "$IN_NIX_SHELL"; then
	PROMPT='%F{magenta}λ '
fi

# Only run once. `exec zsh` won't run this.
if (( ! $+ETC_ZSH_ZSHRC )); then
    # Load env
    source ~/.dotfiles/zsh/env.zsh
fi
export ETC_ZSH_ZSHRC=1

source ~/.zsh_plugins.sh # Load zsh plugins
source ~/.dotfiles/zsh/functions/functions.zsh
source ~/.dotfiles/zsh/functions/fzf-functions.zsh
source ~/.dotfiles/zsh/functions/git-functions.zsh
source ~/.dotfiles/zsh/bindings.zsh
source ~/.dotfiles/zsh/alias.zsh
source ~/.dotfiles/zsh/options.zsh

typeset -U PATH # Remove duplicates in $PATH