#!/bin/bash
# 101109, nate@tsp
# disable the pgp launcher if the dummy receipt exists

if [[ -e /Library/Receipts/com.adullmoment.pgp_engine_started ]]; then
	/bin/launchctl unload -w /Library/LaunchDaemons/com.adullmoment.pgpstartup.plist
	/usr/bin/touch /Library/Receipts/com.adullmoment.pgp_engine_stopped
	else
	/usr/bin/logger -t pgpchecker "nothing to do. exiting..."
	exit 1
fi
exit 0