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
### test of CMake release
################################

. SCRIPTS/colors.sh

function testme()
{
CMV=`cmake --version | grep -e "version"`
MAJOR=`echo $CMV | awk '{print $3}' | awk -F. '{print $1}'`
if [ $MAJOR -eq 4 ];then
	info "Cmake version is now ok."
else
	warning "Cmake version seems not good. \nMaybe a PATH issue?"
	sleep 1
	echo $PATH | grep -e ".local/bin" &>/dev/null
	if ! [ $? -eq 0 ];then
		export PATH=$HOME/.local/bin:$PATH
		### recursive call
		testme
	else
		alert "Cmake version could not been solved. Aborting. Please report this issue."
		exit 1
	fi

fi
}

testme
