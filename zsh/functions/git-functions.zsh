# Zsh git functions.

# gz - Improve readme commit
function gz(){
  git add readme.md
  git commit -m "Improve readme"
  git push
}

# gw <msg> - Commit all changes with <msg>
function gw() {
    git add .
    git commit -m "${(j: :)@}"
    git push
}

# gwa <commit-msg> - commit all changes `Add <commit-msg>`
function gwa(){
  git add .
  git commit -m "Add $*"
  git push
}

# gwf <commit-msg> - commit all changes with `<Fix commit-msg>`
function gwr(){
  git add .
  git commit -m "Remove $*"
  git push
}

# gwr <commit-msg> - commit all changes with `<Remove commit-msg>`
function gwr(){
  git add .
  git commit -m "Remove $*"
  git push
}

# gwi <msg> - commit all changes with `Improve <msg>`
function gwi() {
    git add .
    git commit -m "Improve $*"
    git push
}

# gwe <msg> - commit all changes with `Update <msg>`
function gwe() {
    git add .
    git commit -m "Update $*"
    git push
}

# ggs - commit all changes with generic `update`
function ggs() {
    git add .
    git commit . -m 'Update'
    git push
}

# gc <commit-msg> - write quick commit message
function gc() {
    git commit -m "$@"
}

# g. - cd to root of .git project
function g.() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

# mit - create MIT license file for Nikita Voloboev
function mit() {
  license-up mit Nikita Voloboev nikitavoloboev.xyz
  git add license
}

# mitla - create MIT license file for Learn Anything
function mitla () {
  license-up mit Learn Anything, learn-anything.xyz
  git add license
}

# NOTE: not sure
# gp <link> - pull changes made from PR to head
function gp() {
    git pull origin pull/"$1"/head
}

# mg <dir-name> - create dir, go to it and initialise it with git
function mg() {
    mkdir "$1"
    cd "$1"
    git init
}

# ggu - git push to origin master of currently open Safari tab
function ggu() {
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push -u origin master
}

# ggo - git add origin from currently open Safari tab and push to master there
function ggo() {
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push $(osascript -e 'tell application "Safari" to return URL of front document') master
}

# ggg - git add origin from currently open Safari tab and push to master there
function ggg() {
    git init
    git add .
    git commit -m "Init"
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push $(osascript -e 'tell application "Safari" to return URL of front document') master
}

# ggla - git initialise Learn Anything repository and make first commit
function ggla() {
    git init
    license-up mit Learn Anything, learn-anything.xyz
    git add .
    git commit -m "Init"
}

# ggi - initialise repository and add MIT license
function ggi() {
    git init
    license-up mit Nikita Voloboev nikitavoloboev.xyz
    git add .
    git commit -m "Init"
}

# gao - git remote add origin of link found in clipboard
function gao() {
    git remote add origin "$(pbpaste)"
}

# gL <git-url> - git clone and cd instantly to cloned repo
function gcd() {
   git clone "$(pbpaste)" && cd "${1##*/}"
}

# gll - git clone link in clipboard
function gll(){
    git clone "$(pbpaste)"
    # TODO: cd into cloned project (need to extract name with regex)
}

# ogg - go get currently active Safari URL
function ogg() {
  # Get url
  url=$(osascript -e 'tell application "Safari" to return URL of front document')
  # Remove https://
  url="${url#https://}"
  # Get the package/tool
  go get -u $url
}

# TODO: ?
# igit -
igit() {
  git rev-parse HEAD > /dev/null 2>&1
}

# gte - see contents of .git from current dir recusively as a tree
gte() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}
