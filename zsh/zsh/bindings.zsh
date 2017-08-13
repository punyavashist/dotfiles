# vi movement in iTerm
set -o vi


# _bindings
bindkey -M viins "^w" beginning-of-line
bindkey -M viins "^e" end-of-line
bindkey -M vicmd "^[" vi-insert
bindkey -sM viins "^v" ./
bindkey '^N' forward-word
bindkey '^B' backward-word
bindkey "^F" history-incremental-search-backward

my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^R' my-backward-delete-word


bindkey -M viins ' ' magic-space # TODO: not sure if needed


