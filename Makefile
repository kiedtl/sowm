CFLAGS  = -std=c99 -Wall -Wextra -pedantic -Wold-style-declaration
CFLAGS  = -Wmissing-prototypes -Wno-unused-parameter
LDFLAGS = -lpthread -lxcb -lXau -lXdmcp -lX11 -static
PREFIX  ?= /usr
BINDIR  ?= $(PREFIX)/bin
CC      ?= gcc

all: config.h sowm

config.h:
	cp config.def.h config.h

sowm: sowm.c
	$(CC) -O3 $(CFLAGS) -o sowm sowm.c $(LDFLAGS)

install: all
	install -Dm755 sowm $(DESTDIR)$(BINDIR)/sowm

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/sowm

clean:
	rm -f sowm *.o
