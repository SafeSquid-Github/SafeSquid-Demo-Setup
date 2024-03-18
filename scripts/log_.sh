#!/bin/bash

DIR=$(dirname $0)
DEMO_SETUP=${DIR}/log/$(date +%d%m%y%s)-demo_setup.log
LATEST_LOG_FILE=${DIR}/log/demo_setup.log

LATEST_LOG () {
    ln -sf "${DEMO_SETUP}" "${LATEST_LOG_FILE}"
}

SET_WRITE_PERMISSION () {
    chmod 640 ${DEMO_SETUP}
}

CHK_LEGEND () {
     grep -i "Date&Time" "${DEMO_SETUP}" &> /dev/null 
    if [[ ${?} -ne 0 ]]; then
        echo "      Date&Time     Function_name Line_number Script_name               Info" > ${DEMO_SETUP}
    fi
}

GET_LOG () {
    CHK_LEGEND
    LATEST_LOG
    SET_WRITE_PERMISSION
    local MSG="$*"
    SCRPT_NM=$(basename "${0}")
    DATE_TIME=$(date +"%Y %m %d %T")
    while read MSG
    do
        echo "${DATE_TIME}   [${FUNCNAME[1]}]     [${BASH_LINENO}]      [${SCRPT_NM}]    ${MSG}" >> ${DEMO_SETUP}
    done
}