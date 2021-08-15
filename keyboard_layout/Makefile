# See LICENSE file for copyright and license details.

include config.mk

SRC = keyboard_layout.c

all: options keyboard_layout

options:
	@echo keyboard_layout build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "CC       = ${CC}"



keyboard_layout: ${SRC}
	${CC} ${CFLAGS}





install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f keyboard_layout ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/keyboard_layout

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/keyboard_layout

.PHONY: all options clean dist install uninstall