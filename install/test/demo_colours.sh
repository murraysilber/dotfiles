#!/usr/bin/env zsh

# tput_colors - Demonstrate color combinations.

for fg_color in {0..7}; do
  set_foreground=$(tput setaf $fg_color)
  for bg_color in {0..7}; do
    set_background=$(tput setab $bg_color)
    echo -n $set_background$set_foreground
    printf ' F:%s B:%s ' $fg_color $bg_color
  done
  echo $(tput sgr0)
done

colors256() {
  local c i j

  printf "Colors 0 to 15 for the standard 16 colors\n"
  for ((c = 0; c < 16; c++)); do
    printf "|%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
  done
  printf "|\n\n"

  printf "Colors 16 to 231 for 256 colors\n"
  for ((i = j = 0; c < 232; c++, i++)); do
    printf "|"
    ((i > 5 && (i = 0, ++j))) && printf " |"
    ((j > 5 && (j = 0, 1))) && printf "\b \n|"
    printf "%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
  done
  printf "|\n\n"

  printf "Greyscale 232 to 255 for 256 colors\n"
  for (( ; c < 256; c++)); do
    printf "|%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
  done
  printf "|\n"
}

colors256
