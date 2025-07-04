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

check "$APPNAME"
}
### End of NetSurf
##############################################



###############################################
### gs-webbrowser
function install_gs-webbrowser()
{
APPNAME=WebBrowser
REL="0.1"

cd ../build || exit 1

title "$APPNAME" | tee -a $LOG

printf "Fetching...\n"
if [ -d gs-webbrowser ];then
	cd gs-webbrowser
	git pull origin main &>/dev/null
else
	git clone https://github.com/onflapp/gs-webbrowser.git &>/dev/null
	cd gs-webbrowser
fi

printf "Building...\n"
make

printf "Installing...\n"
sudo make install

### Cleaning
make clean &>/dev/null

ok "Done"

cd $_PWD

check ${APPNAME}
}
### End of gs-webbrowser
################################################


#################################################
############ GAMES ##############################
#################################################

########################################
## NeXTGo
### Repo/Release: github/gnustep/gap: ?
########################################

function install_nextgo()
{

APPNAME="NeXTGo"
REL="3.0"

echo "$APPNAME $REL" >>$LOG
title "$APPNAME $REL"

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gap ];then
        cd gap
        git pull origin master &>/dev/null
else
        git clone https://github.com/gnustep/gap.git &>/dev/null
        cd gap
fi

cd ported-apps/Games/NeXTGo

_build
}

######################################
## GShisen
### Repo/Release: savannah/gap: 1.3.0
######################################

function install_gshisen(){

APPNAME="GShisen"
REL="1.3.0"

echo "$APPNAME $REL" >>$LOG
title "$APPNAME $REL"

cd ../build || exit 1

printf "Fetching...\n"
if [ -d GShisen-1.3.0 ];then
	cd GShisen-1.3.0
else
	wget --quiet http://mirror.netcologne.de/savannah/gap/GShisen-1.3.0.tar.gz
	gunzip --force GShisen-1.3.0.tar.gz
	tar -xf GShisen-1.3.0.tar
	cd GShisen-1.3.0
fi

_build
}


