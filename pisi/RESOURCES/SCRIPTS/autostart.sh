#!/bin/bash

### TODO: ajouter lien vers TimeMon dans /usr/local/bin ...

function get_args()
{
PARAM="$1"
case "$PARAM" in
	"wmclock")
	echo "-24 -led green -exe /usr/local/lib/GNUstep/Applications/Utilities/SystemPreferences.app/SystemPreferences";;
	"*")
	echo " ";;
esac
}

function runapp()
{
pgrep "$1" >/dev/null
if [ $? -eq 0 ];then
	echo "Already running"
else
	ARGS=$(get_args "$1")
	eval "/usr/local/bin/$1 $ARGS" &
fi
}

for APP in "wmclock" "TimeMon"
do
	runapp "${APP}"
done
