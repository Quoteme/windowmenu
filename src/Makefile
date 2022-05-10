CC=gcc
CFLAGS=-I.
LDIR =./lib
DESTDIR=/usr/local
PREFIX=/bin

windowmenu: main.c
	$(CC) -o $@ main.c

.PHONY: clean install

install: windowmenu
	mkdir -p $(DESTDIR)$(PREFIX)
	ls
	install -m 755 windowmenu $(DESTDIR)$(PREFIX)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/windowmenu

clean:
	rm windowmenu

.PHONY: clean install uninstall
# vim: tabstop=2 shiftwidth=2 noexpandtab
