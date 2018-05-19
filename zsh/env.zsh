# Setting and editing of different enviroment variables.

export EDITOR='nvim'
export SUDO_EDITOR='nvim'

export DOTFILES="$HOME/.dotfiles"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$PATH:~/.dotfiles/bin
export PATH=./node_modules/.bin/:$PATH # NPM
export PATH=$PATH:/usr/local/go/bin:/Users/nikivi/go/bin # Go
export PATH=$PATH:~/.cargo/bin # Rust

# FZF TODO: not sure if I need
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export NODE_PATH='/usr/local/lib/node_modules'
