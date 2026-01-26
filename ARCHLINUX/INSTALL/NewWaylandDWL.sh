#!/bin/bash
cd
# Auto login TTY
# Run $ sudo systemctl edit getty@tty1
# and paste
# [Service]
# ExecStart=
# ExecStart=-/sbin/agetty --noreset --noclear --autologin ${USER} - ${TERM}

# Auto start dwl at loggin
# echo "exec dwl 2> ~/.dwl.log" >> /home/${USER}/.bash_profile

# Install packages
sudo pacman -Syu fastfetch htop tree libinput wayland wlroots0.19 wayland-protocols pkg-config brightnessctl wget foot firefox chromium seatd code gimp pcmanfm wmenu ttf-dejavu-nerd go acpi unzip zip python3 jdk11-openjdk grim slurp swayimg man-db lib32-vulkan-radeon android-tools libreoffice-still pipewire pipewire-pulse wireplumber udiskie kdenlive lm_sensors mpv zathura zathura-pdf-mupdf imagemagick apache yt-dlp mariadb kicad kicad-library \
libusb libffi openssl libgcrypt glib2 pixman sdl2 libslirp ccache dfu-util cmake python-pip # ESP-IDF DEPENDENCIES

# dwl
# https://codeberg.org/dwl/dwl.git

# yay
# git clone https://aur.archlinux.org/yay.gi
# cd yay
#makepkg -sic

# jetbrains-toolbox (for android studio)
# yay -S jetbrains-toolbox

# code
# yay -S code-marketplace

# pipewire
# Enable: $ systemctl enable --user pipewire
# Current mic vol: $ wpctl get-volume @DEFAULT_SOURCE@
# Adjust mic vol: $ wpctl set-volume @DEFAULT_SOURCE@ .40
#
# # NOTE: VSCODE C/C++ EXTENSION NOT AVAILABLE IN OSS UNITL VERSION 1.20.5
