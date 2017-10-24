# _general
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> public key copied to pasteboard'"
alias lc='tokei'
alias _='sudo'
alias yi="python3 -i"
alias kar="/Applications/Karabiner.app/Contents/Library/bin/karabiner"
alias le='less -r'
# alias du='du -sh * | sort'
alias h='tmux'
alias eop='echo $PATH'
alias eo='echo'
alias es='elasticsearch'
alias mc='md-to-alfred'
alias pd='pandoc'
alias yt='yotube-dl'
alias r='rg'
alias s='subl'
alias ca='carthage'
alias cad='carthage update'
alias alf='alfred'
alias ta='touch readme.md'
alias d='cd'
alias gos='go-search'
alias sd='sudo'
# TODO: fk alias to run last cmd as sudo instantly
alias lg='ls | grep'
alias gj='open `git config remote.origin.url`'
alias so='source'
alias top="vtop"
alias ka='echo'
alias rl='curl'
alias how='howdoi'
alias ua='unalias'
alias sudo='sudo '
alias m='mkdir'
alias w='code'
alias jj='killall tmux'
alias loc='count_number_of_lines'
alias mm='tldr'
alias ma='man'
# alias aw='k -h' TODO: ?
alias c='ccat'
alias rec='asciinema rec'
alias b='bd'
alias fk='fuck'
alias dus='du -s'
alias t='touch'
alias zo='open'
alias ff='awk'
alias ki='kill'
alias icat='imgcat'
alias tt='type'
alias tre='tree -a'
alias q='exit'
alias e='nvim'
alias screen='screenfetch'
alias se='open .'
alias mx='chmod +x'
alias rr='rm -rf'
# alias a='ls -FG'
alias a='exa'
alias wg='wget -r --no-parent'
alias v='mv'
alias os='osascript'
alias lt='ls -lart'
alias al='exa -l'
# alias aa='ls -lahFG'
alias aa='exa -lahF'
alias tp='type'
#alias cl='/usr/local/bin/m'

# _dev
# _general
alias co='coala'
alias ll='ln -s'
alias jd='jid'
alias tm='task'
alias rf='reflex'
alias kb='kubectl'

alias ser='serve'
alias ss='python3 -m http.server'

alias ra='create-react-app'

alias lic='legit'

# _flask
alias fr='flask run'

# _python
alias p='python3'
alias p2='python'
alias pi='pip install' 
alias rv='virtualenv -p /usr/local/bin/python3'

# _alfred
alias wf='alfred build'
alias wfl='alfred link'
alias wfa='alfred pack -o ~/Desktop'

# _docker
alias k='docker'
alias kc='docker compose'
alias kl='docker logs'
alias klt='docker logs --tail 100'
alias ks='docker ps'
alias ksq='docker ps -q'
alias kk='docker kill'

# _node
alias nd='node'
alias ndi='node install'
alias n.='node .'

# _yarn
alias i='yarn'
alias il='yarn list'
alias ii='yarn init'
alias ia='yarn add'
alias ir='yarn run'
alias iw='yarn remove'
alias ig='yarn global add'
alias is='yarn start'

# _heroku
alias he='heroku'

# _pip
# TODO:

# _npm - depracated
alias np='npm'
alias ni='npm install'
alias ns='npm start'
alias nls='npm ls'
alias nu='npm update'
alias nt='npm init'
alias nig='npm install -g'
alias nb='npm run build'
alias nr='npm run'

# _go
alias o='go'
alias ot='playgo'
alias or='go run'
alias oo='go install'
alias ov='go vet'
alias ob='go build'
alias ora='go-pry'
alias oa='go build -o main'

alias ugo='Go-Package-Store'

# _meteor
alias mt='meteor'

# _compile code
alias sw='swift'

# _ruby
alias rb='ruby'

# _piping
alias h2='head -n 2'
alias h10='head -n 10'
alias t10='tail -n 10'

alias hs='ghci'

alias cwd='pwd | pbcopy'

# _delete things
alias rrpdf='rm -rf *.pdf'

# _source things
alias sz='exec zsh'

# _ls
alias la="ls -aF"
alias ld="ls -ld"
alias lso='ls -At1 && echo "------Oldest--"'
alias lsn='ls -Art1 && echo "------Newest--"'
alias a.='ls -d .*'

# _hugo
alias us='hugo server -D'
alias ut='hugo server -w' # testing
alias u='hugo'

# _jekyll
alias js='bundle exec jekyll serve'
alias jb='jekyll build'

# _ruby
alias bx='bundle exec'

# _nginx
alias ngup='sudo nginx'
alias ngdown='sudo nginx -s stop'
alias ngre='sudo nginx -s stop && sudo nginx'
alias nglog='tail -f /usr/local/var/log/nginx/access.log' # TODO: maybe wrong location
alias ngerr='tail -f /usr/local/var/log/nginx/error.log'


# _utility
alias net="ping ya.ru | grep -E --only-match --color=never '[0-9\.]+ ms'"                # check connection
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
alias ba="bash"

# _brew
alias b='brew'
alias bf='brew info'
alias bci='brew cask install'
alias bt='brew audit --strict'
alias bl='brew list'
alias bs='brew search'
alias bi='brew install'
alias bu='brew update'
alias bdoc='brew doctor'
alias bcl='brew cask list'
alias bui='brew uninstall'
alias bw='brew update  && brew upgrade && brew cleanup'

# _brew service
alias bss='brew services start'
alias bsl='brew services list'
alias bst='brew services stop'

# _directory listings
alias l.='ls -d .*'

# _easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# _cli tools
alias kn='/Applications/Karabiner.app/Contents/Library/bin/karabiner'

# _top
alias cpu='top -o cpu'   # cpu
alias mem='top -o rsize' # memory

# _macos
alias bb='pbcopy'

# _text editors
alias cr='open -a CodeRunner'
alias xx='open -a Xcode'
alias x.='open -a Xcode .'
alias ae='open -a MacDown readme.md'
alias ad='open -a MacDown'
alias wt='open -a Atom'
alias we='code'
alias ww='code .'
# alias ar="open -a Marked\ 2"
alias zr='open -a Preview'

# _web
alias l="open -a Google\ Chrome"
alias qq="open -a Safari"

# _other
alias pdf='open -a PDF\ Expert'
alias love="/Applications/love.app/Contents/MacOS/love"

# _vim jumps
# _main
alias ee='nvim .'                 # current dir
alias ei='nvim index.js'
alias egi='nvim .gitignore'
alias ej='nvim package.json'

# _config
alias ea='nvim ~/.dotfiles/zsh/aliases/alias.zsh'                # alias
alias eh='nvim ~/.ssh/config'                                 # ssh config
alias ejj='nvim ~/.dotfiles/intellij/ideavimrc'               # idea
alias ez='nvim ~/.dotfiles/zsh/zshrc.zsh'                         # zshrc
alias eze='nvim ~/.dotfiles/zsh/aliases/vim.zsh'                 # goto vim
alias ezk='nvim ~/.dotfiles/zsh/aliases/cd.zsh'                  # goto cd
alias ek='nvim ~/Library/Application\ Support/Karabiner/private.xml' # karabiner
alias ew='nvim ~/.dotfiles/nvim/init.vim'                  		 # nvimrc
alias ef='nvim ~/.dotfiles/zsh/functions/functions.zsh'          # shell functions
alias ehs='nvim ~/.dotfiles/hammerspoon/init.lua'             # hammerspoon
alias ezd='nvim ~/.dotfiles/zsh/aliases/dev.zsh'                 # development alias
alias ezg='nvim ~/.dotfiles/zsh/aliases/git.zsh'                 # git alias
alias eza='nvim ~/.dotfiles/zsh/aliases/app.zsh'                 # app alias
alias ezv='nvim ~/.dotfiles/zsh/dev/env.zsh'                     # enviroment variables
alias ezo='nvim ~/.dotfiles/zsh/aliases/docker.zsh'              # docker alias
alias et='nvim ~/.dotfiles/tmux/tmux.conf.local'              # tmux config
alias ezb='nvim ~/.dotfiles/zsh/zsh/bindings.zsh'                # shell keyboard bindings

# _cd places
# _projects
alias dk='cd ~/projects'
alias daq='cd ~/code/xcode/projects/macos/quoter'
alias dla='cd ~/oss/learn-anything/learn-anything'
alias dz='cd ~/oss/nikivi/personal/knowledge'

# _documents
alias dap='cd ~/Documents/d.\ app'
alias dte='cd ~/Documents/d.\ app/tester'
#alias dk='cd ~/Documents/d. \app/unclutter/Unclutter\ Files'
alias doc='cd ~/Documents'
alias dbit='cd ~/Documents/d. \app/bitbar'
alias dF='cd ~/Documents/app/unclutter/Unclutter\ Files'
alias ddes='cd ~/Documents/design'
alias dn='cd ~/oss/nikivi/'

# _code
alias dsh='cd ~/.ssh'
alias dno='cd ~/node'
alias dm='cd ~/ml'
alias dl='cd ~/play'
alias dj='cd ~/learning'
alias dg='cd ~/go/src/github.com/nikitavoloboev'
alias di='cd ~/ideas'

# _xcode
alias dx='cd ~/xcode'
alias dxi='cd ~/xcode/ios'
alias dxm='cd ~/xcode/macos'

# _web
alias dw='cd ~/web'

# _oss
alias ds='cd ~/oss/'
alias dsn='cd ~/oss/nikivi'
alias dt='cd ~/oss/learn-anything'
alias d:='cd ~/oss/nikivi/code'

# _macos
alias de='cd ~/Desktop'
alias dq='cd ~/Downloads'
alias dls='cd ~/Library/Services'
alias dnm='cd /usr/local/lib/node_modules'
alias dbb='cd /usr/local/bin'
alias dcl='cd /usr/local/Cellar'
alias drp='cd ~/Dropbox'

# _config
alias d..='cd ~/.config'
alias dv='cd ~/.dotfiles/nvim'
alias da='cd ~/.dotfiles'
alias dsk='cd ~/Library/Application\ Support/Karabiner'
alias db='cd ~/.dotfiles/bin'
alias dh='cd ~/.hammerspoon'


# _move file locations
# TODO: add move files to hazel alias / function

