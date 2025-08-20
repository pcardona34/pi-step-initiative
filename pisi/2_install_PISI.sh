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
### PISI Desktop Main installation Script
####################################################

####################################################
### Vars

OPTION="$1"

### End of vars
####################################################

####################################################
### Include functions

. SCRIPTS/functions_install_PISI.sh
. SCRIPTS/size.sh

### End of include functions
####################################################

if [ -z "$1" ];then
	OPTION="help"
fi

case "$OPTION" in
	"DESKTOP" | "Desktop" | "desktop")
		install_desktop;;
	"APPS" | "Apps" | "apps")
		install_apps;;
	"DEVEL" | "Devel" | "devel")
		install_devel;;
	"EXTRA" | "Extra" | "extra")
		install_extra;;
	"GAMES" | "Games" | "games")
		install_games;;
	"help" | "*")
		help;;
esac

### Space available ?
print_size


