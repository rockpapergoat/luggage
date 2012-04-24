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

TITLE=Firefox
REVERSE_DOMAIN=com.company
PACKAGE_VERSION="10.0.3esr"
PROXY=""
PAYLOAD=\
	pack-applications-Firefox.app \
	pack-ff-ext-test \
	pack-ff-override \
	pack-script-preflight \
	cleanup


ifdef PROXY
ifeq (PROXY,"")
    $(info $(PROXY))
    DL=curl -L -o Firefox.dmg http://download.mozilla.org/\?product=firefox-${PACKAGE_VERSION}\&os=osx\&lang=en-US
else
    DL=curl -L -o Firefox.dmg -x ${PROXY} http://download.mozilla.org/\?product=firefox-${PACKAGE_VERSION}\&os=osx\&lang=en-US
endif
endif


l_apps_firefox: l_Applications Firefox.app
	@sudo mkdir -pv ${WORK_D}/Applications/Firefox.app/Contents/MacOS/extensions
	@sudo chown -Rfv root:admin ${WORK_D}/Applications/Firefox.app
	@sudo chmod -Rfv 755 ${WORK_D}/Applications/Firefox.app

pack-ff-ext-%: %  l_apps_firefox
	@sudo ${DITTO} -V --noqtn $< ${WORK_D}/Applications/Firefox.app/Contents/MacOS/extensions/$<
	@sudo chown -R root:admin ${WORK_D}/Applications/Firefox.app/Contents/MacOS/extensions/
	@sudo chmod -Rv 644 ${WORK_D}/Applications/Firefox.app/Contents/MacOS/extensions/*


pack-ff-override: override.ini l_apps_firefox
	@sudo ${CP} -v ./override.ini ${WORK_D}/Applications/Firefox.app/Contents/MacOS/
	@sudo chown root:admin ${WORK_D}/Applications/Firefox.app/Contents/MacOS/override.ini
	@sudo chmod 744 ${WORK_D}/Applications/Firefox.app/Contents/MacOS/override.ini

Firefox.app: Makefile
	$(shell ${DL})
	hdiutil mount Firefox.dmg -nobrowse -noautoopen -noverify
	${DITTO} --noqtn /Volumes/Firefox/Firefox.app Firefox.app

preflight: Makefile
    VERSION=$(shell echo ${PACKAGE_VERSION} | tr -d [:alpha:])
    $(shell sed -i "" 's/v2=/v2=${VERSION}/' preflight )

cleanup: Makefile
	rm -Rfv Firefox.app
	hdiutil detach /Volumes/Firefox
	rm -v Firefox.dmg