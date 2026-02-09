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
sudo pacman -Syu fastfetch htop tree libinput wayland wlroots0.19 wayland-protocols pkg-config brightnessctl wget foot firefox chromium seatd code gimp pcmanfm wmenu ttf-dejavu-nerd go acpi unzip zip python3 jdk11-openjdk grim slurp swayimg man-db lib32-vulkan-radeon android-tools libreoffice-still pipewire pipewire-pulse wireplumber udiskie kdenlive lm_sensors mpv zathura zathura-pdf-mupdf imagemagick apache yt-dlp mariadb kicad kicad-library openssh pavucontrol lsp-plugins easyeffects \
libusb libffi openssl libgcrypt glib2 pixman sdl2 libslirp ccache dfu-util cmake python-pip # ESP-IDF DEPENDENCIES

# dwl
# https://codeberg.org/dwl/dwl.git

# yay
# git clone https://aur.archlinux.org/yay.gi
# cd yay
#makepkg -sic

# jetbrains-toolbox (for android studio)
# yay -S jetbrains-toolbox


# pipewire
# Enable: $ systemctl enable --user pipewire
# Current mic vol: $ wpctl get-volume @DEFAULT_SOURCE@
# Adjust mic vol: $ wpctl set-volume @DEFAULT_SOURCE@ .31

# MIC FIX WITH EASYEFFECTS
# Abre EasyEffects y ve a la pestaña Input (abajo a la izquierda).
# Haz clic en Effects y añade:
# Noise Reduction: (Usa el modelo RNNoise). Esto quitará la estática.
# Gate: Para que el micro no capte nada si no estás hablando.
# Limiter: ¡Esto es vital! Ponlo al final. Evitará que, aunque la ganancia suba, el audio se sature (clipping) digitalmente.


# code
# yay -S code-marketplace
# # NOTE: VSCODE C/C++ EXTENSION NOT AVAILABLE IN OSS UNITL VERSION 1.20.5

# FIX SYSTEM-D BOOT INITFRAMS AFTER UPDATE

/etc/systemd/system/efistub-update.path
[Unit]
Description=Copy EFISTUB Kernel to EFI system partition

[Path]
PathChanged=/boot/initramfs-linux-fallback.img

[Install]
WantedBy=multi-user.target
WantedBy=system-update.target

/etc/systemd/system/efistub-update.service
[Unit]
Description=Copy EFISTUB Kernel to EFI system partition

[Service]
Type=oneshot
ExecStart=/usr/bin/cp -af /boot/vmlinuz-linux-zen /efi/vmlinuz-linux-zen
ExecStart=/usr/bin/cp -af /boot/initramfs-linux-zen.img /efi/initramfs-linux-zen.img
ExecStart=/usr/bin/cp -af /boot/amd-ucode.img /efi/amd-ucode.img

