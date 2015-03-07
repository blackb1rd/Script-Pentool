#! /bin/bash

# Directory hierarchy
# /pentest┬>exploits──┬>exploitdb
#         │           ├>set
#         │           └>msf
#         ├>database───>sqlmap
#         ├>tutorial───>pwnwiki
#         └>web───────┬>nikto
#                     └>w3af

if [ ! -d "/pentest" ]; then
	mkdir "/pentest"
fi
if [ ! -d "/pentest/exploits" ]; then
	mkdir "/pentest/exploits"
fi
if [ ! -d "/pentest/database" ]; then
	mkdir "/pentest/database"
fi
if [ ! -d "/pentest/tutorial" ]; then
	mkdir "/pentest/tutorial"
fi
if [ ! -d "/pentest/web" ]; then
	mkdir "/pentest/web"
fi

#Update exploit-db
echo "${txtbld}$(tput setaf 1)[-] Updating Exploit-db, please wait...$(tput sgr0)"
if [ ! -d "/pentest/exploits/exploitdb" ]; then
    git clone https://github.com/offensive-security/exploit-database /pentest/exploits/exploitdb
else
    cd /pentest/exploits/exploitdb && git pull
fi
wait
echo "${txtbld}$(tput setaf 4)[>] Exploit-db updated successfully!$(tput sgr0)"


#Update SET
echo "${txtbld}$(tput setaf 1)[-] Updating SET, please wait...$(tput sgr0)"
if [ ! -d "/pentest/exploits/set" ]; then
    git clone https://github.com/trustedsec/social-engineer-toolkit.git /pentest/exploits/set
else
    cd /pentest/exploits/set && git pull
fi
wait
echo "${txtbld}$(tput setaf 4)[>] SET updated successfully!$(tput sgr0)"

#Update msf
echo "${txtbld}$(tput setaf 1)[-] Updating msf, please wait...$(tput sgr0)"
if [ ! -d "/pentest/exploits/msf" ]; then
    git clone https://github.com/rapid7/metasploit-framework.git /pentest/exploits/msf
else
    cd /pentest/exploits/msf && git pull
fi
wait
echo "${txtbld}$(tput setaf 4)[>] msf updated successfully!$(tput sgr0)"

#Update SQLMap
echo "${txtbld}$(tput setaf 1)[-] Updating SQLMap, please wait...$(tput sgr0)"
if [ ! -d "/pentest/database/sqlmap" ]; then
    git clone https://github.com/sqlmapproject/sqlmap.git /pentest/database/sqlmap
else
    cd /pentest/database/sqlmap && git pull
fi
wait
echo "${txtbld}$(tput setaf 4)[>] SQLMap updated successfully!$(tput shr0)"

#Update pwnwiki
echo "${txtbld}$(tput setaf 1)[-] Updating Pwnwiki, please wait...$(tput sgr0)"
if [ ! -d "/pentest/tutorial/pwnwiki" ]; then
    git clone https://github.com/pwnwiki/pwnwiki.github.io.git /pentest/tutorial/pwnwiki
else
    cd /pentest/tutorial/pwnwiki && git pull
fi
wait
echo "${txtbld}$(tput setaf 4)[>] Pwnwiki updated successfully!$(tput sgr0)"

#Update Nikto
echo "${txtbld}$(tput setaf 1)[-] Updating Nikto, please wait...$(tput sgr0)"
if [ ! -d "/pentest/web/nikto" ]; then
    git clone git://github.com/sullo/nikto.git /pentest/web/nikto
else
    cd /pentest/web/nikto && git pull
fi

wait
echo "${txtbld}$(tput setaf 4)[>] Nikto updated successfully!$(tput sgr0)"

#Update w3af
echo "${txtbld}$(tput setaf 1)[-] Updating w3af, please wait...$(tput sgr0)"
if [ ! -d "/pentest/web/w3af" ]; then
    git clone https://github.com/andresriancho/w3af.git /pentest/web/w3af
else
    cd /pentest/web/w3af && git pull
fi
wait
echo "${txtbld}$(tput setaf 4)[>] w3af updated successfully!$(tput sgr0)"

