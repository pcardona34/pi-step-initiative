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
### Functions for PiSi Desktop Base
################################

. SCRIPTS/check_app.sh

#######################################
## SystemPreferences
### Repo/release: github/gnustep: 1.2.0
########################################

function install_systempreferences()
{
APPNAME="SystemPreferences"
RELEASE="1.2.0"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d apps-systempreferences ];then
	cd apps-systempreferences
	git pull origin master &>/dev/null
else
	git clone --branch=master https://github.com/gnustep/apps-systempreferences &>/dev/null
	cd apps-systempreferences
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

printf "\nChecking...\n"
check "$APPNAME"

}

########################################
## GWorkspace
### Repo/Release: github/gnustep: 1.1.0
########################################

function install_gworkspace()
{

APPNAME=GWorkspace
RELEASE="1.1.0"
CONFIG_ARGS="--with-inotify --enable-gwmetadata"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d apps-gworkspace ];then
	cd apps-gworkspace
	git pull origin master &> /dev/null
else
	git clone --branch=master "https://github.com/gnustep/apps-gworkspace" &> /dev/null
	cd apps-gworkspace
fi

#####################################
### GWmetadata submodule

info "Submodules of GWorkspace: GWMetadata and MDFinder"

cd GWMetadata || exit 1

printf "Configuring...\n"
./configure &>>$LOG &
PID=$!
spinner

printf "\rBuilding...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rSubmodule: "
ok "Done"

cd ..
## End of submodule
####################################

info "Back to the main app"

printf "Configuring...\n"
./configure ${CONFIG_ARGS} &>>$LOG &
PID=$!
spinner

printf "\rBuilding...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"
check "Recycler"
check "MDFinder"

}

#############################################
## Terminal
### Repo/Release: github/gnustep/gap: 0.9.8
#############################################

function install_terminal()
{

APPNAME=Terminal
RELEASE="0.9.8"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gap ];then
	cd gap
	git pull origin master &>/dev/null
	cd system-apps/Terminal
else
	git clone https://github.com/gnustep/gap.git &>/dev/null
	cd gap
	cd system-apps/Terminal
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

printf "\nChecking...\n"
check "$APPNAME"

}

########################################
## Gorm
### Repo/Release: github/gnustep: 1.5.0
########################################

function install_gorm()
{

APPNAME=Gorm
RELEASE="1.5.0"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d apps-gorm ];then
        cd apps-gorm
        git pull origin master &>/dev/null
else
        git clone --branch=master "https://github.com/gnustep/apps-gorm" &>/dev/null
        cd apps-gorm
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

printf "\nChecking...\n"
check "$APPNAME"

}

########################################
## ProjectCenter
### Repo/Release: github/gnustep: 0.7.0
########################################

function install_PC()
{

APPNAME=ProjectCenter
RELEASE="0.7.0"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d apps-projectcenter ];then
        cd apps-projectcenter
        git pull origin master &>/dev/null
else
        git clone --branch=master "https://github.com/gnustep/apps-projectcenter" &>/dev/null
        cd apps-projectcenter
fi

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo make install &>>$LOG &
PID=$!
spinner

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"

}

########################################
## EasyDiff
### Repo/Release: github/gnustep: 0.4.1
########################################

function install_easydiff()
{

APPNAME=Easydiif
RELEASE="0.4.1"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d apps-easydiff ];then
        cd apps-easydiff
        git pull origin master &>/dev/null
	make clean &>/dev/null
else
        git clone --branch=master "https://github.com/gnustep/apps-easydiff.git" &>/dev/null
        cd apps-easydiff
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

printf "\nChecking...\n"
check "$APPNAME"

}

###################################################
## Affiche
### Repo/Release: github/onflapp/gs-desktop: 0.6.0
###################################################

function install_affiche()
{

APPNAME=Affiche
RELEASE="0.6.0"
GNUSTEP_APPS_DIR=/usr/local/lib/GNUstep/Applications

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gs-desktop ];then
	cd gs-desktop
	git pull origin master &>/dev/null
else
	git clone https://github.com/onflapp/gs-desktop.git &>/dev/null
	cd gs-desktop
fi

cd Applications/Affiche

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"

}

#######################################
## Addresses
### Repo/Release: savannah/gap: 0.5.0
#######################################

function install_addressmanager()
{

APPNAME=AddressManager
RELEASE="0.5.0"

title "$APPNAME $RELEASE"

cd ../build || exit 1

printf "Fetching...\n"
if [ -d Addresses-0.5.0 ];then
	cd Addresses-0.5.0
	cd AddressManager
else
	wget --quiet http://savannah.nongnu.org/download/gap/Addresses-0.5.0.tar.gz
	gunzip --force Addresses-0.5.0.tar.gz
	tar -xf Addresses-0.5.0.tar
	cd Addresses-0.5.0
	cd AddressManager
fi

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null
ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"

}

##########################################
## GSPdf
### Repo/Release: github/gnustep/gap: 0.5
##########################################

function install_gspdf()
{
APPNAME=GSPdf
RELEASE="0.5"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gap ];then
        cd gap
        git pull origin master &>/dev/null
else
        git clone https://github.com/gnustep/gap.git &>/dev/null
        cd gap
fi

cd user-apps/GSPdf

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\\rInstalling...\n"
sudo make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"

}

##########################################
## TimeMon
### Repo/Release: github/gnustep/gap: 4.1
##########################################

function install_timemon()
{
APPNAME=TimeMon
RELEASE="4.1"

title "$APPNAME $RELEASE" | tee -a $LOG

printf "Fetching...\n"
cd ../build || exit 1

if [ -d gap ];then
        cd gap
        git pull origin master &>/dev/null
else
        git clone https://github.com/gnustep/gap.git &>/dev/null
        cd gap
fi

cd ported-apps/Util/TimeMon

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

#sudo cp --recursive TimeMon.app ${UTILITIES}/

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"

}

###############################################
## Cynthiune
### Repo/Release: github/gnustep/gap: 1.0.0
### With a patch from Savannah
###############################################

function install_cynthiune()
{
APPNAME=Cynthiune
RELEASE="1.0.0"
BUILD_ARGS="disable-audiofile=yes disable-flac=yes disable-flactags=yes \
        disable-mod=yes disable-windowsmedia=yes disable-musepack=yes \
        disable-timidity=yes disable-asdtags=yes disable-waveout=yes \
        disable-esound=yes disable-ao=yes"
INSTALL_ARGS="${BUILD_ARGS}"
PATCH="Cynthiune-1.0.0_Bundles_ALSA_fails_to_build_due_to_memcheck_inclusion.patch"

title "$APPNAME $RELEASE"

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gap ];then
        cd gap
        git pull origin master &>/dev/null
else
        git clone https://github.com/gnustep/gap.git &>/dev/null
        cd gap
fi

cd user-apps/Cynthiune

### PATCH
cp $_PWD/RESOURCES/PATCHES/$PATCH ./
printf "A patch must be applied... "
TARGET=`grep -i -e "index" ./${PATCH} | awk '{print $2}'`
TARGET=./${TARGET}
patch --forward -u ${TARGET} -i ./${PATCH}
ok "Done"

printf "Building...\n"
make ${BUILD_ARGS} &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo make install ${INSTALL_ARGS} &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"

}

###################################################
## TextEdit
### Repo/Release: github/onflapp/gs-textedit: 4.0
###################################################

function install_textedit()
{
APPNAME=TextEdit
RELEASE="4.0"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gs-textedit ];then
	cd gs-textedit
	git pull origin master &>/dev/null
else
	git clone https://github.com/onflapp/gs-textedit.git &>/dev/null
	cd gs-textedit
fi

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"
}

##################################################
## ImageViewer
### Repo/Release: github/onflapp/gs-desktop: 0.1
##################################################

function install_imageviewer()
{
APPNAME=ImageViewer
RELEASE="0.1"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gs-desktop ];then
        cd gs-desktop
        git pull origin main &>/dev/null
else
        git clone https://github.com/onflapp/gs-desktop.git &>/dev/null
        cd gs-desktop
fi

cd Applications/ImageViewer

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

printf "\nChecking...\n"
check "$APPNAME"
}

##########################################
## SimpleAgenda
### Repo/Release: github/poroussel: 0.4.7
##########################################

function install_agenda()
{
APPNAME=SimpleAgenda
RELEASE="0.4.7"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d simpleagenda ];then
	cd simpleagenda
	git pull origin master &>/dev/null
else
	git clone https://github.com/poroussel/simpleagenda.git &>/dev/null
	cd simpleagenda
fi

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"

}

#################################################
## GNUMail (current / stable)
### Repo/Release: Savannah/gnustep-nonfsf: 1.4.0
#################################################

function install_gnumail()
{
APPNAME=GNUMail
RELEASE="1.4.0"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d GNUMail-1.4.0 ];then
	cd GNUMail-1.4.0
else
	wget --quiet http://download.savannah.nongnu.org/releases/gnustep-nonfsf/GNUMail-1.4.0.tar.gz
	gunzip --force GNUMail-1.4.0.tar.gz
	tar -xf GNUMail-1.4.0.tar
	cd GNUMail-1.4.0
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

printf "\nChecking...\n"
check "$APPNAME"

}

#####################################################
## OpenUp
### Repo/Release: github/onflapp/gs-desktop: 0.1
#####################################################

function install_openup()
{
APPNAME=OpenUp
RELEASE="0.1"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gs-desktop ];then
        cd gs-desktop
        git pull origin main &>/dev/null
else
        git clone https://github.com/onflapp/gs-desktop.git &>/dev/null
        cd gs-desktop
fi

cd Applications/OpenUp

printf "Building...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo -E make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"
}

#################################################
## ScanImage
### Repo/Release: github/onflapp/gs-desktop: 0.1
#################################################

function install_scanimage()
{
APPNAME=ScanImage
RELEASE="0.1"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gs-desktop ];then
        cd gs-desktop
        git pull origin main &>/dev/null
else
        git clone https://github.com/onflapp/gs-desktop.git &>/dev/null
        cd gs-desktop
fi

cd Applications/ScanImage

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

printf "\nChecking...\n"
check "$APPNAME"
}

##################################################
## Screenshot
### Repo/Release: github/onflapp/gs-desktop: 0.1
##################################################

function install_screenshot()
{
APPNAME=ScreenShot
RELEASE="0.1"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gs-desktop ];then
        cd gs-desktop
        git pull origin main &>/dev/null
else
        git clone https://github.com/onflapp/gs-desktop.git &>/dev/null
        cd gs-desktop
fi

cd Applications/ScreenShot

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

printf "\nChecking...\n"
check "$APPNAME"
}

###################################################
## Player
### Repo/Release: github/onflapp/gs-desktop: 0.1
###################################################

function install_player()
{
APPNAME=Player
RELEASE="0.1"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gs-desktop ];then
        cd gs-desktop
        git pull origin main &>/dev/null
else
        git clone https://github.com/onflapp/gs-desktop.git &>/dev/null
        cd gs-desktop
fi

cd Applications/Player

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

printf "\nChecking...\n"
check "$APPNAME"
}

###################################################
## InnerSpace
### Repo/Release: github/onflapp/gs-desktop: 0.1
###################################################

function install_innerspace()
{
APPNAME=InnerSpace
RELEASE="0.1"
PATCH="spordefs.patch"
TARGET="spordefs.m"
PROJ="SporView.bproj"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d gap ];then
        cd gap
        git pull origin master &>/dev/null
else
        git clone https://github.com/gnustep/gap.git &>/dev/null
        cd gap
fi

cd user-apps/InnerSpace

if ! [ -d $HOME/GNUstep/Library/InnerSpace ];then
	mkdir -p $HOME/GNUstep/Library/InnerSpace
fi
printf "Building and installing the subprojects...\n"
for SUB in *.bproj
do
	cd $SUB
	printf "\t${SUB}...\n"
	if [ "$SUB" == "$PROJ" ];then
		### PATCH
		cp $_PWD/RESOURCES/PATCHES/$PATCH ./
		printf "\tA patch must be applied...\n"
		patch --forward -u ${TARGET} -i ${PATCH} &>>$LOG
		ok "\tPatch applied"
	fi
	make &>>$LOG
	cd ..
	cp --recursive $SUB $HOME/GNUstep/Library/InnerSpace/
	ok "\r\tDone"
done

printf "Building InnerSpace...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling main...\n"
sudo make install &>>$LOG &
PID=$!
spinner

### Cleaning
make clean &>/dev/null

ok "\rDone"

cd $_PWD

printf "\nChecking...\n"
check "$APPNAME"
}

######################################
## NetSurf-GNUstep
### 3.10
######################################

{
APPNAME=Netsurf
RELEASE="3.10"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d netsurf-gnustep ];then
        cd netsurf-gnustep
        git pull origin master &>/dev/null
else
        git clone https://github.com/anthonyc-r/netsurf-gnustep.git &>/dev/null
        cd netsurf-gnustep
fi

cd $_PWD
exit

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

printf "\nChecking...\n"
check "$APPNAME"
}

#####################################
## Window Maker
### Repo: windowmaker.org
### Release: see below
#####################################

function install_wmaker()
{

REPO="https://www.windowmaker.org/pub/source/release/"
APP="WindowMaker"
APPNAME="$APP"

############ CHOICE OF THE RELEASE #################
# Install the latest release of WMaker: 0.96.0
RELEASE="0.96.0"
# Install previous stable release
#RELEASE="0.95.9"
#####################################################

CONFIG_ARGS="--disable-xinerama --disable-magick"
EXT=".tar.gz"
DIR="${APP}-${RELEASE}"
ARCHIVE="${DIR}${EXT}"
LINGUAS="fr uk"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d $DIR ];then
	cd $DIR
else
	wget --quiet "${REPO}${ARCHIVE}"
	gunzip --force ${ARCHIVE}
	tar -xf ${DIR}.tar
	cd $DIR || exit 1
fi

printf "Configuring...\n"
./autogen.sh ${CONFIG_ARGS} &>>$LOG
./configure ${CONFIG_ARGS} &>>$LOG &
PID=$!
spinner

printf "\rBuilding...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo make install &>>$LOG &
PID=$!
spinner

sudo ldconfig

### Cleaning
make clean &>/dev/null

cd $_PWD

ok "\rDone"

### Checking
VER=`wmaker --version`
if [ $? == 0 ];then
	info "$VER has been successfully installed."
else
	alert "Window Maker was not successfully installed. This is a major issue. Read $LOG.\nAnd report this issue to:\nhttps://github.com/pcardona34/pi-step-initiative/issues"
fi
}
### End of Wmaker
######################################

######################################
## WMClock
### Repo/Release: dockapps.net: 1.0.16
######################################

function install_wmclock
{

APPNAME=WMClock
RELEASE="1.0.16"
CONFIG_ARGS="--with-lang=french"

title "$APPNAME $RELEASE" | tee -a $LOG

cd ../build || exit 1

printf "Fetching...\n"
if [ -d dockapps-daaf3aa ];then
	cd dockapps-daaf3aa
else
	wget --quiet https://www.dockapps.net/download/wmclock-1.0.16.tar.gz
	gunzip --force wmclock-1.0.16.tar.gz
	tar -xf wmclock-1.0.16.tar
	cd dockapps-daaf3aa
fi

printf "Configuring...\n"
autoreconf -i &>>$LOG
./configure ${CONFIG_ARGS} &>>$LOG &
PID=$!
spinner

printf "\rBuilding...\n"
make &>>$LOG &
PID=$!
spinner

printf "\rInstalling...\n"
sudo make install &>>$LOG &
PID=$!
spinner

ok "\rDone"
cd $_PWD

### Checking
WMC=`which wmclock`
if [ $? -eq 0 ];then
	info "The app binary has been found here:\n${WMC}"
else
	alert "The app binary was not found. Please, report this issue."
fi

}
### End of WMClock
##############################################

##############################################
### /etc/skel: copy ressources

function cp_to_skel()
{

title "User Home Template"

printf "Copy of the User Home Template in /etc/skel/PISI..."

cd RESOURCES/SKEL
if ! [ -d /etc/skel/PISI ];then
	sudo mkdir -p /etc/skel/PISI
fi
sudo cp -r GNUstep /etc/skel/PISI/
sudo chmod --recursive 0755 /etc/skel

cd $_PWD
ok "Done"
}
### End of copy ressources to /etc/skel
##############################################


### End of functions
##############################################

