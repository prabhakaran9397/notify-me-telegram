BINDIR=/usr/local/bin
UNAME_S:=$(shell uname -s)

.PHONY: install uninstall update

install:
	bash install
	install -m775 -d $(BINDIR)
	@if [ "$(UNAME_S)" = "Linux" ]; then\
		install -m775 -t $(BINDIR) notify; \
	fi
	@if [ "$(UNAME_S)" = "Darwin" ]; then\
		install -m775 notify $(BINDIR); \
	fi

uninstall:
	rm -f $(BINDIR)/notify
	rm notify

update:
	rm -f $(BINDIR)/notify
	rm -f notify
	git pull origin master
	bash install
	install -m775 -d $(BINDIR)
	@if [ "$(UNAME_S)" = "Linux" ]; then\
		install -m775 -t $(BINDIR) notify; \
	fi
	@if [ "$(UNAME_S)" = "Darwin" ]; then\
		install -m775 notify $(BINDIR); \
	fi
	
