#!/usr/bin/env fish

# set fish_greeting
function fish_greeting
end

# === Aliases ===

alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias h='history'

alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'
alias rm='rm -r'
alias grep='grep --color=auto'
alias ls='exa -al --color=always --icons --group-directories-first'
alias cat='bat --theme base16'

# Taskwarrior TUI

alias tt='taskwarrior-tui -r ready'
alias tti='taskwarrior-tui -r inbox'
alias tta='taskwarrior-tui -r active'
alias ttn='taskwarrior-tui -r next'

# Pacman/Yay/Paru

alias pacs='pacman -Ss'
alias pacq='pacman -Q'
alias paci='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -R'

alias yays='yay -Ss'
alias yayi='yay -S'
alias yayu='yay -Syu'

alias parus='paru -Ss'
alias parui='paru -S'
alias paruu='paru -Syu'

# Python

alias py='python'

# C++

alias g++db='g++ -ggdb'
alias g++rl='g++ -O2 -DNDEBUG'

# Git

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias df='git diff'

# Dotfiles

alias conf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias conflg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# === COLOR UTILS ===

set default "\e[1;0m"
set black "\e[1;30m"
set red "\e[1;31m"
set green "\e[1;32m"
set yellow "\e[1;33m"
set blue "\e[1;34m"
set magenta "\e[1;35m"
set cyan "\e[1;36m"
set white "\e[1;37m"

# === FUNCTIONS ===

function green
    echo -e "$green$argv[1]"
end

function red
    echo -e "$red$argv[1]"
end

function take
    set dir $argv[1]
    mkdir $dir && cd $dir
end

function fishtheme
    set --local theme $argv[1]
end

function namefmt
    rename y/A-Z/a-z/ "$argv[1]"
    rename 'y/ /-/' "$argv[1]"
    rename y/_/-/ "$argv[1]"
end

function prettierhere
    set -l prettier_files ~/.prettierrc.js ~/.prettierrc.json
    for f in $prettier_files
        # Check if file exists
        if test -f $f
            green "Found $f. Enjoy your pretty code!"
            cp $f $PWD
            return 0
        end
    end

    red "Couldn't find any prettier configuration file in $HOME."
    return 1
end

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function confsync
    conf commit -m "Update $(date +"%Y-%m-%d %H:%M")" && conf push
end

# === BINDS ===

set -g fish_sequence_key_delay_ms 200
bind -M insert -m default jj cancel repaint-mode

# === PROMPT ===

set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked no
# set -g theme_display_git_ahead_verbose yes
# set -g theme_display_git_dirty_verbose yes
# set -g theme_display_git_stashed_verbose yes
# set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
# set -g theme_git_worktree_support yes
# set -g theme_use_abbreviated_branch_name yes
# set -g theme_display_vagrant yes
# set -g theme_display_docker_machine no
# set -g theme_display_k8s_context yes
# set -g theme_display_hg yes
# set -g theme_display_virtualenv no
# set -g theme_display_nix no
# set -g theme_display_ruby no
# set -g theme_display_node yes
set -g theme_display_user yes
set -g theme_display_hostname ssh
set -g theme_display_vi yes
set -g theme_display_date no
# set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
# set -g theme_date_format "+%a %H:%M"
# set -g theme_date_timezone America/Los_Angeles
# set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
# set -g theme_display_jobs_verbose yes
# set -g default_user your_normal_user
set -g theme_color_scheme dracula
set -g fish_prompt_pwd_dir_length 4
set -g theme_project_dir_length 4
set -g theme_newline_cursor yes
# set -g theme_newline_prompt ' ❯ '

# === COLORS ===

set -U fish_color_command cyan --bold
set -U fish_color_keyword magenta
set -U fish_color_quote green
set -U fish_color_redirection yellow
set -U fish_color_end magenta
set -U fish_color_error red
set -U fish_color_param normal --bold
set -U fish_color_valid_path yellow
set -U fish_color_option blue
set -U fish_color_comment blue --dim
set -U fish_color_selection blue --bold --reverse
set -U fish_color_operator green --bold
set -U fish_color_escape blue
set -U fish_color_autosuggestion normal --dim

set -U fish_pager_color_progress yellow --bold --reverse
set -U fish_pager_color_prefix blue --bold --underline
set -U fish_pager_color_completion blue -dim
set -U fish_pager_color_description magenta --italics
set -U fish_pager_color_selected_background --background=blue
set -U fish_pager_color_selected_prefix black --bold
set -U fish_pager_color_selected_completion black
set -U fish_pager_color_selected_description black --italics

# fastfetch
zoxide init --cmd cd fish | source
pyenv init - | source
starship init fish | source
