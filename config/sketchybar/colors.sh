# Paleta Breeze Dark para SketchyBar, JankyBorders y el gestor de ventanas.
# Copia de la fila breeze_dark de config/main/palettes.csv de dotfiles (2026-10-28).
# Al trasladar, este archivo se genera desde esa tabla en vez de copiarse a mano.
# Formato 0xAARRGGBB, el que leen sketchybar y borders.

export BACKGROUND=0xff202326
export FOREGROUND=0xfffcfcfc
export CURSOR=0xfffcfcfc
export SELECTION=0xff2c5b74
export ACCENT=0xff3daee9
export SURFACE=0xff141618
export RAISED=0xff292c30

export COLOR0=0xff232627
export COLOR1=0xffed1515
export COLOR2=0xff11d116
export COLOR3=0xfff67400
export COLOR4=0xff1d99f3
export COLOR5=0xff9b59b6
export COLOR6=0xff1abc9c
export COLOR7=0xfffcfcfc
export COLOR8=0xff7f8c8d
export COLOR9=0xffc0392b
export COLOR10=0xff1cdc9a
export COLOR11=0xfffdbc4b
export COLOR12=0xff3daee9
export COLOR13=0xff8e44ad
export COLOR14=0xff16a085
export COLOR15=0xffffffff

# Usos con nombre: la barra y los bordes leen estos, no los de arriba.
export BAR_COLOR=$BACKGROUND
export ITEM_BG_COLOR=$RAISED
export LABEL_COLOR=$FOREGROUND
export ICON_COLOR=$FOREGROUND
export BORDER_ACTIVE=$ACCENT
export BORDER_INACTIVE=$RAISED
export WORKSPACE_FOCUSED=$ACCENT
export WORKSPACE_IDLE=$COLOR8
