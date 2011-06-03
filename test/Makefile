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

TITLE=test
REVERSE_DOMAIN=com.company
PAYLOAD=pack-tmp-test

pack-tmp-%: package_root
	@sudo mkdir -pv ${WORK_D}/private/tmp
	@sudo cp -v test ${WORK_D}/private/tmp/