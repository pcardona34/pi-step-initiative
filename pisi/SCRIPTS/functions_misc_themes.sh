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
### Functions for Misc Themes
################################

function update_info()
{
cd $PWD/RESOURCES/INFOS
for INFO in Info-gnustep.plist_*
do
	printf "Updating ${INFO#Info-gnustep.plist_}...\n"
	if [ -d ${LOCAL_INSTALL_DIR}/${INFO#Info-gnustep.plist_}.app/Resources ]; then
		TARGET=${LOCAL_INSTALL_DIR}/${INFO#Info-gnustep.plist_}.app/Resources/Info-gnustep.plist
		cp --force ${INFO} ${TARGET}
		ok "Done"
	else
		alert "$TARGET was not found"
		exit 1
	fi	
done
}