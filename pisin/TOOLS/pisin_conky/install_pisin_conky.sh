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
TRANS=`echo ${LANG%.UTF-8} | awk -F_ '{print $1}'`

if [ ! -d $HOME_DIR_CONF/pisin ];then
	mkdir -p "${HOME_DIR_CONF}/pisin"
fi

if [ -n $TRANS ] && [ -f conky.conf.${TRANS} ];then
	cp --force conky.conf.${TRANS} $HOME_DIR_CONF/pisin/conky.conf
else
	cp --force conky.conf $HOME_DIR_CONF/pisin/
fi

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

if [ ! -f $DEST/ConkySymbols.ttf ];then
	cd $_PWD/RESOURCES/THEMES || exit 1
	cp ConkySymbols.ttf.tar.gz $DEST/
	cd $DEST
	gunzip --force ConkySymbols.ttf.tar.gz
	tar -xf ConkySymbols.ttf.tar
	rm ConkySymbols.ttf.tar
	fc-cache -f
fi
ok "Done"

printf "\nConky has been set.\n"
