#!/bin/sh

### OS query ##
OS_ID=`cat /etc/os-release | grep -E ^ID | awk -F= '{print $2}'`

# Dependencies
if [ ${OS_ID}=="debian" ];then
	PMGR="apt"
else
	printf "\nSorry: Your Operating System is not yet supported.\n"
	exit 1
fi

sudo ${PMGR} install cups cups-filters hplip hplip-gui -y

# ...
