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
### Frameworks
################################

################################
### VARS

LOG=$HOME/PISIN_BUILD_FW.log
_PWD=`pwd`
SPIN='/-\|'
. ./SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh
INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_LOCAL_LIBRARY)

################################
### Include functions

. SCRIPTS/colors.sh
. SCRPTS/spinner.sh
. SCRIPTS/std_build.sh
. SCRIPTS/functions_inst_frameworks.sh

### End of Include functions
################################

if ! [ -d ../build ];then
	mkdir ../build
fi

if ! [ -d $INSTALL_DIR ];then
	sudo mkdir INSTALL_DIR
fi

clear
title "Frameworks"
echo "Frameworks" > $LOG

install_pdfkit
install_fw_addresses
install_fw_addressview
install_pantomime
install_SWK
install_rsskit
install_hlkit
install_hkthemes
install_renaissance
install_performance
install_webservices
install_steptalk

####################################
### Removed: not building...

# install_dbuskit
####################################

sudo ldconfig
make_services &>>$LOG

info "All is done for the Frameworks." | tee -a $LOG
sleep 2


