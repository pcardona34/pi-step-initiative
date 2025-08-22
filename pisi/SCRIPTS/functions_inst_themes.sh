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
### Functions for Install Themes
################################

###############################################
function install_wm_theme()
{
title "PISI Theme for WindowMaker"
printf "Installing the theme...\n"
cd $_PWD/RESOURCES/THEMES || exit 1
cp WMPISI.tar.gz $HOME/GNUstep/Library/WindowMaker/
cd $HOME/GNUstep/Library/WindowMaker
gunzip --force WMPISI.tar.gz && tar -xf WMPISI.tar
rm WMPISI.tar
cd $_PWD
ok "Done"
}

###############################################
function install_gs_theme()
{
title "PISI Theme for GNUstep"
printf "Installing the theme...\n"
if ! [ -d $HOME/GNUstep/Library/Themes ];then
	mkdir -p $HOME/GNUstep/Library/Themes
fi
cd $_PWD/RESOURCES/THEMES
cp GSPISI.tar.gz $HOME/GNUstep/Library/Themes/
cd $HOME/GNUstep/Library/Themes
gunzip --force GSPISI.tar.gz
tar -xf GSPISI.tar
rm GSPISI.tar
cd $_PWD
ok "Done"
}
