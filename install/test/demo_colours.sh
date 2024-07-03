#!/usr/bin/env zsh

# tput_colors - Demonstrate color combinations.

colours_8() {
  local fg_colour bg_colour set_foreground set_background
  for fg_colour in {0..7}; do
    set_foreground=$(tput setaf $fg_colour)
    for bg_colour in {0..7}; do
      set_background=$(tput setab $bg_colour)
      echo -n $set_background$set_foreground
      printf ' F:%s B:%s ' $fg_colour $bg_colour
    done
    echo $(tput sgr0)
  done
  printf "\n\n"
}

colours_256() {
  local fg_colour i j

  printf "Colours 0 to 15 for the standard 16 colours\n"
  for fg_colour in {0..15}; do
    printf "|%s%3d%s" "$(tput setaf "$fg_colour")" "$fg_colour" "$(tput sgr0)"
  done
  printf "|\n\n"

  printf "Colours 16 to 231 for 256 colours\n"
  for ((i = j = 0; fg_colour < 232; fg_colour++, i++)); do
    printf "|"
    ((i > 5 && (i = 0, ++j))) && printf " |"
    ((j > 5 && (j = 0, 1))) && printf "\b \n|"
    printf "%s%3d%s" "$(tput setaf "$fg_colour")" "$fg_colour" "$(tput sgr0)"
  done
  printf "|\n\n"

  printf "Greyscale 232 to 255 for 256 colours\n"
  for fg_colour in {232..255}; do
    printf "|%s%3d%s" "$(tput setaf "$fg_colour")" "$fg_colour" "$(tput sgr0)"
  done
  printf "|\n"
}

colours_8
colours_256
