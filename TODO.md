# PiSi: TODO

## Tasks to finish PiSi: Alpha to Beta release

### Install Scripts

- [x] /etc/skel/PISI/GNUstep to be set as a User Template at the end of the desktop install
- [x] Move Wmaker and Dockapps build before all GNUstep stuff.
- [x] Move HelpViewer from Extra to the base install
- [x] Complete tests of all scripts together for the three major stages: 1_prep, 2_install_PISI (only base option) and 3_user_settings.
- [x] Extra: stable apps : review and test relevant scripts
- [x] Games: review and test relevant scripts - Added Freecell; moved to DRAFT: NeXTGo and GShisen.
- [x] A dockapp to monitor network interface: wmifs (it is for a wired connection)
- [x] Use clip for monitoring apps... => modify .xinitrc and _xinitrc template... WMState, etc.
- [x] Frameworks: added libs-steptalk (not fixing gs-WebBrowser);
- [x] Save .xinitrc to RESOURCES/_xinitrc

- [ ] Dependencies: list with commentaries managed by the install script; see and add what is about CUPS (cups-filters, cups-filters-core-drivers,printer-drivers-cups, hplip?)
- [ ] Maybe libs-webservices for the WebApps?
- [ ] better xinitrc/xsession? See plugins-sessions-windowmaker at GNUstep repo (Github) - What about DBus? Until now, the new .xinitrc seems ok.

- [ ] A dockapp/docked app to: Exit cleanly the Xsession; => update /etc/skel/GNUstep then (see wmshutdown: Hum! It only shuts down, does not perform the exit session as expected) No dockapp found. Need to create something... But issue with exit session out of WMaker
- [ ] A WebBrowser? : Netsurf and gs-WebBrowser moved to DRAFTS... => Maybe, in the meanwhile, a simple AppWrapper for Chromium?
- [ ] Update and test /etc/skel/GNUstep template with new apps docked
- [ ] Test on a new fresh clean SD card

### Testing some features / PiSi DEMO

- [ ] Alarms within SimpleAgenda
- [ ] Syncing subdirs within StepSync
- [ ] What are these GSMarkupBrowser and GSLocalizableStrings?
- [ ] MDFinder is not Finder?

#### Testing within SAMPLES

- [ ] Create a SAMPLES Folder
- [ ] Make Testing Units Log those below
- [ ] To be extended

### Misc Migrating Tools and procedures

- [ ] Target: SimpleAgenda. A way to import TODO.txt with an .ics intermediate converter.
- [ ] Target: AddressManager. A way to import a Birthday list with a .vcf intermediate converter
- [ ] Target: a GSPass (frontend to create) with Pass. A way to import from a .csv (see export of the Password Manager of Chromium; and also from KeePassXC) passwords database.
- [x] Target: AddressManager: import a .vcf directory from Abook. Test ok.
- [ ] Documentation about each procedure.

### Tools a Pi average user should look for

- [-] a Mixer: must be AlsaMixer compliant, because it is the way the sound is managed under RPI Lite OS (no PulseAudio) --> so it is DockApp: AlsaMixer.app: ok. || wmmixer-alsa ?
- [ ] Debian (RPI OS) Updater (notifying applet)
- [ ] PiSi Updater: info about a new PiSi release or an app update
- [ ] Recommended Software (easy way to install/uninstall each extra app)
- [ ] EPub reader to include within Librarian and document convert tools...
- [ ] A Password Manager Web Browser free (see Pass, it's C or in the meanwhile, a dockapp like WMpasman)

### Misc apps for a French User

- [ ] Lookup words from French Dictionaries like Littré, etc.

### Average User Documentation

- [ ] Help: should be within HelpViewer (.help/.xlp format)
- [ ] How to Login / start Workspace / halt pi400
- [ ] Customization: locales, timezone (launching and using SystemPreferences)
- [ ] How to use GWorkspace (basic operations on Files); mount/unmount a removable device...
- [ ] Setting CUPS (priting)
- [ ] Setting/Fixing AlsaMixer with an appropriate Service/daemon
- [ ] An Application Quick Tour

### Developer Documentation

- [ ] Maybe more in the Librarian app, because there are PDF tutos...
- [ ] What is GNUstep? What it is not.
- [ ] Making tools, scripting (StepTalk)
- [ ] Making an app (tutorial) with PC and Gorm


### PiSi ART

- [ ] Create a Folder to keep the original drafts for Icons and Wallpapers
- [ ] Create a Significative Wallpaper for the screenshots
- [ ] Better icon for AddressManager
- [ ] Icon for StepSync
- [ ] Better icon for InnerSpace
- [ ] Theme: maybe a new theme for PiSi? (see WindowMakerandI and Loneleymachines.org/tag/windowmaker and GNUstep theming: Rik.theme and icons-rik?) and also: apps-thematic; apps-themepreview; plugins-themes? See also ergonomy with apps-dock, apps-topbar
- [ ] Icon for PowerPaint

## Setting the Beta release

- [ ] Last whole installation from sources and testing
- [ ] Add a binary release
- [ ] Publish the binary release

### Public relations

- [ ] Inform GNUstep community
- [ ] Inform Raspberry Pi community

## New candidates to Extra apps

### Login app

- [ ] Test auto-startx  after login...
- [ ] Test Login.app provided by the Gap repo...
- [ ] Xsession compliant with freedesktop.org specs (DBus)

### Tests begun
- [ ] Weather.app (by paulodelgado at Github) - Status: build ok. First test failed. To be continued.
- [ ] WebApps: Youtube, Spotify... Maybe also, a FreeMusicArchive access?

### Apps-Wrappers

- [ ] Chromium? Depends on NetSurf success...
- [ ] FocusWriter? Depends on OpenOutliner

---

### DRAFTS

There are the failed builds, the tests before choosing, etc.

- [-] A well integrated WebBrowser (High priority) : see repo 'netsurf-gnustep' (by Anthonyc-r at Github) which embeds Netsurf 3.10: a build issue has been posted on the repo's owner. Moved to DRAFT. See there. || Alternative: gs-WebBrowser (by Onflapp at Github) embeds Chromium, it was successfully built, but the Web pages do not load... Something is missing, but not documented.
- [ ] Grr (High priority)
- [ ] NetSurf (wait for issue answer: https://github.com/anthonyc-r/netsurf-gnustep/issues/2)
- [ ] gs-webbrowser: maybe it depends on steptalk (see libs/frameworks)
- [ ] NeXTGo
- [ ] GShisen
- [ ] OpenOutliner

## Future releases

- [ ] Test PiSi on Debian Trixie (13) / RPI OS Lite Flavour
- [ ] List needed changes and evolutions for Debian 13
- [ ] Test on a Pi 500 
- [ ] List needed changes and evolutions for the Pi 500

## Garage

Maybe one day useful ?
- Changing monitor resolution: wmressel
- Changing keyboard layout: wmkeys
- App customized menu: wmmenu
- Changing the theme of WM: wmthemech
- I people does not have wired network, so Wifi is needed: wmwifi | wmwlmon



