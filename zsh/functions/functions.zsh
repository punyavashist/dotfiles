# Zsh functions.

# T - Tester function (I change it often).
function T(){
  echo $PATH
}

# gz - Improve readme commit.
function gz(){
  git add readme.md
  git commit -m "Improve readme"
  git push
}

# C <cmd-name> - Get cheat sheet of command from cheat.sh.
function C(){
  curl cheat.sh/${@:-cheat}
  # curl cheat.sh/$@
}

# cfile <file> - Copy content of file to clipboard.
function cfile(){
  cat $1 | pbcopy
}

# gc <commit-msg> - Write quick commit message.
function gc() {
    git commit -m "$@"
}

# wr - Release alfred workflow.
function  wr() {
  # TODO: Check if current dir has go in it (if yes, cd to workflow and then run script)
  package-workflow .
}

# re <files> - Move files to Trash.
function re(){
  mv "$@" ~/.Trash
}

# zs - Search for most visited directores from z index and open them in Finder.
function zs() {
  z $1 && open .
}

# awe - Open path of current dir in Alfred.
# awe <file> - Open path of <file> in Alfred.
awe() {
    if [ $# -eq 0 ]; then   # If nothing is put as arguments open Alfred at the working directory so it list the content
        osascript -e "tell application \"Alfred 3\" to browse \"$(pwd)\""
    elif [ $# -eq 1 ]; then # If only one argument is set
        if [[ -d $1 ]] || [[ -f $1 ]]; then   # if it looks like a path or file, then make sure we send a full path to Alfred
            osascript -e "tell application \"Alfred 3\" to browse \"$(realpath -s "$1")\""
        else    # Any other words that are not a path would be sent to Alfred as is  (ex: alfs snip  ->  would open Alfred with "snip")
            osascript -e "tell application \"Alfred 3\" to search \"$*\""
        fi
    else   # If multiple arguments are set, then they are sent to Alfred as is. (ex: alfs define allo  ->  would pop Alfred with "define allo")
        osascript -e "tell application \"Alfred 3\" to search \"$*\""
    fi
}

# aw - Alfred file action search of current dir.
# aw <file> - Alfred file action search for file.
aw() {
    if [ $# -eq 0 ]; then    # If no arguments, pop Alfred Action Window in the working directory
        osascript -e "tell application \"Alfred 3\" to action \"$(pwd)\""
    else
        args=""
        argsAreAllPaths=true
        for arg in "$@" ; do
            filePath=$(realpath -s "$arg")
            if [[ -d $filePath ]] || [[ -f $filePath ]]; then    # if the arg is a file of folder, append the path to the args string to build a list for the osascript command
                args+="\"$filePath\","
            else
                argsAreAllPaths=false   # if one argument is not a folder or file path, then pop Alfred with the standard search and try to access Alfred Action Window. This also makes it clear there's a problem with one of the passed paths
                break
            fi
        done
        if [ "$argsAreAllPaths" = true ] ; then    # If all arguments are files or directories, open Alfred Action Window with the list
            args=${args%?} # remove the trailing comma
            osascript -e "tell application \"Alfred 3\" to action { $args }"
        else  # If not all arguments are files or directories, search as is and try to access the Alfred Action Window. The Action Window should pop if it's possible, or the standard Alfred Search would be shown (ex: alfa activity monitor  ->  Would open the file action window of the Activity Monitor)
            actionKey="keystroke (ASCII character 29)"  # (meaning: right arrow) Put your prefered action key (Alfred -> File Search -> Actions -> Show Actions) as applescript command for keystroke or key code (ex: "key code 98")
            delayBetweenEvents=0.1    # Play with the number if the action doesn't work correctly
            osascript -e "tell application \"Alfred 3\" to search \"$*\"" -e "delay $delayBetweenEvents" -e "tell application \"System Events\" to $actionKey"
        fi
    fi
}

# mdg <dir-name> - Create dir and .go file of <dir-name> name.
function mdg() {
    md $1
    touch $1.go
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

# wl - Alfred link and build workflow.
function wl() {
    alfred link
    alfred build
}

# iz <png-file> - Create geometric primitive of png-file.
function iz () {
    primitive -i in.png -o output.png -n "$1"
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

# NOTE: Not sure if needed.
# fix - Fixes antigen problems.
function fix() {
    rm -rf ~/.antigen/.zcompdump
    rm -rf ~/.antigen/.zcompdump.zwc
    exec zsh
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

# wa <dir> - Go to do <dir> directory and open it with VS Code.
function wa() {
    cd "$1"
    code .
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

# TODO: Find for anybar.
# function anybar() {
#     echo -n "red" | nc -4u -w0 localhost 1738
# }

# dirfiles <dir> - Give number of files found inside given directory.
function dirfiles() {
    find "$1" -type f | wc -l
}

# gL <git-url> - Git clone and cd instantly to cloned repo.
function gcd() {
   git clone "$(pbpaste)" && cd "${1##*/}"
}

# TODO: ?
# igit -
igit() {
  git rev-parse HEAD > /dev/null 2>&1
}

# og <git-repo> - Go get the GitHub repo.
og() {
  go get -u "$@"
}

# rfg <file.go> - go run <file.go> on any Go file changes inside current dir.
function rfg() {
  reflex -g '*.go' go run $1
}

# rft <file.py> - Rerun <file.py> on any Python file changes inside current dir.
function rft() {
  reflex -g '*.py' python3 "$@"
}

# rfm <cmd-params> - Rerun main.go with <cmd-params> passed in on any Go files changes inside current dir.
function rfm() {
    reflex -g '*.go' go run main.go $1
}

# wfj <file.js> - Rerun <file.js> on any JS file changes inside current dir.
function wfj() {
    reflex -g '*.js' node $1
}

# af <cmd> - View definition of <cmd>.
function af() {
  whence -f "$1"
}

# tc - Create and edit Cartfile.
function tc() {
    touch Cartfile
    chmod +x Cartfile
    nvim Cartfile
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

# fl <text> - Find where <text> is contained within current dir.
function fl() {
    grep -rnw . -e "$*"
}

# finder - Print current active Finder dir.
function finder {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# xo <xcode-proj> - Open Xcode project.
xo(){
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return
    else
      echo "Nothing found"
    fi
  fi
}

# down <url> - Download <url> and save to current dir.
function down(){
curl -O "$1"
}

# cw - Copy working dir.
cw() { printf %s "$PWD" | pbcopy; }

# md <dir-name> - Craete directory and cd into it.
function md {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# da - cd to ~/.dotfiles
# da <dir> - Change to a directory and list its contents.
function da {
  if [ $# -eq 0 ]; then
    cd ~/.dotfiles
  else
    builtin cd "$argv[-1]" && exa "${(@)argv[1,-2]}"
  fi
}

# server - Create server of current dir on port 8000 and open it in browser.
server() {
	local port="${1:-8000}"
	sleep 1 && open "http://localhost:${port}/" &
	# set the default content-type to `text/plain` instead of `application/octet-stream`
	# and serve everything as utf-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# te - See current dir and its contents recusively as a tree.
te() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

# compress <file/dir> - Compress <file/dir>.
function compress()
  {
    dirPriorToExe=`pwd`
    dirName=`dirname $1`
    baseName=`basename $1`

    if [ -f $1 ] ; then
      echo "It was a file change directory to $dirName"
      cd $dirName
      case $2 in
        tar.bz2)
          tar cjf $baseName.tar.bz2 $baseName
          ;;
        tar.gz)
          tar czf $baseName.tar.gz $baseName
          ;;
        gz)
          gzip $baseName
          ;;
        tar)
          tar -cvvf $baseName.tar $baseName
          ;;
        zip)
          zip -r $baseName.zip $baseName
          ;;
        *)
          echo "Method not passed compressing using tar.bz2"
          tar cjf $baseName.tar.bz2 $baseName
          ;;
      esac
      echo "Back to Directory $dirPriorToExe"
      cd $dirPriorToExe
    else
      if [ -d $1 ] ; then
        echo "It was a Directory change directory to $dirName"
        cd $dirName
        case $2 in
          tar.bz2)
            tar cjf $baseName.tar.bz2 $baseName
            ;;
          tar.gz)
            tar czf $baseName.tar.gz $baseName
            ;;
          gz)
            gzip -r $baseName
            ;;
          tar)
            tar -cvvf $baseName.tar $baseName
            ;;
          zip)
            zip -r $baseName.zip $baseName
            ;;
          *)
            echo "Method not passed compressing using tar.bz2"
            tar cjf $baseName.tar.bz2 $baseName
            ;;
        esac
        echo "Back to Directory $dirPriorToExe"
        cd $dirPriorToExe
      else
        echo "'$1' is not a valid file/folder"
      fi
    fi
    echo "Done"
    echo "###########################################"
  }

# TODO: Write a Go CLI that wraps extract and compress functions + more.
# extract <file.tar> - Extract <file.tar>.
function extract() {
  local remove_archive
  local success
  local file_name
  local extract_dir

  if (( $# == 0 )); then
    echo "Usage: extract [-option] [file ...]"
    echo
    echo Options:
    echo "    -r, --remove    Remove archive."
  fi

  remove_archive=1
  if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
    remove_archive=0
    shift
  fi

  while (( $# > 0 )); do
    if [[ ! -f "$1" ]]; then
      echo "extract: '$1' is not a valid file" 1>&2
      shift
      continue
    fi

    success=0
    file_name="$( basename "$1" )"
    extract_dir="$( echo "$file_name" | sed "s/\.${1##*.}//g" )"
    case "$1" in
      (*.tar.gz|*.tgz) [ -z $commands[pigz] ] && tar zxvf "$1" || pigz -dc "$1" | tar xv ;;
      (*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" ;;
      (*.tar.xz|*.txz) tar --xz --help &> /dev/null \
        && tar --xz -xvf "$1" \
        || xzcat "$1" | tar xvf - ;;
    (*.tar.zma|*.tlz) tar --lzma --help &> /dev/null \
      && tar --lzma -xvf "$1" \
      || lzcat "$1" | tar xvf - ;;
  (*.tar) tar xvf "$1" ;;
  (*.gz) [ -z $commands[pigz] ] && gunzip "$1" || pigz -d "$1" ;;
  (*.bz2) bunzip2 "$1" ;;
  (*.xz) unxz "$1" ;;
  (*.lzma) unlzma "$1" ;;
  (*.Z) uncompress "$1" ;;
  (*.zip|*.war|*.jar|*.sublime-package) unzip "$1" -d $extract_dir ;;
  (*.rar) unrar x -ad "$1" ;;
  (*.7z) 7za x "$1" ;;
  (*.deb)
    mkdir -p "$extract_dir/control"
    mkdir -p "$extract_dir/data"
    cd "$extract_dir"; ar vx "../${1}" > /dev/null
    cd control; tar xzvf ../control.tar.gz
    cd ../data; tar xzvf ../data.tar.gz
    cd ..; rm *.tar.gz debian-binary
    cd ..
    ;;
  (*)
    echo "extract: '$1' cannot be extracted" 1>&2
    success=1
    ;;
esac

(( success = $success > 0 ? $success : $? ))
(( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
shift
  done
}

# ram <process-name> - Find how much RAM a process is taking.
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}