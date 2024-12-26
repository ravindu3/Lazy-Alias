# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set a colorful prompt
# Syntax: \[\033[FORMATm\]
# Example: \[\033[1;31m\] -> Bold Red
# \u -> Username, \h -> Hostname, \w -> Current directory
PS1="\[\033[1;34m\]\u\[\033[1;32m\]@\h \[\033[1;36m\]\w \[\033[0m\]$ "

# Color LS output
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'

# Add some color to the grep command output
alias grep='grep --color=auto'

# Define colors for commonly used commands
alias c='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias h='history'
alias e='exit'

# Enable better command history navigation
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Useful functions with colors
function mkcd() {
    mkdir -p -- "$1" && cd -P -- "$1"
    echo -e "\033[1;32mDirectory '$1' created and navigated.\033[0m"
}

function today() {
    echo -e "\033[1;33mToday is: \033[1;36m$(date "+%A, %B %d, %Y")\033[0m"
}

# Add git branch info to prompt (if in a git repo)
parse_git_branch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2
}
PS1+="\[\033[1;35m\]\$(parse_git_branch)\[\033[0m\] "

# Enable colored output for `man` pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Set default editor
export EDITOR=nano

# Show colorful directory structure using tree
alias tree='tree -C'

# Add color support for `diff`
alias diff='diff --color=auto'

# Welcome Message
echo -e "\033[1;34mWelcome, \033[1;32m$(whoami)!\033[0m"

# Source global definitions (if available)
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#Lazy Alias

alias p="shutdown -P now"
alias r="reboot"
alias 1="ping -c 4 google.com"
alias cls="clear"
alias 
