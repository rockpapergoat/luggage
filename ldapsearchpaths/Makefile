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
# Example of preconfiguring LDAP settings.
#
# These plists need editing - search for example.com and change
# per your local setup. It's probably less hassle to set it up
# on a workstation then copy the plists from
# /Library/Preferences/DirectoryService, though.

# cf. https://github.com/unixorn/luggage/tree/master/examples/configure_ldap/
# used to replace search and contact path config files on 10.5 hosts
# i saw weird results when trying to do this via dscl; not sure why, but this works every time.

include /usr/local/share/luggage/luggage.make

TITLE=configure_ldap_search_paths
REVERSE_DOMAIN=com.company.configure_ldap_search_paths
PAYLOAD=\
	pack-directory-service-preference-ContactsNodeConfig.plist \
	pack-directory-service-preference-SearchNodeConfig.plist \
	pack-script-postflight