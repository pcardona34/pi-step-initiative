#!/bin/bash

####################################################
### P i S i Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

####################################################
### Install some ported or native GNUtep Games
####################################################

####################################################
### ENV
_PWD=`pwd`
. ./SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh
LOG="$HOME/PISI_BUILD_GAMES.log"
SPIN='/-\|'
INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_USER_APPS)

#################################################

################################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/check_app.sh
. SCRIPTS/size.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_games.sh
. SCRIPTS/std_build.sh

### End of Include functions
#################################################

clear
title "PISI - Games"

#################################################
### Is there a Build Folder?

if ! [ -d ../build ];then
	mkdir ../build
fi

### Is there a USER APPS Folder?

if ! [ -d $INSTALL_DIR ];then
	mkdir $INSTALL_DIR
fi

#################################################
### New LOG

echo "$0" > $LOG


##################################

install_chess
install_gomoku
install_lapis
install_freecell
install_gshisen

###################################

make_services
sudo ldconfig
print_size
