#!/bin/bash

echo $MODE_IDX
exit

OPTIONS=(laptop vga duplicate vga-left vga-right)
INTERNAL_OUTPUT="eDP1"
EXTERNAL_OUTPUT="DP2"

MODE_IDX=${MODE_IDX:-0}
OPTIONS_SIZE=${#OPTIONS[@]}
MODE=${OPTIONS[$(( ${MODE_IDX} % ${OPTIONS_SIZE} ))]}

if [[ $MODE = laptop ]]; then
    xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
elif [[ $MODE = vga ]]; then
    xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto 
elif [[ $MODE = duplicate ]]; then
    xrandr --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
elif [[ $MODE = vga-left ]]; then
    xrandr --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
elif [[ $MODE = vga-right ]]; then
    xrandr --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT
fi

