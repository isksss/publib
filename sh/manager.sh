#!/bin/bash
#===== info =====#
# load publib
#================#

# load publib/sh
# $1: target ex) paper.sh
function load_publib(){
    local target=$1
    local publib_path="${HOME}/.publib/sh"
    local publib_url="https://raw.githubusercontent.com/isksss/publib/main/sh/"

    # if publib is not exist, create publib.
    if [ ! -e ${publib_path} ]; then
        mkdir -p ${publib_path}
    fi

    # if target is not exist, download target.
    if [ ! -e ${publib_path}/${target} ]; then
        curl -X GET -H 'accept: application/json' -fsSL ${publib_url}/${target} -o ${publib_path}/${target}
    fi

    # load target
    source ${publib_path}/${target}
}