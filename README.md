# A Pi-STEP initiative (PiSi)

## Abstract

- Setting a GNUstep compliant Desktop on a Raspberry Pi 400.
- **Release/Status**: 0.1-alpha.
- The Operating System is Raspberry Pi OS Lite, itself based on Debian Bookworm, i.e. 12: Trixie not tried yet.

## Detailed goals and targets

### Hardware choice

It is a [Raspberry Pi 400](https://www.raspberrypi.com/products/raspberry-pi-400/specifications/) because it is an affordable and well known hardware. It provides a simple way 
to change the operating system and to test another one by changing the SD card and booting this another system! What functions on my Pi 400 must function on all.

### Audience

The targets of the project are two communities concerned: 

- The *GNUsteppers*: Users and Developers of the [GNUstep project](https://www.gnustep.org/);
- The *Young Learners* within the [Raspberry Pi Foundation](https://www.raspberrypi.org/) project. there is yet a great community around the Raspberry Foundation,  with Teachers and Learners. 

## Method

1) Building a consistent Desktop on the Pi 400 hardware: the average user should find there some familiar commodities like a Workspace (Desktop, FileManager, Dock) and also tools like a software updater, notifications and system monitoring...

2) Adding significant apps from GNUstep for the user experience and tools for the Developper: there are together a Showcase and a Workshop. See below.

3) Providing a finalized set of easy install scripts to build and setup the Desktop.

Until now, steps 1 to 3 are mostly done.

4) Adding tutorials targeting the learning community of the Raspberry Pi 
 Foundation and new GNUstep incoming developers: to do.

---

## The PiSi Desktop

### Firt Screenshots of the current release

![With the Home Directory](./Screenshots/Screenshot_V01_Home_mini.jpg)
[Magnify](./Screenshots/Screenshot_V01_Home.jpg)

![With the Applications Directory](./Screenshots/Screenshot_V01_Apps_mini.jpg)
[Magnify](./Screenshots/Screenshot_V01_Apps.jpg)

### PiSi Components as Brief

- PiSi provides a set of Bash Scripts to fetch, build, install and customize the whole Desktop.
- The GNUstep environment is built from the latest sources of the Libraries, Tools and Apps: unlike some other great projects like NEXTSPACE and GS-Desktop, I am using legacy Window Maker and GWorkspace...
- PiSi provides its original Themes: 'PISI.theme' for GNUstep and 'PISI.themed' for Window Maker. I tried to give a strong GNUstep identity (vertical menus and Dock) but with customized colors and modern icons. Most of these icons were adapted from the [Papirus Iconset project](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme). Several are my own work as the WallPaper too.
- The Monitoring board on the Desktop is using [Conky](https://github.com/brndnmtthws/conky).
- Read the [RELEASE](./pisi/RESOURCES/RELEASE] file to get the complete and detailed list of the components and Apps provided.

### How to install

- Read the [INSTALL](./pisi/INSTALL) guide to know how to fetch and build PiSi.

## Thanks and Tributes

This project is a little piece amount the great work of a community for decades. I would thanks the people who kindly answered my newbie questions on the GNUstep Discuss List. I was also inspired by the theming works of Bertrand Deconinck. I also used some apps from the GS-Desktop project by Florian Ondrej (alias Onflapp on Github).

