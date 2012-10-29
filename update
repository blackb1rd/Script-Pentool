#! /bin/bash
echo -e "${txtbld}$(tput setaf 1)[-] Updating Exploit-db, please wait...$(tput sgr0)"
exploit=$(svn co svn://www.exploit-db.com/exploitdb exploitdb)
wait
if [[$exploit =~ "Can't connect to host"]] ;then 
echo -e "${txtbld}$(tput setaf 1)[!]Exploit-DB's SVN didn't work. Updating manually. Please wait...\n"
wget http://www.exploit-db.com/archive.tar.bz2
wait
tar -xvfj archive.tar.bz2 > /dev/null
rm -rf /pentest/exploits/exploitdb/platforms/
mv -f platforms/ files.csv /pentest/exploits/exploitdb/
rm -rf archive.tar.bz2*
fi
echo -e "${txtbld}$(tput setaf 4)[>] Exploit-db updated successfully!$(tput sgr0)\n"

echo -e "${txtbld}$(tput setaf 1)[-] Updating SET, please wait...$(tput sgr0)"
/pentest/exploits/set/set-update
wait
echo -e "${txtbld}$(tput setaf 4)[>] SET updated successfully!$(tput sgr0)\n"

echo -e "${txtbld}$(tput setaf 1)[-] Updating msf, please wait...$(tput sgr0)"
/pentest/exploits/msf/msfupdate
wait
echo -e "${txtbld}$(tput setaf 4)[>] msf updated successfully!$(tput sgr0)\n"

echo -e "${txtbld}$(tput setaf 1)[-] Updating Nikto, please wait...$(tput sgr0)"
svn co http://svn2.assembla.com/svn/Nikto_2/trunk /pentest/web/nikto/
wait
echo -e "${txtbld}$(tput setaf 4)[>] Nikto updated successfully!$(tput sgr0)\n"


echo -e "${txtbld}$(tput setaf 1)[-] Updating SQLMap, please wait...$(tput sgr0)"
git clone https://github.com/sqlmapproject/sqlmap.git /pentest/database/sqlmap
wait
echo -e "${txtbld}$(tput setaf 4)[>] SQLMap updated successfully!$(tput sgr0)\n"
