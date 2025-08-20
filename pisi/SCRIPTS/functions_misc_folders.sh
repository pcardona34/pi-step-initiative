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
### Functions for Misc Folders
################################

###############################################
function misc_folder_GNUstep()
{
FOLDER="GNUstep"
if [ ! -d $HOME/${FOLDER} ];then
	mkdir -p $HOME/$[FOLDER}
fi
cp $_PWD/RESOURCES/ICONS/dir_${FOLDER}.tiff $HOME/${FOLDER}/.dir.tiff
}
###############################################

###############################################
function misc_folder_Mailboxes()
{
FOLDER="Mailboxes"
if [ ! -d $HOME/${FOLDER} ];then
	mkdir -p $HOME/$[FOLDER}
fi
cp $_PWD/RESOURCES/ICONS/dir_${FOLDER}.tiff $HOME/${FOLDER}/.dir.tiff
}
###############################################

###############################################
function misc_folder_Favorites()
{
FOLDER="Favorites"
if [ ! -d $HOME/${FOLDER} ];then
	mkdir -p $HOME/$[FOLDER}
fi
cp $_PWD/RESOURCES/ICONS/dir_${FOLDER}.tiff $HOME/${FOLDER}/.dir.tiff
}
###############################################

###############################################
function misc_folder_SOURCES()
{
FOLDER="SOURCES"
if [ ! -d $HOME/${FOLDER} ];then
	mkdir -p $HOME/$[FOLDER}
fi
cp $_PWD/RESOURCES/ICONS/dir_${FOLDER}.tiff $HOME/${FOLDER}/.dir.tiff
}
###############################################

###############################################
function misc_folder_Samples()
{
FOLDER="Samples"
if [ ! -d $HOME/${FOLDER} ];then
	mkdir -p $HOME/$[FOLDER}
fi
cp $_PWD/RESOURCES/ICONS/dir_${FOLDER}.tiff $HOME/${FOLDER}/.dir.tiff
}
###############################################
