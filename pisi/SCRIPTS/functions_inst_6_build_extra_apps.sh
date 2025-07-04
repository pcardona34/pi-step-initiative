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
### Functions for inst_6_build_extra_apps...
####################################################


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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME || exit 1

_build
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
BUILD_DIR="gui"
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
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
BUILD_DIR="user-apps"
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd "$BUILD_DIR/${APPNAME}-0.3"

_build
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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d ${APPNAME}-${RELEASE} ];then
	cd ${APPNAME}-${RELEASE}
else
	wget --quiet ${HUB}/${APPNAME}-${RELEASE}${EXT}
	gunzip --force ${APPNAME}-${RELEASE}${EXT}
	tar -xf ${APPNAME}-${RELEASE}.tar
	cd ${APPNAME}-${RELEASE}
fi

_build
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
BUILD_DIR="user-apps"
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
}

#####################################################
## DictionaryReader
### Repo/Release: github/onflapp/gs-desktop: 1.0.0
#####################################################

function install_dictionaryreader()
{

cd ../build || exit 1

APPNAME="Dictionary"
REPO="gs-desktop"
OWNER="onflapp"
HUB="https://github.com"
BRANCH="main"
BUILD_DIR="Applications"
CONFIG_ARGS=""
INSTALL_DIRS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd "$BUILD_DIR/${APPNAME}Reader"

_build
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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d ${APPNAME} ];then
	cd ${APPNAME}
else
	wget --quiet ${HUB}/${APPNAME}-${RELEASE}${EXT}
	bunzip2 ${APPNAME}-${RELEASE}${EXT}
	tar -xf ${APPNAME}-${RELEASE}.tar
	cd ${APPNAME}
fi

_build
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
BUILD_DIR="Applications"
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
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
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d ${APPNAME}-${RELEASE} ];then
	cd ${APPNAME}-${RELEASE}
else
	wget --quiet ${HUB}/${APPNAME}-${RELEASE}${EXT}
	gunzip ${APPNAME}-${RELEASE}${EXT}
	tar -xf ${APPNAME}-${RELEASE}.tar
	cd ${APPNAME}-${RELEASE}
fi

_build
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
BUILD_DIR="Applications"
CONFIG_ARGS=""
INSTALL_ARGS=""

echo "$APPNAME - $RELEASE" >> $LOG
title "$APPNAME $RELEASE"

printf "Fetching...\n"
if [ -d $REPO ];then
        cd $REPO
        git pull origin $BRANCH &>/dev/null
else
	git clone ${HUB}/${OWNER}/${REPO}.git &>/dev/null
	cd $REPO
fi

cd $BUILD_DIR/$APPNAME

_build
}

