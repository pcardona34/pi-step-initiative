# A Pi-STEP initiative
About setting a GNUstep compliant Desktop on a Raspberry Pi 400

## Abstract

Now I have more personal time, I consider to accomplish an old dream: 
setting and using a GNUstep compliant operating system on a recent and silent
(fanless) computer. 

My hardware choice is now a [Raspberry Pi 400](https://www.raspberrypi.com/products/raspberry-pi-400/specifications/) 
and my project is a kind of *Pi-STEP initiative* to develop and to share 
a desktop environment to the communities concerned: 

- GNUstep developers;
- Young learners within the [Raspberry Pi Foundation](https://www.raspberrypi.org/) project. 

It could be a showcase like is already the [LiveStep project](https://github.com/probonopd/LIVEstep) for the FreeBSD.

---

(1) See History of NeXT and OPENSTEP: 

- [French readers](https://www.levenez.com/NeXTSTEP/Historique.html)
- [OPENSTEP](https://next.fandom.com/wiki/OpenStep) 

## Several tries

For several month, I tried some great projects of integrated Desktop purposes like:

- [NEXTSPACE (by Sergii Stoian)](https://github.com/trunkmaster/nextspace)
- [GS-Desktop (by Ondrej Florian)](https://github.com/onflapp/gs-desktop) 

About those projects I have a great respect because of the work the
respective developers accomplished. And I shamelessly borrowed some 
ideas and apps from those. See the details more below.

---

## The Goal

So this is Pi-STEP initiative or how to build an OPENSTEP (1) like Desktop
 and a Learning GNUstep (2) environment on an affordable (3) hardware.

There are the Four Reasons:

### 1) NEXTSTEP, then OPENSTEP are simply the root of MacOS

If You read a tutorial for the OPENSTEP programming, 
i.e. the famous 'Currency Converter' 
([see Discovering OPENSTEP.pdf, begining from page 17](https://github.com/userLevel/next/blob/main/Discovering%20OPENSTEP.pdf))  
using NEXTSTEP/OPENSTEP tools like 'Project Builder' and 'Interface Builder',
you will discover that the same way is still available and efficient to build
an app with Apple's XCode or with the GNUstep equivalent legacy tools: 
**ProjectCenter** and **Gorm**.

### 2) GNUstep

[GNUstep](https://gnustep.github.io/) is an API and a set of libraries, Frameworks and Tools compliant with Cocoa frameworks and specifications 
 which allow a developer to create efficiently portable software 
 to Microsoft Windows, Apple MacOS and to the UNICES operating systems 
 like GNU/Linux and BSD like.

### 3) Managing the Future

To manage the Future, we should thing the way to enlarge the GNUstep 
community. Young developers may not have the money to buy yet an 
Apple MacBook, but they could buy a more affordable material 
like a Raspberry pi 400 or a pi 500. 
And there is yet a great community around the Raspberry Foundation, 
 with Teachers and Learners.

### 4) SD cards are so simple

Another great reason is because the Pi 400 / Pi 500 provides a simple way 
to change the operating system and to test a new one: 
simply change the SD card and boot with another system, that is so simple.

---

## Steps to follow

1) Building a consistent Desktop on the Pi 400 hardware: the average user should find there some familiar commodities like a software updater, etc.

2) Adding significative apps for the user experience and tools for the 
Developper: there are together a Showcase and a Workshop.

3) Providing a finalized easy install script to build and setup the Desktop.

4) Adding tutorials targeting the learning community of the Raspberry Pi 
 Foundation.

---

## The PiSi Desktop

### Screenshots

![Screenshot: release 0.1-alpha](./Screenshot/Screenshot_V01_mini.jpg)
[Magnify](./Screenshots/Screenshot_V01.jpg)

**On the screen** (above)
- The Workspace manager (GWorkspace) with its background layer (Raspberry Pi logo) and two FileManager windows in IconView mode: on the shelf, the shortlinks to the User's 'Home' Folder and to the 'Applications' Folder.
- SimpleAgenda (third window to the right)
- On the bottom: appicon of Screeshot and miniwindow of the Terminal (miniaturized).
- On the right border: the Dock of Window Maker (Window Manager) with the PiSi logo, some dockapps: 
-- WMClock (date and time like in NeXT)
-- TimeMon (CPU load)
- And some docked apps:
-- GWorkspace, TextEdit, SimpleAgenda, GNUMail, Terminal and Affiche (sticky notes).
- On the right bottom, the Recycler.

### So, what is the Pi-Step Initiative Desktop?

#### Brief

- PiSi means: Pi (Raspberry Pi) S(tep) i(nitiative). 
- With PiSi, I am trying to build a modern and consistent GNUstep environment 
from the latest sources and on the Debian Raspberry OS Lite.
- It is my own answer to the Pi-Step Initiative project. 
- **CAUTION!!!** This try is still at Alpha stage... You have been warned.
- Read 'INSTALL' to know how to build PiSi from the sources and the 'RELEASE' 
file to know exactly the apps and tools provided.
- **Release/Status**: 0.1-alpha.

#### To understand the way and the matter

This is a Desktop built from the latest sources of WindowMaker and the 
GNUstep environment. Although it is on Debian OS Lite, it does not
use any deb package of GNUstep nor of WindowMaker, because those are 
often outdated. So all of those are fetched out of the Debian apt repo
and built from their own respective sources, mostly from Github or Savannah.

It has been first tested on and conceived for the Raspberry Pi 400 (not yet tested on a Pi500: if you did, so let me know) and with 
an HD monitor connected at the HDMI port (my current resolution is 1920x1080).

I am using a wired network connection, so I do not care about WiFi. If you need it, use the native RPI CLI tools to get a working connection.
This is mandatory, because we need to download many things to go on.

Do not be afraid about building: all is made by the scripts provided within this repo.
Those scripts will do the following steps:

- Preparing the environment: fetching and installing dependencies on Debian.
- Fetching and building every piece of software: libs, frameworks and applications.
- Setting the User profile.

### What are the major components

PiSi Desktop is built on top of Raspberry Pi OS Lite release: 
it is now Debian Bookworm 12. Not yet tested on Trixie.

- Window Manager: Window Maker 0.96.0
- GNUstep has been built with Clang 19, ARC enabled and Grand Central Dispatch.
- Workspace: GWorkspace and Recycler: 1.1.0 (02 2025)
- Theme: Heritage (by Elegoet and Riccardo Mottola)


### Applications, DevTools, Utilities and Games

There are a plenty of those.
So read the complete list in the file 'RELEASE'.

A strategic choice is the WebBrowser, because it must be well integrated witihin the Desktop ecosystem: until now, no defintive choice between gs-WebBrower (by Onflapp upon chromium) and Netsurf-GNUstep by (Anthony R-C, upon, you gess it: Netsurf)

### What it seems

- Look at the folder named 'SCREENSHOTS' to get some views.

## How to install

Read 'INSTALL' file.

## Launch the Desktop and enjoy

When the installation will be achieved, you will be able to launch PiSi:

	cd && startx


## CAUTION!

Until now, there is no display manager nor graphic login.
!!! **DO NOT** install **wdm** session manager, because the WINGS dependencies
 would conflict with those already installed by PiSi.

# PiSi POST-INSTALL Documentation (TODO)

After PiSi Desktop has been installed on your Pi, several settings must be set...
This will be documented, maybe within the native HelpViewer.
This help should concern:

- Printing and Scanning ;
- Managing Removable Devices;
- Using the Workspace (i.e. GWorkspace...)
- Configuring the Mail User Agent (i.e. GNUMail)
- Using the Developer Tools and Apps (ProjectCenter, Gorm)
...

---

## Diary of the previous tries: the first and second steps together

Before making my own desktop (see PiSi above) I played with two major
projects, which inspired me and which you also might try.

### 1) NEXTSPACE

[NEXTSPACE](https://github.com/trunkmaster/nextspace) (by Sergii Stoian, 'Trunkmaster' at Github)

- Sergii Stoian is a very implicated and reactive developer, 
historic member of the GNUstep community.
- His goal is to make an exact clone of the legendary NeXTstep/OPENSTEP Operating System. 
So he decided to develop all the needed master pieces like the Workspace, 
 and to modify accordingly the window manager (renewed code from Window Maker).
- I was able to build many GNUstep apps to add on it.:
see the repo [apps-within-nextspace](https://github.com/pcardona34/apps-within-nextspace).
- But some issues related to the Pi 400 prevented me until now 
to adopt this project for a daily use</s>: [see the details of the issues](https://github.com/trunkmaster/nextspace/issues).
- And it happened also, while talking about a clean, modern and consistent 
 GNUstep environment in the GNUstep Discuss list that some choices 
 of the NEXTSPACE project were controversed: like the ART backend 
 (VS the Cairo one, because the last is the default on Debian).
- You should give it a try and I frequently use it to see how
it is going on.

### 2) GSDE

[GS-Desktop](https://github.com/onflapp/gs-desktop) (by Ondrej Florian, 'Onflapp' at Github)

- Onflapp was inspired by NEXSTSPACE (see above) but he chose to use more classic pieces of software like GWorkspace and the 
 classic Window Maker as I do myself, and he added many useful little apps and services which all together provide a smart experience. It provides more apps
than within NEXTSPACE. The much significative is WebBrowser, which embeds
Chromium and makes it well integrated within GSDE.
- I was also able to build many other GNUstep apps within it: 
 see the repo [apps-within-gsde]<https://github.com/pcardona34/apps-within-gsde>.
- So, if you want to try a more effective Desktop experience, you should
really try GSDE.


### 3) And the other projects?

Unfortunately, those seems to die or are outdated:
- 'Étoilé' seems a Sleeping Princess for eleven years: latest post on their site is dated from 2014.
- 'Backbone' does not build: code oviously outdated. We can fortunately find the master pieces like SystemPreferences, Terminal or TexTEdit elsewhere.

---

## A Brief Conclusion

Well, if you want to try the GNUstep experience on a Raspberry Pi 400, you already have three possible ways:
- NEXTSPACE: see <https://github.com/trunkmaster/nextspace>, still active development.
- GSDE: see <https://github.com/onflapp/gs-desktop>, maybe the more accomplished yet.
- PISI: my work in progress in this repository... See all Above...

So try and enjoy !
