# Setting of different enviroment variables

# _Dev paths
export PATH=$(brew --prefix ruby)/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"

# Bin
export PATH=$PATH:~/.dotfiles/bin

# NPM
export PATH=./node_modules/.bin/:$PATH

# Anaconda NOTE: note sure
#export PATH=/Users/nikivi/anaconda3/bin:$PATH

# Go
export PATH=$PATH:/usr/local/go/bin:/Users/nikivi/go/bin

# Rust
export PATH=$PATH:~/.cargo/bin

# FZF TODO: not sure if it works
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# SQL NOTE: empty dirs
#export PATH=/usr/local/mysql/bin:$PATH
#:export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# Exported variables get passed on to child processes, not-exported variables do not
# can call it like so $ZPLUG_HOME
export NODE_PATH='/usr/local/lib/node_modules'

# Flask
#export FLASK_APP=app.py