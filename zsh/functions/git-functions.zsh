# Zsh git functions.

# gz - Improve readme commit
gz(){
  git add readme.md
  git commit -m "Improve readme"
  git push
}

# gzc - Improve contributing commit
gzc(){
  git add contributing.md
  git commit -m "Improve contributing"
  git push
}

# geb <branch-name> - create new branch
geb(){
  git checkout -b $1
}

# gw <msg> - commit all changes with <msg>
gw() {
    git add .
    git commit -m "${(j: :)@}"
    git push
}

# gwa <commit-msg> - commit all changes `Add <commit-msg>`
gwa(){
  git add .
  git commit -m "Add $*"
  git push
}

# gwf <commit-msg> - commit all changes with `<Fix commit-msg>`
gwf(){
  git add .
  git commit -m "Fix $*"
  git push
}

# gwr <commit-msg> - commit all changes with `<Remove commit-msg>`
gwr(){
  git add .
  git commit -m "Remove $*"
  git push
}

# gwi <msg> - commit all changes with `Improve <msg>`
gwi() {
    git add .
    git commit -m "Improve $*"
    git push
}

# gwe <msg> - commit all changes with `Update <msg>`
gwe() {
    git add .
    git commit -m "Update $*"
    git push
}

# ggs - commit all changes with generic `update`
ggs() {
    git add .
    git commit . -m 'Update'
    git push
}

# gc <commit-msg> - write quick commit message
gc() {
    git commit -m "$*"
}

# g. - cd to root of .git project
g.() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

# mit - create MIT license file for Nikita Voloboev
mit() {
  license-up mit Nikita Voloboev nikitavoloboev.xyz
  git add license
}

# mitla - create MIT license file for Learn Anything
mitla () {
  license-up mit Learn Anything, learn-anything.xyz
  git add license
}

# NOTE: not sure
# gp <link> - pull changes made from PR to head
gp() {
    git pull origin pull/"$1"/head
}

# mg <dir-name> - create dir, go to it and initialise it with git
mg() {
    mkdir "$1"
    cd "$1"
    git init
}

# ggu - git push to origin master of currently open Safari tab
ggu() {
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push -u origin master
}

# ggo - git add origin from currently open Safari tab and push to master there
ggo() {
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push $(osascript -e 'tell application "Safari" to return URL of front document') master
}

# ggg - git add origin from currently open Safari tab and push to master there
ggg() {
    git init
    git add .
    git commit -m "Init"
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push $(osascript -e 'tell application "Safari" to return URL of front document') master
}

# ggla - git initialise Learn Anything repository and make first commit
ggla() {
    git init
    license-up mit Learn Anything, learn-anything.xyz
    git add .
    git commit -m "Init"
}

# ggi - initialise repository and add MIT license
ggi() {
    git init
    license-up mit Nikita Voloboev nikitavoloboev.xyz
    git add .
    git commit -m "Init"
}

# gao - git remote add origin of link found in clipboard
gao() {
    git remote add origin "$(pbpaste)"
}

# gL <git-url> - git clone and cd instantly to cloned repo
gcd() {
   git clone "$(pbpaste)" && cd "${1##*/}"
}

# gll - git clone link in clipboard
gll(){
    git clone "$(pbpaste)"
    # TODO: cd into cloned project (need to extract name with regex)
}

# ogg - go get currently active Safari URL
ogg() {
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
