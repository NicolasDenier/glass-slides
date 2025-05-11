#!/bin/bash

device="/dev/input/event3"

key_next="(KEY_PAGEDOWN), value 0"
key_previous="(KEY_PAGEUP), value 0"
slidenb=0
slides=${1:-slides.sh}
maxslides=$(wc -l $slides | cut -f1 -d" ")
done=false

show () {
    sed "${slidenb}q;d" $slides | bash &
}

sudo evtest "$device" | while read line && ((! $done)); do
    if echo "$line" | grep -q "$key_next"; then
	((slidenb++))
	if [ $slidenb -gt $maxslides ]; then
            done=true
	    break
       	fi
	pkill "aosd_cat"
        show
    elif echo "$line" | grep -q "$key_previous"; then
	((slidenb--))
	if [ $slidenb -lt 0 ]; then break; fi
	pkill "aosd_cat"
        show	
    fi
done
echo "end"
