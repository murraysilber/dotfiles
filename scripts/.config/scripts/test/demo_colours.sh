#!/usr/bin/env bash

# tput_colors - Demonstrate color combinations.

fromhex() {
  hex=${1#"#"}
  r=$(printf '0x%0.2s' "$hex")
  g=$(printf '0x%0.2s' ${hex#??})
  b=$(printf '0x%0.2s' ${hex#????})
  printf '%03d' "$(((r < 75 ? 0 : (r - 35) / 40) * 6 * 6 + (\
  g < 75 ? 0 : (g - 35) / 40) * 6 + (\
  b < 75 ? 0 : (b - 35) / 40) + 16))"
}

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

tohex() {
  dec=$(($1 % 256)) ### input must be a number in range 0-255.
  if [ "$dec" -lt "16" ]; then
    bas=$((dec % 16))
    mul=128
    [ "$bas" -eq "7" ] && mul=192
    [ "$bas" -eq "8" ] && bas=7
    [ "$bas" -gt "8" ] && mul=255
    a="$(((bas & 1) * mul))"
    b="$((((bas & 2) >> 1) * mul))"
    c="$((((bas & 4) >> 2) * mul))"
    printf 'dec= %3s basic= #%02x%02x%02x\n' "$dec" "$a" "$b" "$c"
  elif [ "$dec" -gt 15 ] && [ "$dec" -lt 232 ]; then
    b=$(((dec - 16) % 6))
    b=$((b == 0 ? 0 : b * 40 + 55))
    g=$(((dec - 16) / 6 % 6))
    g=$((g == 0 ? 0 : g * 40 + 55))
    r=$(((dec - 16) / 36))
    r=$((r == 0 ? 0 : r * 40 + 55))
    printf 'dec= %3s color= #%02x%02x%02x\n' "$dec" "$r" "$g" "$b"
  else
    gray=$(((dec - 232) * 10 + 8))
    printf 'dec= %3s  gray= #%02x%02x%02x\n' "$dec" "$gray" "$gray" "$gray"
  fi
}

for i in $(seq 0 255); do
  tohex ${i}
done

colours_8
colours_256
fromhex b8bb26
