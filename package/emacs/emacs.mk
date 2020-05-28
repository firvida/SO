################################################################################
#
# emacs
#
################################################################################

EMACS_VERSION = 26.3  
EMACS_SOURCE = emacs-$(EMACS_VERSION).tar.xz
EMACS_SITE = http://mirror.us-midwest-1.nexcess.net/gnu/emacs
EMACS_LICENSE = GPL-2.0+

EMACS_CONF_OPTS += --with-x-toolkit=gtk3

EMACS_CONF_ENV = CFLAGS="${TARGET_CFLAGS} -I/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/include/cairo -I/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/include/glib-2.0 -I/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/lib/glib-2.0/include -I/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/include/pixman-1 -I/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/include/freetype2 -I/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/include/uuid -I/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/include/libdrm -I/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/include/libpng16" \
		 LIBS="-L/srv/buildroot/output/host/bin/../x86_64-firvida-linux-gnu/sysroot/usr/lib -lcairo"

$(eval $(autotools-package))
