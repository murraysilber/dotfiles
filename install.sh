#!/bin/zsh

#===============================================================================
# PRE-LAUNCH SETUP
#===============================================================================
PARENT_PATH=$(dirname ${BASH_SOURCE[0]-$0}) # relative script path from execution location, same as "${BASH_SOURCE%/*}" or "${BASH_SOURCE}"

source ${PARENT_PATH}/lib/globals
source ${PARENT_PATH}/lib/functions

pre_flight_checks
# handle_getopts "$@"
loggers

#===============================================================================
# START RUNNING SETUP
#===============================================================================
welcome
#header

# SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]-$0})
# SCRIPT_DIR=$(cd $SCRIPT_DIR && pwd)
