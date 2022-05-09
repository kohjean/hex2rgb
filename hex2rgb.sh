#!/bin/bash
hex=$1
if [ ! $hex ]; then
    echo "Requires one argument"
elif [[ ! $hex =~ ^\#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ ]]; then
    echo "Invalid arg"
else
    if [ ${hex:0:1} = "#" ]; then
        hex=${hex:1:6}
    fi
    hex_r="${hex:0:2}"
    hex_g="${hex:2:2}"
    hex_b="${hex:4:2}"

    rgb_r=`echo $((0x${hex_r}))`
    rgb_g=`echo $((0x${hex_g}))`
    rgb_b=`echo $((0x${hex_b}))`

    rgb="rgb($rgb_r, $rgb_g, $rgb_b)"
    colored=`printf '\033[38;2;%d;%d;%dm%s' $rgb_r $rgb_g $rgb_b "$rgb"`
    printf "$rgb" | pbcopy
    printf "Converted #$hex to $colored"
fi
