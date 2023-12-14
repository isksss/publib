#!/bin/bash

#===== info =====#
# require: curl, jq, screen
#================#

#===== var =====#
server_jar="server.jar"
screen_name="minecraft"
#================#

# download paper project.
# $1: project name
# $2: version
function paper-download(){
    local project=$1 #ex) paper, velocity
    local version=$2 #ex) 1.16.5

    local url="https://api.papermc.io/v2/projects/${project}/versions/${version}"

    local response=$(curl -X GET -H 'accept: application/json' -fsSL ${url})
    local build=`echo ${response} | jq -r '.builds[-1]'`
    local jar="${project}-${version}-${build}.jar"
    local jar_url="${url}/builds/${build}/downloads/${jar}"

    # download jar
    curl -X GET -H 'accept: application/json' -fsSL ${jar_url} -o ${server_jar}
}


# run paper project.
# $1: project name
# $2: memory size
function paper-run(){
    local project=$1 #ex) paper, velocity
    local memory=$2 #ex) 1G

    # if eula.txt is not exist, create eula.txt.
    if [ ! -e eula.txt ]; then
        echo "eula=true" > eula.txt
    fi

    # if screen is not exist, create screen.
    if ! screen -list | grep -q "${screen_name}"; then
        screen -dmS ${screen_name}
    else
        echo "screen is already exist."
        exit 1
    fi

    # run server
    screen -S ${screen_name} -X stuff "java -Xms${memory} -Xmx${memory} -jar ${server_jar} nogui\n"
}

# stop paper project.
function paper-stop(){
    # if screen is not exist, exit.
    if ! screen -list | grep -q "${screen_name}"; then
        echo "screen is not exist."
        exit 1
    fi

    screen -S ${screen_name} -X stuff "stop\n"
}

# このファイルが直接実行された場合のみ実行
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    default_project="paper"
    default_version="1.16.5"
    paper-download $default_project $default_version
fi