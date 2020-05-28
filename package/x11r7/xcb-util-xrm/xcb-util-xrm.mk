################################################################################
#
# xcb-util-wm
#
################################################################################

XCB_UTIL_XRM_VERSION = 1.3
XCB_UTIL_XRM_SITE = https://github.com/Airblader/xcb-util-xrm/releases/download/v1.3
XCB_UTIL_XRM_SOURCE = xcb-util-xrm-1.3.tar.bz2  
XCB_UTIL_XRM_INSTALL_STAGING = YES
XCB_UTIL_XRM_LICENSE = MIT
XCB_UTIL_XRM_LICENSE_FILES = COPYING
XCB_UTIL_XRM_DEPENDENCIES = libxcb

$(eval $(autotools-package))
