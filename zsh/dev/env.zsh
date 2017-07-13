# setting of different enviroment variables

# _dev paths
export PATH=$(brew --prefix ruby)/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"

export PATH=$PATH:~/.dotfiles/bin

# _npm path
export PATH=$PATH:./node_modules/.bin/

# _anaconda
export PATH=$PATH:$HOME/software/anaconda3/bin

# _go 
export GOPATH=/Users/nikivi/go/
export PATH=$PATH:$GOPATH/bin:$GOPATH/bin
export GOBIN=$GOPATH/bin

# _sql
export PATH=/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/


# exported variables get passed on to child processes, not-exported variables do not
# can call it like so $ZPLUG_HOME
export NODE_PATH='/usr/local/lib/node_modules'

# _flask
export FLASK_APP=app.py


