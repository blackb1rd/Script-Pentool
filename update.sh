#! /bin/bash
echo -e "${txtbld}$(tput setaf 1)[-] Updating SET, please wait...$(tput sgr0)"
/pentest/exploits/set/set-update
wait
echo -e "${txtbld}$(tput setaf 4)[>] SET updated successfully!$(tput sgr0)\n"

echo -e "${txtbld}$(tput setaf 1)[-] Updating msf, please wait...$(tput sgr0)"
/pentest/exploit/msf/msfupdate
wait
echo -e "${txtbld}$(tput setaf 4)[>] msf updated successfully!$(tput sgr0)\n"

echo -e "${txtbld}$(tput setaf 1)[-] Updating Nikto, please wait...$(tput sgr0)"
perl /pentest/web/nikto/nikto.pl -update
wait
echo -e "${txtbld}$(tput setaf 4)[>] Nikto updated successfully!$(tput sgr0)\n"

echo -e "${txtbld}$(tput setaf 1)[-] Updating Exploit-db, please wait...$(tput sgr0)"
wget http://www.exploit-db.com/archive.tar.bz2
wait
tar xvfj archive.tar.bz2 > /dev/null
rm -rf /pentest/exploits/exploitdb/platforms/
mv -f platforms/ files.csv /pentest/exploits/exploitdb/
rm -rf archive.tar.bz2*
echo -e "${txtbld}$(tput setaf 4)[>] Exploit-db updated successfully!$(tput sgr0)\n"
