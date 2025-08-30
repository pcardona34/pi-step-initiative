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
### desc...
################################

#############################################
### Howto
### To use this function, you need to set
### some vars in the caller script:
### global: SPIN='/-\|'
### before any call: put the long process to bg
### with '&' and then set PID=$!
#############################################

#############################################
### Spinner
function spinner()
{
i=1
echo -n ' '
while [ -d /proc/$PID ]
do
	sleep 0.2
	printf "\b${SPIN:i++%${#SPIN}:1}"
done
}
### End of Spinner
#############################################

