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
### DRAFT
### This is not yet available
### for daily use
#####################################

### Testing new Applications: 
### Retesting broken...

################################
### ENV

LOG="$HOME/PISI_BUILD_DRAFT.log"
_PWD=`pwd`
SPIN='/-\|'
. SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh
USER_INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_USER_APPS)

### End of VARS
################################

################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/check_app.sh
. SCRIPTS/functions_inst_DRAFT.sh
. SCRIPTS/std_build.sh

### End of Include functions
################################

#################################################

clear
title "PISI - DRAFTS"

#################################################
### Is there a Build Folder?

if ! [ -d ../build ];then
	mkdir ../build
fi

#################################################
### New LOG

echo "$0" > $LOG


##################################

##############################################
## If you do not want any app to be installed
## Just comment the relevant line, below,
## save and run...
##############################################

### Apps
#install_netsurf
#install_gs-webbrowser

### Games
#install_nextgo ### Not building
#install_gshisen ### Not building


##############################################

make_services
sudo ldconfig

###############

