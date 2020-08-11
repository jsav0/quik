include config.mk

all: $(SERVERS)

$(SERVERS):
	drist -p $@

clean: 
	find . -name "config.*" -exec rm -f {} \;

ln:
	./.link.sh
