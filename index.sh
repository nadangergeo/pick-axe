#!/bin/bash

# GET PATH OF THIS SCRIPT
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# CD TO SCRIPT PATH
cd $SCRIPTPATH

if [ -z "${@}" ]
then
    $SCRIPTPATH/HELP
else
    bash -c "$SCRIPTPATH/$@"
fi