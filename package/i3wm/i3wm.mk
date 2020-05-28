################################################################################
#
# i3wm
#
################################################################################

I3WM_VERSION = 4.18.1  
I3WM_SOURCE = i3-$(I3WM_VERSION).tar.bz2
I3WM_SITE = https://i3wm.org/downloads
I3WM_LICENSE = GPL-2.0+
I3WM_LICENSE_FILES = COPYING

I3WM_CONF_OPTS = \
	--x-includes=$(STAGING_DIR)/usr/include/X11 \
	--x-libraries=$(STAGING_DIR)/usr/lib

I3WM_DEPENDENCIES = xlib_libX11 libxml2 libglib2 pango host-pkgconf \
                    libev startup-notification xcb-util xcb-util-cursor \
                    xcb-util-keysyms xcb-util-wm xcb-util-xrm yajl

ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
I3WM_CONF_OPTS += --enable-imlib2
I3WM_DEPENDENCIES += imlib2
else
I3WM_CONF_OPTS += --disable-imlib2
endif

ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
I3WM_CONF_OPTS += --enable-startup-notification
I3WM_DEPENDENCIES += startup-notification
else
I3WM_CONF_OPTS += --disable-startup-notification
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
I3WM_CONF_OPTS += --enable-session-management
I3WM_DEPENDENCIES += xlib_libSM
else
I3WM_CONF_OPTS += --disable-session-management
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
I3WM_CONF_OPTS += --enable-xinerama
I3WM_DEPENDENCIES += xlib_libXinerama
else
I3WM_CONF_OPTS += --disable-xinerama
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
I3WM_CONF_OPTS += --enable-xrandr
I3WM_DEPENDENCIES += xlib_libXrandr
else
I3WM_CONF_OPTS += --disable-xrandr
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
I3WM_DEPENDENCIES += xlib_libXcursor
I3WM_CONF_OPTS += --enable-xcursor
else
I3WM_CONF_OPTS += --disable-xcursor
endif

$(eval $(autotools-package))
