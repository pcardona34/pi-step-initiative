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
### User home settings
### This set GNUstep Library, defaults, .xinitrc...
####################################################

####################################################
### Include functions

. SCRIPTS/colors.sh
. SCRIPTS/spinner.sh

### End of include functions
####################################################

_PWD=`pwd`

####################################################
### FreeDesktop User filesystem

### Set or restore standard $HOME filesystem
xdg-user-dirs-update
### Set misc folders (non standard ones)
. SCRIPTS/misc_folders.sh

####################################################
### User profile
### Very important, because GNUstep needs to source this...

IS_PROFILE=`grep -e "GNUstep.sh" $HOME/.profile`
if [ $? -eq 0 ];then
	info "$HOME/.profile is yet sourcing GNUstep."
else
	echo ". /usr/local/share/GNUstep/Makefiles/GNUstep.sh" >> $HOME/.profile
	. $HOME/.profile
fi

###################################################
### Prevent .cache issue
IS_BASHRC=`grep -e ".cache" $HOME/.bashrc`
if [ $? -eq 0 ];then
	info "$HOME/.bashrc already fixes the '.cache' issue."
else
	cat RESOURCES/SCRIPTS/_bashrc >> $HOME/.bashrc
fi

###################################################
### User WindowMaker profile

### We set standard first

cd
wmaker.inst
cd $_PWD

###################################################
### .xinitrc

if ! [ -f $HOME/.xinitrc ];then
	cp --verbose RESOURCES/SCRIPTS/_xinitrc $HOME/.xinitrc
else
	warning "A xinit script is already in the user directory."
	IS_WMAKER=`grep -e "wmaker" $HOME/.xinitrc`
	if [ $? -eq 0 ];then
		info "It seems correct and it will be unchanged."
	else
		info "It is not compliant, so you should change it."
		cp -i RESOURCES/SCRIPTS/_xinitrc $HOME/.xinitrc
	fi
fi

### Symbolic link to Applications
if [ -d /user/local/lib/GNUstep/Applications ];then
	cd /
	sudo ln -s /user/local/lib/GNUstep/Applications Applications
fi

cd $_PWD

### Wallpaper
WP=wp_pi_step_initiative.png
if [ ! -f $HOME/GNUstep/Library/WindowMaker/Backgrounds/$WP ];then
	cp RESOURCES/WALLPAPERS/$W $HOME/GNUstep/Library/WindowMaker/Backgrounds/
fi

### Installing Tools and confs... Updater
cd TOOLS/pisi_updater || exit 1
. ./install_pisi_updater.sh
cd $_PWD

### Installing Tools and confs... Conky
cd TOOLS/pisi_conky || exit 1
. ./install_pisi_conky.sh
cd $_PWD

### Installing Tools and confs...
cd TOOLS/pisi_compton || exit 1
. ./install_pisi_compton.sh
cd $_PWD

###########################################
### Installing the themes
. SCRIPTS/inst_themes
### Apps known to not comply with Theme: workaround
### We need to update Info-gnustep.plist for these apps
. SCRIPTS/misc_themes

###########################################
### Setting the Defaults...
. SCRIPTS/set_defaults.sh


###########################################
### Installing Tools
cd $_PWD
cp -i RESOURCES/SCRIPTS/autostart $HOME/GNUstep/Library/Windowmaker/
cp RESOURCES/SCRIPTS/Setup_Printer.sh $HOME/.local/bin/
cp RESOURCES/SCRIPTS/pisi $HOME/.local/bin/
cp SCRIPTS/colors.sh SCRIPTS/spinner.sh $HOME/.local/bin/

###########################################
### Copying samples
printf "Copying samples...\n"
cp $_PWD/RESOURCES/Samples.tar.gz $HOME/
cd $HOME
gunzip --force Samples.tar.gz
tar -xf Samples.tar
ok "Done"

###########################################
### Uncomment below if you use a Display Manager like XDM, Login.app...
### Do not use WDM.
#cp $HOME/.xinitrc $HOME/.xsession

printf "\nThe PiStep Initiative OS Desktop is ready to use now.\n"

printf "To start it, execute:\n"
cli "cd && startx"

warning "Until now, no DM nor Login Manager... \nDO NOT use WDM, it could break PiSi installation!"

