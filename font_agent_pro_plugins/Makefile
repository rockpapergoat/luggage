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

include /usr/local/share/luggage/luggage.make

TITLE=font_agent_pro_4_plugins
REVERSE_DOMAIN=org.wgbh
PAYLOAD=\
	pack-internet-plugin-flashplayer.xpt\
	unbz2-internet-plugin-Flash_Player.plugin\
	
l_indesign_plugins: l_Applications
	@sudo mkdir -p ${WORK_D}/Applications/Adobe\ InDesign\ CS5.5/Plug-Ins/
	@sudo chown root:admin ${WORK_D}/Applications/Adobe\ InDesign\ CS5.5/Plug-Ins/
	@sudo chmod 775 ${WORK_D}/Applications/Adobe\ InDesign\ CS5.5/Plug-Ins/

l_illustrator_plugins: l_Applications
	@sudo mkdir -p ${WORK_D}/Applications/Adobe\ Illustrator\ CS5.1/Plug-ins.localized/
	@sudo chown root:admin ${WORK_D}/Applications/Adobe\ Illustrator\ CS5.1/Plug-ins.localized/
	@sudo chmod 775 ${WORK_D}/Applications/Adobe\ Illustrator\ CS5.1/Plug-ins.localized/

l_photoshop_plugins: l_Applications
	@sudo mkdir -p ${WORK_D}/Applications/Adobe\ Photoshop\ CS5.1/Plug-ins/
	@sudo chown root:admin ${WORK_D}/Applications/Adobe\ Photoshop\ CS5.1/Plug-ins/
	@sudo chmod 775 ${WORK_D}/Applications/Adobe\ Photoshop\ CS5.1/Plug-ins/


unbz2-indesign-plugin-%: %.tar.bz2 l_indesign_plugins
	@sudo ${TAR} xjf $< -C ${WORK_D}/Applications/Adobe\ InDesign\ CS5.5/Plug-Ins
	@sudo chown -R root:admin ${WORK_D}/Applications/Adobe\ InDesign\ CS5.5/Plug-Ins

unbz2-illustrator-plugin-%: %.tar.bz2 l_illustrator_plugins
	@sudo ${TAR} xjf $< -C ${WORK_D}/Applications/Adobe\ Illustrator\ CS5.1/Plug-ins.localized
	@sudo chown -R root:admin ${WORK_D}/Applications/Adobe\ Illustrator\ CS5.1/Plug-ins.localized

unbz2-photoshop-plugin-%: %.tar.bz2 l_photoshop_plugins
	@sudo ${TAR} xjf $< -C ${WORK_D}/Applications/Adobe\ Photoshop\ CS5.1/Plug-ins
	@sudo chown -R root:admin ${WORK_D}/Applications/Adobe\ Photoshop\ CS5.1/Plug-ins


