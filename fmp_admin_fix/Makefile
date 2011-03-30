#
#   Copyright 2009 Joe Block <jpb@ApesSeekingKnowledge.net>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#       You may obtain a copy of the License at
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

TITLE=fmp_admin_fix
REVERSE_DOMAIN=com.company
PAYLOAD=\
	pack-script-preflight\
	pack-fmp-admin\
	pack-script-postflight
	

#  /Library/FileMaker Server/Admin/admin-server/admin-client-lib

l_Library_FileMaker_Server_Admin_admin_server_admin_client_lib: l_Library
	@sudo mkdir -p ${WORK_D}/Library/FileMaker\ Server/Admin/admin-server/admin-client-lib
	@sudo chown root:admin ${WORK_D}/Library/FileMaker\ Server/
	@sudo chmod 1775 ${WORK_D}/Library/FileMaker\ Server/Admin/admin-server/admin-client-lib

pack-fmp-admin: l_Library_FileMaker_Server_Admin_admin_server_admin_client_lib
	@sudo ${CP} ./admin-console-client.jar ${WORK_D}/Library/FileMaker\ Server/Admin/admin-server/admin-client-lib/