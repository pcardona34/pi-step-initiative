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
### Install Extra Apps...
################################

####################################################
### ENV
_PWD=`pwd`
. ./SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh
LOG="$HOME/PISI_BUILD_EXTRA.log"
SPIN='/-\|'
LOCAL_INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_LOCAL_APPS)

#################################################

################################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/check_app.sh
. SCRIPTS/size.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_6_build_extra_apps.sh
. SCRIPTS/std_build.sh

### End of Include functions
#################################################

clear
title "PISI - Extra applications"

#################################################
### Is there a Build Folder?

if ! [ -d ../build ];then
	mkdir ../build
fi

#################################################
### New LOG

echo "$0" > $LOG



#################################################
### If you do not want any app to install
### comment the relevent install script below
#################################################

install_calculator
install_ink
install_powerpaint
install_vespucci
install_stepsync
install_notebook
install_gemas
install_graphos
install_dictionaryreader
install_cenon
install_librarian
install_flexisheet
install_pikopixel
install_price
install_fontmanager

################################################

make_services
sudo ldconfig
print_size

