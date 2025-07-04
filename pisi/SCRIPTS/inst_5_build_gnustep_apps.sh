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
### PiSi Desktop Base: GNUstep-apps
#####################################

### Install Applications: Preferences, GWorkspace, etc
### See RELEASE for a complete list
### Install Developer apps

################################
### ENV

_PWD=`pwd`
. SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh
LOG="$HOME/PISI_BUILD_BASE.log"
SPIN='/-\|'
LOCAL_INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_LOCAL_APPS)

### End of VARS
################################

################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/check_app.sh
. SCRIPTS/size.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_5_build_gnustep_apps.sh
. SCRIPTS/std_build.sh

### End of Include functions
################################

clear
title "PISI - Main applications and Tools"

################################
### Is there a Build Folder?

if ! [ -d ../build ];then
	mkdir -p ../build
fi

#################################################
### New LOG

echo "$0" >$LOG

##############################################
## If you do not want any app to be installed
## Just comment the relevant line, below,
## save and run...
##############################################

install_innerspace
make_services
sudo ldconfig
exit

install_systempreferences
install_gworkspace
install_terminal
install_gorm
install_PC
install_easydiff
install_affiche
install_addressmanager
install_gspdf
install_timemon
install_cynthiune
install_textedit
install_imageviewer
install_agenda
install_gnumail
install_openup
install_scanimage
install_screenshot
install_player


install_helpviewer

make_services
sudo ldconfig
print_size

###############

### User Template

cp_to_skel
