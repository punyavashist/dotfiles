# TODO: sort it into appropriate sections

# _dev
function afl() {
    alfred build
    alfred link
}

function iz () {
    primitive -i in.png -o output.png -n "$1"
}

function img() {
    cd ~/oss/nikivi/img/github
    open .
}


function fix() {
    rm -rf ~/.antigen/.zcompdump
    rm -rf ~/.antigen/.zcompdump.zwc
    exec zsh
}

function gp() {
    git pull origin pull/"$1"/head
}

# changed queries in search engine
function qe() {
    yarn run clean-triggers
    git add .
    git commit -m "queries"
    git push
}

function mi() {
    mkdir "$1"
    cd "$1"
    git init
}


functon aw() {
    cd "$1"
    code .
}

function ggi() {
    git init
    git add .
    git commit -m "🌅"
}

function gao() {
    clipboard="$(pbpaste)"
    git remote add origin $clipboard
}

# TODO: anybar
function anybar() {
    echo -n "red" | nc -4u -w0 localhost 1738
}

# finds recursively number of files in dir given
function findfiles() {
    arg="$1"
    find $arg -type f | wc -l
}

# bootstrap new repo
function glw() {
    clipboard="$(pbpaste)"
    git remote add origin $clipboard.git
    git push -u origin master
}

# TODO: git clone and cd instantly to cloned repo
#function ..() {
#    clipboard="$(pbpaste)"
#    git clone "$clipboard" && cd "${1##*/}"
#}

function gc() {
    arg="$*"
    git commit -m "$arg"
}


function wfg() {
    reflex -g '*.go' go run main.go $1
}

function wfj() {
    reflex -g '*.js' node $1
}

function wfb() {
    reflex -g '*.rb' ruby main.rb
}

function wfa() {
    reflex -g '*.go' alfred build
}

function tc() {
    touch Cartfile
    chmod +x Cartfile
    nvim Cartfile
}


function gll(){
    clipboard="$(pbpaste)"
    git clone $clipboard
}

function ggs() {
    git add .
    git commit . -m ':sparkles:'
    git push
}

function gw() {
    git add .
    git commit -m $1
}

function ogg() {
    go get github.com/$@
}

# find aliases
fa() { grep -r -h "alias[[:space:]]\+${(q)1}" ~/.dotfiles/zsh; }

# find where is text searched is contained
function fl() {
    grep -rnw . -e "$*"
}

# taken folder as input, prefix it with a.
function va() {
    mv $1 a.\ $1
}

# remove prefixes from folder
rk() { [[ -z "$1" ]] && return; mv "$1" "${1##*. }"};


# show current Finder directory.
function finder {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

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

function each() {
  for dir in *; do
    # echo "${dir}:"
    cd $dir
    $@
    cd ..
  done
}

function fn() { ls **/*$1* }

function fnd() { ls **/*$1*(/) }

function download(){
curl -O "$1"
}

function highlight(){
  highlight -O rtf $1 --font-size 25 --style solarized-dark -W -J 50 -j 3 --src-lang $2 | pbcopy
}

cw() { printf %s "$PWD" | pbcopy; }

function md {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# change to a directory and list its contents
function ad {
  builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

function fex {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# TODO: ?
fss() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* *
	fi
}

server() {
	local port="${1:-8000}"
	sleep 1 && open "http://localhost:${port}/" &
	# set the default content-type to `text/plain` instead of `application/octet-stream`
	# and serve everything as utf-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

te() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

repo() {
	local giturl=$(git config --get remote.origin.url | sed 's/git@/\/\//g' | sed 's/.git$//' | sed 's/https://g' | sed 's/:/\//g')
	if [[ $giturl == "" ]]; then
		echo "Not a git repository or no remote.origin.url is set."
	else
		local gitbranch=$(git rev-parse --abbrev-ref HEAD)
		local giturl="http:${giturl}"

		if [[ $gitbranch != "master" ]]; then
			if echo "${giturl}" | grep -i "bitbucket" > /dev/null ; then
				local giturl="${giturl}/branch/${gitbranch}"
			else
				local giturl="${giturl}/tree/${gitbranch}"
			fi
		fi

		echo $giturl
		open $giturl
	fi
}

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

npm() {
	if [ -f "yarn.lock" ]; then
		echo "$(tput sgr 0 1)$(tput setaf 1)You should use Yarn for this project.$(tput sgr0)"
		return
	fi
	command npm $@
}

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

