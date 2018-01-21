# Zsh keyboard bindings.

# Vi movement in iTerm
set -o vi

bindkey -e # Switch to emacs keymap
bindkey -v # Switch to vim keymap

# _Bindings
bindkey "^f" beginning-of-line
bindkey "^g" end-of-line

# bindkey -M viins "^o" beginning-of-line
bindkey -M vicmd "^[" vi-insert
bindkey -sM viins "^v" ./
bindkey '^N' forward-word
bindkey '^B' backward-word
# bindkey '⌃T' edit-command-line
# bindkey "^F" history-incremental-search-backward

# _FZF TODO: ?
# bind '"\er": redraw-current-line'
# bind '"\C-g\C-f": "$(gf)\e\C-e\er"'
# bind '"\C-g\C-b": "$(gb)\e\C-e\er"'
# bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
# bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
# bind '"\C-g\C-r": "$(gr)\e\C-e\er"'

my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^R' my-backward-delete-word

bindkey -M viins ' ' magic-space # TODO: not sure if needed