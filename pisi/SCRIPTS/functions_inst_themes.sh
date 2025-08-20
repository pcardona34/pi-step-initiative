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
cd $HOME/GNUstep/Library/WindowMaker
cp $_PWD/RESOURCES/THEMES/WMPISI.tar.gz ./
gunzip WMPISI.tar.gz
tar -xf WMPISI.tar
ok "Done"
}

###############################################
function install_gs_theme()
{
title "PISI Theme for GNUstep"
printf "Installing the theme...\n"
cd $HOME/GNUstep/Library/Themes
cp $_PWD/RESOURCES/THEMES/GSPISI.tar.gz ./
gunzip GSPISI.tar.gz
tar -xf GSPISI.tar
ok "Done"
}
