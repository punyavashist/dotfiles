# My configuration files for macOS [![Thanks](https://img.shields.io/badge/Say%20Thanks-💗-ff69b4.svg)](https://www.patreon.com/nikitavoloboev)
> Includes Zsh, Neovim, Karabiner, Hammerspoon, VS Code

![](https://i.imgur.com/zAKij1K.jpg)

These are the various configuration files I use on macOS. I wrote about how I customise and use my shell in article [here](https://medium.com/@NikitaVoloboev/pretty-and-fast-shell-97ea870f2805).

You can also see my top used applications, safari exensions and alfred workflows I use [here](https://github.com/nikitavoloboev/my-mac-os#readme).

##### Contents
- [Install](#install)
- [Karabiner](#karabiner)
- [Neovim](#neovim)
- [VS Code](#vs-code)
- [Sublime Text](#sublime-text)
- [Hammerspoon](#hammerspoon)
- [Zsh](#zsh)
  - [Interesting aliases and functions](#interesting-aliases-and-functions)
- [Fzf](#fzf)
- [Interesting dotfiles](#interesting-dotfiles)
- [Contributing](#contributing)

## Install
To install my configration, clone the repository and run: `./install`.

This will automatically setup all the configuration files using [Dotbot](https://github.com/anishathalye/dotbot).

I describe my custom configuration I use below. It is heavily tailored to my own workflow so it is best you take ideas from it rather than copying the entire config.

## Karabiner

<img src="https://i.imgur.com/5Cs4oly.png" width="500" alt="img">

The most exciting thing in here is probably how I utilise [Karabiner](https://pqrs.org/osx/karabiner/). It has absolutely transformed the way I interact with my computer and there is no going back now.

I go over how I use Karabiner in detail [here](https://wiki.nikitavoloboev.xyz/macOS/apps/karabiner/karabiner.html). And my config for it can be seen [here](https://github.com/nikitavoloboev/dotfiles/blob/master/karabiner/private.xml).

## Neovim
The best text editing experience you will ever get. It is worth learning it as you will start thinking about text editing differently.

My Neovim config can be seen [here](nvim/init.vim). I use [Ayu theme](https://github.com/ayu-theme/ayu-vim) with [many plugins](https://wiki.nikitavoloboev.xyz/text-editors/vim/vim-plugins.html). Here is how it looks:

![](https://i.imgur.com/m6CK29L.png)

## VS Code
My main editor of choice is [VS Code](https://github.com/Microsoft/vscode) since it has very well built [vim mode](https://github.com/VSCodeVim/Vim).

Configs I use for it can be seen [here](https://github.com/nikitavoloboev/dotfiles/tree/master/vscode). And [here](https://wiki.nikitavoloboev.xyz/text-editors/vs-code/vs-code-extensions.html) is a list of extensions I use.

## Sublime Text
I use it primarily to edit markdown files like [my wiki](https://wiki.nikitavoloboev.xyz/other/wiki-workflow.html). I also edit config files and open large and small files for quick edits.

I use [many plugins](https://wiki.nikitavoloboev.xyz/text-editors/sublime-text/sublime-text-plugins.html) together with [Ayu theme](https://github.com/dempfi/ayu).

## Hammerspoon
I don't use [Hammerspoon](http://www.hammerspoon.org/) as extensively however I am looking into implementing more of its features into my workflow.

## Zsh
I am using [Zsh](http://www.zsh.org) as my shell with [Antibody](https://github.com/getantibody/antibody) plugin manager.

I am also using [Ayu theme](https://github.com/nikitavoloboev/my-mac-os/tree/master/iterm#readme) I made in Zsh. Here is how my prompt looks like:

![](https://i.imgur.com/zHUb7nT.png)

> a is [alias](zsh/alias.zsh) for [exa](https://github.com/ogham/exa)

## Zsh aliases
I use many aliases to get around my system as fast as possible. You can view them all [here](zsh/alias.zsh).

### Interesting aliases and functions
There is quite a lot of awesome programs I use from my command line. You can see [here](https://github.com/nikitavoloboev/my-mac-os#command-line-apps) for some of them.

I also love customising my shell experience with various aliases and zsh functions. Here are some that I like and use very often:

#### Commit and push repository to GitHub in one command

```Bash
ggi() {
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
mit() {
  license-up mit Nikita Voloboev nikitavoloboev.xyz
  git add license
}
```

Which using [this CLI tool](https://github.com/nikitavoloboev/license-up), will create a license file and git add it. It will then take the URL of my current browser window which will be at the newly created repository, point the local git repo to push there and push it.

And thus in one command I initialised and pushed the repo. To create a new repo quickly I use [this Alfred workflow](https://github.com/nikitavoloboev/alfred-ask-create-share).

#### Commit all with generic `update` message
I use this command often.

```Bash
ggs() {
    git add .
    git commit . -m 'update'
    git push
}
```

It will simply add all files and commit them. I don't use this when working with code but for making some changes or for updating this dotfiles repo for example, I just use this. Saves a lot of time.


#### Clone current url in clipboard

```Bash
gll(){
    git clone "$(pbpaste)"
}
```

I use this very often to quickly clone the URL that I copied from GitHub.

#### Trash files / folders
A lot more safer than `rm -rf` files as you can always check out `~/.Trash` in cases of emergency or mistakes.

```Bash
re(){
  mv "$1" ~/.Trash
}
```

### Fzf
[fzf](https://github.com/junegunn/fzf) is a command line tool that lets you fuzzy search on text. I use it very often now for fuzzy searching for files to open with neovim, or fuzzy searching through my commit messages and more.

Here are some of my favourite commands I use with it:

#### Search for files to edit in current dir

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

## Interesting dotfiles
These are dotfiles I got many ideas from and liked.
- [bluz71](https://github.com/bluz71/dotfiles) - Interesting vim setup.
- [caarlos0](https://github.com/caarlos0/dotfiles) - Made antibody.
- [wangsongiam](https://github.com/wangsongiam/dotfiles) - Interesting hammerspoon and zsh config.
- [rvolosatovs](https://github.com/rvolosatovs/dotfiles) - Good vim setup for Go.
- [Keith](https://github.com/keith/dotfiles) - Vim, zsh, tmux, and OS X .

## Contributing
[Suggestions](../../issues/) on how I can improve the structure of these dotfiles as well as suggesting new and awesome tools are welcome.

## Thank you 💜
You can support me on [Patreon](https://www.patreon.com/nikitavoloboev) or look into [other projects](https://nikitavoloboev.xyz/projects) I shared.

## License
MIT © [Nikita Voloboev](https://www.nikitavoloboev.xyz)