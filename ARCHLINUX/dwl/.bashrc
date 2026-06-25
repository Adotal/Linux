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
alias packettracer='/usr/lib/packettracer/packettracer.AppImage'
#alias studio='~/android-studio/bin/studio.sh' # BETTER MAKE A SYMLINK
alias nv='nvim'
alias ws='watch sensors'
alias changemac='/home/adotal/Documents/Linux/UTILITIES/ChangeMAC.sh'

# Fix JVM problems with dwm/dwl
alias netbeans_fixed='wmname LG3D && netbeans'

function battery_percent {
	battery=$(acpi -b)
	echo $battery | grep -Po '[0-9]+(?=%)'
}

PS1="[\[\033[38;5;39m\]\H\[$(tput sgr0)\]@\[\033[38;5;1m\]\u\[$(tput sgr0)]\[\033[38;5;222m\][\d \A][\$(battery_percent)%]\[$(tput sgr0)\][\033[38;5;40m\]\w\[$(tput sgr0)]\n\[\033[38;5;202m\]\$ \[$(tput sgr0)\]"
export PATH="~/develop/flutter/bin:$PATH"


# Load Angular CLI autocompletion.
#source <(ng completion script)

alias ap_now='sudo create_ap wlp2s0 enp1s0f1 Extender-AO 123456789.'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias spotify-adblock='LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify'
