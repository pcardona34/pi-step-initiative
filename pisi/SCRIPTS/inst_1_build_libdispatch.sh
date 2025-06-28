#!/bin/bash

####################################################
### P i S i Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

#########################################
### Install GRAND CENTRAL DISPATCH	#
#########################################

### About
# Grand Central Dispatch (GCD or libdispatch) provides comprehensive
# support for concurrent code execution on multicore hardware.
###

#########################################
### VARS

_PWD=`pwd`
LOG="$HOME/PISI_BUILD.log"
SPIN='/-\|'

#########################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_1_build_libdispatch.sh

### End of include functions
#########################################

####################################################
### Install GCD

echo "Installing GCD..." >$LOG

if ! [ -d ../build ];then
	mkdir ../build
fi

install_libdispatch
sudo ldconfig
