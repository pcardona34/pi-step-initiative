#!/bin/bash

####################################################
### P i S i N     Desktop - by Patrick Cardona
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
PISIN=`pwd`
LOG="$HOME/PISIN_DEPS.log"
SPIN='/-\|'
STATUS=0
CONF=RESOURCES/PISIN.conf
REQUIRED_OS=`grep -e "OS" $CONF | awk -F= '{print $2}'`
REQUIRED_RELEASE=`grep -e "REL" $CONF | awk -F= '{print $2}'`
REQUIRED_ARCH=`grep -e "ARCH" $CONF | awk -F= '{print $2}'`
REQUIRED_MODEL=`grep -e "MODEL" $CONF | awk -F= '{print $2}'`
### End of Vars
###############################################################

###############################################################
### include functions
. /etc/os-release
. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/size.sh
. SCRIPTS/functions_prep.sh
### end of include functions
###############################################################

### Here it really begins...

echo "Pi STEP Initiative Desktop: init log" >>$LOG

clear
title "Pi STEP Initiative Desktop"

sleep 1

#########################

#not_again || exit 1
sanity_check || exit 1
debian_update || exit 1
sudo apt autoremove -y &>/dev/null

LIST="build" && install_deps

sudo ldconfig

########################

info "The System is up to date.\nYou may go on with step 2."
print_size
sleep 3

cd
