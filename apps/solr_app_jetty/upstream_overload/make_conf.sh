#!/usr/bin/env bash
#
# Copyright 2012 HellaSec, LLC
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obCONFIG_INSTALLED_BACKUPtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
# ==== make_conf.sh ====
#
# Make config files by filling in values in .template files
#
# USAGE: ./make_conf.sh BG_CONF_DIR
#   For example, ./make_conf.sh core4/
#

if [ "$1" == "" ]
then
    echo "Error: You need to specify the BG_CONF_DIR. See source code."
    exit 1
fi

BG_CONF_DIR=$1
# get absolute path and strip any trailing slashes
BG_ABS_CONF_DIR=`readlink -f $BG_CONF_DIR`


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../../../nginx_upstream_overload/env.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../../../nginx_doorman/env.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../env.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../../../siteconfig.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cat $BG_ABS_CONF_DIR/nginx.conf.template \
    | sed "s@TEMPLATE_SERVER_NAME@$SERVER_NAME@g" \
    | sed "s@TEMPLATE_ALERT_PIPE_PATH@$ALERT_PIPE_PATH@g" \
    | sed "s@TEMPLATE_INSTALL_SOLR_PATH@$SOLR_LOCAL_PATH@g" \
    | sed "s@TEMPLATE_PUZZLE_SSI_PATH_NGX@$PUZZLE_SSI_PATH_NGX@g" \
    | sed "s@TEMPLATE_PUZZLE_STATIC_PATH_NGX@$PUZZLE_STATIC_PATH_NGX@g" \
    > $DIR/nginx.conf

cat $BG_ABS_CONF_DIR/bouncer_config.json.template \
    | sed "s@TEMPLATE_ALERT_PIPE_PATH@$ALERT_PIPE_PATH@g" \
    | sed "s@TEMPLATE_SIG_FILE_PATH@$SIG_FILE_PATH@g" \
    > $DIR/bouncer_config.json

cat $DIR/restart_fcgi.sh.template \
    | sed "s@TEMPLATE_DIR@$DIR@g" \
    > $DIR/restart_fcgi.sh
chmod +x $DIR/restart_fcgi.sh
