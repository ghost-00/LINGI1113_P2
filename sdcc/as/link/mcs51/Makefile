#
#
#

VERSION         = 2.9.4
VERSIONHI       = 2
VERSIONLO       = 9
VERSIONP        = 4

SHELL           = /bin/sh
CC              = gcc
CPP             = gcc -E
INSTALL         = /usr/bin/install -c
STRIP           = strip

top_builddir    = ../../..
top_srcdir      = ../../..

srcdir          = .
prefix          = /usr/local
exec_prefix     = ${prefix}
bindir          = ${exec_prefix}/bin
libdir          = ${exec_prefix}/lib
datadir         = ${datarootdir}
datarootdir     = ${prefix}/share
includedir      = ${prefix}/include
mandir          = ${datarootdir}/man
man1dir         = $(mandir)/man1
man2dir         = $(mandir)/man2
infodir         = @info@

EXEEXT          = 



CPPFLAGS        =  -I.. -I$(srcdir)/..
CFLAGS          = -pipe -ggdb -g -O2 -Wall -DINDEXLIB -DUNIX -I.. -I$(srcdir)/..
M_OR_MM         = -MM
LDFLAGS         = 

OBJDIR = obj

ASXXLIB = $(srcdir)/../../asxxsrc

LKLIB = $(srcdir)/..

ASXXLIBSRC = strcmpi.c

LKLIBSRC = lk_readnl.c lkaomf51.c lkar.c lkdata.c lkelf.c lkeval.c \
           lkgb.c lkhead.c lklex.c lklib.c lklibr.c lklist.c lkmain.c \
           lkmem.c lknoice.c lkrel.c lkrloc.c lks19.c lksdcclib.c \
           lksym.c sdld.c

SRC = lkarea.c lkihx.c

LKSOURCES = $(SRC) $(LKLIBSRC:%.c=$(LKLIB)/%.c) $(ASXXLIBSRC:%.c=$(ASXXLIB)/%.c)

OBJS = $(SRC:%.c=$(OBJDIR)/%.o)
LKOBJS = $(LKLIBSRC:%.c=$(OBJDIR)/%.o)
ASXXLIBOBJS = $(ASXXLIBSRC:%.c=$(OBJDIR)/%.o)
LKOBJECTS = $(OBJS) $(LKOBJS) $(ASXXLIBOBJS)

ASLINK          = $(top_builddir)/bin/sdld$(EXEEXT)

transform       = s,x,x,

# Compiling entire program or any subproject
# ------------------------------------------
all: checkconf $(ASLINK)

$(ASLINK): $(LKOBJECTS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(LKOBJECTS)

# Compiling and installing everything and running test
# ----------------------------------------------------
install: all installdirs
	$(INSTALL) $(ASLINK) `echo $(DESTDIR)$(bindir)/sdld$(EXEEXT)|sed '$(transform)'`
	$(STRIP) `echo $(DESTDIR)$(bindir)/sdld$(EXEEXT)|sed '$(transform)'`

# Deleting all the installed files
# --------------------------------
uninstall:
	rm -f $(DESTDIR)$(bindir)/sdld$(EXEEXT)


# Performing self-test
# --------------------
check:


# Performing installation test
# ----------------------------
installcheck:


# Creating installation directories
# ---------------------------------
installdirs:
	$(INSTALL) -d $(DESTDIR)$(bindir)


# Creating dependencies
# ---------------------
dep: Makefile.dep

Makefile.dep: $(LKSOURCES) $(LKLIB)/*.h $(top_builddir)/*.h
	$(CPP) $(CPPFLAGS) $(M_OR_MM) $(filter %.c,$^) >Makefile.dep

ifeq "$(findstring $(MAKECMDGOALS),uninstall check installcheck installdirs \
                                   clean distclean mostlyclean realclean)" ""
  -include Makefile.dep
endif
include $(srcdir)/clean.mk

# My rules
# --------
$(OBJDIR)/.stamp:
	mkdir -p $(OBJDIR)
	touch $(OBJDIR)/.stamp

$(OBJDIR)/%.o: %.c $(OBJDIR)/.stamp
	$(CC) -c $(CFLAGS) -o $@ $<

$(OBJDIR)/%.o: $(LKLIB)/%.c $(OBJDIR)/.stamp
	$(CC) -c $(CFLAGS) -o $@ $<

$(OBJDIR)/%.o: $(ASXXLIB)/%.c $(OBJDIR)/.stamp
	$(CC) -c $(CFLAGS) -o $@ $<


# Remaking configuration
# ----------------------
checkconf:
	@if [ -f $(top_builddir)/devel ]; then\
          $(MAKE) -f conf.mk srcdir="$(srcdir)" top_builddir="$(top_builddir)" freshconf;\
        fi

# End of Makefile
