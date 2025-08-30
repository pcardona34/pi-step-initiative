#!/bin/bash

####################################################
### P i S i N     Updater - by Patrick Cardona
### pcardona34 @ Github
###
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Install the Updater Tool
################################

################################
### VARS

AUTO=$HOME/GNUstep/Library/WindowMaker/autostart
HOME_DIR_BIN=$HOME/.local/bin

if ! [ -d $HOME_DIR_BIN ];then
	mkdir -p "$HOME_DIR_BIN"
fi

cp -u Updater.sh $HOME_DIR_BIN/

###  Copy of dunstrc
DUNSTRC=$HOME/.config/dunst
if ! [ -d $DUNSTRC ];then
	mkdir -p $DUNSTRC
fi
cp _dunstrc $DUNSTRC/dunstrc

grep -e "Updater.sh" $AUTO &>/dev/null
if [ $? -eq 0 ];then
	printf "\nAlready set in $AUTO\n"
fi

printf "\nPiSiN_Updater has been set.\n"
