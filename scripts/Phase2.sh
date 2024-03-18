#!/bin/bash

DIR=$(dirname "${0}")
source ${DIR}/scripts/Phase1.sh
source ${DIR}/scripts/log_.sh
LOG_FILE=${DIR}/log/$(date +%d%m%y%s)demo_setup.log
SAFESQUID_ROOT_CERT_DIR=/usr/local/safesquid/security/ssl/trusted/
echo "SafeSquid Install" |& GET_LOG
#Phase2 
#Phase2 of script configures safesquid proxy server

CHK_SAFESQUID () {
    SAFESQUID=/etc/init.d/safesquid
    if [[ ! -f ${SAFESQUID} ]]; then
    echo "SafeSquid is not installed in this server"
    echo "Select -r <Proxy_IP> <Proxy_Port> to setup safesquid remote server"
    exit 1
    fi
}

PROXY_IP_PORT () {

    PROXY_NETSTAT=$(netstat -lntp | grep safesquid | awk '{print $4}')
    NETSTAT_PORT=$(netstat -lntp | grep safesquid | awk '{print $4}')
    PROXY_PORT="${NETSTAT_PORT##*:}"
    PROXY_LOCALHOST="127.0.0.1"

    if [[ ${PROXY_NETSTAT} == :::"${PROXY_PORT}" ]]; then  
        PROXY_IP=${PROXY_LOCALHOST}:${PROXY_PORT}; else 
        PROXY_IP=${PROXY_NETSTAT}
    fi

}

PROXY_IP_PORT_REMOTE () {
    shift
    PROXY_IP_REMOTE=${1}
    PROXY_PORT_REMOTE=${2}
    PROXY_="${PROXY_IP_REMOTE}":"${PROXY_PORT_REMOTE}"
} 


SAFESQUID_UPLOAD_CATEGORY_FILE () {
    echo "Upload private category file"
    declare -A SAFESQUID_CUSTOM_CATEGORY
    SAFESQUID_CUSTOM_CATEGORY["Mission%20Critical%20Cloud%20Drive%20App"]="Mission Critical Cloud Drive App.txt"
    SAFESQUID_CUSTOM_CATEGORY["Mission%20Critical%20Webmail%20App"]="Mission Critical Webmail App.txt"
    SAFESQUID_CUSTOM_CATEGORY["Mission%20Critical%20Apps"]="Mission Critical Apps.txt"
    SAFESQUID_CUSTOM_CATEGORY["DropBox%20Official"]="DropBox Official.txt"
    
    for CATEGORY in "${!SAFESQUID_CUSTOM_CATEGORY[@]}"; do
        COMMAND=(curl);
        COMMAND+=(--verbose);
        COMMAND+=(--proxy "${1}");
        COMMAND+=(--location);
        COMMAND+=(--request POST \'http://safesquid.cfg/?handler=upload\&type=websites_file\&list=${CATEGORY}\');
        COMMAND+=(--form \'filename=@"${DIR}/config/Categories_list/${SAFESQUID_CUSTOM_CATEGORY[${CATEGORY}]}"\');
        COMMAND+=(--form \'name="websites_file\&list=${CATEGORY}"\');
        eval "${COMMAND[*]}" |& GET_LOG
    done
}

SAFESQUID_CONFIG_UPLOAD () {
    echo "Upload custom config.xml file"
    COMMAND=(curl);
    COMMAND+=(--verbose);
    COMMAND+=(--proxy "${1}");
    COMMAND+=(--location);
    COMMAND+=(--request POST \'http://safesquid.cfg/?handler=upload\&type=config\&overwrite=yes\');
    COMMAND+=(--form \'filename=@"${DIR}/config/config.xml"\');
    COMMAND+=(--form \'name="config"\');
    eval "${COMMAND[*]}" |& GET_LOG
}

SAVE_SETT_SAFESQUID () {
    echo "Save SafeSquid configurations"
    COMMAND=(curl);
    COMMAND+=(--verbose);
    COMMAND+=(--proxy "${1}");
    COMMAND+=(--location);
    COMMAND+=(--request POST \'http://safesquid.cfg/\');
    COMMAND+=(--header \'Referer: http://safesquid.cfg/\');
    COMMAND+=(--header \'Content-Type: application/x-www-form-urlencoded\');
    COMMAND+=(--data-urlencode \'filename=config.xml\');
    COMMAND+=(--data-urlencode \'handler=save\');
    eval "${COMMAND[*]}" |& GET_LOG
}

RESTART_SAFESQUID () {
    echo "Restart SafeSquid"
    /etc/init.d/monit stop |& GET_LOG ; /etc/init.d/safesquid stop |& GET_LOG ; /etc/init.d/monit start |& GET_LOG ; sleep 4 
    /etc/init.d/safesquid status |& GET_LOG
    STATUS_CHECK
}

USR_ADD () {
    LOGIN_NAME="${1}"
    echo "Add user ${LOGIN_NAME}"
    useradd "${LOGIN_NAME}" |& GET_LOG
        if [[ "${?}" -eq 9 ]]; then 
        echo "User ${LOGIN_NAME} exists"
        	return
        fi
    LOGIN_PASSWD=pass123
    echo -n "Password for user "${LOGIN_NAME}"" |& GET_LOG
    echo "${LOGIN_NAME}:${LOGIN_PASSWD}" | chpasswd |& GET_LOG
}

SAFESQUID_CONFIG_LOCAL () {
    echo "Setup SafeSquid"
    PROXY_IP_PORT
    SAFESQUID_UPLOAD_CATEGORY_FILE "${PROXY_IP}"
        STATUS_CHECK
    SAFESQUID_CONFIG_UPLOAD "${PROXY_IP}"
        STATUS_CHECK
    SAVE_SETT_SAFESQUID "${PROXY_IP}"
        STATUS_CHECK
}

SAFESQUID_CONFIG_REMOTE () {
    echo "Configure SafeSquid on a remote server"
    PROXY_IP_PORT_REMOTE "${@}"
    SAFESQUID_UPLOAD_CATEGORY_FILE "${PROXY_}"
        STATUS_CHECK
    SAFESQUID_CONFIG_UPLOAD "${PROXY_}"
        STATUS_CHECK 
}

CHK_BFR_CP () {
    echo "Update hosts entry in /etc/hosts file"
    grep "mycloudbank.com" /etc/hosts > /dev/null
    if [[ "${?}" -eq 1 ]]; then
    cat ${DIR}/tmp/append_to_hosts_file >> /etc/hosts
    else
    echo "Hosts entry exists."
    return
    fi
    STATUS_CHECK
}

SAFESQUID_SETUP_LOCAL () { 
    SAFESQUID_CONFIG_LOCAL
    CHK_BFR_CP
    cp ${DIR}/config/myrootCA.crt "${SAFESQUID_ROOT_CERT_DIR}"
    USR_ADD Manoj
    USR_ADD Haresh
    STATUS_CHECK
    RESTART_SAFESQUID
    echo ""
    echo "User Haresh and Manoj has been created with password set as ${LOGIN_PASSWD}"
    echo "you'll require this password to login to your safesquid web interface"
    echo "You can access your safesquid web interface using http://safesquid.cfg/"
}

CREATE_REMOTE_SCRIPT () {
    echo "Create remote_setup.sh"
    > "${DIR}"/tmp/remote_setup.sh
    sed 's#/usr/sshdir/#/usr/local/src/#' "${DIR}"/scripts/remote_tmplt.sh >> "${DIR}"/tmp/remote_setup.sh
    STATUS_CHECK
}

ALL_DONE () {
    LOGIN_PASSWD=pass123
    echo ""
    echo "User Haresh and Manoj has been created with password set as ${LOGIN_PASSWD}"
    echo "you'll require this password to login to your safesquid web interface"
    echo "You can access your safesquid web interface using http://safesquid.cfg/"
}

#To be used for setting safesquid servers if located in remote server.
SAFESQUID_SETUP_REMOTE () {
    SAFESQUID_CONFIG_REMOTE "${@}"
    CREATE_REMOTE_SCRIPT
    SSH_EXE () {
        SSH_USR_IP=root@"${PROXY_IP_REMOTE}"
        ssh ${SSH_USR_IP} 'bash -s' < "${1}"
    }
    echo "Execute remote_setup.sh script"
    SSH_EXE ${DIR}/tmp/remote_setup.sh |& GET_LOG
    if [[ ${?} -eq 0 ]]; then
        ALL_DONE
    fi
    rm ${DIR}/tmp/* |& GET_LOG
}
