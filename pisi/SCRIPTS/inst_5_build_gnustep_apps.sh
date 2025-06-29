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

LOG="$HOME/PISI_BUILD_BASE.log"
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
. SCRIPTS/functions_inst_5_build_gnustep_apps.sh

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

#install_systempreferences
#install_gworkspace
#install_terminal
#install_gorm
#install_PC
#install_easydiff
#install_affiche
#install_addressmanager
#install_gspdf
#install_timemon
#install_cynthiune
#install_textedit
#install_imageviewer
#install_agenda
#install_gnumail
#install_openup
#install_scanimage
#install_screenshot
#install_player
#install_innerspace
install_netsurf

make_services
sudo ldconfig

###############

### User Template

#cp_to_skel
