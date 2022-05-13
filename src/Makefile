CC=gcc
CFLAGS=-I.
LDIR =./lib
LDLIBS = $(shell pkg-config --libs gtk+-3.0)
DESTDIR=/usr/local
PREFIX=/bin

windowmenu: main.c
	$(CC) -o $@ main.c `pkg-config --cflags --libs gtk4`

.PHONY: clean install

install: windowmenu
	mkdir -p $(DESTDIR)$(PREFIX)
	install -m 755 windowmenu $(DESTDIR)$(PREFIX)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/windowmenu

clean:
	rm windowmenu

.PHONY: clean install uninstall
# vim: tabstop=2 shiftwidth=2 noexpandtab
