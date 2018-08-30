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

if [ $# -ne 2 ] || [ ! -f $1 ] || [ ! -f $2 ]; then
    echo "ERROR - usage: $0 api.conf <file>"
    exit 1
else
    source $1
fi

# add logic to check file type, exit if not supported by api 
# https://www.paloaltonetworks.com/documentation/80/wildfire/wf_admin/wildfire-overview/wildfire-concepts/file-analysis

URL='https://wildfire.paloaltonetworks.com/publicapi/submit/file'

curl -F 'apikey='$APIKEY -F 'file=@'$1 $URL
