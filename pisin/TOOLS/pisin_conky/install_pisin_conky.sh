#!/bin/bash

####################################################
### P i S i N    Desktop - by Patrick Cardona
### pcardona34 @ Github
###
### This is Free and Open Source software.
### Read License in the root directory.
####################################################

################################
### Install the Conky Panel
################################

################################
### VARS

AUTO=$HOME/GNUstep/Library/WindowMaker/autostart
HOME_DIR_CONF=$HOME/.config

if [ ! -d $HOME_DIR_CONF/pisin ];then
	mkdir -p "${HOME_DIR_CONF}/pisin"
fi

cp conky.conf $HOME_DIR_CONF/pisin/

grep -e "conky" $AUTO &>/dev/null
if [ $? -eq 0 ];then
	printf "\nAlready set in $AUTO\n"
fi

####################################
### Install Conky Symbols TTF font

DEST=$HOME/.local/share/fonts
if ! [ -d $DEST ];then
	mkdir -p $DEST
fi

printf "Conky Symbols TTF...\n"
cd $_PWD/RESOURCES/THEMES || exit 1
cp ConkySymbols.ttf.tar.gz $DEST/
cd $DEST
gunzip --force ConkySymbols.ttf.tar.gz
tar -xf ConkySymbols.ttf.tar
rm ConkySymbols.ttf.tar
fc-cache -f
ok "Done"

printf "\nConky has been set.\n"
