#!/bin/bash

####################################################
### P i S i N    Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

LOG="$HOME/ENJOY.log"
BEG=`date`
echo "Begining of Enjoy script at: $BEG" > $LOG

. SCRIPTS/colors.sh

####################################################
### Builds and launches PiSiN on well known Pi's SBC
####################################################

if [ -f $HOME/.xinitrc ];then
	warning "A script to start the X session (.xinitrc) was found in your home directory."
	info "To launch the desktop, better use:"
	cli "cd && startx"
	printf "\nDo you want to force PiSiN (re-)install? (y/n)\n"
	read REPONSE
	case $REPONSE in
		"y"|"Y") printf "\rStarting PiSiN All-in-One install script...\n" && sleep 2;;
		"n"|"N"|*) printf "\rAborting...\n" && exit 1
	esac
fi

./1_prep.sh
./2_install_GNUstep.sh
./3_install_PISIN.sh desktop
./3_install_PISIN.sh apps
./3_install_PISIN.sh extra
./3_install_PISIN.sh devel
./3_install_PISIN.sh games
./4_user_settings.sh

END=`date`
LOG="$HOME/ENJOY.log"
echo "Installation ending at: $END" >> $LOG
mv -f $LOG $HOME/Documents/

cd && startx
