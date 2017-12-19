# My configuration files for macOS [![Thanks](https://img.shields.io/badge/Say%20Thanks-💗-ff69b4.svg)](https://www.patreon.com/nikitavoloboev)
> Includes zsh, neovim, karabiner, hammerspoon, vs code


These are the various configuration files I use on macOS. I wrote about how I customise and use my shell in article [here](https://medium.com/@NikitaVoloboev/pretty-and-fast-shell-97ea870f2805).

You can also see my top used applications, safari exensions and alfred workflows I use [here](https://github.com/nikitavoloboev/my-mac-os).

## Contents
- [Karabiner](#karabiner)
- [Neovim](#neovim)
- [VS Code](#vs-code)
- [Hammerspoon](#hammerspoon)
- [Zsh](#zsh)
- [Inspiring dotfiles](#inspiring-dotfiles)
- [Contributing](#contributing)

## Karabiner 

<img src="https://explainxkcd.com/wiki/images/b/bf/borrow_your_laptop.png" width="500" alt="img">

The most exciting thing in here is probably how I utilise [Karabiner](https://pqrs.org/osx/karabiner/). It has absolutely transformed the way I interact with my computer and there is no going back now.

I go over how I use Karabiner in detail [here](https://wiki.nikitavoloboev.xyz/macOS/apps/karabiner/Karabiner.html) and I document all the keybindings I have made and changed as an interactive mind map [here](https://my.mindnode.com/c7EmmKvaxCyCEuTzcpkGB4MGeLpWdR8nsJK4rjDh#2086.8,-2205.5,2). Scroll around and explore, perhaps you find something interesting.

## Neovim 
I am [still learning vim](https://my.mindnode.com/24sx5yV3S7FLayi5Msvhysx5HZ8aAPzUqJ6rStKi) but the this journey has been very rewarding. Modal editing is pretty amazing.

I use [ayu theme](https://github.com/ayu-theme/ayu-vim) across all my editors, including neovim:

<img src="https://i.imgur.com/nL5NGpJ.png" width="500" alt="img">

## VS Code 
My main editor of choice is [VS Code](https://github.com/Microsoft/vscode) since it has very well built [vim mode](https://github.com/VSCodeVim/Vim). And I really love its [Go Plugin](https://github.com/Microsoft/vscode-go) + the amazing zen mode. 

Configs I use for it can be seen [here](https://github.com/nikitavoloboev/dotfiles/tree/master/vscode).

## Hammerspoon 
I don't use [hammerspoon](http://www.hammerspoon.org/) as extensively however I am looking into implementing more of its features into my workflow.

## Zsh 
I am using [zsh](http://www.zsh.org) as my shell with [antibody](https://github.com/getantibody/antibody) plugin manager.

I am also using [ayu theme](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/ayu.itermcolors) in zsh. Here is how my prompt looks like:

<img src="https://i.imgur.com/JfAUnKm.png" width="500" alt="img">

## Zsh aliases 
I use many aliases to get around my system as fast as possible.

Similar to my Karabiner config, I keep a list of all aliases that I have with their descriptions in an interactive mind map you can view [here](https://my.mindnode.com/upnFQeGrQCPwgCf3pfS4FgywQUj5sXNLxb1awm1D).

## Interesting aliases and zsh functions 
There is quite a lot of awesome programs I use from my command line (you can see [here](https://github.com/nikitavoloboev/my-mac-os#command-line-apps-) for some of them).

However I also really love customising my shell experience with various aliases and zsh functions. Here are some that I like and use very often:

### Commit and push repository to GitHub in one command

```Bash
function ggi() {
    git init
    mit
    git add .
    git commit -m "Init"
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push -u origin master
}
```

Say I created some project and wrote some code in it or added a simple README with some text in it. I then go on to create a [new GitHub repository](https://github.com/new) and give it a name. After that I just run this `ggi` command.

It will initialise my current directory with git if it wasn't already. It will then call this function :

```Bash
function mit() {
  license-up Nikita Voloboev nikitavoloboev.xyz
  git add LICENSE
  git commit -m 'MIT license'
}
```

Which using [this CLI tool](https://github.com/nikitavoloboev/license-up), will create a license file and git commit it. After that it will add all the remaining files with a commit message you like, take the URL of my current browser window which will be at the newly created repository, point the local git repo to push there and push it.

And thus in one command I initialised and pushed the repo. To create a new repo quickly I use [this Alfred workflow](https://github.com/nikitavoloboev/alfred-ask-create-share).


### Commit all with ✨
I use this command really often.

```Bash
function ggs() {
    git add .
    git commit . -m '✨'
    git push
}
```

It will simply add all files and commit them. I don't use this when working with code but for making some changes or for updating this dotfiles repo for example, I just use this. Saves a lot of time.


### Clone current url in clipboard

```Bash
function gll(){
    git clone "$(pbpaste)"
}
```

I use this very often to quickly clone the URL that I copied from GitHub.

### Trash files / folders
A lot more safer than `rm -rf` files as you can always check out `~/.Trash` in cases of emergency or mistakes.

```Bash
function re(){
  mv "$1" ~/.Trash
}
```

### Fzf bindings 
[fzf](https://github.com/junegunn/fzf) is a command line tool that lets you fuzzy search on text. I use it very often now for fuzzy searching for files to open with neovim, or fuzzy searching through my commit messages and more.

Here are some of my favourite commands I use with it :


### Search for files to edit in current dir

```Bash
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && nvim "${files[@]}"
}
```

This command will let me fuzzy search for a file to open from the directory I am currently in. I use it a lot.

Since I also use VS Code as my primary editor, I use this command too :

```Bash
fw() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && code "${files[@]}"
}
```

Which does the same thing but opens the files in VS Code instead of neovim.


### Search for files to edit in my ~/.dotfiles

```Bash
fea() {
  cd ~/.dotfiles
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && nvim "${files[@]}"
}
```

A slight variation of the above command that first `cd`'s to `~/.dotfiles` and then lets me search through contents of it to quickly edit and modify my config with neovim.

## Inspiring dotfiles
These are dotfiles I got many ideas from and really liked.
- [caarlos0](https://github.com/caarlos0/dotfiles)

## Contributing
[Suggestions](https://github.com/nikitavoloboev/dotfiles/issues) on how I can improve the structure of these dotfiles as well as suggesting new and awesome tools one can use is welcome. 

## Thank you 💜
You can support what I do on [Patreon](https://www.patreon.com/nikitavoloboev) or look into [other repositories](https://my.mindnode.com/ZKGETDkUaQUsL3q8q9z788CxG84oEHgDiT79GuzX#-143.5,-902.6,0) I shared. 

## License
MIT © [Nikita Voloboev](https://www.nikitavoloboev.xyz)