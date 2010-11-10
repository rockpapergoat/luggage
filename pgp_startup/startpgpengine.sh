#!/bin/bash
# 101109, nate@tsp
# run pgp engine on launch
/usr/bin/open "/Library/Application Support/PGP/PGP Engine.app"
# leave a crumb behind...
/usr/bin/touch /Library/Receipts/com.adullmoment.pgp_engine_started
exit 0
