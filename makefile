# quik - mispelt script for deploying vps' quickly
# see the source code for copyright and license details.

BIN    = quik
PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin

all:

install: 
	@echo installing executable to "${BINDIR}/${BIN}"
	@mkdir -p "${BINDIR}"
	@install -m 0755 "${BIN}" "${BINDIR}/${BIN}"

uninstall:
	@echo removing executable file from "${BINDIR}/${BIN}"
	@rm -f "${BINDIR}/${BIN}"
