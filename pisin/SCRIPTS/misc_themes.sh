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
### Miscellaneous for Themes
################################

################################
### ENV

LOG="$HOME/PISI_MISC_THEMES.log"
LOCAL_INSTALL_DIR=$(gnustep-config --variable=GNUSTEP_LOCAL_APPS)
_PWD=`pwd`
SPIN='/-\|'

### End of VARS
################################

################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_misc_themes.sh

### End of Include functions
################################

################################

echo "$0" >$LOG

###############################################

update_info
