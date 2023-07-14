# Credit: pwnsdx https://gist.github.com/pwnsdx/1217727ca57de2dd2a372afdd7a0fc21; nebular https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3#gistcomment-3019082

#https://gist.github.com/b0gdanw/b6fe449407465ddd6f2a657d71e1345c

# IMPORTANT: Don't forget to logout from your Apple ID in the settings before running it!
# IMPORTANT: You will need to disable SIP: Reboot to Recovery, in Terminal csrutil disable

# WARNING: It might disable things that you may not like. Please double check the services in the TODISABLE vars.

# Get active services: launchctl list | grep -v "\-\t0"
# Find a service: grep -lR [service] /System/Library/Launch* /Library/Launch* ~/Library/LaunchAgents
# List disabled services: launchctl print-disabled user/501 |grep true & launchctl print-disabled system |grep true

# Agents to disable
# 'com.apple.speech.speechdatainstallerd' 'com.apple.speech.speechsynthesisd' 'com.apple.speech.synthesisserver' will freeze Edit menus
# 'com.apple.bird' will prevent saving prompt from being shown
# 'com.apple.imklaunchagent' is not related to iMessage
# 'com.apple.WebKit.PluginAgent' can cause video problems in Safari

TODISABLE=()

# iCloud
TODISABLE+=('com.apple.security.cloudkeychainproxy3' \
	'com.apple.iCloudUserNotifications' \
	'com.apple.icloud.findmydeviced.findmydevice-user-agent' \
	'com.apple.icloud.fmfd' \
	'com.apple.icloud.searchpartyuseragent' \
	'com.apple.cloudd' \
	'com.apple.cloudpaird' \
	'com.apple.cloudphotod' \
	'com.apple.followupd' \
	'com.apple.protectedcloudstorage.protectedcloudkeysyncing')

# Safari useless stuff
TODISABLE+=('com.apple.SafariBookmarksSyncAgent' \
	'com.apple.SafariCloudHistoryPushAgent')

# iMessage / Facetime
TODISABLE+=('com.apple.imagent' \
	'com.apple.imautomatichistorydeletionagent' \
	'com.apple.imtransferagent' \
	'com.apple.avconferenced')

# Game Center / Passbook / Apple TV / Homekit...
TODISABLE+=('com.apple.gamed' \
	'com.apple.passd' \
	'com.apple.Maps.pushdaemon' \
	'com.apple.videosubscriptionsd' \
	'com.apple.CommCenter-osx' \
	'com.apple.homed')

# Ad-related
TODISABLE+=('com.apple.ap.adprivacyd' \
	'com.apple.ap.adservicesd')

# Screensharing
TODISABLE+=('com.apple.screensharing.MessagesAgent' \
	'com.apple.screensharing.agent' \
	'com.apple.screensharing.menuextra')

# Siri
TODISABLE+=('com.apple.siriknowledged' \
	'com.apple.assistant_service' \
	'com.apple.assistantd' \
	'com.apple.Siri.agent' \
	'com.apple.knowledge-agent' \
	'com.apple.parsec-fbf')

# VoiceOver / accessibility-related stuff
TODISABLE+=('com.apple.VoiceOver' \
	'com.apple.voicememod' \
	'com.apple.accessibility.AXVisualSupportAgent' \
	'com.apple.accessibility.dfrhud' \
	'com.apple.accessibility.heard')

# Quicklook
#TODISABLE+=('com.apple.quicklook.ui.helper' \
#	'com.apple.quicklook.ThumbnailsAgent' \
#	'com.apple.quicklook')

# Sidecar
TODISABLE+=('com.apple.sidecar-hid-relay' \
	'com.apple.sidecar-relay')

# Debugging process
TODISABLE+=('com.apple.spindump_agent' \
	'com.apple.ReportCrash' \
	'com.apple.ReportGPURestart' \
	'com.apple.ReportPanic' \
	'com.apple.DiagnosticReportCleanup' \
	'com.apple.diagnostics_agent' \
	'com.apple.TrustEvaluationAgent')
	
# Screentime
TODISABLE+=('com.apple.ScreenTimeAgent' \
	'com.apple.UsageTrackingAgent')

# Location
TODISABLE+=('com.apple.routined')

# MotionTrackingAgent
TODISABLE+=('com.apple.accessibility.MotionTrackingAgent')

# Photos
TODISABLE+=('com.apple.photolibraryd' \
	'com.apple.mediastream.mstreamd' \
	'com.apple.photoanalysisd')

# Phone Call Handoff
TODISABLE+=('com.apple.rapportd-user')

# Keyboard services
# TODISABLE+=('com.apple.keyboardservicesd' \
#	'com.apple.KeyboardAccessAgent')

# Calendar
TODISABLE+=('com.apple.CalendarAgent')

# Contacts
TODISABLE+=('com.apple.AddressBook.AssistantService' \
	'com.apple.AddressBook.SourceSync' \
	'com.apple.ContactsAgent' \
	'com.apple.contacts.donation-agent' \
	'com.apple.AddressBook.ContactsAccountsService')

# EjectGPU
TODISABLE+=('com.apple.SafeEjectGPUAgent')

# Wi-Fi
TODISABLE+=('com.apple.wifi.WiFiAgent' \
	'com.apple.WiFiVelocityAgent')

# Others
TODISABLE+=('com.apple.telephonyutilities.callservicesd' \
	'com.apple.parsecd' \
	'com.apple.AOSPushRelay' \
	'com.apple.AOSHeartbeat' \
	'com.apple.AMPArtworkAgent' \
	'com.apple.AirPlayUIAgent' \
	'com.apple.AirPortBaseStationAgent' \
	'com.apple.familycircled' \
	'com.apple.familycontrols.useragent' \
	'com.apple.familynotificationd' \
	'com.apple.findmymacmessenger' \
	'com.apple.sharingd' \
	'com.apple.identityservicesd' \
	'com.apple.java.InstallOnDemand' \
	'com.apple.parentalcontrols.check' \
	'com.apple.security.keychain-circle-notification' \
	'com.apple.syncdefaultsd' \
	'com.apple.appleseed.seedusaged' \
	'com.apple.appleseed.seedusaged.postinstall' \
	'com.apple.CallHistorySyncHelper' \
	'com.apple.RemoteDesktop' \
	'com.apple.CallHistoryPluginHelper' \
	'com.apple.SocialPushAgent' \
	'com.apple.touristd' \
	'com.apple.macos.studentd' \
	'com.apple.exchange.exchangesyncd' \
	'com.apple.suggestd' \
	'com.apple.AddressBook.abd' \
	'com.apple.helpd' \
	'com.apple.amp.mediasharingd' \
	'com.apple.progressd' \
	'com.apple.mediaanalysisd' \
	'com.apple.remindd')


# more
TODISABLE+=('com.apple.eospreflightagent' \
	'com.apple.ExpansionSlotNotification' \
	'com.apple.knowledge-agent' \
	'com.apple.MemorySlotNotification')

# Mounting system as writable
#sudo mount -wu /

# Create backup folders
[ -d ~/DisabledLaunchAgents ] || mkdir ~/DisabledLaunchAgents
[ -d ~/DisabledLaunchDaemons ] || mkdir ~/DisabledLaunchDaemons

for agent in "${TODISABLE[@]}"
do
  [ -f /System/Library/LaunchAgents/${agent}.plist ] && {
 	echo "Agent ${agent} exists, disabling" 
        sudo launchctl load -wF /System/Library/LaunchAgents/${agent}.plist
        launchctl load -wF /System/Library/LaunchAgents/${agent}.plist
#	mv /System/Library/LaunchAgents/${agent}.plist ~/DisabledLaunchAgents/${agent}.plist
	echo "[OK] Agent ${agent} disabled"
  } || {
 	echo "! Agent ${agent} does not exist" 
  }
done

# Daemons to disable
TODISABLE=()

# iCloud
TODISABLE+=('com.apple.analyticsd' \
	'com.apple.icloud.findmydeviced' \
	'com.apple.icloud.searchpartyd')

# SystemStats
TODISABLE+=('com.apple.systemstats.analysis' \
	'com.apple.systemstats.daily' \
	'com.apple.systemstats.microstackshot_periodic')

# Phone Call Handoff
TODISABLE+=('com.apple.rapportd')

# SafeEjectGPU
TODISABLE+=('com.apple.SafeEjectGPUStartupDaemon')

# Time Machine
TODISABLE+=('com.apple.backupd-helper' \
	'com.apple.backupd')

# Wi-Fi
 TODISABLE+=('com.apple.wifiFirmwareLoader' \
	'com.apple.wifip2pd' \
	'com.apple.wifivelocityd' \
	'com.apple.diagnosticextensions.osx.wifi.helper')

# Others
TODISABLE+=('com.apple.netbiosd' \
	'com.apple.preferences.timezone.admintool' \
	'com.apple.remotepairtool' \
	'com.apple.security.FDERecoveryAgent' \
	'com.apple.SubmitDiagInfo' \
	'com.apple.screensharing' \
	'com.apple.appleseed.fbahelperd' \
	'com.apple.ManagedClient.cloudconfigurationd' \
	'com.apple.locate' \
	'com.apple.locationd' \
	'com.apple.eapolcfg_auth' \
	'com.apple.airportd' \
	'com.apple.airport.wps' \
	'com.apple.RemoteDesktop.PrivilegeProxy')

for daemon in "${TODISABLE[@]}"
do
  [ -f /System/Library/LaunchDaemons/${daemon}.plist ] && {
 	echo "- Daemon ${daemon} exists, disabling" 
        sudo launchctl load -wF /System/Library/LaunchDaemons/${daemon}.plist
        launchctl load -wF /System/Library/LaunchDaemons/${daemon}.plist
#	mv /System/Library/LaunchDaemons/${daemon}.plist ~/DisabledLaunchDaemons/${daemon}.plist
	echo "[OK] Daemon ${daemon} disabled"
  } || {
 	echo "! Daemon ${daemon} does not exist" 
  }

done
