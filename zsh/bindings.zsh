# vi movement in iTerm
set -o vi

bindkey -e # TODO: not sure 

bindkey '⌃T' edit-command-line


# _bindings
bindkey -M viins "^w" beginning-of-line
bindkey -M viins "^e" end-of-line
bindkey -M vicmd "^[" vi-insert
bindkey -sM viins "^v" ./
bindkey '^N' forward-word
bindkey '^B' backward-word
bindkey "^F" history-incremental-search-backward

# _fzf
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
