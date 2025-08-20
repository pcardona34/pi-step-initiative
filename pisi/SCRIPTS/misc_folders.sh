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
### Miscellaneous for Home Folders
################################

################################
### ENV

LOG="$HOME/PISI_MISC_FOLDERS.log"
_PWD=`pwd`
SPIN='/-\|'

### End of VARS
################################

################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_misc_folders.sh

### End of Include functions
################################

################################

echo "$0" >$LOG

###############################################
misc_folder_GNUstep
misc_folder_Mailboxes
misc_folder_Signets
misc_folder_SOURCES
