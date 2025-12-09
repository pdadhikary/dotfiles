source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting

end


set -g fish_key_bindings fish_vi_key_bindings
set fish_cursor_default block blink

# fzf shell integration:
fzf --fish | source

# starship shell integratin:
starship init fish | source

# zoxide shell integration:
zoxide init --cmd cd fish | source

alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
