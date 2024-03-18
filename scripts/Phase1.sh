#!/bin/bash
DIR=$(dirname $0)
source ${DIR}/scripts/create_hosts_file.sh
source ${DIR}/scripts/log_.sh

#Phase1
#Phase 1 of the script configures the dummy websites for demonstration.
#Step 1 Installing Applications

STATUS_CHECK () {
    if [[ ${?} -eq 0 ]]; then
        echo "Complete";else 
        echo "Error" 
    fi
}

UNZIP_FILE () {
    tar -xzvf ${ARCHIVE_FILE} -C ${LOCATION} |& GET_LOG
}

SYS_UPDATE () {
    echo "System update"
    apt update |& GET_LOG && apt upgrade -y |& GET_LOG
}

APP_INSTALL () {
    echo "Install applications"
    apt install nginx python3 python3-flask sqlite3 nodejs -y  |& GET_LOG
}

CHK_DIR () {
    DIR_LOCATE="${1}"
    if [[ ! -f "${DIR_LOCATE}" ]]; then
    mkdir -p "${DIR_LOCATE}"
    fi
}

CREATE_DIR_IF_NOTEXT () {
CHK_DIR /usr/share/nginx
CHK_DIR /usr/lib/nginx
}

UNZIP_TO_LOCATION_OG () {
    
    ARCHIVE_FILE=${DIR}/tar_files/${1}
    LOCATION=${2}
    UNZIP_FILE
} 

FILES () { 
    echo "Extract archives"
    UNZIP_TO_LOCATION_OG  modules-available.tar.gz /usr/share/nginx/
    UNZIP_TO_LOCATION_OG  modules.tar.gz /usr/lib/nginx/ 
    UNZIP_TO_LOCATION_OG  certs.tar.gz /usr/local/src/
    UNZIP_TO_LOCATION_OG  www.tar.gz /var/
    UNZIP_TO_LOCATION_OG  apps.tar.gz /usr/local/src/
    UNZIP_TO_LOCATION_OG  nginx.tar.gz /etc/
    UNZIP_TO_LOCATION_OG  startup_script.tar.gz /usr/local/src/
    UNZIP_TO_LOCATION_OG  startup_services.tar.gz /usr/lib/
    STATUS_CHECK
}

LINK_SERVICE () {
    echo "Enable application services"
    for services in /usr/lib/startup_services/* ; do
    ln -s "${services}" /etc/systemd/system/ |& GET_LOG  
    systemctl enable "$(basename "${services}")" |& GET_LOG  
    systemctl start "$(basename "${services}")" |& GET_LOG   
    done 
    STATUS_CHECK
}

RESTART_SERVICE () {
    echo "Restart nginx services"
    systemctl restart nginx.service 
    STATUS_CHECK
} 