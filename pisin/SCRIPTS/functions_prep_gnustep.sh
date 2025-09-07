#!/bin/bash

####################################################
### P i S i N    Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

####################################################
### Functions for Prep install of GNUstep
####################################################

####################################################
### Vars

_PWD=`pwd`

### End of vars
####################################################

####################################################
### Include functions

. SCRIPTS/colors.sh

### End of include functions
####################################################

####################################################
### install prep GNUstep

function install_prep_GNUstep()
{
cd $_PWD
. SCRIPTS/inst_libdispatch.sh
cd $_PWD
. SCRIPTS/inst_libojc2.sh
}
### End of prep GNUstep
####################################################


### End of functions
##############################################

