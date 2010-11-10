#!/bin/bash
# 100727, nate@tsp
# wait some random amount of seconds, then run sophos with desired options
#
seconds=$(( (RANDOM%60)*8 ))
/bin/sleep $seconds
/usr/bin/sweep -di --quarantine -sc -s -all -rec -ss --reset-atime --stop-scan --follow-symlinks --stay-on-machine --backtrack-protection --preserve-backtrack /
exit 0