# paths
PREFIX = /usr/local

# flags
CFLAGS   = -I/usr/include keyboard_layout.c -lX11 -lxkbfile -o keyboard_layout

# compiler and linker
CC = cc