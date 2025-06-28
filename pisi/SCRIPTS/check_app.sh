#!/bin/bash

####################################################
### P i S i Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

. SCRIPTS/colors.sh

#########################################
### Check if the app is ok
### $1: the name of the installed App.
#########################################
function check()
{
__PWD=`pwd`
GNUSTEP_APPS_DIR=/usr/local/lib/GNUstep/Applications
ISSUES=https://github.com/pcardona34/pi-step-initiative/issues

if [ -n "$1" ];then
	APP="$1"
else
	alert "The APP name is empty."
	printf "Use:"
	cli "$0 <APP_NAME>"
	exit 1
fi

cd $GNUSTEP_APPS_DIR || exit 1
if [ -d "${APP}" ] || [ -d "${APP}.app" ];then
	info "The application ${APP} has been found: ok."
else
	alert "ERROR! The application ${APP} was not found in ${GNUSTEP_APPS_DIR}.\nPlease, report this issue at:\n${ISSUES}"
	exit 1
fi
}

### Test
### check "Affiche"
