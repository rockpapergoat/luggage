#!/bin/bash
# 110429, nate@tsp
# lock the screen, sleep a bit, kill the lock

# we don't need to define a lockImage if we first copy the lock image to
# /Library/Preferences/Lock Screen Image.
/System/Library/CoreServices/RemoteManagement/AppleVNCServer.bundle/Contents/Support/LockScreen.app/Contents/MacOS/LockScreen -session 256 -msgHex 506c656173652077616974207768696c65207570646174657320696e7374616c6c2e0a596f7572206d616368696e652077696c6c207265626f6f74206175746f6d61746963616c6c792e & #-lockImage

# lockscreen goes into the background, we sleep for a time, then kill the lock
sleep 15

/usr/bin/killall LockScreen

# for actual installs, we may just want to skip terminating the lock at the end
# and instead rely on the reboot to clear it.
exit 0