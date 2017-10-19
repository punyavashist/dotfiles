# setting of different enviroment variables

# _dev paths
export PATH=$(brew --prefix ruby)/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"

# my cli
export PATH=$PATH:~/.dotfiles/bin

# _npm path
export PATH=./node_modules/.bin/:$PATH

# _anaconda
export PATH=/Users/nikivi/anaconda3/bin:$PATH

# _go
export PATH=$PATH:/usr/local/go/bin:/Users/nikivi/go/bin

# _rust
export PATH=$PATH:~/.cargo/bin

# _fzf TODO: not sure if it works
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# _sql
export PATH=/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/


# exported variables get passed on to child processes, not-exported variables do not
# can call it like so $ZPLUG_HOME
export NODE_PATH='/usr/local/lib/node_modules'

# _flask
export FLASK_APP=app.py


