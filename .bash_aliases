#BASH ALIASES
# ===========

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

alias pacs='pacman -Ss'
alias pacq='pacman -Q'
alias paci='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -R'

alias yays='yay -Ss'
alias yayi='yay -S'
alias yayu='yay -Syu'

# Taskwarrior TUI

alias tt='taskwarrior-tui -r ready'
alias tti='taskwarrior-tui -r inbox'
alias tta='taskwarrior-tui -r active'
alias ttn='taskwarrior-tui -r next'

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
