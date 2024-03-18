#!/bin/bash
DIR=$(dirname "${0}")
source "${DIR}"/scripts/Phase1.sh
source "${DIR}"/scripts/Phase2.sh
source "${DIR}"/scripts/Phase3.sh
source "${DIR}"/scripts/log_.sh

DEMO_SERVER_SETUP () {
    SYS_UPDATE
    APP_INSTALL
    CREATE_DIR_IF_NOTEXT
    FILES
    LINK_SERVICE
    RESTART_SERVICE
    CREATE_HOST_FILE
}

ALL () {
    DEMO_SERVER_SETUP
    SAFESQUID_SETUP
}

SAFESQUID_SETUP () {
    echo "Start SafeSquid setup"
    CHK_SAFESQUID
    SAFESQUID_SETUP_LOCAL
} 

SAFESQUID_REMOTE () {
    READ_OPTION () {
        SCRPT_NM=$(basename "${0}")
        OPTION="${@}" 
        if [[ ${#} -lt 3 ]]; then
            echo "Error: IP PORT required" >&2
            echo "USAGE:
            ${SCRPT_NM} -r <Proxy_IP_address> <Proxy_port>"
            exit 1 
        fi  
    }
    READ_OPTION "${@}"
    DEMO_SERVER_SETUP
    SAFESQUID_SETUP_REMOTE "${@}"
}

HELP () {
    ECHO_INST
    READ_OPTION_PHASE3
    case ${OPTION} in 
        1)
        DEMO_ONE ;;
        2)
        DEMO_TWO ;;
        3) 
        DEMO_THREE ;;
        4)
        DEMO_FOUR ;;
        5)
        INSTALLTION_HELP;;
    esac
}

ALL () {
    DEMO_SERVER_SETUP
    SAFESQUID_SETUP
}

ADD_HOSTS_ENTRY () {
    cat "${DIR}"/tmp/append_to_hosts_file >> /etc/hosts
}

USAGE () {
    SCRPT_NM=$(basename "${0}")
    echo ""
    echo -e "$(tput bold)Usage:"; echo "${SCRPT_NM}  <argument> <complete_setup>"
    echo ""
    echo "Options:"
    echo "-c    -    Creates dummy webservices, configures safesquid with custom configuration and categories for an existing install of SafeSquid"
    echo "-d    -    Creates dummy webservices"
    echo "-s    -    configures safesquid with custom configuration and categories for an existing install of SafeSquid in local server"
    echo "-r    -     Creates dummy webservices, configures safesquid with custom configuration and categories for an existing install of SafeSquid installed in a remote server."
    echo ""
    echo ""
    echo "$(tput bold)Examples:"
    echo "${SCRPT_NM} -c = Setup complete dummy servers with safesquid custom configuration in local server.
    ${SCRPT_NM} -d = Only setup dummy servers.
    ${SCRPT_NM} -s = Only SafeSquid custom configurations. 
    ${SCRPT_NM} -r 10.100.29.1 8080 = Setup complete dummy servers in local machhine and Safesquid custom configuration in remote server." 
    echo ""
    echo "${SCRPT_NM}_v2.0"
}

INVALID_OPT () {
    echo "$(tput bold)Invalid Option"
}

READ_OPTION () {
    OPTION=${1} 
   if [[ ${#} -eq 0 ]]; then
   echo "$(tput bold)Error: Option required" >&2
    USAGE
   exit 1 
   fi  
}

END_MSG () {
    if [[ "${?}" -eq 0 ]]; then
    echo ""
    echo "Feedbacks are welcomed @ pratik@safesquid.net"
    echo "For support contact @ support@safesquid.net"
    else
    exit 1
    fi
}

READ_OPTION "${@}"
case "${OPTION}" in 
    -c)
    ALL;;
    -d)
    DEMO_SERVER_SETUP;;
    -s)
    SAFESQUID_SETUP;;
    -r)
    SAFESQUID_REMOTE "${@}";;
    -h)
    HELP;;
    -H)
    CREATE_HOST_FILE;;
    -t)
    CREATE_REMOTE_TAR;;
    *)
    INVALID_OPT;;
esac

END_MSG
exit 0