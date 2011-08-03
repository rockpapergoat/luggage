#!/bin/bash
# 110111, nate@tsp, first boot script
# 110412, increased sleep line to 10 after network detect
#
# variables
serial=`/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Serial Number/ {print $NF}'`
kickstart="/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart"
systemsetup="/usr/sbin/systemsetup"
defaults="/usr/bin/defaults"
scutil="/usr/sbin/scutil"

# discover new hardware
/bin/sleep 2
/usr/sbin/networksetup -detectnewhardware
# sleep here a bit to ensure the network hardware is up and grabs an address
#/bin/sleep 10
#/usr/bin/say `/usr/sbin/networksetup -getinfo Ethernet | /usr/bin/awk '/IP address: [0-9](3)*/'`
# start ssh
$systemsetup -setremotelogin on
# add admin group to ssh access group
/usr/sbin/dseditgroup -o edit -a admin -t group com.apple.access_ssh
# Set to use ntp
$systemsetup -settimezone America/New_York
$systemsetup -setusingnetworktime on
$systemsetup -setnetworktimeserver 0.pool.ntp.org
/usr/sbin/ntpdate -bvs 0.pool.ntp.org
# wake on lan
$systemsetup -setwakeonnetworkaccess on
# enable ARD for admin
$kickstart -configure -allowAccessFor -specifiedUsers
$kickstart -activate -configure -access -on -users "admin" -privs -all -restart -agent
# no sleepy-sleep
/usr/bin/pmset sleep 0
# hide 500 users
$defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES
# hide wgbh admin users
$defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add admin
# enable journaling if not already
/usr/sbin/diskutil enableJournal /
# run any other items stored on the casper server itself
#/bin/bash -c "`/usr/bin/curl -s http://server.example.com/start.sh`"


# announce completion
/usr/bin/say "firstboot configuration complete"
/usr/bin/say "($basename $0) finished in $SECONDS seconds"
/usr/bin/say "($basename $0) finished in " $(($SECONDS / 60)) "minutes"
# disable this script + launchdaemon
$defaults write /Library/LaunchDaemons/com.example.firstboot Disabled -bool true
/bin/mv -v $0 /Library/LaunchDaemons/com.example.firstboot.plist /var/root/

# remove the script, if required
#/bin/rm $0
