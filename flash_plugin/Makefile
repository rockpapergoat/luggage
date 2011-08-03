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

TITLE=flash_plugin
REVERSE_DOMAIN=com.example
PAYLOAD=\
	pack-internet-plugin-flashplayer.xpt\
	unbz2-internet-plugin-Flash_Player.plugin\
	
l_Library_Internet_Plugins: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Internet\ Plug-Ins
	@sudo chown root:admin ${WORK_D}/Library/Internet\ Plug-Ins
	@sudo chmod 775 ${WORK_D}/Library/Internet\ Plug-Ins

pack-internet-plugin-%: % l_Library_Internet_Plugins
	@sudo ${CP} -v $< ${WORK_D}/Library/Internet\ Plug-Ins/

unbz2-internet-plugin-%: %.tar.bz2 l_Library_Internet_Plugins
	@sudo ${TAR} xjf $< -C ${WORK_D}/Library/Internet\ Plug-Ins
	@sudo chown -R root:admin ${WORK_D}/Library/Internet\ Plug-Ins/