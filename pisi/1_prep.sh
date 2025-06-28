#!/bin/bash

####################################################
### P i S i Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Sanity check, update, deps...
################################

###############################################################
### Vars
LOG="$HOME/PISI_DEPS.log"
SPIN='/-\|'
STATUS=0
CONF=RESOURCES/PISI.conf
REQUIRED_OS=`grep -e "OS" $CONF | awk -F= '{print $2}'`
REQUIRED_RELEASE=`grep -e "REL" $CONF | awk -F= '{print $2}'`
REQUIRED_ARCH=`grep -e "ARCH" $CONF | awk -F= '{print $2}'`
REQUIRED_MODEL=`grep -e "MOD" $CONF | awk -F= '{print $2}'`
### End of Vars
###############################################################

###############################################################
### include functions
. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/size.sh
. SCRIPTS/functions_1_prep.sh
### end of include functions
###############################################################

### Here it really begins...

echo "Pi STEP Initiative Desktop: dependencies log" >>$LOG

clear
title "Pi STEP Initiative Desktop"

sleep 1

#########################

sanity_check
debian_update
install_deps
install_cmake

sudo ldconfig

########################

info "All the dependencies have been fetched and installed.\nYou may go on with step 2."
print_size

