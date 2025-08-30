#!/bin/bash

####################################################
### P i S i N    Updater - by Patrick Cardona
### pcardona34 @ Github
###
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Updater
################################

################################
### VARS

SPIN='/-\|'

if [ $# -eq 1 ];then
	ARG="$1"
else
	ARG="-h"
fi

###############################################
### Importe des fonctions
###############################################
. $HOME/.local/bin/colors.sh
. $HOME/.local/bin/spinner.sh

###############################################
### Clean: remove the lock file
###############################################
function clean()
{
if [ -f $HOME/.Updater ];then
	rm $HOME/.Updater
fi
}
### End of clean

###################################################
### Update: check packages to update
###################################################

function update()
{
TMPFILE=$(mktemp /tmp/pisi-XXXXX)
trap "rm -f $TMPFILE" EXIT
PREFIX=$(echo ${LANG%.UTF-8} | awk -F'_' '{print $1}')
DELAY=30 # seconds
case $PREFIX in
	"fr")
	TITLE="Mise à jour du Système"
	MSG="nouveaux paquets sont disponibles.";;
	"en" | *)
	TITLE="Debian Updater"
	MSG="new packages are available.";;
esac

### Get info from Debian apt update
sleep $DELAY
sudo apt update &>>$TMPFILE

### Search if upgradable packages exists
NB=$(grep -e "upgradable" $TMPFILE | awk '{print $1}') || NB=0
if [ $NB ];then
	dunstify -u critical "$TITLE" "$NB $MSG"
#	echo "$NB $MSG" > $HOME/.Updater
else
	clean
fi
}
### End of update

function upgrade()
{
title "Upgrading the packages..."
sudo apt full-upgrade -y &>/dev/null &
PID=$!
spinner
clean
ok "\rDone"
}
### End of upgrade

function myhelp()
{
#clear
printf "PiSiN Updater Syntax:\n"
printf "$0 <OPTION>\n\n"
printf "Options:\n"
printf "\t--update | -d\t\tUpdate the Database of the packages.\n"
printf "\t--upgrade | -g\t\tUpgrade the Debian packages.\n"
printf "\t--help | -h\t\tPrint this help.\n\n"
}
### End of help

######################################

case "$ARG" in
	"--update"|"-d")
	update;;
	"--upgrade"|"-g")
	upgrade;;
	"*")
	myhelp;;
esac

