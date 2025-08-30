#!/bin/bash

####################################################
### P i S i N    Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

#####################################
### GNUstep-apps
#####################################

### Install Applications: Preferences, GWorkspace, etc
### See RELEASE for a complete list
### N.B.: Developer apps are divided into inst_devel.sh

################################
### ENV

_PWD=`pwd`
. SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh
LOG="$HOME/PISIN_BUILD_BASE.log"
SPIN='/-\|'
#INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_USER_APPS)
INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_LOCAL_APPS)

### End of VARS
################################

################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/check_app.sh
. SCRIPTS/size.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_apps.sh
. SCRIPTS/functions_inst_wrappers.sh
. SCRIPTS/std_build.sh

### End of Include functions
################################

clear
title "PiSiN - Main applications and Tools"

################################
### Is there a Build Folder?

if ! [ -d ../build ];then
	mkdir -p ../build
fi

################################
### Is there a USER APPS Folder?

if ! [ -d $INSTALL_DIR ];then
	mkdir -p $INSTALL_DIR
fi

#################################################
### New LOG

echo "$0" >$LOG

##############################################
## If you do not want any app to be installed
## Just comment the relevant line, below,
## save and run...
##############################################

install_systempreferences
install_gworkspace
install_helpviewer
install_textedit
install_openup
install_addressmanager
install_gnumail
install_grr
install_agenda
install_terminal
install_gspdf
install_imageviewer
install_cynthiune
install_player
install_librarian
install_innerspace
install_scanimage
install_screenshot
install_volumecontrol
install_ink
install_wrappers

##################
### Removed
#install_affiche
#install_timemon
##################

make_services
sudo ldconfig
print_size
