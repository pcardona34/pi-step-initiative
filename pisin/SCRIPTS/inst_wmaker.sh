#!/bin/bash

####################################################
### P i S i N    Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### WMaker and dockapps
################################

### Install Window Maker
### And some DockApps...

################################
### ENV

LOG="$HOME/PISI_BUILD_BASE_WM.log"
_PWD=`pwd`
SPIN='/-\|'
#. SCRIPTS/environ.sh
#. /usr/local/share/GNUstep/Makefiles/GNUstep.sh

### End of VARS
################################

################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_wmaker.sh

### End of Include functions
################################

################################

if ! [ -d ../build ];then
	mkdir -p ../build
fi

echo "$0" >$LOG

##############################################
## If you do not want any app to be installed
## Just comment the relevant line, below,
## save and run...
##############################################

### The DockApps must be built after wmaker and Wings libs.

install_wmaker

sudo ldconfig

###############

###############################################
### REMOVED
#install_wmifs
#install_wmclock
#install_alsamixer_dot_app
