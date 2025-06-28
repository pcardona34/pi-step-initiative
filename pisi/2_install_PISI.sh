#!/bin/bash

####################################################
### P i S i Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

####################################################
### PISI Desktop installation main script
####################################################

####################################################
### Vars

OPTION="$1"

### End of vars
####################################################

####################################################
### Include functions

. SCRIPTS/functions_2_install_PISI.sh
. SCRIPTS/size.sh

### End of include functions
####################################################

if [ -z "$1" ];then
	OPTION="help"
fi

case "$OPTION" in
	"Base" | "base" | "BASE")
		install_base;;
	"Extra" | "extra" | "EXTRA")
		install_extra;;
	"Whole" | "whole" | "WHOLE")
		install_whole;;
	"help" | "*")
		help;;
esac

### Space available ?
print_size


