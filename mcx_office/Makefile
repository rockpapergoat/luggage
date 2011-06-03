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
# Example of packaging a gui application

include /usr/local/share/luggage/luggage.make

TITLE=mcx_office
REVERSE_DOMAIN=com.company
PAYLOAD=\
	pack-mcx-mcx_office.plist \
	pack-usr-local-bin-mcx_import.rb\
	pack-script-postflight


pack-mcx-%: % l_etc_mcx
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/private/etc/mcx

l_etc_mcx: l_private_etc
	@sudo mkdir -p ${WORK_D}/private/etc/mcx
	@sudo chown -R root:wheel ${WORK_D}/private/etc/mcx
	@sudo chmod -R 755 ${WORK_D}/private/etc/mcx