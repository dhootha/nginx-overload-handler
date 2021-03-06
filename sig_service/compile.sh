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
# ==== compiles BouncerService.thrift ====
#
# compiles to python stubs located in gen-py
#
# USAGE: ./compile.sh
#

# $DIR is the absolute path for the directory containing this bash script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOORMAN_DIR="$DIR/../nginx_doorman"
thrift -gen py -o $DIR $DIR/SignatureService.thrift
OPT="-g -W -Wall -Wpointer-arith -Wno-unused-parameter -Wunused-function -Wunused-variable -Wunused-value -Werror"

rm $DIR/bayes.o $DIR/bayes_test
gcc $OPT -c $DOORMAN_DIR/bayes.c -I $DOORMAN_DIR -o $DIR/bayes.o
gcc $OPT -Werror $DIR/bayes.o $DIR/bayes_test.c -I $DOORMAN_DIR -o $DIR/bayes_test

