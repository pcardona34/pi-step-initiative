#!/bin/bash

####################################################
### P i S i Updater - by Patrick Cardona
### pcardona34 @ Github
###
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Install the Compton conf file
### herited from Deconinck
################################

################################
### VARS

AUTO=$HOME/GNUstep/Library/WindowMaker/autostart
HOME_DIR_CONF=$HOME/.config

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

### Is Compton there?
apt search compton &>/dev/null
if [ $? -ne 0 ];then
	printf "Installing the dependency: compton...\n"
	sudo apt install compton --yes &>/dev/null &
	PID=$!
	spinner
	printf "\r"
fi

if [ ! -d $HOME_DIR_CONF ];then
	mkdir -p "${HOME_DIR_CONF}"
fi

cp CONFIG/compton.conf $HOME_DIR_CONF/

grep -e "compton" $AUTO &>/dev/null
if [ $? -eq 0 ];then
	printf "\nAlready set in $AUTO\n"
else
	echo "pgrep compton || compton -b" >> $AUTO
fi

printf "\nCompton has been set.\n"
