#
#   Copyright 2009 Joe Block <jpb@ApesSeekingKnowledge.net>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.com/licenses/LICENSE-2.0
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

TITLE=Firefox-Extension
REVERSE_DOMAIN=com.company.firefox-extension
PAYLOAD=pack-company-cck@extensions.company.com


pack-company-cck@extensions.company.com: l_Library_Application_Support-Mozilla/Extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}
		@sudo mkdir -p ${WORK_D}/Library/Application\ Support/Mozilla/Extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}
		@sudo chown root:admin ${WORK_D}/Library/Application\ Support/Mozilla/Extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}
		@sudo ${CP} -R ./company-cck@extensions.company.com ${WORK_D}/Library/Application\ Support/Mozilla/Extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}
		@sudo chmod 775 ${WORK_D}/Library/Application\ Support/Mozilla/Extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}

l_Library_Application_Support-Mozilla/Extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}: l_Library_Application_Support
		@sudo mkdir -p ${WORK_D}/Library/Application\ Support/Mozilla