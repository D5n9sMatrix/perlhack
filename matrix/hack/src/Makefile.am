## Process this file with automake to produce Makefile.in

## Created by Anjuta

AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\" \
	$(HACK_CFLAGS)

AM_CFLAGS =\
	 -Wall\
	 -g

bin_PROGRAMS = hack

hack_SOURCES = \
	main.cc

hack_LDFLAGS = 

hack_LDADD = $(HACK_LIBS)


if NATIVE_WIN32
hack_LDFLAGS += -mwindows
endif
