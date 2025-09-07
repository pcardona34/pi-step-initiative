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
### Functions for Install LIBOBJC2
################################

###################################
### Install objc2
function install_libobjc2()
{
### Dependency
title "Robin Map Dev dependency"
sudo apt install -y robin-map-dev &>/dev/null &
PID=$!
spinner
ok "\rDone."

if [ -d ../build ];then
	cd ../build
else
	mkdir -p ../build && cd ../build
fi

title "Lib OBJC2"
echo "Lib OBJC2" >>$LOG

printf "Fetching...\n"
if [ -d libobjc2 ];then
	cd libobjc2
	git pull origin master &>/dev/null
else
	git clone --recurse-submodules --branch=master "https://github.com/gnustep/libobjc2" &>/dev/null
	cd libobjc2
fi

sudo rm -Rf Build
mkdir Build && cd Build
printf "Configuring...\n"
cmake .. \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_C_COMPILER=${CC} \
	-DCMAKE_CXX_COMPILER=${CXX} &>>$LOG &
PID=$!
spinner

printf "Building...\n"
make -j8 &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

sudo make clean &>/dev/null

cd $_PWD

sudo ldconfig

ok "\rDone."
}
### end of function
###########################
