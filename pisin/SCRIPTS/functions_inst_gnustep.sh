#!/bin/bash

####################################################
### P i S i N    Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Install all GNUstep libs and Tools
################################

####################################
### Install GNUstep MAKE TOOLS
function install_gnustep_make()
{

title "1 - GNUstep Make Tools"

cd ../build || exit 1

printf "Fetching...\n"
if [ -d tools-make ];then
	cd tools-make
	git pull origin master &>/dev/null
else
	git clone --branch=master "https://github.com/gnustep/tools-make" &>/dev/null
	cd tools-make
fi

printf "Configuring...\n"
./configure \
	--with-layout=fhs \
	--enable-native-objc-exceptions \
	--enable-objc-arc \
	--enable-install-ld-so-conf \
	--enable-debug-by-default &>>$LOG &
PID=$!
spinner

printf "\rBuilding and installing...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
sudo make clean &>/dev/null

ok "\rDone"
cd $_PWD
}

################################################
### Install GNUstep BASE

function install_gnustep_base()
{

. /usr/local/share/GNUstep/Makefiles/GNUstep.sh
cd ../build || exit 1

title "2 - GNUstep BASE"

printf "Fetching...\n"
if [ -d libs-base ];then
	cd libs-base
	git pull origin master &>/dev/null
else
	git clone --branch=master "https://github.com/gnustep/libs-base" &>/dev/null
	cd libs-base
fi

printf "Configuring...\n"
./configure &>>$LOG &
PID=$!
spinner

printf "\rBuilding and installing...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
sudo make clean &>/dev/null

ok "\rDone"
cd $_PWD
}

########################################
### Install GNUstep COREBASE

function install_gnustep_corebase()
{

. /usr/local/share/GNUstep/Makefiles/GNUstep.sh

cd ../build || exit 1

title "3 - GNUstep COREBASE"

printf "Fetching...\n"
if [ -d libs-corebase ];then
	cd libs-corebase
	git pull origin master &>/dev/null
else
	git clone --branch=master "https://github.com/gnustep/libs-corebase" &>/dev/null
	cd libs-corebase
fi

printf "Configuring...\n"
./configure &>>$LOG &
PID=$!
spinner

printf "\rBuilding and installing...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"
cd $_PWD
}

###########################################
### Install GNUstep GUI

function install_gnustep_gui()
{

. /usr/local/share/GNUstep/Makefiles/GNUstep.sh

cd ../build || exit 1

title "4 - GNUstep GUI"

printf "Fetching...\n"
if [ -d libs-gui ];then
	cd libs-gui
	git pull origin master &>/dev/null
else
	git clone --branch=master "https://github.com/gnustep/libs-gui" &>/dev/null
	cd libs-gui
fi

printf "Configuring...\n"
./configure &>>$LOG &
PID=$!
spinner

printf "\rBuilding and installing...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"
cd $_PWD
}

#######################################
### Install GNUstep BACK

function install_gnustep_back()
{

. /usr/local/share/GNUstep/Makefiles/GNUstep.sh

cd ../build || exit 1

title "5 - GNUstep BACK"

printf "Fetching...\n"
if [ -d libs-back ];then
	cd libs-back
	git pull origin master &>/dev/null
else
	git clone --branch=master "https://github.com/gnustep/libs-back" &>/dev/null
	cd libs-gui
fi

printf "Configuring...\n"
./configure &>>$LOG &
PID=$!
spinner

printf "\rBuilding...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
sudo make clean &>/dev/null
ok "\rDone"
cd $_PWD
}
### Enf of functions
########################################
