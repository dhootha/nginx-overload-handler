#!/usr/bin/env bash
#
# Copyright 2012 HellaSec, LLC
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
# ==== doorman_overload.sh sends a large volume of requests at server ===
#
# USAGE: ./doorman_overload.sh duration concurrent url
#   where concurrent is the number of concurrent requests per benchmark
#   url is the target url
#
# e.g. ./doorman_overload.sh 3 800 "http://foo/index.php?title=Main_Page"
#

BEFORE=`date +%s`

while [ 1 ]
do
    # run multiple benchmarks in parallel to avoid getting blocked
    # while waiting for requests
    ((ab -n $2 -c $2 $3 ) & sleep 1 ; kill $! ) &
    AFTER=`date +%s`
    let TIME=$AFTER-$BEFORE
    if [ $TIME -gt $1 ]; then
        exit
    fi
    sleep 0.25
done

