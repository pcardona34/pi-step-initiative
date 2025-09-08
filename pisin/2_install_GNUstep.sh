#!/bin/bash

####################################################
### P i S i N     Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

####################################################
### PISIN Desktop Prep installation of GNUstep
####################################################

####################################################
### Vars

_PWD=`pwd`
SPIN='/-\|'

### End of vars
####################################################

####################################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/environ.sh
. SCRIPTS/functions_prep.sh
. SCRIPTS/functions_inst_libdispatch.sh
. SCRIPTS/functions_inst_libobjc2.sh
. SCRIPTS/functions_inst_gnustep.sh


### End of include functions
####################################################

LOG="$HOME/PISIN_PREP_GNUSTEP.log"

clear
title "Prepare the GNUstep installation"
echo "Prepare the GNUstep installation" > $LOG

##########################################
### Install CMake 4
##########################################
install_cmake

cd $_PWD

#########################################
### Install GRAND CENTRAL DISPATCH	#
#########################################

### About
# Grand Central Dispatch (GCD or libdispatch) provides comprehensive
# support for concurrent code execution on multicore hardware.
###

#########################################
### VARS
LOG="$HOME/PISIN_BUILD_GCD.log"
#########################################
title "Grand Central Dispatch"
echo "Installing GCD..." > $LOG

if ! [ -d ../build ];then
	mkdir ../build
fi

install_libdispatch
sudo ldconfig

cd $_PWD

### Checking for GCD
GCD=/usr/local/lib/libdispatch.so

if ! [ -f $GCD ];then
	alert "The installation of Grand Central Dispatch failed."
	exit 1
else
	info "Check of Grand Central Dispatch..."
	ok "Done"
fi

#####################################
### 1st install of GNUstep Tools-Make
#####################################

##########################################
### VARS
LOG="$HOME/PISIN_BUILD_TOOLS-MAKE_01.log"
##########################################

install_gnustep_make

################################
### Install LIBOBJC2
################################

################################
### VARS
LOG="$HOME/PISIN_BUILD_OBJC2.log"
################################

title "LIBOBJC2"
echo "Installing Libobjc2..." > $LOG

testcmake
install_libobjc2
sudo ldconfig

cd $_PWD

### Ckecking for LIBOBJC2
OBJC=/usr/local/lib/libobjc.so

if ! [ -f $OBJC ];then
	alert "The installation of Objc2 failed."
	exit 1
else
	info "Check of Objc2..."
	ok "Done"

fi

################################
### Install all GNUstep libs and Tools
################################

################################
### VARS
LOG="$HOME/PISIN_BUILD_GNUstep.log"
################################

clear
title "Installing all GNUstep libs and Tools"
echo "Installing all GNUstep libs and Tools" > $LOG

###############################
### GNUstep Make: 2th install
###############################

install_gnustep_make

### Other libs...
install_gnustep_base
install_gnustep_corebase
install_gnustep_gui
install_gnustep_back

sudo ldconfig

info "GNUstep has been installed. Follow step 3 now."
