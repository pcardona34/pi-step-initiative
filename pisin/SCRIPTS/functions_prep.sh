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
### Functions for 1_prep.sh
################################

#############################################
### Sanity check
function sanity_check()
{

title "Checking your environment"

. /etc/os-release
ARCHI=`uname -a | awk '{print $10}'`
MODEL=`cat /sys/firmware/devicetree/base/model | awk '{print $3}'`

if [ "$ID" == "$REQUIRED_OS" ] && [ $VERSION_ID -eq $REQUIRED_RELEASE ] && [ "$ARCHI" == "$REQUIRED_ARCH" ] && [ "$MODEL" == "$REQUIRED_MODEL" ];then
	info "On $ID - $VERSION_ID - ${ARCHI} - Raspberry Pi ${MODEL}\nYou are welcome!\n\n"
else
	alert "PiSiN Desktop should not be installed without Debian 12.\nNor without Arm64 processor.\nIt has been conceived on and for a Raspberry Pi 400 SBC.\nAborting!\n"
	exit 1
fi
}

#############################################
### Debian update
function debian_update()
{

info "It is time to have a first cup of coffee. ;-)"

title "Updating Debian Lite OS"

printf "Updating...\n"

sudo apt update &>>$LOG &
PID=$!
spinner

sudo apt full-upgrade --yes &>>$LOG &
PID=$!
spinner

ok "\r\rDone"
}
### End of Debian update
#############################################

#############################################
### Core dependencies for GNUstep
### and Window Maker Desktop
function install_deps()
{
title "Installation of the Dependencies"
sleep 1
prefix="#"

while read DEP
do
if [ -z "$DEP" ];then
	# This line is empty...
	continue
fi
echo "$DEP" | grep -e "$prefix" &>/dev/null
if [ $? -eq 0 ];then
	# This line is commented out...
	continue
else
	printf "${DEP}... "
	sudo apt install "$DEP" --yes &>>$LOG
	if [ $? -ne 0 ];then
		alert "ERROR: this dependency: ${DEP} was not resolved.\nAborting!!!" | tee -a $LOG
		STATUS=1;break
	else
		ok " Done"
	fi
fi
done < RESOURCES/debian12_deps.txt

if [ $STATUS -ne 0 ];then
	warning "You must resolve this dependency trap.\nSee and fix RESOURCES/debian12_deps.txt\nThen execute again:\n\n\t ${0}\n\n"
	exit 1
fi
}

#############################################
### A more up to date CMAKE
function install_cmake()
{

title "A more up to date CMAKE"

_PWD=`pwd`

if ! [ -d ../build ];then
	mkdir ../build
fi
cd ../build || exit 1

if [ -f cmake-4.0.2-linux-aarch64.sh ];then
	printf "\ncmake 4 installation script has been yet downloaded.\n"
	if [ -f $HOME/.local/bin/cmake ];then
		CMAKE_VER=`$HOME/.local/bin/cmake --version`
		info "cmake 4 is installed.\n${CMAKE_VER}"
	else
		printf "The following script will install cmake.\n"
		printf "Type 'q' to exit LICENSE reading, then 'y' twice to accept the defaults.\n"
		sleep 3
		bash ./cmake-4.0.2-linux-aarch64.sh
		cd cmake-4.0.2-linux-aarch64 || exit 1
		for d in bin share
		do
			cp --recursive $d "$HOME/.local/"
		done
		cd $_PWD
	fi
else
	printf "\nfetching: CMake-4.0.2...\n"
	wget --quiet https://github.com/Kitware/CMake/releases/download/v4.0.2/cmake-4.0.2-linux-aarch64.sh
	install_cmake # recursive call
fi
}
### End of up to date CMake
#############################################
