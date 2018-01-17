# Zsh git functions

# gz - Improve readme commit.
function gz(){
  git add readme.md
  git commit -m "Improve readme"
  git push
}

# gc <commit-msg> - Write quick commit message.
function gc() {
    git commit -m "$@"
}

# g. - cd to root of .git project.
function g.() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

# mit - Create MIT license file for Nikita Voloboev.
function mit() {
  license-up mit Nikita Voloboev nikitavoloboev.xyz
  git add license
}

# mitla - Create MIT license file for Learn Anything.
function mitla () {
  license-up mit Learn Anything, learn-anything.xyz
  git add license
}

# NOTE: Not sure.
# gp <link> - Pull changes made from PR to head
function gp() {
    git pull origin pull/"$1"/head
}

# ggr - Commit readme changes with `Improve readme` message.
function ggr(){
  git add readme.md
  git commit -m "Improve readme"
  git push
}

# mg <dir-name> - Create dir, go to it and initialise it with Git.
function mg() {
    mkdir "$1"
    cd "$1"
    git init
}

# ggu - Git push to origin master of currently open Safari tab.
function ggu() {
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push -u origin master
}

# ggla - Git initialise Learn Anything repository and make first commit.
function ggla() {
    git init
    mitla
    git add .
    git commit -m "Init"
}

# ggi - Initialise repository and add MIT license.
function ggi() {
    git init
    mit
    git add .
    git commit -m "Init"
}

# gao - Git remote add origin of link found in clipboard.
function gao() {
    git remote add origin "$(pbpaste)"
}

# gL <git-url> - Git clone and cd instantly to cloned repo.
function gcd() {
   git clone "$(pbpaste)" && cd "${1##*/}"
}

# gll - Git clone link in clipboard.
function gll(){
    git clone "$(pbpaste)"
    # TODO: cd into cloned project (need to extract name with regex)
}

# ggs - Git add all files and commit them with generic `Update` message.
function ggs() {
    git add .
    git commit . -m 'Update'
    git push
}

# gwi <msg> - Git add all files and commit changes with `Improve <msg>`.
function gwi() {
    git add .
    git commit -m "Improve $*"
    git push
}

# gd <msg> - Git add files and commit changes with `Update <msg>`.
function gd() {
    git add .
    git commit -m "Update ${(j: :)@}"
    git push
}

# gw <msg> - Git add all files and commit changes with <msg>.
function gw() {
    git add .
    git commit -m "${(j: :)@}"
    git push
}

# ogg - go get currently active Safari URL.
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

# gte - See contents of .git from current dir recusively as a tree.
gte() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}
