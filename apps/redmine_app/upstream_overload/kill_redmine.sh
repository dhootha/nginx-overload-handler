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
# ==== kill_redmine.sh ====
#
# USAGE: sudo ./kill_redmine.sh
#

pkill -f "ruby"
pkill -f "python.*redmine_bouncer.py"
pkill -f "python.*alert_router.py"
pkill -f "python.*sigservice.py"
sleep 2
pkill -9 -f "ruby"
pkill -9 -f "python.*redmine_bouncer.py"
pkill -9 -f "python.*alert_router.py"
pkill -9 -f "python.*sigservice.py"

