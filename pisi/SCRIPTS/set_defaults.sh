#!/bin/bash

### Set the defaults
### for a PiSi Desktop

## Theming and ergonomy

### Applying a theme for GNUstep:

#### Syntax: defaults write NSGlobalDomain GSTheme THEME-NAME
#### (in our case: THEME-NAME is 'PISI')
defaults write NSGlobalDomain GSTheme 'PISI'

### Applying a theme for WMaker:

#### Syntax: setstyle THEME-PACK
#### (in our case: THEME-PACK is 'PISI')
setstyle --no-cursors --no-fonts $HOME/GNUstep/Library/WindowMaker/Themes/PISI.themed

#### Dock
### Modern Dock look (transparency)
defaults write org.gnustep.GWorkspace dockstyle 1
### Dock to the left
defaults write org.gnustep.GWorkspace dockposition 0
### Single click to launch an app from the Dock
defaults write org.gnustep.GWorkspace singleclicklaunch 1

### GNUMail colors tweaking with PISI Theme
defaults write org.gnustep.GNUMail QUOTE_COLOR_LEVEL_1 '0.166774 0.400093 1.000000'
defaults write org.gnustep.GNUMail QUOTE_COLOR_LEVEL_2 '1.000000 0.214640 0.543376'
defaults write org.gnustep.GNUMail QUOTE_COLOR_LEVEL_3 '0.000000 1.000000 0.000000'
defaults write org.gnustep.GNUMail QUOTE_COLOR_LEVEL_4 '0.000000 1.000000 1.000000'
defaults write org.gnustep.GNUMail MAILHEADERCELL_COLOR '0.619370 0.619370 0.897638'

### Terminal to use with GWorkspace is Terminal.app and its services
defaults write org.gnustep.GWorkspace terminal_services 1

### Show the desktop background of GW
defaults write org.gnustep.GWorkspace no_desktop 0

### Set TextEdit as default Editor
defaults write org.gnustep.GWorkspace defaulteditor TextEdit.app

### Apps on the Dock
defaults write org.gnustep.GWorkspace applications '{ 1 = TextEdit; 2 = SimpleAgenda; 3 = Terminal; 4 = GNUMail; 5 = InnerSpace; }'

### Desktop appearance: imagepath sets the wallpaper
defaults write org.gnustep.GWorkspace desktopinfo '{ backcolor = { alpha = 1; blue = 0; green = 0; red = 0; }; "fsn_info_type" = 0; iconposition = 5; iconsize = 48; imagepath = "/home/patrick/GNUstep/Library/WindowMaker/Backgrounds/wp_pi_step_initiative.png"; imagestyle = 1; indexes = { }; labeltxtsize = 12; usebackimage = 1; }'

### Filemanager: hide dotFiles
defaults write NSGlobalDomain GSFileBrowserHideDotFiles 1

### Terminal: unicode setting
defaults write org.gap.Terminal Linux_CharacterSet utf-8

### AddressManager: name format
defaults write Addresses ScreenNameFormat FirstNameFirst
