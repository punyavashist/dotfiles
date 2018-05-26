# Update readme commit
gz(){
  git add README.md
  git commit -m "readme: update"
  git push
}

# Make PR
pr() {
  # TODO: test it
  git push -u origin "$1"
  hub pull-request -h "$1" -F -
}

# Fork repo
gf(){
  hub fork
  git branch --set-upstream-to nikitavoloboev/master master
  git remote rename origin upstream; git remote rename nikitavoloboev origin
}

# Fork repo and move it to ~/dev/forks
gfandmove(){
  hub fork
  git branch --set-upstream-to nikitavoloboev/master master
  git remote rename origin upstream; git remote rename nikitavoloboev origin
  CLONE_DIR_NAME=$(basename "$PWD")
  cd .. && mv $CLONE_DIR_NAME ~/dev/forks
  cd ~/dev/forks/$CLONE_DIR_NAME
}

# TODO: ?
grus(){
  # TODO: if it is a fork, get the link of the fork and fill it here instead of manually adding it
  git remote add upstream "$1"
  git fetch upstream
  git checkout master
  git reset --hard upstream/master
  git push origin master --force
}

# Pull changes from upstream (fork) to master
gfu(){
  git fetch upstream
  git pull upstream master
}

# Ignore files and remove them if they were tracked
gri(){
  git rm "$*"
  git rm --cached "$*"
}

# Update contributing file commit
gwt(){
  git add CONTRIBUTING.md
  git commit -m "contributing: update"
  git push
}

# Create new branch. geb <branch-name>
geb(){
  git checkout -b "$1"
}

# Commit all changes with <commit-msg>. gw <commit-msg>
gw() {
    git add .
    git commit -m "${(j: :)@}"
    # TODO: check if there is configured push destination. If not, don't push.
    # TODO: change other functions there to do the same
    git push
}

# Commit all changes with `add <commit-msg>`. gwa <commit-msg>
gwa(){
  git add .
  git commit -m "add $*"
  git push
}

# Commit all changes with `<fix commit-msg>`. gwf <commit-msg>
gwf(){
  git add .
  git commit -m "fix $*"
  git push
}

# Commit all changes with `<remove commit-msg>`. gwr <commit-msg>
gwr(){
  git add .
  git commit -m "remove $*"
  git push
}

# Commit all changes with `improve <msg>`. gwi <msg>
gwi() {
    git add .
    git commit -m "improve $*"
    git push
}

# Commit all changes with `update <msg>`. gwe <msg>
gwu() {
    git add .
    git commit -m "update $*"
    git push
}

# Commit all changes with `update`
ggs() {
    git add .
    git commit . -m 'update'
    git push
}

# Write quick commit message. gc <commit-msg>
gc() {
    git commit -m "$*"
}

# cd to root of .git project
g.() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

# Create MIT license file for Nikita Voloboev
mit() {
  license-up mit Nikita Voloboev nikitavoloboev.xyz
  git add license
}

# Create MIT license file for Learn Anything
mitla () {
  license-up mit Learn Anything, learn-anything.xyz
  git add license
}

# TODO: not sure
# Pull changes made from PR to head. gp <link>
gp() {
    git pull origin pull/"$1"/head
}

# Create dir, go to it and initialise it with git. mg <dir-name>
mg() {
    mkdir "$1"
    cd "$1"
    git init
}

# git push to origin master of currently open Safari tab
ggu() {
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push -u origin master
}

# git add origin from currently open Safari tab and push to master there
ggo() {
    git add .
    git commit -m "Init"
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push $(osascript -e 'tell application "Safari" to return URL of front document') master
    git push --set-upstream origin master
}

# git add origin from currently open Safari tab and push to master there
ggg() {
    git init
    git add .
    git commit -m "Init"
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push $(osascript -e 'tell application "Safari" to return URL of front document') master
}

# git initialise Learn Anything repository and make first commit
ggla() {
    git init
    license-up mit Learn Anything, learn-anything.xyz
    git add .
    git commit -m "Init"
}

# Initialise repository and add MIT license
ggi() {
    git init
    license-up mit Nikita Voloboev nikitavoloboev.xyz
    git add .
    git commit -m "Init"
}

# git remote add origin of link found in clipboard
gao() {
    git remote add origin "$(pbpaste)"
}

# git clone and cd instantly to cloned repo. gcd <git-url>
gcd() {
   git clone "$(pbpaste)" && cd "${1##*/}"
}

# git clone link in clipboard
gll(){
    git clone "$(pbpaste)"
    # TODO: cd into cloned project (need to extract name with regex)
}

# go get currently active Safari URL
ogg() {
  # Get url
  url=$(osascript -e 'tell application "Safari" to return URL of front document')
  # Remove https://
  url="${url#https://}"
  # Get the package/tool
  go get -u $url
}

# TODO: ?
igit() {
  git rev-parse HEAD > /dev/null 2>&1
}

# See contents of .git from current dir recusively as a tree
gte() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}
