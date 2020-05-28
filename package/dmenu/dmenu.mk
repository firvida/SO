################################################################################
#
# dmenu
#
################################################################################

DMENU_VERSION = 4.9  
DMENU_SOURCE = dmenu-4.9.tar.gz
DMENU_SITE = https://dl.suckless.org/tools

DMENU_CONF_OPTS = \
	--x-includes=$(STAGING_DIR)/usr/include/X11 \
	--x-libraries=$(STAGING_DIR)/usr/lib

DMENU_DEPENDENCIES = xlib_libX11 libxml2 libglib2 pango host-pkgconf

ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
DMENU_CONF_OPTS += --enable-imlib2
DMENU_DEPENDENCIES += imlib2
else
DMENU_CONF_OPTS += --disable-imlib2
endif

ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
DMENU_CONF_OPTS += --enable-startup-notification
DMENU_DEPENDENCIES += startup-notification
else
DMENU_CONF_OPTS += --disable-startup-notification
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
DMENU_CONF_OPTS += --enable-session-management
DMENU_DEPENDENCIES += xlib_libSM
else
DMENU_CONF_OPTS += --disable-session-management
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
DMENU_CONF_OPTS += --enable-xinerama
DMENU_DEPENDENCIES += xlib_libXinerama
else
DMENU_CONF_OPTS += --disable-xinerama
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
DMENU_CONF_OPTS += --enable-xrandr
DMENU_DEPENDENCIES += xlib_libXrandr
else
DMENU_CONF_OPTS += --disable-xrandr
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
DMENU_DEPENDENCIES += xlib_libXcursor
DMENU_CONF_OPTS += --enable-xcursor
else
DMENU_CONF_OPTS += --disable-xcursor
endif

$(eval $(autotools-package))
