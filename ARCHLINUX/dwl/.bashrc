#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias music='vlc /home/usuario1/MUSIC_BACK/'
alias ls='ls --color=auto'
alias pacfull='sudo pacman -Syu --noconfirm'
alias x='exit'
alias qs='poweroff'
alias rs='reboot'
alias mi='sudo make clean install'
#alias studio='~/android-studio/bin/studio.sh' # BETTER MAKE A SYMLINK
alias nv='nvim'

function battery_percent {
	battery=$(acpi -b)
	echo $battery | grep -Po '[0-9]+(?=%)'
}

PS1="[\[\033[38;5;39m\]\H\[$(tput sgr0)\]@\[\033[38;5;1m\]\u\[$(tput sgr0)]\[\033[38;5;222m\][\d \A][\$(battery_percent)%]\[$(tput sgr0)\][\033[38;5;40m\]\w\[$(tput sgr0)]\n\[\033[38;5;202m\]\$: \[$(tput sgr0)\]"
export PATH="~/develop/flutter/bin:$PATH"


# Load Angular CLI autocompletion.
source <(ng completion script)

# Fix JVM problems with dwm/dwl
# exec wmname LG3D
