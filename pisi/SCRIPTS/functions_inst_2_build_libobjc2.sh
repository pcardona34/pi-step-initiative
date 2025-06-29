#!/bin/bash

####################################################
### P i S i Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Functions for Install LIBOBJC2
################################

###################################
### Install objc2
function install_libobjc2()
{

title "Lib OBJC2" | tee -a $LOG

printf "Fetching...\n"
if [ -d libobjc2 ];then
	cd libobjc2
	git pull origin master &>/dev/null
else
	git clone --recurse-submodules --branch=master "https://github.com/gnustep/libobjc2" &>/dev/null
	cd libobjc2
fi

if [ -d build ];then
	cd build
else
	mkdir build && cd build
fi

printf "Configuring...\n"
cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo &>>$LOG
printf "Building...\n"
make clean &>/dev/null
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo make install &>>$LOG &
PID=$!
spinner

cd $_PWD
ok "\rDone."
}
### end of function
###########################
