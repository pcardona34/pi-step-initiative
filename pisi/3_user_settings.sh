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

### End of include functions
####################################################


####################################################
### FreeDesktop User filesystem

### Set or testore standard $HOME filesystem
xdg-user-dirs-update

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
### User WindowMaker profile

### We set standard first
wmaker.inst
if ! [ -f $HOME/.xinitrc ];then
	cp --verbose RESOURCES/_xinitrc $HOME/.xinitrc
else
	warning "A xinit script is already in the user directory."
	IS_WMAKER=`grep -e "wmaker" $HOME/.xinitrc`
	if [ $? -eq 0 ];then
		info "It seems correct and it will be unchanged."
	else
		info "It was not compliant, so changed."
	fi
fi

### Hidden files
if ! [ -f $HOME/.hidden ];then
	cp --verbose RESOURCES/_hidden_home$HOME/.hidden
fi

if ! [ -f /.hidden ];then
        sudo cp --verbose RESOURCES/_hidden_root /.hidden
fi

### Symbolic link to Applications
cd /
sudo ln -s /use/local/lib/GNUstep/Applications Applications
cd

### !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
### We should restore here the Library and Defaults...
### from /etc/skel/PISI...
### !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

cp -r /etc/skel/PISI/GNUstep $HOME/

### Uncomment below if you use a Display Manager like XDM, Login.app...
### Do not use WDM.
#cp $HOME/.xinitrc $HOME/.xsession


printf "\nThe PiStep Initiative OS Desktop is ready to use now.\n"

printf "To start it, execute:\n"
cli "cd && startx"

warning "Until now, no DM nor Login Manager... \nDO NOT use WDM, it could break PiSi installation!"

