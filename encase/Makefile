#
#   Copyright 2009 Joe Block <jpb@ApesSeekingKnowledge.net>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# 

include /usr/local/share/luggage/luggage.make

TITLE=encase
PACKAGE_VERSION=6.17.0.75
REVERSE_DOMAIN=com.guidancesoftware
PAYLOAD= \
	pack-usr-local-sbin-enosxintel\
	pack-encase-startup-EnCase \
	pack-encase-startup-StartupParameters.plist \
	pack-script-postflight

l_Library_StartupItems_EnCase: l_Library_StartupItems
	@sudo mkdir -p ${WORK_D}/Library/StartupItems/EnCase
	@sudo chown root:wheel ${WORK_D}/Library/StartupItems/EnCase
	@sudo chmod 755 ${WORK_D}/Library/StartupItems/EnCase

pack-encase-startup-%: % l_Library_StartupItems_EnCase
	@sudo ${INSTALL} -m 700 -g wheel -o root $< ${WORK_D}/Library/StartupItems/EnCase