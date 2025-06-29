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
### Functions for PiSi - DRAFT - GNUstep apps
####################################################

######################################
## NetSurf-GNUstep
### 3.10
######################################

function install_netsurf
{

APPNAME=Netsurf
RELEASE="3.10"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

#### TO BE DONE AGAIN... ####
#### See the issue ####




printf "Fetching...\n"
if [ -d netsurf-gnustep ];then
        cd netsurf-gnustep
        git pull origin master &>/dev/null
else
        git clone https://github.com/anthonyc-r/netsurf-gnustep.git &>/dev/null
        cd netsurf-gnustep
fi

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"
}
### End of NetSurf
##############################################
