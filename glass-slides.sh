#!/bin/bash

device="/dev/input/event3"

key_next="(KEY_PAGEDOWN), value 0"
key_previous="(KEY_PAGEUP), value 0"
slidenb=0
maxslides=2

sudo evtest "$device" | while read line; do
    if echo "$line" | grep -q "$key_next"; then
	((slidenb++))
	bash "./slides/s$slidenb.sh"
	if [ $slidenb -ge $maxslides ]; then break; fi
    elif echo "$line" | grep -q "$key_previous"; then
	((slidenb--))
	bash "./slides/s$slidenb.sh"
	if [ $slidenb -le 0 ]; then break; fi
    fi
done
