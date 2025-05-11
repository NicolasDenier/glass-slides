# Glass Slides
Display text slides on top of your current screen.  
Useful when you want to show a demo and add comments, avoiding switching back and forth between screen share and slides.  
To some extend you can draw simple diagrams using arrow characters.  
As each slide is defined as a command, you can launch a script instead of displaying text.  

## Supported style
- Any text (including emojis)
- Any font
- Any color
- Any position
- Any duration

## Run
- First install the [`aosd_cat`](https://manpages.ubuntu.com/manpages/focal/man1/aosd_cat.1.html) package
- Prepare your slides (see [slides.sh](slides.sh) and `aosd_cat` doc)  
  one line per slide
- Launch `./glass-slides.sh <slides file>`
- Press page up/page down keys to change slides (next/previous)  
  starts and ends with empty slides
