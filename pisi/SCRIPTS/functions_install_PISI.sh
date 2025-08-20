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
### install base desktop

function install_desktop()
{
. SCRIPTS/inst_wmaker.sh
. SCRIPTS/inst_libdispatch.sh
. SCRIPTS/inst_libojc2.sh
. SCRIPTS/inst_gnustep.sh
. SCRIPTS/inst_frameworks.sh
}
### End of desktop
####################################################

####################################################
### install main apps

function install_apps()
{
. SCRIPTS/inst_apps.sh
}
### End of apps
####################################################

####################################################
### install devel apps

function install_devel()
{
. SCRIPTS/inst_devel.sh
}
### End of devel
####################################################

####################################################
### Install the extra apps and games

function install_extra()
{
. SCRIPTS/inst_extra.sh
}

function install_games()
{
. SCRIPTS/inst_games.sh
}

### end of extra
####################################################

####################################################
###
function help()
{
clear
title "Main PiSi install script: Help"
printf "You can install Pisi like this:"
cli "./2_install_Pisi.sh OPTION"
printf "\n- OPTION could be one of: desktop, apps, devel, extra, games"

MESSAGE="- desktop: means WindowMaker and some dockapps.\n \
(i) - apps: means GWorkspace, Terminal, TextEdit, GNUMail, etc."
info "$MESSAGE"
}
### end of help
####################################################

### End of functions
##############################################

