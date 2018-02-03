# Zsh keyboard bindings.

set -o vi # Vi movement in iTerm

# _Keymaps
bindkey -e # Switch to emacs keymap
bindkey -v # Switch to vim keymap

# _Control
bindkey "^f" beginning-of-line
bindkey "^g" end-of-line
bindkey "^k" forward-word
bindkey "^j" backward-word
# bindkey "^o" kill-word
# bindkey "^o" '^Ua^M' # Run 'a' command TODO: doesnt work
bindkey "^e" kill-whole-line
bindkey -M vicmd "^[" vi-insert
# bindkey '^:' forward-word # Move back a word
# bindkey '^o' backward-word # Move forward a word
# bindkey -M viins "^o" beginning-of-line
# bindkey -sM viins "^v" ./
# bindkey '^N' forward-word
# bindkey '^B' backward-word
# bindkey '⌃T' edit-command-line
# bindkey "^F" history-incremental-search-backward

# _Option
# bindkey -s '\ei' '^Ua^M' # Run 'a' command
# bindkey -s '\es' '^Asudo ^E' # Prepend 'sudo ' to current command and move to EOL
# bindkey -s '\el' '^Ucd ..; a^M' # Move to parent directory and list it
# bindkey -s '\eU' '^Ucd ..^M' # Move to parent directory
bindkey '\e.' insert-last-word # Insert last argument of previous command
bindkey "\eo" describe-key-briefly


# _FZF TODO: ?
# bind '"\er": redraw-current-line'
# bind '"\C-g\C-f": "$(gf)\e\C-e\er"'
# bind '"\C-g\C-b": "$(gb)\e\C-e\er"'
# bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
# bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
# bind '"\C-g\C-r": "$(gr)\e\C-e\er"'

bindkey -M viins ' ' magic-space
# bindkey -M viins ' ' self-insert