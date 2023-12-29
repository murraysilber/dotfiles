#!/bin/zsh

#===============================================================================================
# PRE-LAUNCH SETUP
#===============================================================================================
PARENT_PATH=$(dirname "${BASH_SOURCE[0]}") # relative script path from execution location, same as "${BASH_SOURCE%/*}" or "${BASH_SOURCE}"

echo ${PARENT_PATH}
source ${PARENT_PATH}/lib/functions
#source ${PARENT_PATH}/lib/getopts

# preFlightChecks
# handle_getopts "$@"
# loggers

#===============================================================================================
# START RUNNING SETUP
#===============================================================================================
welcome
#header
