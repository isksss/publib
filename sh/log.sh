#!/bin/bash
#===== info =====#
# logger
# $1: log name
#================#

#===== var =====#
log_dir="/var/log/${$1}"
#===============#

#===== init =====#
mkdir -p ${log_dir}

function log(){
    local log_file="${log_dir}/$(date +%Y%m%d).log"
    local log_time=$(date +%Y/%m/%d-%H:%M:%S)
    local log_level=$1
    local log_msg=$2
    echo "[${log_time}][${log_level}] ${log_msg}" >> ${log_file}
}

function log_info(){
    local log_msg=$1
    log "INFO" "${log_msg}"
}

function log_warn(){
    local log_msg=$1
    log "WARN" "${log_msg}"
}

function log_error(){
    local log_msg=$1
    log "ERROR" "${log_msg}"
}
#================#