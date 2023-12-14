#!/bin/bash
#===== info =====#
#
#================#

#===== var =====#
PROJECT="paper"
VERSION="1.16.5"
MEMORY="2014M"
#===============#

#===== init =====#
# load publib manager
. <(curl -fsSL https://raw.githubusercontent.com/isksss/publib/main/sh/manager.sh)

# load some file
load_publib log.sh
load_publib paper.sh
#================#

COMMAND=$1
case ${COMMAND} in
    "dl")
        paper-download ${PROJECT} ${VERSION}
        ;;
    "run")
        paper-run ${MEMORY}
        ;;
    "stop")
        paper-stop
        ;;
    *)
        echo "Usage: $0 {dl|run|stop}"
        ;;
esac