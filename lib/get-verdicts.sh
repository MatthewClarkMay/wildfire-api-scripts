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

URL='https://wildfire.paloaltonetworks.com/publicapi/get/verdicts'

length=$(wc -l $2 | awk '{ print $1 }')

if [ $length -gt 500 ]; then
    echo "File may not contain more than 500 lines"
    exit 1
fi

while read line; do
if ! [[ $line =~ ^([0-9a-f]{32}|[0-9a-f]{64})$ ]]; then
    echo "ERROR - Hashes in file must be MD5, or SHA256, and each hash should be separated by a newline"
    exit 1
fi
done < $2

curl -F 'apikey='$APIKEY -F 'file=@'$2 -F 'format='$FORMAT $URL
