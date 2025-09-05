#!/bin/bash

####################################################
### P i S i N     Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

####################################################
### PISIN Desktop Prep installation of GNUstep
####################################################

####################################################
### Vars

_PWD=`pwd`
SPIN='/-\|'
LOG="$HOME/PISIN_PREP_GNUSTEP.log"

### End of vars
####################################################

####################################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/environ.sh
. SCRIPTS/functions_prep.sh
. SCRIPTS/functions_prep_gnustep.sh

### End of include functions
####################################################

clear
title "Prepare the GNUstep installation"

install_cmake

### Check CMake
which ~/.local/bin/cmake &>/dev/null
if [ $? -eq 0 ];then
	# New version of cmake has been installed
	# Must be sure to have an updated PATH
	echo $PATH | grep -e ".local/bin" &>/dev/null
	if ! [ $? -eq 0 ];then
		. ~/.profile
	fi
else
	printf "The new Cmake release has not been correctly installed.\n"
	printf "Run again $0 and answer y/Y for every question.\n"

fi

cd $_PWD

### Install GCD and Libobjc2
install_prep_GNUstep
cd $_PWD

### Checking for GCD
GCD=/usr/local/lib/libdispatch.so
if ! [ -f $GCD ];then
	alert "The installation of Grand Central Dispatch failed."
	exit 1
else
	info "Check of Grand Central Dispatch..."
	ok "Done"
fi

OBJC=/usr/local/lib/libobjc.so
if ! [ -f $OBJC ];then
	alert "The installation of Objc2 failed."
	exit 1
else
	info "Check of Objc2..."
	ok "Done"

fi

### Install GNUstep: Base, etc
. SCRIPTS/inst_gnustep.sh

info "GNUstep has been installed. You may follow step 3 now."
