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
### Functions for Install Themes
################################

###############################################
function install_wm_theme
{
title "PISIN Theme for WindowMaker"
printf "Installing the theme...\n"
cd RESOURCES/THEMES || exit 1
if [ ! -d $HOME/GNUstep/Library/WindowMaker/Themes ];then
	mkdir -p $HOME/GNUstep/Library/WindowMaker/Themes
fi
cp WMPISIN.tar.gz $HOME/GNUstep/Library/WindowMaker/Themes/
cd $HOME/GNUstep/Library/WindowMaker/Themes || exit 1
gunzip --force WMPISIN.tar.gz && tar -xf WMPISIN.tar
rm WMPISIN.tar
cd $_PWD
ok "Done"
}

###############################################
function install_gs_theme
{
title "PISIN Theme for GNUstep"
printf "Installing the theme...\n"
if ! [ -d $HOME/GNUstep/Library/Themes ];then
	mkdir -p $HOME/GNUstep/Library/Themes
fi
cd RESOURCES/THEMES
cp GSPISIN.tar.gz $HOME/GNUstep/Library/Themes/
cd $HOME/GNUstep/Library/Themes || exit 1
gunzip --force GSPISIN.tar.gz
tar -xf GSPISIN.tar
rm GSPISIN.tar
cd $_PWD
ok "Done"
}
