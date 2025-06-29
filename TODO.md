# PiSi: TODO

## Tasks to finish PiSi (Alpha to Beta release)

### Install Scripts

- [x] /etc/skel/GNUstep to be set as a User Template at the end of the desktop install
- [ ] Update and test /etc/skel/GNUstep template with new apps docked
- [-] A well integrated WebBrowser: see repo 'netsurf-gnustep' (by Anthonyc-r at Github) which embeds Netsurf 3.10: a build issue has been posted on the repo's owner.
- [ ] A dockapp/docked app to: Exit cleanly the Xsession; => update /etc/skel/GNUstep then (see wmshutdown-1.6.tar.gz)
- [ ] Move HelpViewer from Extra to the base install
- [ ] Extra: stable apps and Games: review and test relevant scripts
- [ ] Complete tests of all scripts together for the three major stages
- [ ] Dependencies: list with commentaries managed by the install script
- [ ] Frameworks: to add/test: libs-steptalk; maybe libs-webservices for the WebApps?
- [ ] Complete install on a new SD card
- [ ] better xinitrc/xsession? See plugins-sessions-windowmaker at GNUstep repo (Github) - What about DBus?

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

- [x] a Mixer: must be AlsaMixer compliant, because it is the way the sound is managed under RPI Lite OS (no PulseAudio) --> so it is DockApp: AlsaMixer.app: ok.
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

## Public relations

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

### Failed to build/Run... retry

- [ ] Grr (High priority)
- [ ] NeXTGo
- [ ] GShisen
- [ ] OpenOutliner

## Future releases

- [ ] Test PiSi on Debian Trixie (13) / RPI OS Lite Flavour
- [ ] List needed changes and evolutions for Debian 13
- [ ] Test on a Pi 500 
- [ ] List needed changes and evolutions for the Pi 500



