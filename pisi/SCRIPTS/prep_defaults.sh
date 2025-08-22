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
### Prep defaults...
################################

_PWD=`pwd`

cd $_PWD/SCRIPTS || exit 1

if [ "$USER" == "patrick" ];then
	### Default user...
	cp --force set_defaults_DRAFT set_defaults.sh
else
	cat set_defaults_DRAFT | sed -e s/patrick/$USER/g > set_defaults.sh
fi

cd $_PWD
