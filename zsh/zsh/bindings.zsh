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


bindkey -M viins ' ' magic-space # TODO: not sure if needed


