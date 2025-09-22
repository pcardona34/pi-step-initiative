#!/bin/bash

####################################################
### P i S i N     Desktop - by Patrick Cardona
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

clear

####################################################
### FreeDesktop User filesystem

title "Customizing the User Home folder"
### Set or restore standard $HOME filesystem
### Do NOT use xdg-user-dirs-update!!!
for FOLD in Books Desktop Documents Downloads Favorites Images Mailboxes Music Samples Videos
do
	if ! [ -d $HOME/$FOLD ];then
		mkdir -p $HOME/$FOLD
	fi
done

### Set misc folders (non standard ones)
. SCRIPTS/misc_folders.sh

### Target of Tools
if ! [ -d $HOME/.local/bin ];then
	mkdir -p $HOME/.local/bin
fi

###################################################
### Prevent .cache issue

title "Fixing cache issue"
grep -e ".cache" $HOME/.bashrc &>/dev/null
if [ $? -eq 0 ];then
	info "$HOME/.bashrc already fixes the '.cache' issue."
else
	cat RESOURCES/SCRIPTS/_bashrc >> $HOME/.bashrc
fi
ok "Done"

###################################################
### User WindowMaker profile
title "User's WindowMaker profile"

### We set standard first
if [ -d $HOME/GNUstep/Library/WindowMaker ];then
	printf "Already set.\n"
else
	cd
	wmaker.inst
	cd $_PWD
fi
ok "Done"

###################################################
### Autostart
title "Autostart"
cd $_PWD/RESOURCES/SCRIPTS
cp --remove-destination autostart $HOME/GNUstep/Library/WindowMaker/
printf "Autostart for Window Maker has been updated.\n"
cd $_PWD
ok "Done"

###################################################
### .xinitrc
title "Xinit"

if ! [ -f $HOME/.xinitrc ];then
	cd RESOURCES/SCRIPTS && cp _xinitrc $HOME/.xinitrc
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
cd $_PWD
ok "Done"

#################################################
### Wallpaper
title "Wallpaper"
WP=fond_pi_step_initiative.png
WP_FOLDER=$HOME/GNUstep/Library/WindowMaker/Backgrounds
if ! [ -f $WP_FOLDER/$WP ];then
	cd RESOURCES/WALLPAPERS && cp $WP $WP_FOLDER/
fi
cd $_PWD
ok "Done"

#################################################
### Installing Tools and confs... Updater
title "Updater tool"
cd $_PWD/TOOLS/pisin_updater || exit 1
. ./install_pisin_updater.sh
cd $_PWD
ok "Done"

### Installing Tools and confs... Conky
title "Conky Monitoring Board"
cd $_PWD/TOOLS/pisin_conky || exit 1
. ./install_pisin_conky.sh
cd $_PWD
ok "Done"

### Installing Tools and confs... Compton
title "Compton Compositing"
cd $_PWD/TOOLS/pisin_compton || exit 1
. ./install_pisin_compton.sh
cd $_PWD
ok "Done"

###########################################
### Installing the theme
title "PISIN Theme"
cd $_PWD
. SCRIPTS/inst_themes.sh
### Some Apps known to not comply with Theme: workaround
### We need to update Info-gnustep.plist for these apps
### Adding 'CFBundleIdentifier' property in the Dictionary
. SCRIPTS/misc_themes.sh
cd $_PWD

###########################################
### Setting the Defaults...
title "GNUstep Defaults Setting"
. SCRIPTS/prep_defaults.sh
. SCRIPTS/set_defaults.sh
cd $_PWD

###########################################
### Installing Tools
title "User Tools"
cd $_PWD/RESOURCES/SCRIPTS || exit 1
for TOOL in Setup_Printer.sh pisin
do
	cp -u $TOOL $HOME/.local/bin/
done

cd $_PWD/SCRIPTS || exit 1
for TOOL in colors.sh spinner.sh
do
	cp -u $TOOL $HOME/.local/bin/
done

cd $_PWD
ok "Done"

###########################################
### Samples
title "Sample Files"
cd $_PWD/RESOURCES && cp -u Samples.tar.gz $HOME/
cd $HOME
gunzip --force Samples.tar.gz
tar -xf Samples.tar && rm Samples.tar

cd Samples
for FIC in *.mp3 *.ogg; do cp --force "$FIC" $HOME/Music/ ;done
for FIC in *.mp4 *.mkv; do cp --force "$FIC" $HOME/Videos/ ;done
for FIC in *.png *.jpg *.tiff; do cp --force "$FIC" $HOME/Images/ ;done
for FIC in *.epub *.pdf; do cp --force "$FIC" $HOME/Books/ ;done

cd $_PWD
ok "Done"

###########################################
### Help
title "Help Files"
cd $_PWD/RESOURCES/HELP
for HLP in *.help
do
	cp -ruf ${HLP} $HOME/Books/
done

cd $_PWD
ok "Done"

###########################################
### Info release
RELEASE=$(grep -e "Release" RELEASE | awk '{print $3}')
STATUS=$(grep -e "Status" RELEASE | awk '{print $3}')

if [ ! -d $HOME/.local/etc ];then
	mkdir -p $HOME/.local/etc
fi
echo "DESKTOP=PiSiN" > $HOME/.local/etc/release.info
echo "REL=$RELEASE" >> $HOME/.local/etc/release.info
echo "STATUS=$STATUS" >> $HOME/.local/etc/release.info

###########################################
### Installation LOGS
title "Installation Logs"

cd
for LOG in *.log
do
	mv $LOG Documents/
done
info "All the logs were moved into the Documents Folder."

###########################################
### Uncomment below if you use a Display Manager like XDM, Login.app...
### Do not use WDM.
#cp $HOME/.xinitrc $HOME/.xsession

MESSAGE="The PiStep Initiative Desktop is ready to use now.\n \
To start it, execute:\n"
info "$MESSAGE"
cli "cd && startx"

warning "Until now, no DM nor Login Manager... \nDO NOT use WDM, it could break PiSiN installation!"

