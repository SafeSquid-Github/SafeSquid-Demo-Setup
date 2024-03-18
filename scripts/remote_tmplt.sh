#!/bin/bash

MK_ROOT_CERT () {
echo "
Certificate:
    Data:
        Version: 1 (0x0)
        Serial Number: 4097 (0x1001)
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN=Root CA, ST=KA, C=IN/emailAddress=issuer@support.com, O=Certificate Authority, OU=Root
        Validity
            Not Before: Jul  3 08:43:13 2022 GMT
            Not After : Jul  3 08:43:13 2023 GMT
        Subject: CN=Root CA, ST=KA, C=IN/emailAddress=issuer@support.com, O=Certificate Authority, OU=Root
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (4096 bit)
                Modulus:
                    00:e4:b2:9b:ee:f7:7c:a8:ff:bf:ef:d3:a8:a7:f4:
                    5f:a8:99:cf:40:e1:14:66:8d:4e:d3:d5:34:67:6a:
                    62:89:0d:8d:af:d7:96:de:0f:4a:f9:b6:ac:eb:c4:
                    5a:22:29:a4:76:f6:7e:e0:78:55:e0:50:a9:d9:f2:
                    db:79:34:cf:41:12:dd:6c:a7:7c:69:f3:94:21:58:
                    25:ec:46:1c:dd:47:bc:a4:80:d7:68:38:dd:e7:60:
                    38:3a:36:1d:49:c2:9d:a0:06:b7:52:6b:17:30:d2:
                    1b:de:ac:11:89:e6:7d:f6:05:3b:35:b9:ae:e2:1e:
                    1d:4f:0e:ba:0a:22:6e:be:3a:2d:1e:a6:3d:bb:74:
                    a8:86:a3:5e:eb:5e:2e:48:0a:ce:1f:7f:b0:63:6f:
                    2c:a3:a3:b2:fd:52:10:75:b1:99:e5:71:61:c0:04:
                    3f:df:f3:ec:9e:64:03:e2:24:54:74:a4:78:73:77:
                    a4:00:3a:0c:68:08:eb:bb:8e:3c:7d:bd:fa:e9:6a:
                    e6:30:42:6d:04:c4:93:b1:61:a9:08:70:ad:91:52:
                    b6:2f:ab:2c:c6:39:b8:f8:42:83:48:b1:0f:57:f4:
                    d9:bc:c0:9a:c1:b6:bc:f2:80:ec:b1:be:47:89:e7:
                    2b:e0:c4:56:9c:98:19:66:39:87:0f:2f:9b:4c:a2:
                    9e:d3:6e:9e:c9:51:bb:21:7d:28:3a:25:51:96:c3:
                    3a:38:26:d8:9e:51:46:d1:24:d7:58:54:86:ad:fe:
                    0d:cc:9a:64:a9:a3:e0:6b:d7:48:4c:bf:68:bc:58:
                    61:52:f7:56:75:87:26:62:18:b4:cb:dc:c7:59:14:
                    54:4d:65:16:34:c3:b3:bf:02:8f:87:00:bb:9b:54:
                    f4:ae:87:88:1a:95:e4:9f:d2:bd:02:b3:34:a6:36:
                    73:aa:99:c1:bc:b6:86:e8:e6:f3:ae:ef:d3:5a:96:
                    4a:00:bb:e6:af:10:ab:16:cb:e4:58:82:84:71:ce:
                    73:cb:6a:cd:93:12:2e:fc:ea:5d:90:45:e8:e5:c1:
                    fc:3c:9d:9d:0b:ef:7c:fb:a6:03:61:12:53:99:a2:
                    f1:a9:7f:82:07:33:c8:e3:2e:8c:1b:21:da:5c:e6:
                    1d:1b:97:cb:d0:9f:f7:a6:7e:b3:03:c5:93:5f:c1:
                    15:7f:20:65:8b:a0:6d:70:3e:f4:9a:b7:b2:cf:17:
                    82:87:16:61:f7:18:b6:b3:e4:b7:b5:19:fb:fc:5d:
                    04:39:b6:4a:1a:d0:35:37:09:f2:61:8f:e5:c4:97:
                    cc:b9:65:5b:a3:9f:f7:c8:82:06:a8:3b:ea:6a:5b:
                    14:df:72:d7:63:30:56:dd:f9:3d:ca:52:95:cf:02:
                    8b:05:d7
                Exponent: 65537 (0x10001)
    Signature Algorithm: sha256WithRSAEncryption
    Signature Value:
        94:81:0f:15:05:fa:46:01:d6:e7:87:0c:85:6d:70:b7:b6:73:
        b6:73:67:eb:27:bc:67:db:58:74:fc:22:63:db:e9:ad:41:f2:
        79:1b:ba:8b:24:d4:73:df:d4:90:b3:ed:7f:42:6c:96:11:dd:
        38:b8:a6:2f:71:8d:fa:7c:c6:ba:c9:32:f1:6b:37:c4:91:d6:
        5c:03:e8:2f:60:78:f0:80:12:37:29:23:b6:89:74:5d:aa:da:
        96:e9:ea:49:62:6b:b6:58:16:1a:97:35:99:8e:55:17:50:ac:
        4a:4f:00:48:3a:1a:c5:d3:98:32:a4:e0:ec:73:46:4a:ad:4a:
        5a:18:65:a1:7e:bf:11:04:1a:8c:ea:92:fd:9b:39:96:3f:5b:
        71:7b:1b:7a:2e:13:de:35:87:d6:14:9d:25:43:bc:2e:e6:47:
        6d:03:11:9b:66:48:8c:fb:a8:b1:71:a2:30:46:bf:fd:62:55:
        e8:0a:3e:dc:46:85:a5:bf:2b:6e:39:b4:ce:5d:1a:fe:34:40:
        ae:d3:56:f8:87:1f:7b:cc:6a:4e:42:a0:97:e4:5d:42:ed:f1:
        83:cc:72:5e:b7:a9:8f:68:40:89:79:b9:c5:67:db:64:78:a2:
        61:39:c5:43:65:c5:37:ab:c4:99:8f:d7:3a:6f:51:ea:4b:92:
        e3:e5:ce:ea:8a:6d:65:cf:89:69:d9:4b:a2:a1:59:db:0f:ef:
        87:af:39:a9:3e:e5:29:23:14:ab:98:52:93:e1:02:94:e5:8b:
        16:c4:00:0e:35:ef:54:ff:c8:7c:d4:50:d5:73:79:13:aa:52:
        a4:3d:33:36:24:41:d1:55:ab:bf:f1:4c:23:57:b3:c1:01:36:
        ee:3a:d7:1d:d8:44:c9:06:92:ac:ac:ab:aa:a0:27:5c:91:92:
        79:c8:6b:21:90:df:f7:75:5f:32:5f:35:fa:b7:3b:58:98:67:
        33:9c:a5:df:17:b3:d8:5b:7f:fd:e5:00:05:88:66:f7:88:d8:
        28:d8:d7:94:37:b4:3f:1b:f6:40:9e:ee:1b:55:9a:ef:d8:f0:
        e7:de:54:76:1c:d1:60:d8:8d:94:dd:01:83:70:90:66:bb:50:
        cb:d8:c8:8b:b6:e6:1f:e1:7a:e3:b3:00:7c:e7:90:90:3f:5a:
        6e:89:61:09:72:44:1b:33:b2:94:8d:5a:87:d2:39:d4:5b:16:
        68:05:f3:d3:cb:ab:52:21:e1:29:de:be:20:fa:51:03:ca:d2:
        b9:5d:e7:dd:99:5b:bb:3d:2b:1d:3d:dd:9c:4a:13:8f:8f:10:
        cc:ea:9a:5a:c1:f0:f9:6d:d8:52:98:b1:04:43:2f:68:91:d5:
        3c:b0:0e:a8:a5:a8:97:78
-----BEGIN CERTIFICATE-----
MIIFcTCCA1kCAhABMA0GCSqGSIb3DQEBCwUAMH4xEDAOBgNVBAMMB1Jvb3QgQ0Ex
CzAJBgNVBAgMAktBMQswCQYDVQQGEwJJTjEhMB8GCSqGSIb3DQEJARYSaXNzdWVy
QHN1cHBvcnQuY29tMR4wHAYDVQQKDBVDZXJ0aWZpY2F0ZSBBdXRob3JpdHkxDTAL
BgNVBAsMBFJvb3QwHhcNMjIwNzAzMDg0MzEzWhcNMjMwNzAzMDg0MzEzWjB+MRAw
DgYDVQQDDAdSb290IENBMQswCQYDVQQIDAJLQTELMAkGA1UEBhMCSU4xITAfBgkq
hkiG9w0BCQEWEmlzc3VlckBzdXBwb3J0LmNvbTEeMBwGA1UECgwVQ2VydGlmaWNh
dGUgQXV0aG9yaXR5MQ0wCwYDVQQLDARSb290MIICIjANBgkqhkiG9w0BAQEFAAOC
Ag8AMIICCgKCAgEA5LKb7vd8qP+/79Oop/RfqJnPQOEUZo1O09U0Z2piiQ2Nr9eW
3g9K+bas68RaIimkdvZ+4HhV4FCp2fLbeTTPQRLdbKd8afOUIVgl7EYc3Ue8pIDX
aDjd52A4OjYdScKdoAa3UmsXMNIb3qwRieZ99gU7Nbmu4h4dTw66CiJuvjotHqY9
u3SohqNe614uSArOH3+wY28so6Oy/VIQdbGZ5XFhwAQ/3/PsnmQD4iRUdKR4c3ek
ADoMaAjru448fb366WrmMEJtBMSTsWGpCHCtkVK2L6ssxjm4+EKDSLEPV/TZvMCa
wba88oDssb5Hiecr4MRWnJgZZjmHDy+bTKKe026eyVG7IX0oOiVRlsM6OCbYnlFG
0STXWFSGrf4NzJpkqaPga9dITL9ovFhhUvdWdYcmYhi0y9zHWRRUTWUWNMOzvwKP
hwC7m1T0roeIGpXkn9K9ArM0pjZzqpnBvLaG6Obzru/TWpZKALvmrxCrFsvkWIKE
cc5zy2rNkxIu/OpdkEXo5cH8PJ2dC+98+6YDYRJTmaLxqX+CBzPI4y6MGyHaXOYd
G5fL0J/3pn6zA8WTX8EVfyBli6BtcD70mreyzxeChxZh9xi2s+S3tRn7/F0EObZK
GtA1NwnyYY/lxJfMuWVbo5/3yIIGqDvqalsU33LXYzBW3fk9ylKVzwKLBdcCAwEA
ATANBgkqhkiG9w0BAQsFAAOCAgEAlIEPFQX6RgHW54cMhW1wt7ZztnNn6ye8Z9tY
dPwiY9vprUHyeRu6iyTUc9/UkLPtf0JslhHdOLimL3GN+nzGusky8Ws3xJHWXAPo
L2B48IASNykjtol0XaralunqSWJrtlgWGpc1mY5VF1CsSk8ASDoaxdOYMqTg7HNG
Sq1KWhhloX6/EQQajOqS/Zs5lj9bcXsbei4T3jWH1hSdJUO8LuZHbQMRm2ZIjPuo
sXGiMEa//WJV6Ao+3EaFpb8rbjm0zl0a/jRArtNW+Icfe8xqTkKgl+RdQu3xg8xy
Xrepj2hAiXm5xWfbZHiiYTnFQ2XFN6vEmY/XOm9R6kuS4+XO6optZc+JadlLoqFZ
2w/vh685qT7lKSMUq5hSk+EClOWLFsQADjXvVP/IfNRQ1XN5E6pSpD0zNiRB0VWr
v/FMI1ezwQE27jrXHdhEyQaSrKyrqqAnXJGSechrIZDf93VfMl81+rc7WJhnM5yl
3xez2Ft//eUABYhm94jYKNjXlDe0Pxv2QJ7uG1Wa79jw595UdhzRYNiNlN0Bg3CQ
ZrtQy9jIi7bmH+F647MAfOeQkD9abolhCXJEGzOylI1ah9I51FsWaAXz08urUiHh
Kd6+IPpRA8rSuV3n3Zlbuz0rHT3dnEoTj48QzOqaWsHw+W3YUpixBEMvaJHVPLAO
qKWol3g=
-----END CERTIFICATE-----

" > /usr/local/src/myrootCA.crt
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
    
    > "/usr/local/src/append_to_hosts_file"
    for FQDN in "${!Host_File[@]}"; do
        echo ""${Host_File[${FQDN}]}"        "${FQDN}"" >> "/usr/local/src/append_to_hosts_file"
    done
 
}

STATUS_CHECK () {
    if [[ ${?} -eq 0 ]]; then
        echo "Complete";else 
        echo "Error" 
    fi
}
RESTART_SAFESQUID () {
    echo "Restart SafeSquid"
    /etc/init.d/monit stop  ; /etc/init.d/safesquid stop  ; /etc/init.d/monit start  ; sleep 3
    /etc/init.d/safesquid status  
    STATUS_CHECK
}

USR_ () {
    echo "Add user ${1}"
    LOGIN_NAME="${1}"
    LOGIN_PASSWD=pass123
    useradd "${LOGIN_NAME}"    
        if [[ "${?}" -eq 9 ]]; then 
            echo ""${LOGIN_NAME}" exists" 
        	return
        fi
    echo -n "Password for user "${LOGIN_NAME}"" 
    echo "${LOGIN_NAME}:${LOGIN_PASSWD}" | chpasswd  
}

USR_ADD () {
    USR_ Haresh
    USR_ Manoj
}

ALL_DONE () {
    echo ""
    echo "User Haresh and Manoj has been created with password set as ${LOGIN_PASSWD}"
    echo "you'll require this password to login to your safesquid web interface"
    echo "You can access your safesquid web interface using http://safesquid.cfg/"
}

CHK_BFR_CP () {
    echo "Update hosts entry in /etc/hosts file"
    grep "mycloudbank.com" /etc/hosts > /dev/null
    if [[ "${?}" -eq 1 ]]; then
    cat /usr/sshdir/append_to_hosts_file >> /etc/hosts
    else
    echo "Hosts entry exists."
    return
    fi
    STATUS_CHECK
}

CP_PST () {
    CHK_BFR_CP
    echo "Add root certificate to SafeSquid's trusted folder"
    cp /usr/sshdir/myrootCA.crt /usr/local/safesquid/security/ssl/trusted/   
    STATUS_CHECK 
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

SAVE_SETT_SAFESQUID () {
    echo "Save SafeSquid configurations"
    PROXY_IP_PORT
    COMMAND=(curl);
    COMMAND+=(--proxy "${PROXY_IP}");
    COMMAND+=(--location);
    COMMAND+=(--request POST \'http://safesquid.cfg/\');
    COMMAND+=(--header \'Referer: http://safesquid.cfg/\');
    COMMAND+=(--header \'Content-Type: application/x-www-form-urlencoded\');
    COMMAND+=(--data-urlencode \'filename=config.xml\');
    COMMAND+=(--data-urlencode \'handler=save\');
    eval "${COMMAND[*]}"   
    STATUS_CHECK

}

REMOTE_EXE () {
    MK_ROOT_CERT
    CREATE_HOST_FILE 
    USR_ADD 
    CP_PST 
    SAVE_SETT_SAFESQUID 
    RESTART_SAFESQUID 
    ALL_DONE 
    exit 0
}

REMOTE_EXE
