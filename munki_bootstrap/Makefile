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

TITLE=munki_bootstrap
REVERSE_DOMAIN=com.adullmoment
PAYLOAD=install-Users-Shared-munki_start

install-Users-Shared-munki_start: l_Users_Shared .com.googlecode.munki.checkandinstallatstartup
	@sudo cp -v .com.googlecode.munki.checkandinstallatstartup ${WORK_D}/Users/Shared/

l_Users: l_root
	@sudo mkdir -p ${WORK_D}/Users
	@sudo chown root:admin ${WORK_D}/Users
	@sudo chmod 755 ${WORK_D}/Users
	@echo "Creating \"Users\" directory"

l_Users_Shared: l_Users
	@sudo mkdir -p ${WORK_D}/Users/Shared
	@sudo chown root:wheel ${WORK_D}/Users/Shared
	@sudo chmod 1777 ${WORK_D}/Users/Shared
	@echo "Creating \"Users/Shared\" directory"