#!/usr/bin/env bash
# 100713, nate@tsp
# quick & dirty one-liner to check DN
host=`grep -A1 "m[d-l]-" /Library/Preferences/DirectoryService/ActiveDirectory.plist | head -n 1| sed -e 's/<[^<]*>/ /g'| tr -d "[:space:]"`
dscl /Search -read /Computers/$host | grep -i -A1 dn: