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
### Install LIBOBJC2
################################

################################
### VARS

_PWD=`pwd`
LOG="$HOME/PISI_BUILD.log"
SPIN='/-\|'
. ./SCRIPTS/environ.sh

### End VARS...
################################

################################
### include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh
. SCRIPTS/functions_inst_libobjc2.sh

### End of include functions
################################

install_libobjc2
sudo ldconfig

