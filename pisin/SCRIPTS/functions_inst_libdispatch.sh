#!/bin/bash

####################################################
### P i S i N    Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### Thanks for the GNUstep Developers Community
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

#################################################
### Funtions for Install GRAND CENTRAL DISPATCH	 #
#################################################

####################################################
### Install GCD
function install_libdispatch()
{

cd ../build || exit 1

title "Lib DISPATCH - Grand Central Dispatch"
printf "Fetching...\n"

if [ -d swift-corelibs-libdispatch ];then
	cd swift-corelibs-libdispatch
	git pull origin main &>/dev/null
else
	git clone --branch=main "https://github.com/apple/swift-corelibs-libdispatch" &>/dev/null
	cd swift-corelibs-libdispatch
fi

if [ -d build ];then
	cd build
else
	mkdir build && cd build
fi

printf "Configuring...\n"
cmake .. \
    -DCMAKE_C_COMPILER=${CC} \
    -DCMAKE_CXX_COMPILER=${CXX} \
    -DINSTALL_PRIVATE_HEADERS=YES \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Debug &>>$LOG &
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

cd $_PWD
ok "\rDone"

}
### End of function
################################


