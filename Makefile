
# Directory where this Makefile exists (the dotfiles directory)
EMACS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

el-modules = init-core.el \
init-completion.el \
init-developing.el \
init-helm.el \
init-helpers.el \
init-javascript.el \
init-org.el \
init-gtd.el \
init-dired.el \
init-navigation.el \
init-rss.el \
init-web.el \
init-python.el \
init-utils.el \
init-notifications.el \
init-twitter.el \
init-remote.el \
init-misc.el \
init-git.el \
init-grep.el \
init-ibuffer.el \
init-eshell.el \
init-docker.el \
init-evil.el \
init-chat.el \
init-writing.el \
init-theme.el \
deos.el

all: init $(el-modules)

clean:
	rm -fv *.el
	rm -fv *.elc
	rm -fv sh/*.sh
	rm -rfv ~/.emacs.d

init: initialize.sh
initialize.sh: deos.org
	bin/tangle deos.org
install.sh: deos.org
	bin/tangle deos.org
run-init: init
	bash initialize.sh

%.el: %.org
	bin/tangle $<

byte-compile-all: all
	for f in *.el; do \
		bin/byte-compile $$f; \
	done

run: all
	for f in sh/*.sh; do \
		echo "Running: $$f"; \
		bash -l $$f; \
	done

install: run-init run install.sh
	bash -l install.sh
