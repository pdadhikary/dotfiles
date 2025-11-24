source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    starship init fish | source
    zoxide init --cmd cd fish | source
end

