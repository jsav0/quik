# quik - mispelt script for deploying vps' quickly
# see the source code for copyright and license details.

BIN    = quik
PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin

all:

install: 
	@echo installing executable to "${DESTDIR}${PREFIX}/bin"
	@mkdir -p "${DESTDIR}${BINDIR}"
	@install -m 0755 "${BIN}" "${DESTDIR}${BINDIR}/${BIN}"

uninstall:
	@echo removing executable file from "${DESTDIR}${PREFIX}/bin"
	@rm -f "${DESTDIR}${BINDIR}/${BIN}"
