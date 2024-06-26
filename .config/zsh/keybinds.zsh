##
## Keybindings
##
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey -s '^K' 'ls^M'
bindkey -s '^o' '_smooth_fzf^M'

# prepend sudo on the current commmand
bindkey -M emacs '' _sudo_command_line
bindkey -M vicmd '' _sudo_command_line
bindkey -M viins '' _sudo_command_line

# fix backspace and other stuff in vi-mode
bindkey -M viins '\e/' _vi_search_fix
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line

# vim:ft=zsh:nowrap

# alt+<- | alt+->
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# ctrl+<- | ctrl+->
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
