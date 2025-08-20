#!/bin/bash

####################################################
### P i S i Updater - by Patrick Cardona
### pcardona34 @ Github
###
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Install the Updater Tool
################################

################################
### VARS

AUTO=$HOME/GNUstep/Library/WindowMaker/autostart
HOME_DIR_BIN=$HOME/.local/bin

#################################
### FUNCTIONS

#############################################
### Spinner
#############################################
### Howto
### To use this function, you need to set
### some vars in the caller script:
### global: SPIN='/-\|'
### before any call: put the long process to bg
### with '&' and then set PID=$!
#############################################
function spinner()
{
i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.2
	printf "\b${SPIN:i++%${#SPIN}:1}"
done
}
### End of Spinner
#############################################

###########################
### Title (yellow-orange)
### $1: title text
function title()
{
printf "\n \033[22;33m=== $1 ===\033[0m \n\n"
}

##########################
### Alert (red)
### $1: message
function alert()
{
printf "\n \033[22;31m=== Alert! ===\033[0m \n"
printf "\033[22;31m [E] ${1} \033[0m \n\n"
}

##########################
### Warning (magenta)
### $1: message
function warning()
{
printf "\n \033[22;35m=== Warning! ===\033[0m \n"
printf "\033[22;35m /!\ ${1} \033[0m \n\n"
}


##########################
### Info (cyan)
### $1: message
function info()
{
printf "\n \033[22;36m=== Info ===\033[0m \n"
printf "\033[22;36m (i) ${1} \033[0m \n\n"
}

##########################
### cli (cyan)
### $1: commande
function cli()
{
printf "\n\t\033[22;36m ${1} \033[0m \n\n"
}


###########################
### ok (green)
function ok()
{
printf "\033[22;32m${1}\033[0m.\n"
}
#########################

### END OF FUNCTIONS
##################################

### Is Dunst there?
apt search dunst &>/dev/null
if [ $? -ne 0 ];then
	printf "Installing the dependency: dunst...\n"
	sudo apt install dunst --yes &>/dev/null &
	PID=$!
	spinner
	printf "\r"
fi

if ! [ -d $HOME_DIR_BIN ];then
	mkdir -p "$HOME_DIR_BIN"
fi

cp SCRIPTS/Updater.sh $HOME_DIR_BIN/

###  Copy of dunstrc
DUNSTRC=$HOME/.config/dunst
if ! [ -d $DUNSTRC ];then
	mkdir -p $DUNSTRC
fi
cp CONFIG/_dunstrc $DUNSTRC/dunstrc

grep -e "Updater.sh" $AUTO &>/dev/null
if [ $? -eq 0 ];then
	printf "\nAlready set in $AUTO\n"
else
	echo "sleep 30 && $HOME_DIR_BIN/Updater.sh -d &" >> $AUTO
fi

printf "\nPisi_Updater has been set.\n"
