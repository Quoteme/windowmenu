CC=gcc
CFLAGS=-I.
LDIR =./lib
DESTDIR=/usr/local
PREFIX=/bin

windowmenu: main.c
	$(CC) $( pkg-config --cflags gtk4 ) -o $@ main.c $( pkg-config --libs gtk4 )

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
