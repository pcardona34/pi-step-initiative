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
## standard configure and build app function
####################################################

function _build()
{

if [ -z ${APPNAME} ];then
	alert "The application is misconfigured. Aborting!"
fi

if [ -f configure ];then
        printf "Configuring...\n"
        ./configure ${CONFIG_ARGS} &>>$LOG &
        PID=$!
        spinner
        printf "\rBuilding...\n"
else
        printf "Building...\n"
fi

make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install ${INSTALL_ARGS} GNUSTEP_INSTALLATION_DOMAIN=LOCAL &>>$LOG &
#make install ${INSTALL_ARGS} GNUSTEP_INSTALLATION_DOMAIN=USER &>>$LOG &

PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

check ${APPNAME}

}

###################################################
### Building Frameworks
###################################################

function _build_FW()
{

if [ -z ${APPNAME} ];then
	alert "The Name of Framework is misconfigured. Aborting!"
fi

if [ -f configure ];then
        printf "Configuring...\n"
        ./configure ${CONFIG_ARGS} &>>$LOG &
        PID=$!
        spinner
        printf "\rBuilding...\n"
else
        printf "Building...\n"
fi

make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install ${INSTALL_ARGS} GNUSTEP_INSTALLATION_DOMAIN=LOCAL &>>$LOG &
#make install ${INSTALL_ARGS} GNUSTEP_INSTALLATION_DOMAIN=USER &>>$LOG &

PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

check_FW ${APPNAME}

}

###################################################
### Building Themes
###################################################

function _build_FW()
{

if [ -z ${APPNAME} ];then
	alert "The Name of the THEME is misconfigured. Aborting!"
fi

if [ -f configure ];then
        printf "Configuring...\n"
        ./configure ${CONFIG_ARGS} &>>$LOG &
        PID=$!
        spinner
        printf "\rBuilding...\n"
else
        printf "Building...\n"
fi

make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
#sudo -E make install ${INSTALL_ARGS} GNUSTEP_INSTALLATION_DOMAIN=LOCAL &>>$LOG &
make install ${INSTALL_ARGS} GNUSTEP_INSTALLATION_DOMAIN=USER &>>$LOG &

PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

check_THEME ${APPNAME}

}