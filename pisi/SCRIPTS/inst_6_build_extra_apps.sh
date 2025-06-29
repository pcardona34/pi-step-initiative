#!/bin/bash

# PiSi Desktop
### Install more Applications and Tools...

### ENV
_PWD=`pwd`
. ./SCRIPTS/environ.sh
. /usr/local/share/GNUstep/Makefiles/GNUstep.sh

APPLICATIONS=/usr/local/lib/GNUstep/Applications
if ! [ -d $APPLICATIONS ];then
	printf "The Applications Folder is not found.\nYou must correct this path in ${0}.\n"
	exit 1
fi

if ! [ -d ../build ];then
	mkdir ../build
fi

LOG="$HOME/PISI_BUILD.log"
SPIN='/-\|'

echo "$0" > $LOG



##################################
## TEMPLATES			##
##################################

##########################
## Template: for git...
##########################

function install_foo()
{

cd ../build || exit 1

APPNAME="foo"
REPO="gap"
OWNER="gnustep"
HUB="https://github.com"
BRANCH="master"
BUILD_DIR="user-apps" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
	make clean &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################
echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

################################
## Template for: get method
################################

function install_bar()
{
cd ../build || exit 1

APPNAME="bar"
RELEASE="1.0.0"
EXT=".tar.gz"
HUB=http://savannah.nongnu.org/download/gap
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d ${APPNAME}-${RELEASE} ];then
	cd ${APPNAME}-${RELEASE}
	make clean &>/dev/null
else
	wget --quiet ${HUB}/${APPNAME}-${RELEASE}${EXT}
	gunzip ${HUB}/${APPNAME}-${RELEASE}${EXT}
	tar -xf ${APPNAME}-${RELEASE}.tar
	cd ${APPNAME}-${RELEASE}
fi

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

##################################
## END OF TEMPLATES		##
##################################

######################################
## BELOW BEGINS THE INST. FUNCTIONS ##
######################################

################################################
## GNUstep Examples: Ink, Calculator,PowerPaint
### Repo/Release: github/gnustep/tests-examples
################################################

##########################
## Calculator
##########################

function install_calculator()
{

cd ../build || exit 1

APPNAME="Calculator"
REPO="tests-examples"
OWNER="gnustep"
HUB="https://github.com"
BRANCH="master"
BUILD_DIR="gui" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

##########################
## Ink
##########################

function install_ink()
{

cd ../build || exit 1

APPNAME="Ink"
REPO="tests-examples"
OWNER="gnustep"
HUB="https://github.com"
BRANCH="master"
BUILD_DIR="gui" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} | tee -a $LOG &> /dev/null
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

##########################
## PowerPaint
##########################

function install_powerpaint()
{

cd ../build || exit 1

APPNAME="PowerPaint"
REPO="tests-examples"
OWNER="gnustep"
HUB="https://github.com"
BRANCH="master"
BUILD_DIR="gui" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"


if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install | &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

###################################################
## Vespucci: GNUstep WebBrowser with SimpleWebKit
### Repo/Release: github/gnustep/gap: 0.1
###################################################

function install_vespucci()
{

cd ../build || exit 1

APPNAME="Vespucci"
REPO="gap"
OWNER="gnustep"
HUB="https://github.com"
BRANCH="master"
BUILD_DIR="user-apps" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

############################################
## StepSync
### Repo/Release: github/gnustep/gap: 0.1
############################################

function install_stepsync()
{
cd ../build || exit 1

APPNAME="StepSync"
REPO="gap"
OWNER="gnustep"
HUB="https://github.com"
BRANCH="master"
BUILD_DIR="system-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

###########################################################
## NoteBook
### Repo/Release: github/pcardona34/gnustep-notebook: 0.3
###########################################################

function install_notebook()
{

cd ../build || exit 1

APPNAME="NoteBook"
REPO="gnustep-notebook"
OWNER="pcardona34"
HUB="https://github.com"
BRANCH="main"
BUILD_DIR="." # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd "$BUILD_DIR/${APPNAME}-0.3"

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

################################################
## Gemas
### Repo/Release: savannah/gnustep-nonfsf: 0.4
################################################

function install_gemas()
{
cd ../build || exit 1

APPNAME="Gemas"
RELEASE="0.4"
EXT=".tar.gz"
HUB=http://download.savannah.nongnu.org/releases/gnustep-nonfsf
TARGET="${DEVEL}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d ${APPNAME}-${RELEASE} ];then
	cd ${APPNAME}-${RELEASE}
	make clean &>/dev/null
else
	wget --quiet ${HUB}/${APPNAME}-${RELEASE}${EXT}
	gunzip ${HUB}/${APPNAME}-${RELEASE}${EXT}
	tar -xf ${APPNAME}-${RELEASE}.tar
	cd ${APPNAME}-${RELEASE}
fi

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

##########################################
## Graphos
### Repo/release: github/gnustep/gap: 0.6
##########################################

function install_graphos()
{


cd ../build || exit 1

APPNAME="Graphos"
REPO="gap"
OWNER="gnustep"
HUB="https://github.com"
BRANCH="master"
BUILD_DIR="user-apps" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

#####################################################
## DictionaryReader
### Repo/Release: github/onflapp/gs-desktop: 1.0.0
#####################################################

function install_dictionaryreader()
{

cd ../build || exit 1

APPNAME="DictionaryReader"
REPO="gs-desktop"
OWNER="onflapp"
HUB="https://github.com"
BRANCH="main"
BUILD_DIR="Applications" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive Dictionary.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

################################
## Cenon
### Repo/Release: cenon: 4.0.2
################################

function install_cenon()
{

cd ../build || exit 1

APPNAME="Cenon"
RELEASE="4.0.2"
EXT=".tar.bz2"
HUB=https://cenon.download/source
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d ${APPNAME} ];then
	cd ${APPNAME}
	make clean &>/dev/null
else
	wget --quiet ${HUB}/${APPNAME}-${RELEASE}${EXT}
	bunzip2 ${HUB}/${APPNAME}-${RELEASE}${EXT}
	tar -xf ${APPNAME}-${RELEASE}.tar
	cd ${APPNAME}
fi

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo -E make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

#################################################
## Librarian
### Repo/Release: github/onflapp/gs-desktop: 0.1
#################################################

function install_librarian()
{

cd ../build || exit 1

APPNAME="Librarian"
RELEASE="0.1"
REPO="gs-desktop"
OWNER="onflapp"
HUB="https://github.com"
BRANCH="main"
BUILD_DIR="Applications" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive Dictionary.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

#################################################
## HelpViewer
### Repo/Release: github/onflapp/gs-desktop: 0.4
#################################################

function install_helpviewer()
{

cd ../build || exit 1

APPNAME="HelpViewer"
REPO="gs-desktop"
OWNER="onflapp"
HUB="https://github.com"
BRANCH="main"
BUILD_DIR="Applications" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

#############################################
## FlexiSheet
### Repo/Release: github/gnustep/gap: 0.5.7
#############################################

function install_flexisheet()
{
cd ../build || exit 1

APPNAME="FlexiSheet"
REPO="gap"
OWNER="gnustep"
HUB="https://github.com"
BRANCH="master"
BUILD_DIR="user-apps" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

#######################################################
## PikoPixel
### Repo/Release: github/onflapp/gs-pikopixel: 1.0.b10
#######################################################

function install_pikopixel()
{

cd ../build || exit 1

APPNAME="PikoPixel"
REPO="gs-PikoPixel"
OWNER="onflapp"
HUB="https://github.com"
BRANCH="main"
BUILD_DIR="." # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make clean &>/dev/null
make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo -E make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

#####################################
## PRICE
### Repo/Release: sourceforge: 1.3.0
#####################################

function install_price()
{

cd ../build || exit 1

APPNAME="PRICE"
RELEASE="1.3.0"
EXT=".tar.gz"
HUB=https://master.dl.sourceforge.net/project/price/1.3.0
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d ${APPNAME}-${RELEASE} ];then
	cd ${APPNAME}-${RELEASE}
	make clean &>/dev/null
else
	wget --quiet ${HUB}/${APPNAME}-${RELEASE}${EXT}
	gunzip ${HUB}/${APPNAME}-${RELEASE}${EXT}
	tar -xf ${APPNAME}-${RELEASE}.tar
	cd ${APPNAME}-${RELEASE}
fi

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

##################################################
## FontManager
### Repo/Release: github/onflapp/gs-desktop: 0.1
##################################################

function install_fontmanager()
{

cd ../build || exit 1

APPNAME="FontManager"
REPO="gs-desktop"
OWNER="onflapp"
HUB="https://github.com"
BRANCH="main"
BUILD_DIR="Applications" # "system-apps" | "ported-apps"
TARGET="${APPLICATIONS}"

echo "$APPNAME - $RELEASE" >> $LOG
printf "\nBuilding $APPNAME $RELEASE"
printf "\nPlease, wait...\n"

if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

#####################################

CONFIG_ARGS=""
if [ -f configure ];then
	./configure ${CONFIG_ARGS} &>>$LOG
fi

make &>>$LOG &
PID=$!

i=1
printf "Building...\n"
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

printf "\nInstalling ${APPNAME} ${RELEASE}"
printf "\nPlease, wait...\n"

if [ "$TARGET" == "$APPLICATIONS" ];then
	sudo make install &>>$LOG &
else
	sudo cp --recursive ${APPNAME}.app $TARGET/ &>>$LOG &
fi
PID=$!

i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.25
	printf "\b${SPIN:i++%${#SPIN}:1}"
done

cd $_PWD

printf "\nInstallation of ${APPNAME} ${RELEASE}"
printf "\nDone.\n"

}

#################################################
### If you do not want any app to install
### comment the relevent install script below
#################################################

install_calculator
install_ink
install_powerpaint
install_vespucci
install_stepsync
install_notebook
install_gemas
install_graphos
install_dictionaryreader
install_cenon
install_librarian
install_helpviewer
install_flexisheet
install_pikopixel
install_price
install_fontmanager

make_services
sudo ldconfig
