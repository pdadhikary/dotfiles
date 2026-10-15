source /usr/share/cachyos-fish-config/cachyos-config.fish

# auto-attach a zellij session per project directory (ghostty only, so
# alacritty/ttys are left alone); skipped when already inside zellij
if status is-interactive; and not set -q ZELLIJ; and test "$TERM_PROGRAM" = ghostty
    zellij attach --create (basename $PWD | string replace -a '.' '-')
end

fish_vi_key_bindings

starship init fish | source

function fish_greeting
    set user (whoami)
    set host (hostname)
    set kernel (uname -r)
    set uptime (uptime -p | sed 's/up //')

    set greeting_list \
        "Pilot's license? What for?" \
        "Hey! Listen!" \
        "Demon King? Secret Stones?" \
        "Psycho Mantis??!" \
        "Microsoft is run by... ANTS!" \
        "Tony... get the boulder." \
        "GOBLINS are REAL" \
        "KNACKKK 2 BABYYYYY!!!" \
        "Roadwork ahead? I sure hope it does." \
        "Put these foolish ambitions to rest." \
        "FOUL TARNISHED, In search of the Elden Ring." \
        "Together, we shall devour the very gods!" \
        "Praise the Sun!" \
        "Ahh... maidenless..." \
        "I help anytime." \
        "I'm sorry $user, I'm afraid I can't do that." \
        "You got AMNESIA." \
        "Ah \$h!t, here we go again..." \
        "I fart in your general direction." \
        "What... is the capital of Assyria?" \
        "'Tis but a scratch" \
        "Bring out the Holy Hand Grenade." \
        "Help! Help! I'm being repressed!" \
        "Nobody expects the Spanish Inquisition!" \
        "Now you see the violence inherent in the system." \
        "Bring me a shrubbery!" \
        "That's just like, uh, your opinion, man."

    set greeting $greeting_list[(random 1 (count $greeting_list))]

    echo ""
    echo (set_color brmagenta)"  $greeting" (set_color normal)
    echo ""
    echo (set_color brblack)"  $user  •  󰒋 $host  •   $kernel  •  󰥔 $uptime" (set_color normal)
    echo ""
end

zoxide init --cmd cd fish | source

alias ls='eza -al --color=always --group-directories-first --icons=always'
alias la='eza -a --color=always --group-directories-first --icons=always'
alias ll='eza -l --color=always --group-directories-first --icons=always'
alias lt='eza -aT --color=always --group-directories-first --icons=always'
alias l.="eza -a | grep -e '^\.'"
alias nv="nvim"
alias urn="uv run nvim"

set -gx GV_DIR /home/deepta/gv

set -gx g16root /home/deepta
set -gx GAUSS_SCRDIR /home/deepta/g16/Scratch
# bass source /home/deepta/g16/bsd/g16.profile

# opencode
fish_add_path /home/deepta/.opencode/bin
fish_add_path /home/deepta/orca

fish_add_path /home/deepta/.spicetify
