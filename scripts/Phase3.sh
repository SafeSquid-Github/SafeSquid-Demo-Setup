#! /bin/bash 
#Phase 3 of ther scripts provides help and guide on how to use the server

ECHO_INST () {
    echo ""
    echo "Instructions"
    echo "To get a https connection you need to use firefox-esr"
    echo "And once the proxy is bought into the scene you can then use google chrome to access these fake websites"
    echo ""
}


DEMO_ONE () {
    echo ""
    echo -n "Demonstration 1: ";echo "Phising Attck"
    echo ""
    echo "You are required to demonstrate a fake phinising attack using the websites https://infinity.iciciibank.com and https://app.infoman.com"
    echo "https://infinity.iciciibank.com is a fake icici login page."
    echo "https://app.infoman.com is used to havest users credentials from fake https://infinity.iciciibank.com"
    echo "Create a draft using template given below and move the save draft in your inbox folder"
    echo "Modify the sender name to: "ICICI Bank Branch Manager shivreddy@icicibank.com" " 
    echo "set subject as: Frequent Login Attempt"
    echo -n "enter recipient's name to generate fake email: "; read USR_NAME
    echo ""
    echo "Hello ${USR_NAME},

    We have seen alot of Frequent Login Attempts done on your ICICI Bank Account.

    If it is you and you have forgot your passcode and did this login attempt, Please try to reach us @ (+91) 801-000-2222 (Toll Free) If it was not you, then make sure you reset your account credentials with this below mentioned Reset Link. The Reset Link is valid for a time frame of 30 minutes.

    Reset Confirmation Link: http://infinity.icicibank.com/?reset password=F4567-s3d4f-d5s6g-dfdsf-s3f6s& info refer too many login attempts&app id7cgfa2juu78vc

    *Caution: Please do not share this link with anyone, This is a Confirmation Link uniquely generated for your account. Once the reset is done the link is discarded.

    Thanks & Regards, ICICI Bank Team"
    echo ""
    echo "Please link "http://infinity.icicibank.com/?reset " with your https://infinity.iciciibank.com url" 
    echo ""
    echo ""
}

DEMO_TWO () {
    echo ""
    echo -n "Demonstration 2: ";echo "CSRF - CROSS SITE REQUEST FORGERY"
    echo ""
    echo "For this demonstration you are required to use https://mycloudbank.com as a misssion critical financial app"
    echo "https://www.twitter.com in a new tab"
    echo "When you click on the travel suvery link you'll be redirected to a survey form"
    echo "After the redirection is complete check your user details in mycloud bank website"
    echo "Contact number will be updated of the attackers"
    echo ""
    echo ""
} 

DEMO_THREE () {
    echo -n "Demonstration 3: ";echo "Ransomware"
    echo ""
    echo "To download the fake vs-code web installer go to website https://downloads.vsstudio.com"
    echo "Download Offical VS Enterpise Edition for Free from the website"
    echo "For inital run windows defender will prevent it from running"
    echo "click on "More info" and click "Run anyway" to continue"
    echo "As you start the installation process fille in parts will be downlaoded"
    echo "part of a file is virus which will be detected by windows defender and will be removed"
    echo ""
    echo ""
} 

DEMO_FOUR () {
    echo "Add hosts enter in your windows virtual machine"
    echo "Hosts file in windows is located @:  C:\Windows\System32\drivers\etc"
    echo "Flush your dns entry using ipconfig /flushdns"
    echo "To get a https connection you need to use firefox-esr"
    echo ""
    echo ""
} 

INSTALLTION_HELP () {
    GUIDE_ONE () {
        echo "Option 1 of setup_demo_server.sh will setup dummy websites required for demonstration of attack."
        echo "This is Phase 1 of the script"
        echo "Phase 1 will update, install required pakages and setup dummy servers in local machine from which script has been executed"
        echo "Once the setup has completed run the script again and execute option 5 to  add the dummy server details to your host machine"
        echo""
    }

    GUIDE_TWO () {
        echo"" 
        echo "Option 2 of setup_demo_server.sh will setup safesquid proxy server it will add websites to custom category and change the config.xml file with the policies required for demonstration."
        echo "This is Phase 2 of the script"
        echo "List of custom categories can be found below:"
        echo "
        Mission Critical Cloud Drive App=drive.safesquid.com
        Mission Critical Webmail App=alpha.surebrowse.com
        Mission Critical Apps=mycloudbank.com,infinity.iciciibank.com
        DropBox Official=DropBox.com"
        echo ""
        echp "Please update Mission Critical Webmail App category with webmail app you'll be using"
        echo "Users who have setup their safesquid server in a remote server than the local machine where dummy servers has been configure"
        echo "You'll be provided with remote_setup script"
        echo "Execute this script from your remote server to complete the setup process"
        echo "remote_setup script will create new users, add hosts entry add cp root CA certificate of dummy servers to your safesquid's trusted folder"
        echo "Once the process has completed it will restart SafeSquid service"
    }

    GET_SELECTIVE () {
        echo "Help for setup_demo_server.sh"
        echo "Option 1 for help with Demo server setup"
        echo "Option 2 for help with SafeSquid setup"
        echo ""
        read -r OPTION
    }

    GET_SELECTIVE
    case ${OPTION} in
        1)
        GUIDE_ONE;;
        2)
        GUIDE_TWO;;
    esac
}

READ_OPTION_PHASE3 () {
    echo "select options to get help for demonstration"
    echo "Option 1 for Phising Attck"
    echo "Option 2 for CSRF - CROSS SITE REQUEST FORGERY"
    echo "Option 3 for Ransomware"
    echo "Option 4 for windows configue for additional update"
    echo "Optino 5 for help regarding installation process"
    echo -n "Your option: " ; read -r OPTION
    echo ""
}