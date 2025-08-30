#!/bin/bash

####################################################
### P i S i N    Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

#####################################
### Install Developer Applications
#####################################

################################
### ENV

_PWD=`pwd`
. SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh
LOG="$HOME/PISIN_BUILD_BASE.log"
SPIN='/-\|'
INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_LOCAL_APPS)

### End of VARS
################################

################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/check_app.sh
. SCRIPTS/size.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_devel.sh
. SCRIPTS/std_build.sh

### End of Include functions
################################

clear
title "PiSiN - Devel applications and Tools"

################################
### Is there a Build Folder?

if ! [ -d ../build ];then
	mkdir -p ../build
fi

################################
### Is there an APPS Folder?

if ! [ -d $INSTALL_DIR ];then
	mkdir -p $INSTALL_DIR
fi

#################################################
### New LOG

echo "$0" >$LOG

##############################################
## If you do not want any app to be installed
## Just comment the relevant line, below,
## save and run...
##############################################

install_gorm
install_PC
install_easydiff
install_gemas
install_thematic

make_services
sudo ldconfig
print_size

###############
