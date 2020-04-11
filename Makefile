# Only to simplify install/uninstall process

VERSION      ?= 0.1
NAME          = cx
EXEC          = $(NAME)
CONFIG        = $(NAME).conf
PKG           = $(NAME)-$(VERSION)
ARCHIVE       = $(PKG).tar.gz

prefix       ?= /usr/local
sysconfdir   ?= /etc
datadir       = $(prefix)/share/doc/cx

all clean distclean:
	@true

install:
	@install -d $(DESTDIR)$(prefix)/bin
	@install -d $(DESTDIR)$(sysconfdir)
	@install -d $(DESTDIR)$(datadir)
	@install -m 0755 $(EXEC) $(DESTDIR)$(prefix)/bin/$(EXEC)
	@install -b -m 0644 $(CONFIG) $(DESTDIR)$(sysconfdir)/$(CONFIG)
	@install -m 0644 README.md $(DESTDIR)$(datadir)/README.md

uninstall:
	-@$(RM) $(DESTDIR)$(prefix)/bin/$(EXEC)
	-@$(RM) $(DESTDIR)$(sysconfdir)/$(CONFIG)
	-@$(RM) -r $(DESTDIR)$(datadir)

dist:
	@if [ ! `git tag | grep v$(VERSION)` ]; then				\
		echo;								\
		printf "\e[1m\e[41mCannot find release tag v$(VERSION)\e[0m\n";	\
		echo;								\
		exit 1;								\
	fi
	@git archive --format=tar --prefix=$(PKG)/ v$(VERSION) | gzip >../$(ARCHIVE)
	@(cd ..; md5sum $(ARCHIVE) | tee $(ARCHIVE).md5)
