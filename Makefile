target  = hs100
objects = comms.o handlers.o hs100.o escape.o

CFLAGS  = -std=gnu99
INSTALL_PATH := $(shell python -c 'import sys; print(sys.prefix if (hasattr(sys, "real_prefix") or (hasattr(sys, "base_prefix") and sys.base_prefix != sys.prefix)) else "/usr/local")')

.PHONY: all
all:	$(target)

.PHONY: clean
clean:
	rm -f $(target) $(objects)

.PHONY: install
install: all
	install -d $(INSTALL_PATH)/bin
	install -m 755 $(target) $(INSTALL_PATH)/bin/$(target)

$(target): $(objects)
	$(CC) -o $@ $(objects)
