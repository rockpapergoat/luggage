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

TITLE=flash_player
REVERSE_DOMAIN=com.company
PACKAGE_VERSION="11.2.202.228"
URL=http://fpdownload.macromedia.com/get/flashplayer/pdc/${PACKAGE_VERSION}/install_flash_player_osx.dmg
PROXY=""
PAYLOAD=\
	pack-tmp-AdobeFlashPlayer.pkg \
	pack-lib-prefs-macromedia-settings.sol \
	pack-script-postflight \
	cleanup

ifdef PROXY
ifeq (PROXY,"")
    $(info proxy is set to: $(PROXY))
    DL=curl -L -o install_flash_player_osx.dmg ${URL}
else
    $(info proxy is set to: $(PROXY))
    DL=curl -L -o install_flash_player_osx.dmg -x ${PROXY} ${URL}
endif
endif


l_prefs_macromedia: l_Library_Preferences
	@sudo mkdir -p ${WORK_D}/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys
	@sudo chown root:wheel ${WORK_D}/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys
	@sudo chmod 755 ${WORK_D}/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys

pack-lib-prefs-macromedia-%: % l_prefs_macromedia
	@sudo ditto -V $< ${WORK_D}/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys/$<
	@sudo chown -Rf root:wheel ${WORK_D}/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys/
	@sudo chmod -Rf 755 ${WORK_D}/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys

unbz2-library-prefs-%: %.tar.bz2 l_Library_Preferences
	@sudo ${TAR} xjf $< -C ${WORK_D}/Library/Preferences
	@sudo chown -R root:admin ${WORK_D}/Library/Preferences/$(shell echo $< | sed s/\.tar\.bz2//g)

pack-tmp-%: % package_root AdobeFlashPlayer.pkg
	@sudo mkdir -pv ${WORK_D}/private/tmp
	@sudo ditto -V $< ${WORK_D}/private/tmp/$<
	@sudo chown -Rf root:admin ${WORK_D}/private/tmp/$<

AdobeFlashPlayer.pkg: Makefile
	$(shell ${DL})
	hdiutil mount install_flash_player_osx.dmg -nobrowse -noautoopen -noverify
	${DITTO} --noqtn /Volumes/Flash\ Player/Install\ Adobe\ Flash\ Player.app/Contents/Resources/Adobe\ Flash\ Player.pkg AdobeFlashPlayer.pkg

cleanup: Makefile
	rm -Rfv install_flash_player_osx.dmg
	hdiutil detach /Volumes/Flash\ Player
	rm -Rfv AdobeFlashPlayer.pkg