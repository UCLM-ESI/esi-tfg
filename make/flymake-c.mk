
# usage: put "-include c-flymake.mk" in your Makefile and activate
# flymake-mode in emacs

check-syntax:
	$(CC) -Wall -Wextra -pedantic -fsyntax-only -S $(CHK_SOURCES)
