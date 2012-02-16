# -*- mode:makefile -*-
# ----------------------------------------------------------------------
# Required pkgs: gvfs-bin
# Required vars: DAV-URI DAV-FILES
# ----------------------------------------------------------------------

ifndef DAV-URI
$(error "You must define variable 'DAV-URI' to your target URI")
endif

ifndef DAV-FILES
$(error "You must define variable 'DAV-FILES' for your deplyable files")
endif

dav-mount:
	gvfs-mount $(DAV-URI)

dav-umount:
	gvfs-mount -u $(DAV-URI)

dav-show: dav-mount
	nautilus $(DAV-URI)

dav-copy:
	gvfs-copy $(DAV-FILES) $(DAV-URI)

dav-rm:
	gvfs-rm $(addprefix $(DAV)/, $(DAV-FILES))

install: dav-mount dav-copy

uninstall: dav-mount dav-rm
