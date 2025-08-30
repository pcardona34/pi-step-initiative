# PiSi-Updater

This is PiSiN-Updater, an applet for the [PiSiN Desktop](https://github.com/pcardona34/pi-step-initiative).
It checks if an update is available (until now, only for the OS Debian)
and then notify it via the standard `notify-send' command.

## Prerequisite

- The 'Dunst' notifyer deamon has been loaded within the Xsession: this is 
already done if you yet installed PiSiN Desktop.

## Installing

- To add the tool script to your 'autostart' script within WindowMaker, 
just execute:

````
./install_pisin_updater.sh
````
