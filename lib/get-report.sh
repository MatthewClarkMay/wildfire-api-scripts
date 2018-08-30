#!/bin/bash

# Author:
# Matt May <mcmay.web@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License.  You may obtain a
# copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

if [ $# -ne 2 ] || [ ! -f $1 ]; then
    echo "ERROR - usage: $0 api.conf <hash>"
    exit 1
else
    source $1
fi

if ! [[ $2 =~ ^([0-9a-f]{32}|[0-9a-f]{64})$ ]]; then
    echo "ERROR - Hash must be MD5, or SHA256"
    exit 1
fi

FORMAT='pdf'
URL='https://wildfire.paloaltonetworks.com/publicapi/get/report'

curl -F 'apikey='$APIKEY -F 'hash='$2 -F 'format='$FORMAT $URL
