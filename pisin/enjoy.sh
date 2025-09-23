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
### VARS
LOGENJ="$HOME/ENJOY.log"
IS_OK=0
### LITE=0 means full install - LITE=1 means lite install: only basic apps
LITE=0
#LITE=1
_PWD=`pwd`
PISIN=${_PWD}
####################################################
### Functions

. SCRIPTS/colors.sh
. SCRIPTS/functions_prep.sh

####################################################

### Abort script if EXIT is not 0
set -e

####################################################
### Builds and launches PiSiN on well known Pi's SBC
####################################################

clear

if [ -f $HOME/.xinitrc ];then
	warning "A script to start the X session (.xinitrc) was found in your home directory."
	info "To launch the desktop, better use:"
	cli "cd && startx"
	printf "\nDo you want to force PiSiN (re-)install?\n"
	read -p "(y/n): " -s REPONSE
	case $REPONSE in
		"y"|"Y") printf "\nStarting PiSiN All-in-One install script...\n" && sleep 2;;
		"n"|"N"|*) printf "\nAborting...\n" && exit 1
	esac
fi

####################################################
### Timer (1)
BEG=`date`
echo "PiSiN: Begining of script $0 at: $BEG" > $LOGENJ

####################################################
### Install steps
####################################################

./1_prep.sh || exit 1

cd ${PISIN}
./2_install_wmaker.sh || exit 1

cd ${PISIN}
./3_install_gnustep.sh || exit 1

cd ${PISIN}
./4_install_frameworks.sh || exit 1

cd ${PISIN}
./5_install_PISIN.sh apps || exit 1

if [ ${LITE} -eq 0 ];then
	cd ${PISIN}
	./5_install_PISIN.sh extra
	cd ${PISIN}
	./5_install_PISIN.sh devel
	cd ${PISIN}
	./5_install_PISIN.sh games
fi
cd ${PISIN}
./6_user_settings.sh

##################################################
### Timer (2)
END=`date`
echo "PiSiN: End of script $0 at: $END" >> $LOGENJ

cd

### Cleaner
if [ -d $HOME/Documents ];then
	mv --force *.log $HOME/Documents/
fi

startx || exit 1

exit
