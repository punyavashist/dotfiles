source ~/.zsh_plugins.sh # Load zsh plugins

# Change prompt if inside nix-shell
if test -n "$IN_NIX_SHELL"; then
	PROMPT='%F{magenta}λ '
fi

source ~/.dotfiles/zsh/env.zsh

source ~/.dotfiles/zsh/functions/functions.zsh
source ~/.dotfiles/zsh/functions/fzf-functions.zsh
source ~/.dotfiles/zsh/functions/git-functions.zsh
source ~/.dotfiles/zsh/bindings.zsh
source ~/.dotfiles/zsh/alias.zsh
source ~/.dotfiles/zsh/options.zsh