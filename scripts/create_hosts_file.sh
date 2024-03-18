#!/bin/bash
DIR=$(dirname "${0}")

STATUS_CHECK () {
    if [[ ${?} -eq 0 ]]; then
        echo "Complete";else 
        echo "Error" 
    fi
}

CREATE_HOST_FILE () {

    DUMMY_SERVER_IP=$(ip route show | tail -n 1 | awk '{print $9}')

    declare -A Host_File
    Host_File["mycloudbank.com"]=${DUMMY_SERVER_IP}
    Host_File["app.infoman.com"]=${DUMMY_SERVER_IP}
    Host_File["infinity.iciciibank.com"]=${DUMMY_SERVER_IP}
    Host_File["www.twitter.com"]=${DUMMY_SERVER_IP}
    Host_File["downloads.vsstudio.com"]=${DUMMY_SERVER_IP}
    Host_File["www.obsurvey.com"]=${DUMMY_SERVER_IP}
    Host_File["obsurwey.com"]=${DUMMY_SERVER_IP}
    
    echo "## Added by Demo_setup ##"> "${DIR}"/tmp/append_to_hosts_file
    for FQDN in "${!Host_File[@]}"; do
        echo ""${Host_File[${FQDN}]}"        "${FQDN}"" >> "${DIR}/tmp/append_to_hosts_file"
    done
    STATUS_CHECK
}