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
# Example of adding a hidden admin account via pkg.
# Use the unbz2-private-var-Users- rule to pack up an existing homedir, if needed.
# Be sure to include the actual user and admin group plists in this directory.
# Also be sure to drop in the tarred, bzipped homedir is present if you're installing that.
# Shadow hash entried are from 10.6. include the password hash file if installing on 10.6

include /usr/local/share/luggage/luggage.make

TITLE=admin_account_107
REVERSE_DOMAIN=com.rockpapergoat
PAYLOAD=\
	pack-var-db-dslocal-nodes-Default-users-admin.plist\
	pack-var-db-dslocal-nodes-Default-groups-admin.plist\
	# unbz2-private-var-Users-admin\
	# pack-script-postflight



# path vars

l_var_db_dslocal: l_var_db
	@sudo mkdir -p ${WORK_D}/var/db/dslocal
	@sudo chown -R root:wheel ${WORK_D}/var/db/dslocal
	@sudo chmod 755 ${WORK_D}/var/db/dslocal

l_var_db_dslocal_nodes: l_var_db_dslocal
	@sudo mkdir -p ${WORK_D}/var/db/dslocal/nodes
	@sudo chown -R root:wheel ${WORK_D}/var/db/dslocal/nodes
	@sudo chmod 755 ${WORK_D}/var/db/dslocal/nodes

l_var_db_dslocal_nodes_Default: l_var_db_dslocal_nodes
	@sudo mkdir -p ${WORK_D}/var/db/dslocal/nodes/Default
	@sudo chown -R root:wheel ${WORK_D}/var/db/dslocal/nodes/Default
	@sudo chmod 700 ${WORK_D}/var/db/dslocal/nodes/Default

l_var_db_dslocal_nodes_Default_users: l_var_db_dslocal_nodes_Default
	@sudo mkdir -p ${WORK_D}/var/db/dslocal/nodes/Default/users
	@sudo chown -R root:wheel ${WORK_D}/var/db/dslocal/nodes/Default/users
	@sudo chmod 700 ${WORK_D}/var/db/dslocal/nodes/Default/users

l_var_db_dslocal_nodes_Default_groups: l_var_db_dslocal_nodes_Default
	@sudo mkdir -p ${WORK_D}/var/db/dslocal/nodes/Default/groups
	@sudo chown -R root:wheel ${WORK_D}/var/db/dslocal/nodes/Default/groups
	@sudo chmod 700 ${WORK_D}/var/db/dslocal/nodes/Default/groups

l_var_db_shadow_hash: l_var_db
	@sudo mkdir -p ${WORK_D}/var/db/shadow/hash
	@sudo chown -R root:wheel ${WORK_D}/var/db/shadow/hash
	@sudo chmod 700 ${WORK_D}/var/db/shadow/hash

l_private: l_root
	@sudo mkdir -p ${WORK_D}/private
	@sudo chown -R root:wheel ${WORK_D}/private
	@sudo chmod -R 755 ${WORK_D}/private

l_private_var: l_private
	@sudo mkdir -p ${WORK_D}/private/var
	@sudo chown -R root:wheel ${WORK_D}/private/var
	@sudo chmod -R 755 ${WORK_D}/private/var

l_private_var_Users: l_private_var
	@sudo mkdir -p ${WORK_D}/private/var/Users
	@sudo chown -R root:wheel ${WORK_D}/private/var/Users
	@sudo chmod -R 755 ${WORK_D}/private/var/Users


# pack vars

pack-var-db-shadow-hash-%: % l_var_db_shadow_hash
	@sudo install -m 600 -o root -g wheel $< ${WORK_D}/var/db/shadow/hash

pack-var-db-dslocal-nodes-Default-users-%: % l_var_db_dslocal_nodes_Default_users
	@sudo install -m 600 -o root -g wheel $< ${WORK_D}/var/db/dslocal/nodes/Default/users

pack-var-db-dslocal-nodes-Default-groups-%: % l_var_db_dslocal_nodes_Default_groups
	@sudo install -m 600 -o root -g wheel $< ${WORK_D}/var/db/dslocal/nodes/Default/groups



# unbz vars

unbz2-private-var-Users-%: %.tar.bz2 l_private_var_Users
	@sudo ${TAR} xjf $< -C ${WORK_D}/private/var/Users
	#@sudo chown -Rv $(shell echo $< | sed s/\.tar\.bz2//g):admin ${WORK_D}/private/var/Users/$(shell echo $< | sed s/\.tar\.bz2//g)
