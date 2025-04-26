# A Pi-STEP initiative
About setting a compliant OPENSTEP Desktop on a RPI Pi 400

## Abstract

Now I have more personal time, I consider to accomplish an old dream: setting and using a OPENSTEP like operating system: see History of NeXT and OPENSTEP: [French readers](https://www.levenez.com/NeXTSTEP/Historique.html) or there: [OPENSTEP](https://next.fandom.com/wiki/OpenStep) - on a recent and silent (fanless) computer. My hardware choice is now a [Raspberry Pi 400](https://www.raspberrypi.com/products/raspberry-pi-400/specifications/) and my project is a kind of Pi-STEP initiative to develop and to share a bootable SD card image of that OS with Desktop to the communities concerned: GNUstep developers and also young learners within the [Raspberry Pi Foundation](https://www.raspberrypi.org/) project. It could be a showcase like is already the [LiveStep project](https://github.com/probonopd/LIVEstep) for the FreeBSD.

For several month, I tried some great projects of integrated Desktop purposes like [NEXTSPACE (by Sergii Stoian)](https://github.com/trunkmaster/nextspace) and [GS-Desktop (by Ondrej Florian)](https://github.com/onflapp/gs-desktop) about those projects I have a great respect because of the work they accomplished.

But until now, I am not satisfied...

---

## The Goal

So a Pi-STEP initiative or how to build an OPENSTEP (1) like Desktop and a Learning GNUstep (2) environment on an affordable (3) material.

There are the three reasons:

1) NEXTSTEP, then OPENSTEP are simply the root of MacOS. If You read a tutorial for the NEXTSTEP programming, i.e. the famous 'Currency Converter' ([see Discovering OPENSTEP.pdf, begining from page 17](https://github.com/userLevel/next/blob/main/Discovering%20OPENSTEP.pdf)) using NEXTSTEP/OPENSTEP tools like 'Project Builder' and 'Interface Builder', You will discover that the same way is still available and efficient to build an app with Apple's XCode or with the GNUstep equivalent legacy tools: ProjectCenter and Gorm.

2) [GNUstep](https://gnustep.github.io/) is a set of libraries, frameworks and tools compliant with OPENSTEP/Cocoa frameworks and specifications which allow a developer to create efficiently portable software to Microsoft Windows, Apple MacOS and to the UNICES operating systems like GNU/Linux and BSD like.

3) To manage the Future, we should thing the way to enlarge the GNUstep community. Young developers may not have the money to buy yet an Apple MacBook, but they could buy a more affordable material like a Raspberry pi 400 or a pi 500. And there is yet a great community around the Raspberry Foundation, with Teachers and Learners. Another great reason is because the pi 400 provide a simple way to change the operating system and to test a new one: simply change the SD card and boot with another system, that is so simple.

---

## Steps to follow

1) Building a consistent OS/Desktop compliant with the OPENSTEP specifications and pi 400 hardware: the average user should find there some familiar commodities like a software updater, etc.

2) Adding significative apps for the user experience and tools for the Developper: this is together a Showcase and a Workshop.

3) Providing a finalized SD card image to copy and to boot on.

4) Adding tutorials targeting the learning community of the Raspberry Pi Foundation.

## Diary of tries: the first and second steps together

### 1) NEXTSPACE (by Sergii Stoian, Trunkmaster at Github)

- Sergii Stoian is a very implicated and reactive developer, historic member of the GNUstep community. He decided to develop all the needed master pieces like the Workspace, and to modify accordingly the window manager (renewed code from Window Maker). But some persistent issues related to the pi 400 prevent me until now to adopt its project for a daily use:

  a) Lost keyboard input within the non GNUstep native X11 applications (like chromium browser, xedit, etc.) when you change the keyboard layout: default layout is English qwerty, mine is French azerty, with oss variant.
  b) Flickering display when you select the HD mode (1080p is unfortunately turned to 1080i: interlaced) : so you must downgrade to a lower resolution.

- Although I can't yet adopt it for the above reasons, I was also able to build many GNUstep apps to add on it.: see the repo <https://github.com/pcardona34/apps-within-nextspace>.

### 2) GS-Desktop (by Ondrej Florian, Onflapp at Github)
   
- Onflapp uses more classic pieces of software like GWorkspace and the classic Window Maker, and he added many useful little apps and services which provide a smart experience. 
- I was also able to build many other GNUstep apps: see the repo <https://github.com/pcardona34/apps-within-gsde>.

- But it seems the way GNUstep was built is not up to date: no arc nor clang. So I am guessing about this choice to provide a modern GNUstep environment.

---

## Draft: Thoughts and Hypothesis, things and actions not yet planned

### Maybe GNUstep on a BSD/UNIX OS ?

1) OpenBSD:

- Source info: <https://mediawiki.gnustep.org/index.php/Platform:BSD#OpenBSD>

- Command:
```
sudo pkg_add -i gnustep-desktop
````

- Comment from the same site above:
> 'Above command will install the meta package, and all the packages from the x11/gnustep part of the ports tree.'

So I was gusessing if this meta-port could fetch the latest GNUstep environment and build it...

But, while retrieving <https://www.openbsd.org/cgi-bin/cvsweb/ports/x11/gnustep/>

The server responded:

> 410 Gone
> OpenBSD httpd

Hum! Apart on GNU/Linux, are any BSD concerned with an up to date way to install GNUstep ?
Maybe FreeBSD ?


