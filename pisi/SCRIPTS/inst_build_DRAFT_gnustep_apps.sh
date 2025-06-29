#!/bin/bash

####################################################
### P i S i Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

#####################################
### PiSi Desktop : DRAFT
### This is not yet available
### for daily use
#####################################

### Install Applications: 
### New, broken...

################################
### ENV

LOG="$HOME/PISI_BUILD_DRAFT.log"
_PWD=`pwd`
SPIN='/-\|'
. SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh

### End of VARS
################################

################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_DRAFT_gnustep_apps.sh

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

#install_netsurf

##############################################

make_services
sudo ldconfig

###############

