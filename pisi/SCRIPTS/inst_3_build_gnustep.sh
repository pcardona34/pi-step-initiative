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
### Install all GNUstep libs and Tools
################################

################################
### VARS
SPIN='/-\|'
LOG="$HOME/PISI_BUILD.log"
_PWD=`pwd`
. SCRIPTS/environ.sh
### End of VARS
################################

################################
### Include functions
. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_3_build_gnustep.sh
### End of Include functions
################################

if ! [ -d ../build ];then
	mkdir ../build
fi

clear
title "Installing all GNUstep libs and Tools" | tee $LOG

install_gnustep_make
install_gnustep_base
install_gnustep_corebase
install_gnustep_gui
install_gnustep_back

sudo ldconfig

