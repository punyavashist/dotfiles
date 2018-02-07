# Setting and editing of different enviroment variables.

export PATH=$(brew --prefix ruby)/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH" # Python 2
export PATH=$PATH:~/.dotfiles/bin
export PATH=./node_modules/.bin/:$PATH # NPM
# export PATH=/Users/nikivi/anaconda3/bin:$PATH # Anaconda NOTE: note sure if need
export PATH=$PATH:/usr/local/go/bin:/Users/nikivi/go/bin # Go
export PATH=$PATH:~/.cargo/bin # Rust

# FZF TODO: not sure if it works
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# SQL NOTE: empty dirs
# export PATH=/usr/local/mysql/bin:$PATH
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

export NODE_PATH='/usr/local/lib/node_modules'
# export FLASK_APP=app.py # Flask
