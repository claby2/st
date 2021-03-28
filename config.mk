# st version
VERSION = 0.8.4

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

OS = $(shell uname -s)

ifeq ($(OS), Darwin)
	# x11 include and lib may be located in /opt/ on Darwin
	X11INC = /opt/X11/include
	X11LIB = /opt/X11/lib
else
	X11INC = /usr/X11R6/include
	X11LIB = /usr/X11R6/lib
	# lrt may not be supported in Darwin
	LRT = $(-lrt)
endif

PKG_CONFIG = pkg-config

# includes and libs
INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2`
LIBS = -L$(X11LIB) -lm $(LRT) -lX11 -lutil -lXft -lXrender \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2`

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)

# OpenBSD:
#CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
#LIBS = -L$(X11LIB) -lm -lX11 -lutil -lXft \
#       `$(PKG_CONFIG) --libs fontconfig` \
#       `$(PKG_CONFIG) --libs freetype2`

# compiler and linker
# CC = c99
