#!/bin/bash

# exec alacritty --hold -e ls
alacritty --command bash -c 'cd /home/Adotal/Documents/C-CPP/C++/DEITEL_9/Cap6/6.22_to_6.40/;  vim -p Exercises.h Exercises.cpp main.cpp; $SHELL' &
alacritty --command bash -c 'cd /home/Adotal/Documents/C-CPP/C++/DEITEL_9/Cap6/6.22_to_6.40/; ls -la; $SHELL' &
exec zathura /home/Adotal/Downloads/Deitel\ -\ Cómo\ programar\ en\ C++\ Novena\ Edición_compressed.pdf &
