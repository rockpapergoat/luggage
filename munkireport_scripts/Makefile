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

TITLE=munki_report_scripts
REVERSE_DOMAIN=com.adullmoment
PAYLOAD=\
	pack-munki-postflight\
	pack-munki-preflight\
	pack-munki-report_broken_client\

l_usr_local_munki: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/munki
	@sudo chown -R root:wheel ${WORK_D}/usr/local/munki
	@sudo chmod -R 755 ${WORK_D}/usr/local/munki

pack-munki-%: % l_usr_local_munki
	@sudo ${INSTALL} -m 755 $< ${WORK_D}/usr/local/munki
