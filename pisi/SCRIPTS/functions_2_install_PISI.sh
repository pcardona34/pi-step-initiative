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
### Functions for PISI installation main script
####################################################

####################################################
### Vars

_PWD=`pwd`

### End of vars
####################################################

####################################################
### Include functions

. SCRIPTS/colors.sh

### End of include functions
####################################################

####################################################
### install base desktop: it includes dev apps

function install_base()
{
. SCRIPTS/inst_1_build_libdispatch.sh
. SCRIPTS/inst_2_build_libojc2.sh
. SCRIPTS/inst_3_build_gnustep.sh
. SCRIPTS/inst_4_build_frameworks.sh
. SCRIPTS/inst_5_build_desktop.sh
}
### End of base
####################################################

####################################################
### Install the extra apps and games
function install_extra()
{
. SCRIPTS/inst_6_build_more_apps.sh
. SCRIPTS/inst_7_build_games.sh
}
### end of extra
####################################################

####################################################
### Install the base desktop, extra apps and games
function install_whole()
{
install_base
install_extra
}
### end of whole
####################################################

####################################################
###
function help()
{
clear
title "Main PiSi install script: Help"
printf "You can install Pisi like this:\n-Desktop base:"
cli "./2_install_Pisi.sh base"
printf "\n- Extra apps: only, if you already did base first:"
cli "./2_install_Pisi.sh extra"
printf "\n- All the above in one step:"
cli "./2_install_Pisi.sh whole"

MESSAGE="- Base: means WindowMaker, GWorkspace and some usefull apps like the Developer apps. \n \
(i) - Extra: means more apps, games..."
info "$MESSAGE"
}
### end of help
####################################################

### End of functions
##############################################

