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
# ==== launch_osqa.sh ====
#
# USAGE: sudo ./launch_osqa.sh

# $DIR is the absolute path for the directory containing this bash script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../env.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../../../dependencies/env.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py runserver 0.0.0.0:9000
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9000 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9001 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9002 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9003 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9004 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9005 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9006 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9007 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9008 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9009 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9010 &
$SUDO -i -u $FCGI_USER python $INSTALL_OSQA_PATH/manage.py run_gunicorn 0.0.0.0:9011 &


