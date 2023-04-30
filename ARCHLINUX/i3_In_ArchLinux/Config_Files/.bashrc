#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias x='exit'
PS1="[\[\033[38;5;39m\]\H\[$(tput sgr0)\]@\[\033[38;5;1m\]\u\[$(tput sgr0)]\[\033[38;5;222m\][\d \A]\[$(tput sgr0)\][\033[38;5;40m\]\w\[$(tput sgr0)]\n\[\033[38;5;202m\]\$: \[$(tput sgr0)\]"
