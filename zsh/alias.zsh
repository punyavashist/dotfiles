# _Testing

# TODO: clean it & use only what I need

# _Nix
alias n='nix-env'
alias nu='nix-env -q | fzf | xargs -I{} nix-env -e {}' # Search installed packages to uninstall
alias nq='nix-env -q' # See installed packages
alias nuu='nix-env -u' # Upgrade packages

# _General
alias -g G='| grep' # Grep search
alias op='open'
alias dnd='do-not-disturb toggle'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete" # Recursively delete `.DS_Store` files
alias g='hub' # Wrapper over git
alias pip='pip3'
alias peek='tee >(cat 1>&2)' # Mirror stdout to stderr, useful for seeing data going through a pipe
alias aet='subl CONTRIBUTING.md'
alias crypto='curl rate.sx' # Get crypto prices
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> public key copied to pasteboard'"
alias lc='tokei'
alias sf='screenfetch -E'
alias me='open -a "Marked 2" README.md'
alias mr='open -a "Marked 2"'
alias _='sudo'
alias ae='subl README.md' # Edit readme file
alias yi="python -i"
alias kar="/Applications/Karabiner.app/Contents/Library/bin/karabiner"
alias le='less -r'
alias wifi='wifi-password -q'
# alias du='du -sh * | sort'
alias eo='echo'
alias es='elasticsearch'
alias mc='md-to-alfred'
alias pd='pandoc'
alias yt='yotube-dl'
alias r='rg'
alias e='nvim'
alias s='subl'
alias ss='subl .'
alias ca='carthage'
alias alf='alfred'
alias ta='touch readme.md'
alias d='cd'
alias alert="tput bel" # Bell when the program is finished. i.e. npm install && alert
alias gos='go-search'
alias sd='sudo'
# TODO: fk alias to run last cmd as sudo instantly
alias lg='ls | grep'
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
alias mm='tldr'
alias ma='man'
# alias aw='k -h' TODO: ?
alias c='ccat'
alias rec='asciinema rec'
alias b='bd'
alias ws='workflow-install -s source' # Symlink `source` directory
alias dus='du -s'
alias t='touch'
alias zo='open'
alias ff='open .'
alias ki='kill'
alias icat='imgcat'
alias tt='tldr'
alias tre='tree -a'
alias q='exit'
alias screen='screenfetch'
alias ad='open .'
alias mx='chmod +x'
alias rr='rm -rf'
# alias a='ls -FG'
alias a='exa'
alias aa='exa -la' # See hidden files
alias wg='wget -r --no-parent'
alias v='mv'
alias os='osascript'
alias lt='ls -lart'
# alias aa='ls -lahFG'
# alias aa='exa -lahF'
alias tp='type'
#alias cl='/usr/local/bin/m'
# alias gr='goreleaser'

# _Dev
alias ll='ln -s'
alias jd='jid'
alias tm='task'
alias rf='reflex'
alias kb='kubectl'
alias ser='serve'
alias h='python -m http.server'
alias cra='npx create-react-app'
alias lic='legit'

# _App
alias to='gittower .' # Open current dir in Tower

# _Python
alias p='python'
alias p2='python2'
alias pi='pip install'

# _Alfred
alias wf='alfred build'
alias wfs='workflow-install -s source' # Symlink source dir to Alfred
alias wfl='alfred link'
alias wfa='alfred pack -o ~/Desktop'

# _Docker
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
alias iw='yarn && yarn start'
alias il='yarn list'
alias ii='yarn init'
alias ia='yarn add'
alias ir='yarn run'
alias im='yarn remove'
alias ig='yarn global add'
alias is='yarn start'

# _npm - TODO: remove
alias ns='npm start'
alias nls='npm ls'
# alias nu='npm update'
alias nt='npm init'
alias nig='npm install -g'
alias nb='npm run build'
alias nr='npm run'

# _Go
alias o='go'
alias org='richgo'
alias ot='playgo'
alias or='go run'
alias oo='go install'
alias ov='go vet'
alias ob='go build'
alias ora='go-pry'
alias oe='go build -o main'

alias ugo='Go-Package-Store'

# _Ruby
alias rb='ruby'

# _Piping
alias h2='head -n 2'
alias h10='head -n 10'
alias t10='tail -n 10'

alias hs='ghci'

alias cwd='pwd | pbcopy'

# _Delete things
alias rrpdf='rm -rf *.pdf'

# _Source things
alias sz='exec zsh'

# _ls
alias la="ls -aF"
alias ld="ls -ld"
alias lso='ls -At1 && echo "------Oldest--"'
alias lsn='ls -Art1 && echo "------Newest--"'
alias a.='ls -d .*'
alias l.='ls -d .*'

# _Hugo
alias us='hugo server -D'
alias ut='hugo server -w' # testing
alias u='hugo'

# _Jekyll
alias js='bundle exec jekyll serve'
alias jb='jekyll build'

# _Ruby
alias bx='bundle exec'

# _Nginx
alias ngup='sudo nginx'
alias ngdown='sudo nginx -s stop'
alias ngre='sudo nginx -s stop && sudo nginx'
alias nglog='tail -f /usr/local/var/log/nginx/access.log' # TODO: maybe wrong location
alias ngerr='tail -f /usr/local/var/log/nginx/error.log'

# _Utility
alias net="ping ya.ru | grep -E --only-match --color=never '[0-9\.]+ ms'"                # check connection
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
alias ba="bash"

# _easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias kn='/Applications/Karabiner.app/Contents/Library/bin/karabiner' # Karabiner CLI

alias cpu='top -o cpu'   # CPU
alias mem='top -o rsize' # Memory

# _macos
alias bb='pbcopy'

# _Text editors
alias cr='open -a CodeRunner'
alias xx='open -a Xcode'
alias x.='open -a Xcode .'
#alias ae='open -a MacDown readme.md'
alias wt='open -a Atom'
alias we='code'
alias ww='code .'
# alias ar="open -a Marked\ 2"
alias zr='open -a Preview'

# _Web
alias sc="open -a Google\ Chrome"
alias sf="open -a Safari"

# _Other
alias pdf='open -a PDF\ Expert'
alias love="/Applications/love.app/Contents/MacOS/love"

# _Vim
alias ee='nvim .' # Current dir
alias ei='nvim index.js'
alias egi='nvim .gitignore' # TODO: make it zsh func, go to root and then run it
alias ej='nvim package.json'

# _Edit config
alias ek='nvim ~/Library/Application\ Support/Karabiner/private.xml' # karabiner
alias ew='nvim ~/.dotfiles/nvim/init.vim' # nvimrc
alias essh='nvim ~/.ssh/config' # ssh config
alias et='nvim ~/.dotfiles/tmux/tmux.conf.local' # tmux config

# _cd places
alias dw='cd ~/dev/web'
alias dsh='cd ~/.ssh'
alias dn='cd ~/dev/clones'
alias di='cd ~/dev/ideas'
alias dg='cd ~/go/src/github.com/nikitavoloboev'
alias dl='cd ~/dev/learn'
alias dt='cd ~/dev/test'
alias dm='cd ~/dev/games'
alias da='cd ~/dev/'
alias ds='cd ~/dev/forks/'
alias dla='cd ~/dev/github/learn-anything'
alias dz='cd ~/.dotfiles'
alias dk='cd ~/Documents'

# _Xcode
alias dx='cd ~/dev/Xcode'
alias dxi='cd ~/dev/Xcode/iOS'
alias dxm='cd ~/dev/xcode/macOS'

# _macOS
alias de='cd ~/Desktop'
alias dq='cd ~/Downloads'
alias dls='cd ~/Library/Services'
alias dnm='cd /usr/local/lib/node_modules'
alias dbb='cd /usr/local/bin'
alias dcl='cd /usr/local/Cellar'
alias drp='cd ~/Dropbox'

# _Config
alias d..='cd ~/.config'
alias dv='cd ~/.dotfiles/nvim'
alias dsk='cd ~/Library/Application\ Support/Karabiner'
alias db='cd ~/.dotfiles/bin'
alias dh='cd ~/.hammerspoon'

# _Git
alias gj='open `git config remote.origin.url`'
alias ggh='push -u origin HEAD'
alias gre='git rebase -i HEAD~4'
alias gsh='git stash'
alias gr='git checkout -b'
alias grh='git reset --hard HEAD'
alias grc='git rm --cached'
# alias gt='git tag'
alias g:='git push -u origin master'
alias gn='git open'
alias ge='git checkout'
#alias gu='git commit --amend'
alias ggf='git push -f'
alias g::='git_remote_add_origin_from_active_link'
# alias g="git"
alias gi='git init'
alias gl='git pull'
alias gcl='git clone'
alias g.='git add .'
alias ga='git add'
# alias gb='git branch'
alias gbd='git branch -d'
alias gg='git push'
#alias gr='git rm'
# alias gf='git fetch'
alias glp='git pull && git push'
alias grao='git remote add origin'
#alias gz='git discard'
#alias gr='git rm --cached -r'

# undo your last commit, but don't throw away your changes
alias greset='git reset --soft HEAD^'

# Diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdn='git diff --name-only'

# _status
alias gs='git status --short'
alias gss='git show --word-diff=color' # See changes made

alias ggn='git_add_origin_and_origin_push'

# _Commit
alias gpm="git push origin master"
alias gpd="git push origin develop"

# Utilities
alias ungit="find . -name '.git' -exec rm -rf {} \;" # Remove git from a project

alias gto='gittower'
