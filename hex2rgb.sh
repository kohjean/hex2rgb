#!/bin/bash
hex=$1
if [ ! $hex ]; then
    echo "Requires one argument"
elif [[ ! $hex =~ ^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ ]]; then
    echo "Invalid arg"
else
    if [ ${hex:0:1} = "#" ]; then
        hex=${hex:1:6}
    fi
    printf "rgb(%d, %d, %d)\n" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2}
fi
