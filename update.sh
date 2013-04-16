#! /bin/bash

#Check directory
# ->/pentest
# |->exploits
#  |->exploitdb
#  |->set
#  |->msf
# |->web
#  |->nikto
# |->databse
#  |->sqlmap

if [ ! -d "/pentest" ]; then
    mkdir "/pentest"
    mkdir "/pentest/exploits"
    mkdir "/pentest/exploits/exploitdb"
    mkdir "/pentest/exploits/exploitdb/platforms"
    mkdir "/pentest/exploits/set"
    mkdir "/pentest/web"
    mkdir "/pentest/web/nikto"
    mkdir "/pentest/database"
    mkdir "/pentest/database/sqlmap"
fi

#Update exploit-db
echo "${txtbld}$(tput setaf 1)[-] Updating Exploit-db, please wait...$(tput sgr0)"
exploit=$(svn co svn://www.exploit-db.com/exploitdb exploitdb)
wait
if [ -z "$exploit" ]; then 
echo "${txtbld}$(tput setaf 1)[!]Exploit-DB's SVN didn't work. Updating manually. Please wait...\n"
wget http://www.exploit-db.com/archive.tar.bz2
wait
tar xvfj archive.tar.bz2 > /dev/null
rm -rf /pentest/exploits/exploitdb/platforms
mv -f platforms files.csv /pentest/exploits/exploitdb
rm -rf archive.tar.bz2*
fi
echo "${txtbld}$(tput setaf 4)[>] Exploit-db updated successfully!$(tput sgr0)\n"


#Update SET
echo "${txtbld}$(tput setaf 1)[-] Updating SET, please wait...$(tput sgr0)"
if [ ! -f "/pentest/exploits/set/set-update" ]; then
    svn co http://svn.secmaniac.com/social_engineering_toolkit /pentest/exploits/set
else
    /pentest/exploits/set/set-update
fi
wait
echo "${txtbld}$(tput setaf 4)[>] SET updated successfully!$(tput sgr0)\n"

#Update msf
echo "${txtbld}$(tput setaf 1)[-] Updating msf, please wait...$(tput sgr0)"
if [ ! -f "/pentest/exploits/msf/msfupdate" ]; then
    svn co https://www.metasploit.com/svn/framework3/trunk/ /pentest/exploits/msf
else
    /pentest/exploits/msf/msfupdate
fi
wait
echo "${txtbld}$(tput setaf 4)[>] msf updated successfully!$(tput sgr0)\n"

#Update Nikto
echo "${txtbld}$(tput setaf 1)[-] Updating Nikto, please wait...$(tput sgr0)"
if [ ! -f "/pentest/web/nikto/README.md" ]; then
    rm -r "/pentest/web/nikto"
    git clone git://github.com/sullo/nikto.git /pentest/web/nikto
else
    cd /pentest/web/nikto && git pull
fi

wait
echo "${txtbld}$(tput setaf 4)[>] Nikto updated successfully!$(tput sgr0)\n"

#Update SQLMap
echo "${txtbld}$(tput setaf 1)[-] Updating SQLMap, please wait...$(tput sgr0)"
if [ ! -f "/pentest/database/sqlmap/sqlmap.py" ]; then
    git clone https://github.com/sqlmapproject/sqlmap.git /pentest/database/sqlmap
else
    cd /pentest/database/sqlmap && git pull
fi
wait
echo -e "${txtbld}$(tput setaf 4)[>] SQLMap updated successfully!$(tput sgr0)\n"
